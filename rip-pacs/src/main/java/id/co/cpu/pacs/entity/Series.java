package id.co.cpu.pacs.entity;

import java.io.Serializable;
import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import id.co.cpu.pacs.entity.Equipment;
import id.co.cpu.pacs.entity.Study;

import java.util.Collection;

/**
 * Entity implementation class for Entity: Series
 *
 */
@Entity
@Table(name="mst_series")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Series implements Serializable {

	private static final long serialVersionUID = 6918147797908911998L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="entity_series_id")
	private Long id;
	
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
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_date", updatable = false, insertable=true)
	private Date createdDate;
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="modified_date", insertable = true, updatable=true)
	private Date modifiedDate;
		
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="entity_study_id")
	private Study study;

	@OneToOne(mappedBy = "series")
	private Equipment equipment;

	@OneToMany(mappedBy = "series")
	private Collection<Instance> instance;	

	public Series() {
		super();
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSeriesInstanceUID() {
		return this.seriesInstanceUID;
	}

	public void setSeriesInstanceUID(String seriesInstanceUID) {
		this.seriesInstanceUID = seriesInstanceUID;
	}

	public Integer getSeriesNumber() {
		return this.seriesNumber;
	}

	public void setSeriesNumber(Integer seriesNumber) {
		this.seriesNumber = seriesNumber;
	}

	public String getSeriesDescription() {
		return this.seriesDescription;
	}

	public void setSeriesDescription(String seriesDescription) {
		this.seriesDescription = seriesDescription;
	}

	public String getBodyPartExamined() {
		return this.bodyPartExamined;
	}

	public void setBodyPartExamined(String bodyPartExamined) {
		this.bodyPartExamined = bodyPartExamined;
	}

	public String getLaterality() {
		return this.laterality;
	}

	public void setLaterality(String laterality) {
		this.laterality = laterality;
	}

	public String getProtocolName() {
		return this.protocolName;
	}

	public void setProtocolName(String protocolName) {
		this.protocolName = protocolName;
	}

	public String getPatientPosition() {
		return patientPosition;
	}

	public void setPatientPosition(String patientPosition) {
		this.patientPosition = patientPosition;
	}

	public String getOperatorsName() {
		return this.operatorsName;
	}

	public void setOperatorsName(String operatorsName) {
		this.operatorsName = operatorsName;
	}

	public Date getSeriesDateTime() {
		return this.seriesDateTime;
	}

	public void setSeriesDateTime(Date seriesDateTime) {
		this.seriesDateTime = seriesDateTime;
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

	public Study getStudy() {
		return study;
	}

	public void setStudy(Study param) {
		this.study = param;
	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment param) {
		this.equipment = param;
	}

	public Collection<Instance> getInstance() {
		return instance;
	}

	public void setInstance(Collection<Instance> param) {
		this.instance = param;
	}

	@Override
	public String toString() {
		return String.format(
				"Series[id=%d, seriesInstanceUID=%s, seriesNumber=%d, seriesDescription=%s, bodyPartExamined=%s, patientPosition=%s, laterality=%s, protocolName=%s, operatorsName=%s, seriesDateTime=%s, createdDate=%s, modifiedDate=%s]",
				id, seriesInstanceUID, seriesNumber, seriesDescription, bodyPartExamined, patientPosition,
				laterality, protocolName, operatorsName, seriesDateTime, createdDate, modifiedDate);
	}
   
}
