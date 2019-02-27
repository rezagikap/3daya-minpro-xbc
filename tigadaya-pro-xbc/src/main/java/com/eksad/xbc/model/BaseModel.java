package com.eksad.xbc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BaseModel {
	
	@Column(name="created_by")
	private Integer createdBy;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	@Column(name="created_on")
	private Date createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	@Column(name="modified_on")
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	@Column(name="deleted_on")
	private Date deletedOn;
	
	@Column(name="is_delete")
	private Boolean isDelete;

	
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
		Date createdOnNew = null;
		try {
			createdOnNew = format.parse(createdOn);
		} catch (Exception e) {
			this.createdOn = null;
		}
		this.createdOn = createdOnNew;
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
		Date modifiedOnNew = null;
		try {
			modifiedOnNew = format.parse(modifiedOn);
		} catch (Exception e) {
			this.modifiedOn = null;
		}
		this.modifiedOn = modifiedOnNew;
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

	public void setDeletedOn(String deletedOn) {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date deletedOnNew = null;
		try {
			deletedOnNew = format.parse(deletedOn);
		} catch (Exception e) {
			this.deletedOn = null;
		}
		this.deletedOn = deletedOnNew;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
}
