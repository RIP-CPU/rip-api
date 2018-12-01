package id.co.cpu.security.entity;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Properties;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import id.co.cpu.common.entity.BaseAuditEntity;
import id.co.cpu.common.utils.PropertiesUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name = "sec_user")
public class UserEntity extends BaseAuditEntity implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2442773369159964802L;
	
	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "user_uuid", nullable = false, unique=true)
	private String userUUID;

	@Column(name = "username", nullable = false, unique = true)
	private String username;

	@Column(name = "password", nullable = false)
	private String password;

	@Column(name = "account_enabled", nullable = false)
	private boolean enabled = false;

	@Column(name = "account_non_expired", nullable = false)
	private boolean accountNonExpired = true;

	@Column(name = "account_non_locker", nullable = false)
	private boolean accountNonLocked = true;

	@Column(name = "credentials_non_expired", nullable = false)
	private boolean credentialsNonExpired = true;

	@Column(name = "fullname", nullable = false)
	private String name;

	@Column(name = "email", nullable = true, unique = true)
	private String email;
	
	@Column(name = "address", nullable = false)
	private String address;

	@Column(name = "division_code", nullable = true)
	private String divisionCode;

	@Column(name = "city", nullable = true)
	private String city;

	@Column(name = "province", nullable = true)
	private String province;

	@Column(name = "district_code", nullable = true)
	private String districtCode;

	@Column(name = "phone_number", nullable = true)
	private String phoneNumber;

	@Column(name = "mobile_number", nullable = true)
	private String mobileNumber;

	@Column(name = "description", nullable = true)
	private String description;

	@Column(name = "verification_code", nullable = true)
	private String verificationCode;

	@Column(name = "raw", nullable = true)
	private String raw;

	@ManyToMany(fetch = FetchType.EAGER)
	@Fetch(FetchMode.SELECT)
	@JoinTable(name = "r_user_role", joinColumns = {
			@JoinColumn(name = "userUUID") }, inverseJoinColumns = @JoinColumn(name = "roleUUID") )
	private Set<RoleEntity> roles = new HashSet<RoleEntity>();

	/*****************************
	 * - Transient Field -
	 ****************************/
	private String passwordConfirm;
	private String captcha;
	private String enabledStr;
	private String accountNonLockedStr;
	private Properties prop;

	@Override
	@Transient
	public Set<GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> authorities = new LinkedHashSet<GrantedAuthority>();
		authorities.addAll(roles);
		return authorities;
	}

	@Transient
	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	@Transient
	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public void addRole(RoleEntity role) {
		if (roles == null) {
			roles = new HashSet<RoleEntity>();
		}
		roles.add(role);
	}

	public void setEnabled() {
		this.enabled = enabledStr.equalsIgnoreCase("1");
	}

	@Transient
	public String getEnabledStr() {
		return enabledStr;
	}

	public void setEnabledStr(String enabledStr) {
		this.enabledStr = enabledStr;
	}

	public void setEnabledStr() {
		if (enabled) {
			enabledStr = "1";
		} else {
			enabledStr = "0";
		}
	}

	public void setAccountNonLocked() {
		this.accountNonLocked = accountNonLockedStr.equalsIgnoreCase("1");
	}

	@Transient
	public String getAccountNonLockedStr() {
		return accountNonLockedStr;
	}

	public void setAccountNonLockedStr(String accountNonLockedStr) {
		this.accountNonLockedStr = accountNonLockedStr;
	}

	public void setAccountNonLockedStr() {
		if (accountNonLocked) {
			accountNonLockedStr = "1";
		} else {
			accountNonLockedStr = "0";
		}
	}

	@Column(name = "RAW", nullable = true)
	public String getRaw() {
		if (prop == null)
			prop = new Properties();
		raw = PropertiesUtil.toString(prop);
		return raw;
	}

	public void setRaw(String raw) {
		this.raw = raw;
		prop = PropertiesUtil.fromString(raw);
	}

	@Transient
	public Properties getProp() {
		return prop;
	}

	public void setProp(Properties prop) {
		this.prop = prop;
	}

	@Transient
	public String getCustomProp(String key) {
		if (prop == null)
			prop = new Properties();
		return (String) prop.get(key);
	}

	public void setCustomProp(String key, String value) {
		if (prop == null)
			prop = new Properties();
		prop.put(key, value);
		getRaw();
	}

}