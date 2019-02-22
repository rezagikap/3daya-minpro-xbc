package com.eksad.xbc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name="t_trainer")
public class TrainerModel {
	

	@Id
	@Column(name="id", columnDefinition="serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "t_trainer_seq")
	@TableGenerator(name = "t_trainer_seq", table = "tbl_squence", 
	pkColumnName = "seq_id", valueColumnName = "seq_value", 
	initialValue = 0, allocationSize=1)
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@Column(name="modified_on")
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@Column(name="deleted_on")
	private Date deletedOn;
	
	@Column(name="is_delete")
	private Boolean isDelete;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
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

	public void createdOn(String createdOn) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date coDateNew = null;
		try {
			coDateNew = format.parse(createdOn); 
			} catch (Exception e) {
				this.createdOn= null;
			}
		this.createdOn=coDateNew;
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

	public void modifiedOn(String modifiedOn) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date moDateNew = null;
		try {
			moDateNew = format.parse(modifiedOn); 
			} catch (Exception e) {
				this.modifiedOn= null;
			}
		this.modifiedOn=moDateNew;
	}

	public Integer getDeletedBy() {
		return deletedBy;
	}

	public void setDeletedBy(Integer deletedBy) {
		this.deletedBy = deletedBy;
	}

	public Date getDeletedOn() {
		return deletedOn;
	}

	public void deletedOn(String deletedOn) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date doDateNew = null;
		try {
			doDateNew = format.parse(deletedOn); 
			} catch (Exception e) {
				this.deletedOn= null;
			}
		this.deletedOn=doDateNew;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	

}