package id.co.cpu.security.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;

import id.co.cpu.common.entity.BaseAuditEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false, exclude={"menu", "role"})
@ToString(exclude={"menu", "role"})
@Entity
@Table(name = "sec_function")
public class FunctionEntity extends BaseAuditEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5870155744883664118L;
	
	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
	@Column(name = "function_uuid", nullable = false, unique = true)
	private String id;

	@Column(name = "access")
	private String access;

	@ManyToOne(targetEntity = MenuEntity.class, fetch = FetchType.EAGER)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "menu_uuid", nullable = false, insertable = false, updatable = false)
	private MenuEntity menu;

	@ManyToOne(targetEntity = RoleEntity.class, fetch = FetchType.LAZY)
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "role_uuid", nullable = false, insertable = false, updatable = false)
	private RoleEntity role;

}