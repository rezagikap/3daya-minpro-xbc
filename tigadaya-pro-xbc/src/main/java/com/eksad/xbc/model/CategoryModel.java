package com.eksad.xbc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name = "t_category")
//@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class CategoryModel {
	@Id
	@Column(name = "id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "t_category_seq")
	@TableGenerator(name = "t_category_seq", table = "tbl_squence", pkColumnName = "seq_id",
	valueColumnName = "seq_value", initialValue = 0, allocationSize = 1)
	private Integer id;
	
	@Column(name ="code")
	private String code;
	
	@Column(name = "name")
	private String name;
	
	@Column(name ="description")
	private String description;
	
	@Column(name = "created_by")
	private Integer createdBy;
	
	@Column(name = "created_on")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss") 
	private Date createdOn;
	
	@Column(name = "modified_by")
	private Integer modifiedBy;
	
	@Column(name = "modified_on")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date modifiedOn;
	
	@Column(name = "deleted_by")
	private Integer DeletedBy;
	
	@Column(name = "deleted_on")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date deletedOn;
	
	@Column(name = "is_delete")
	private Boolean isDelete;
	
	//@JsonIgnore
	//@OneToMany( mappedBy="category", fetch=FetchType.EAGER, orphanRemoval=true)
	//private IdleNewsModel idle_news;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date crea = null;
		try {
			crea = format.parse(createdOn);
		} catch (Exception e) {
			crea = null;
		}
		this.createdOn = crea;
	}
	public Integer getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(Integer modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(String modifiedOn) {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date modi = null;
		try {
			modi = format.parse(modifiedOn);
		} catch (Exception e) {
			modi = null;
		}
		this.modifiedOn = modi;
	}
	public Integer getDeletedBy() {
		return DeletedBy;
	}
	public void setDeletedBy(Integer deletedBy) {
		DeletedBy = deletedBy;
	}
	public Date getDeletedOn() {
		return deletedOn;
	}
	public void setDeletedOn(String deletedOn) {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date dele = null;
		try {
			dele = format.parse(deletedOn);
		} catch (Exception e) {
			dele = null;
		}
		this.deletedOn = dele;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}				
	
}