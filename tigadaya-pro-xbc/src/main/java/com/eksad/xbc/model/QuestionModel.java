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
@Table(name="t_question")
public class QuestionModel {
	
	@Id
	@Column(name="id", columnDefinition="serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "question_seq")
	@TableGenerator(name = "question_seq", table = "tbl_squence", 
	pkColumnName = "seq_id", valueColumnName = "seq_value", 
	initialValue = 0, allocationSize=1)	
	private Integer id;
	
	@Column(name="question")
	private String question;
	
	@Column(name="question_type")
	private String questionType;
	
	@Column(name="option_a")
	private String optionA;
	
	@Column(name="option_b")
	private String optionB;
	
	@Column(name="option_c")
	private String optionC;
	
	@Column(name="option_d")
	private String optionD;
	
	@Column(name="option_e")
	private String optionE;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="image_a")
	private String imageA;
	
	@Column(name="image_b")
	private String imageB;
	
	@Column(name="image_c")
	private String imageC;
	
	@Column(name="image_d")
	private String imageD;
	
	@Column(name="image_e")
	private String imageE;
	
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getOptionE() {
		return optionE;
	}

	public void setOptionE(String optionE) {
		this.optionE = optionE;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getImageA() {
		return imageA;
	}

	public void setImageA(String imageA) {
		this.imageA = imageA;
	}

	public String getImageB() {
		return imageB;
	}

	public void setImageB(String imageB) {
		this.imageB = imageB;
	}

	public String getImageC() {
		return imageC;
	}

	public void setImageC(String imageC) {
		this.imageC = imageC;
	}

	public String getImageD() {
		return imageD;
	}

	public void setImageD(String imageD) {
		this.imageD = imageD;
	}

	public String getImageE() {
		return imageE;
	}

	public void setImageE(String imageE) {
		this.imageE = imageE;
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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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
