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
import javax.persistence.OneToOne;
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
@Table(name="mst_series")
public class Series extends BaseAuditEntity {

	private static final long serialVersionUID = 6918147797908911998L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "series_uuid", nullable = false, unique=true)
	private String id;
	
	@Column(name="series_instance_uid", length=100)
	private String seriesInstanceUID;
	
	@Column(name="series_number")
	private Integer seriesNumber;
	
	@Column(name="series_description", length=100)
	private String seriesDescription;	
		
	@Column(name="body_part_examined", length=40)
	private String bodyPartExamined;
	
	@Column(name="patient_position", length=30)	
	private String patientPosition;
	
	@Column(name="laterality", length=100)
	private String laterality;
	
	@Column(name="protocol_name", length=100)
	private String protocolName;
	
	@Column(name="operators_name", length=50)
	private String operatorsName;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="series_date_time")
	private Date seriesDateTime;
		
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="study_uuid")
	private Study study;

	@OneToOne(mappedBy = "series")
	private Equipment equipment;

	@OneToMany(mappedBy = "series")
	private Collection<Instance> instance;

	@Override
	public String toString() {
		return String.format(
				"Series[id=%d, seriesInstanceUID=%s, seriesNumber=%d, seriesDescription=%s, bodyPartExamined=%s, patientPosition=%s, laterality=%s, protocolName=%s, operatorsName=%s, seriesDateTime=%s, createdDate=%s, modifiedDate=%s]",
				id, seriesInstanceUID, seriesNumber, seriesDescription, bodyPartExamined, patientPosition,
				laterality, protocolName, operatorsName, seriesDateTime, createdDate, modifiedDate);
	}
   
}
