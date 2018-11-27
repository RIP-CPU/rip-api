package id.co.cpu.pacs.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import id.co.cpu.pacs.entity.Patient;

/**
 * Entity implementation class for Entity: Study
 *
 */
@Entity
@Table(name="mst_study")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Study implements Serializable {

	private static final long serialVersionUID = 6126899965207417288L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;	

	@Column(name="study_id", length=50)
	private String studyID;
	
	@Column(name="study_description", length=300)
	private String studyDescription;
	
	@Column(name="study_instance_uid", length=100)
	private String studyInstanceUID;
	
	@Column(name="accession_number", length=30)
	private String accessionNumber;	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="study_date_time")
	private Date studyDateTime;
	
	@Column(name="referring_physician_name", length=100)
	private String referringPhysicianName;
	
	@Column(name="additional_patient_history", length=300)
	private String additionalPatientHistory;
	
	@Column(name="admitting_diagnoses_description", length=200)
	private String admittingDiagnosesDescription;
	
	@Column(name="study_status_id", length=40)
	private String studyStatusID;
	
	@Column(name="study_priority_id", length=40)
	private String studyPriorityID;
	
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

	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="patient_id")
	private Patient patient; 
	
	@OneToMany(mappedBy = "study")
	private Collection<Series> series;	
	
	public Study() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStudyID() {
		return this.studyID;
	}

	public void setStudyID(String studyID) {
		this.studyID = studyID;
	}

	public String getStudyDescription() {
		return studyDescription;
	}

	public void setStudyDescription(String studyDescription) {
		this.studyDescription = studyDescription;
	}

	public String getStudyInstanceUID() {
		return this.studyInstanceUID;
	}

	public void setStudyInstanceUID(String studyInstanceUID) {
		this.studyInstanceUID = studyInstanceUID;
	}

	public String getAccessionNumber() {
		return this.accessionNumber;
	}

	public void setAccessionNumber(String accessionNumber) {
		this.accessionNumber = accessionNumber;
	}

	public Date getStudyDateTime() {
		return this.studyDateTime;
	}

	public void setStudyDateTime(Date studyDateTime) {
		this.studyDateTime = studyDateTime;
	}

	public String getReferringPhysicianName() {
		return this.referringPhysicianName;
	}

	public void setReferringPhysicianName(String referringPhysicianName) {
		this.referringPhysicianName = referringPhysicianName;
	}

	public String getAdditionalPatientHistory() {
		return this.additionalPatientHistory;
	}

	public void setAdditionalPatientHistory(String additionalPatientHistory) {
		this.additionalPatientHistory = additionalPatientHistory;
	}

	public String getAdmittingDiagnosesDescription() {
		return this.admittingDiagnosesDescription;
	}

	public void setAdmittingDiagnosesDescription(String admittingDiagnosesDescription) {
		this.admittingDiagnosesDescription = admittingDiagnosesDescription;
	}

	public String getStudyStatusID() {
		return this.studyStatusID;
	}

	public void setStudyStatusID(String studyStatusID) {
		this.studyStatusID = studyStatusID;
	}

	public String getStudyPriorityID() {
		return this.studyPriorityID;
	}

	public void setStudyPriorityID(String studyPriorityID) {
		this.studyPriorityID = studyPriorityID;
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

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient param) {
		this.patient = param;
	}

	public Collection<Series> getSeries() {
		return series;
	}

	public void setSeries(Collection<Series> param) {
		this.series = param;
	}

	@Override
	public String toString() {
		return String.format(
				"Study[id=%d, studyID=%s, studyDescription=%s, studyInstanceUID=%s, accessionNumber=%s, studyDateTime=%s, referringPhysicianName=%s, additionalPatientHistory=%s, admittingDiagnosesDescription=%s, studyStatusID=%s, studyPriorityID=%s, createdDate=%s, modifiedDate=%s, patientID=%s]",
				id, studyID, studyDescription, studyInstanceUID, accessionNumber, studyDateTime,
				referringPhysicianName, additionalPatientHistory, admittingDiagnosesDescription, studyStatusID,
				studyPriorityID, createdDate, modifiedDate, patient.getId());
	}
	
   
}
