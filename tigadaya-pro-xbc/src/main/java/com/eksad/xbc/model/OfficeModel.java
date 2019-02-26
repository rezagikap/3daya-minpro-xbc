package com.eksad.xbc.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="t_office")
public class OfficeModel {
	@Id
	@Column(name="id", columnDefinition="serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "user_seq")
	@TableGenerator(name = "user_seq", table = "tbl_squence", 
	pkColumnName = "seq_id", valueColumnName = "seq_value", 
	initialValue = 0, allocationSize=1)	
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="address")
    private String address;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@Column(name="modified_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@Column(name="deleted_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
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

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
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

	public void setDeletedOn(Date deletedOn) {
		this.deletedOn = deletedOn;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
	
	
}
