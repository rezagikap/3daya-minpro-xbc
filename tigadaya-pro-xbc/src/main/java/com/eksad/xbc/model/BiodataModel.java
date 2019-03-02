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
@Table(name="t_biodata")
public class BiodataModel {
	
	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="biodata_seq")
	@TableGenerator(name="biodata_seq", table="tbl_squence", pkColumnName="seq_id", valueColumnName="seq_value", initialValue=0,allocationSize=1)
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="last_education")
	private String lastEducation;
	
	@Column(name="graduation_year")
	private String graduationYear;
	
	@Column(name="educational_level")
	private String educationalLevel;
	
	@Column(name="majors")
	private String majors;
	
	@Column(name="gpa")
	private String gpa;
	
	@Column(name="bootcamp_test_type")
	private Integer bootcampTestType;
	
	@Column(name="iq")
	private Integer iq;
	
	@Column(name="du")
	private String du;
	
	@Column(name="arithmetic")
	private Integer arithmetic;
	
	@Column(name="nested_logic")
	private Integer nestedLogic;
	
	@Column(name="join_table")
	private Integer joinTable;
	
	@Column(name="tro")
	private String tro;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="interviewer")
	private String interviewer;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm:ss")
	private Date createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@Column(name="modified_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm:ss")
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@Column(name="deleted_on")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm:ss")
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLastEducation() {
		return lastEducation;
	}

	public void setLastEducation(String lastEducation) {
		this.lastEducation = lastEducation;
	}

	public String getGraduationYear() {
		return graduationYear;
	}

	public void setGraduationYear(String graduateYear) {
		this.graduationYear = graduateYear;
	}

	public String getEducationalLevel() {
		return educationalLevel;
	}

	public void setEducationalLevel(String educationLevel) {
		this.educationalLevel = educationLevel;
	}

	public String getMajors() {
		return majors;
	}

	public void setMajors(String majors) {
		this.majors = majors;
	}

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
	}

	public Integer getBootcampTestType() {
		return bootcampTestType;
	}

	public void setBootcampTestType(Integer bootcampTestType) {
		this.bootcampTestType = bootcampTestType;
	}

	public Integer getIq() {
		return iq;
	}

	public void setIq(Integer iq) {
		this.iq = iq;
	}

	public String getDu() {
		return du;
	}

	public void setDu(String du) {
		this.du = du;
	}

	public Integer getArithmetic() {
		return arithmetic;
	}

	public void setArithmetic(Integer arithmetic) {
		this.arithmetic = arithmetic;
	}

	public Integer getNestedLogic() {
		return nestedLogic;
	}

	public void setNestedLogic(Integer nastedLogic) {
		this.nestedLogic = nastedLogic;
	}

	public Integer getJoinTable() {
		return joinTable;
	}

	public void setJoinTable(Integer joinTable) {
		this.joinTable = joinTable;
	}

	public String getTro() {
		return tro;
	}

	public void setTro(String tro) {
		this.tro = tro;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getInterviewer() {
		return interviewer;
	}

	public void setInterviewer(String interviewer) {
		this.interviewer = interviewer;
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
