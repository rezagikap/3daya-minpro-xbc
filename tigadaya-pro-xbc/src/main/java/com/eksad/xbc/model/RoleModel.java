package com.eksad.xbc.model;

<<<<<<< HEAD
import java.sql.Date;
import java.util.List;

=======
import java.text.SimpleDateFormat;
import java.util.Date;
>>>>>>> b0eec26a3f33e0249e43a37bf4c926302c71f5a9
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

<<<<<<< HEAD
import com.eksad.xbc.model.RoleModel;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="t_role")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
=======
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;



@Entity
@Table(name="t_role")
@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class, property="id")
>>>>>>> b0eec26a3f33e0249e43a37bf4c926302c71f5a9
public class RoleModel {
	@Id
	@Column(name="id", columnDefinition = "serial")
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "t_role_seq")
	@TableGenerator(name = "t_role_seq", table = "tbl_squence", pkColumnName = "seq_id", valueColumnName = "seq_value", initialValue = 0, allocationSize = 1)
	private Integer id;
	
	@JsonIgnore
	@OneToMany(mappedBy="role")
	private List<UserModel> listUser;
	
	@Column(name="code")
	private String code;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String description;
	
	@Column(name="created_by")
	private Integer createdBy;
	
	@Column(name="created_on")
<<<<<<< HEAD
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
=======
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
>>>>>>> b0eec26a3f33e0249e43a37bf4c926302c71f5a9
	private Date createdOn;
	
	@Column(name="modified_by")
	private Integer modifiedBy;
	
	@Column(name="modified_on")
<<<<<<< HEAD
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
=======
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
>>>>>>> b0eec26a3f33e0249e43a37bf4c926302c71f5a9
	private Date modifiedOn;
	
	@Column(name="deleted_by")
	private Integer deletedBy;
	
	@Column(name="deleted_on")
<<<<<<< HEAD
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
=======
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
>>>>>>> b0eec26a3f33e0249e43a37bf4c926302c71f5a9
	private Date deletedOn;
	
	@Column(name="is_deleted")
	private Boolean isDelete;

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

<<<<<<< HEAD
	public List<UserModel> getListUser() {
		return listUser;
	}

	public void setListUser(List<UserModel> listUser) {
		this.listUser = listUser;
	}
=======
>>>>>>> b0eec26a3f33e0249e43a37bf4c926302c71f5a9
	
	
}