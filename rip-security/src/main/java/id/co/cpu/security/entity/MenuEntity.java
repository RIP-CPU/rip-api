package id.co.cpu.security.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
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
@EqualsAndHashCode(callSuper=false, exclude={"childsMenu", "parentMenu"})
@ToString(exclude={"childsMenu", "parentMenu"})
@Entity
@Table(name = "sec_menu")
public class MenuEntity extends BaseAuditEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5870155744883664118L;
	
	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
	@Column(name = "menu_uuid", nullable = false, unique = true)
	private String id;

	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "url", nullable = false)
	private String url;

	@Column(name = "level")
	private Integer level;

	@Column(name = "ordering")
	private Integer ordering;

	@Column(name = "ordering_str")
	private String orderingStr;

	@Column(name = "icon")
	private String icon;

	@Column(name = "is_leaf")
	private Boolean leaf;

	@Column(name = "parent_uuid", nullable = true)
	private String parentId;

	@ManyToOne(targetEntity = MenuEntity.class, fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinColumn(name = "parent_uuid", nullable = true, insertable = false, updatable = false)
	private MenuEntity parentMenu;

	@OneToMany(mappedBy = "parentMenu", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@OrderBy("orderingStr ASC")
	private Set<MenuEntity> childsMenu;

}