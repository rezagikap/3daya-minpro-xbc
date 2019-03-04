package com.eksad.xbc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "t_menu_access")
//@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property="id")
public class MenuAccessModel {

	@Id
	@Column(name = "id" , columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "menu_access_seq")
	@TableGenerator(name = "menu_access_seq", table = "tbl_squence", pkColumnName = "seq_id", valueColumnName = "seq_value", initialValue = 0, allocationSize = 1)
	private Integer id;

	@Column(name = "menu_id")
	private Integer menuId;

	@Column(name = "role_id")
	private Integer roleId;

	@Column(name = "created_by")
	private Integer createdBy;

	@Column(name = "created_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date createdOn;
	
	@ManyToOne
	@JoinColumn(name="menu_id", updatable=false, insertable=false)
	//@JsonManagedReference
	//@JsonIgnore
	private MenuModel menus;
	
	@ManyToOne
	@JoinColumn(name="role_id", updatable=false, insertable=false)
	//@JsonManagedReference
	//@JsonIgnore
	private RoleModel roles;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date createdOnNew = null;
		try {
			createdOnNew = format.parse(createdOn);
		} catch (Exception e) {
			this.createdOn = null;
		}
		this.createdOn = createdOnNew;
	}

	public MenuModel getMenus() {
		return menus;
	}

	public void setMenus(MenuModel menus) {
		this.menus = menus;
	}

	public RoleModel getRoles() {
		return roles;
	}

	public void setRoles(RoleModel roles) {
		this.roles = roles;
	}
}
