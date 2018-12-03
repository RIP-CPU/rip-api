package id.co.cpu.security.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;

import id.co.cpu.common.entity.BaseAuditEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false, exclude={"users"})
@ToString(exclude={"users"})
@Entity
@Table(name = "sec_role")
public class RoleEntity extends BaseAuditEntity implements GrantedAuthority {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5870155744883664118L;
	
	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
	@Column(name = "role_uuid", nullable = false, unique = true)
	private String id;

	@Column(name = "role_name", unique = true)
	private String authority;

	@Column(name = "description")
	private String description;

	@ManyToMany(mappedBy = "roles")
	private Set<UserEntity> users = new HashSet<UserEntity>();

	@Override
	public String getAuthority() {
		return authority;
	}

}