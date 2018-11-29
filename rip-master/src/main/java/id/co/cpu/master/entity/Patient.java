package id.co.cpu.master.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

/**
 * Entity implementation class for Entity: Patient
 * 
 */
@Entity
@Table(name = "mst_patient")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Patient implements Serializable {

	private static final long serialVersionUID = 657390142518153080L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name="id")	
	private Long id;	
	
	@Column(name="patient_id", length=100)
	private String patientID;	
	
	@Column(name="patient_name", length=100)
	private String patientName;
	
	@Column(name="patient_sex", length=10)
	private String patientSex;
	
	@Temporal(TemporalType.DATE)
	@Column(name="patient_birthday")
	private Date patientBirthday;
	
	@Column(name="patient_age", length=10)
	private String patientAge;
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_date", updatable = false, insertable=true)
	private Date createdDate;
	
	@Column(name="created_by", length=25)
	private String createdBy;
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="modified_date", insertable = true, updatable=true)
	private Date modifiedDate;
	
	@Column(name="modified_by", length=25)
	private String modifiedBy;

	@OneToMany(mappedBy = "patient")
	private Collection<Study> study;

	public Patient() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPatientID() {
		return this.patientID;
	}

	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}

	public String getPatientName() {
		return this.patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientSex() {
		return this.patientSex;
	}

	public void setPatientSex(String patientSex) {
		this.patientSex = patientSex;
	}

	public Date getPatientBirthday() {
		return patientBirthday;
	}

	public void setPatientBirthday(Date patientBirthday) {
		this.patientBirthday = patientBirthday;
	}

	public String getPatientAge() {
		return this.patientAge;
	}

	public void setPatientAge(String patientAge) {
		this.patientAge = patientAge;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getModifiedDate() {
		return this.modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@PreUpdate
	@PrePersist
	public void updateTimeStamps() {
		modifiedDate = new Date();
		if (createdDate == null) {
			createdDate = new Date();
		}
	}

	public Collection<Study> getStudy() {
		return study;
	}

	public void setStudy(Collection<Study> param) {
		this.study = param;
	}

	@Override
	public String toString() {
		return String.format(
				"Patient[id=%d, patientID=%s, patientName=%s, patientSex=%s, patientBirthday=%s, patientAge=%s, createdDate=%s, modifiedDate=%s]",
				id, patientID, patientName, patientSex, patientBirthday, patientAge, createdDate,
				modifiedDate);
	}
	
}