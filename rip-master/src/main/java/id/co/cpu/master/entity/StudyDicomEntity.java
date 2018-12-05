package id.co.cpu.master.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import id.co.cpu.common.entity.BaseAuditEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name="dcm_study")
public class StudyDicomEntity extends BaseAuditEntity {

	private static final long serialVersionUID = 6126899965207417288L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "study_uuid", nullable = false, unique=true)
	private String id;	

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

	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="patient_uuid")
	private PatientDicomEntity patient; 
	
	@OneToMany(mappedBy = "study")
	private Collection<SeriesDicomEntity> series;

	@Override
	public String toString() {
		return String.format(
				"Study[id=%s, studyID=%s, studyDescription=%s, studyInstanceUID=%s, accessionNumber=%s, studyDateTime=%s, referringPhysicianName=%s, additionalPatientHistory=%s, admittingDiagnosesDescription=%s, studyStatusID=%s, studyPriorityID=%s, patientID=%s]",
				id, studyID, studyDescription, studyInstanceUID, accessionNumber, studyDateTime,
				referringPhysicianName, additionalPatientHistory, admittingDiagnosesDescription, studyStatusID,
				studyPriorityID, patient.getPatientId());
	}
	
   
}
