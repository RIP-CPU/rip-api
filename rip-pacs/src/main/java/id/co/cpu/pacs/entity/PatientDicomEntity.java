package id.co.cpu.pacs.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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
@Table(name="dcm_patient")
public class PatientDicomEntity extends BaseAuditEntity {

	private static final long serialVersionUID = 657390142518153080L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "patient_uuid", nullable = false, unique=true)
	private String id;	
	
	@Column(name="patient_id", length=100)
	private String patientId;	
	
	@Column(name="patient_name", length=100)
	private String patientName;
	
	@Column(name="patient_sex", length=10)
	private String patientSex;
	
	@Temporal(TemporalType.DATE)
	@Column(name="patient_birthday")
	private Date patientBirthday;
	
	@Column(name="patient_age", length=10)
	private String patientAge;

	@OneToMany(mappedBy = "patient")
	private Collection<StudyDicomEntity> study;

	@Override
	public String toString() {
		return String.format(
				"Patient[id=%s, patientId=%s, patientName=%s, patientSex=%s, patientBirthday=%s, patientAge=%s]",
				id, patientId, patientName, patientSex, patientBirthday, patientAge);
	}
	
}
