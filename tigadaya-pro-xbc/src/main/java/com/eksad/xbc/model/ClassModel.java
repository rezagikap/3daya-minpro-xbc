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
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="t_clazz")
@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property="id")
public class ClassModel {
	@Id
	@Column(name="id", columnDefinition="serial")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="t_clazz_seq")
	@TableGenerator(name="t_clazz_seq", table="tbl_squence", pkColumnName="seq_id",
	valueColumnName="seq_value", initialValue=0, allocationSize=1)
	private Integer id;
	
	@Column(name="batch_id")
	private Integer batchId;
	
	@Column(name="biodata_id")
	private Integer biodataId;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="dd-MM-yyyy hh:mm:ss")
	private Date createdOn;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBatchId() {
		return batchId;
	}

	public void setBatchId(Integer batchId) {
		this.batchId = batchId;
	}

	public Integer getBiodataId() {
		return biodataId;
	}

	public void setBiodataId(Integer biodataId) {
		this.biodataId = biodataId;
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
		Date createdOnNew=null;
		try {
			createdOnNew=format.parse(createdOn);
		} catch (Exception e) {
			this.createdOn=null;
		}
		this.createdOn = createdOnNew;
	}
}