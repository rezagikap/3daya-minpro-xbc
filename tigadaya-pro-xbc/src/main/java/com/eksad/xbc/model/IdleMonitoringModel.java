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
@Table(name= "t_monitoring")
public class IdleMonitoringModel {
    @Id
    @Column(name="id", columnDefinition="serial")
    @GeneratedValue(strategy=GenerationType.TABLE, generator= "t_monitoring_seq")
    @TableGenerator(name = "t_monitoring_seq", table = "tbl_squence", pkColumnName = "seq_id",
	valueColumnName = "seq_value", initialValue = 0, allocationSize = 1)
	private Integer id;
    
    @Column(name="biodata_id")
	private Integer testId;
    
    @Column(name="idle_date")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss") 
	private Date idleDate;
    
    @Column(name="last_project")
	private String lastProject;
    
    @Column(name="idle_reason")
	private String idleReason;
    
    @Column(name="placement_date")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss") 
	private Date placementDate;
    
    @Column(name="placement_at")
	private String placementAt;
    
    @Column(name="notes")
	private String notes;
    
    @Column(name="created_by")
	private Integer createdBy;
    
    @Column(name="created_on")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss") 
	private Date createdOn;
    
    @Column(name="modified_by")
	private Integer modifiedBy;
    
    @Column(name="modified_on")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss") 
	private Date modifiedOn;
    
    @Column(name="deleted_by")
	private Integer deletedBy;
    
    @Column(name="deleted_on")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss") 
	private Date  deletedOn;
    
    @Column(name="is_delete")
	private Boolean isDelete;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTestId() {
		return testId;
	}

	public void setTestId(Integer testId) {
		this.testId = testId;
	}

	public Date getIdleDate() {
		return idleDate;
	}

	public void setIdleDate(String idleDate) {
		SimpleDateFormat format = new SimpleDateFormat ("dd-MM-yyyy hh:mm:ss");
		Date idle = null;
		try {
			idle = format.parse(idleDate);
		} catch (Exception e) {
			idle = null;
		}
		this.idleDate = idle;
	}

	public String getLastProject() {
		return lastProject;
	}

	public void setLastProject(String lastProject) {
		this.lastProject = lastProject;
	}

	public String getIdleReason() {
		return idleReason;
	}

	public void setIdleReason(String idleReason) {
		this.idleReason = idleReason;
	}

	public Date getPlacementDate() {
		return placementDate;
	}

	public void setPlacementDate(String placementDate) {
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");	
	Date place = null;
	try {
		place=format.parse(placementDate);
	} catch (Exception e) {
		place = null;
	}
		this.placementDate = place;
	}

	public String getPlacementAt() {
		return placementAt;
	}

	public void setPlacementAt(String placementAt) {
		this.placementAt = placementAt;
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
