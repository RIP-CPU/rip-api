package id.co.cpu.security.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;

import id.co.cpu.common.entity.BaseAuditEntity;
import id.co.cpu.feign.dto.security.MenuDto;
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

	@Column(name = "is_home")
	private Boolean home;

	@Column(name = "is_group")
	private Boolean group;

	@Column(name = "parent_uuid", nullable = true)
	private String parentId;

	@ManyToOne(targetEntity = MenuEntity.class, fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@JoinColumn(name = "parent_uuid", nullable = true, insertable = false, updatable = false)
	private MenuEntity parentMenu;

	@OneToMany(mappedBy = "parentMenu", fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	@OrderBy("orderingStr ASC")
	private Set<MenuEntity> childsMenu = new HashSet<MenuEntity>();
	
	@OneToMany(mappedBy = "menu", targetEntity = MenuI18nEntity.class, fetch = FetchType.LAZY)
	@Fetch(FetchMode.SELECT)
	private Set<MenuI18nEntity> menuI18n = new HashSet<MenuI18nEntity>();

	@Transient
	public List<MenuDto> getChildren() {
		if(childsMenu.size() <= 0)
			return null;
		List<MenuDto> menuDtos = new ArrayList<MenuDto>();
		childsMenu.forEach(data->{
			menuDtos.add(new MenuDto(
					data.getTitle(), 
					data.getIcon(),
					data.getUrl(),
					data.getHome(),
					data.getGroup(),
					data.getChildren()));
		});
		return menuDtos;
	}
	
	@Transient
	public MenuDto toObject() {
		MenuDto menuDto = new MenuDto(
				this.title, 
				this.icon, 
				this.url, 
				this.home, 
				this.group, 
				this.getChildren());
		return menuDto;
	}
	
	@Transient
	public MenuDto toObject(String title) {
		MenuDto menuDto = new MenuDto(
				title, 
				this.icon, 
				this.url, 
				this.home, 
				this.group, 
				this.getChildren());
		return menuDto;
	}

}