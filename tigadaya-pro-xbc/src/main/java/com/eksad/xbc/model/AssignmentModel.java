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

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="t_assignment")
public class AssignmentModel {
	
	@Id
	@Column(name = "id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "assignment_seq")
	@TableGenerator(name = "assignment_seq", table = "tbl_squence", pkColumnName = "seq_id", valueColumnName = "seq_value", initialValue = 0, allocationSize = 1)
	private Integer id;
	
	@Column(name="biodata_id")
	private Integer biodata_id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="start_date")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date startDate;
	
	@Column(name="end_date")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date endDate;
	
	@Column(name="description")
	private String description;
	
	@Column(name="realization_date")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
	private Date realizationDate;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="is_hold")
	private Boolean isHold;
	
	@Column(name="is_done")
	private Boolean isDone;
	
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

	public Integer getBiodata_id() {
		return biodata_id;
	}

	public void setBiodata_id(Integer biodata_id) {
		this.biodata_id = biodata_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date startDateNew = null;
		try {
			startDateNew = format.parse(startDate);
		} catch (Exception e) {
			this.startDate = null;
		}
		this.startDate = startDateNew;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date endDateNew = null;
		try {
			endDateNew = format.parse(endDate);
		} catch (Exception e) {
			this.endDate = null;
		}
		this.endDate = endDateNew;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getRealizationDate() {
		return realizationDate;
	}

	public void setRealizationDate(String realizationDate) {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date realizationDateNew = null;
		try {
			realizationDateNew = format.parse(realizationDate);
		} catch (Exception e) {
			this.realizationDate = null;
		}
		this.realizationDate = realizationDateNew;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Boolean getIsHold() {
		return isHold;
	}

	public void setIsHold(Boolean isHold) {
		this.isHold = isHold;
	}

	public Boolean getIsDone() {
		return isDone;
	}

	public void setIsDone(Boolean isDone) {
		this.isDone = isDone;
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
