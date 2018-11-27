package id.co.cpu.pacs.entity;

import java.io.Serializable;
import java.lang.Float;
import java.lang.Integer;
import java.lang.String;
import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import id.co.cpu.pacs.entity.Series;

/**
 * Entity implementation class for Entity: instance
 *
 */
@Entity
@Table(name="mst_instance")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Instance implements Serializable {

	private static final long serialVersionUID = -4366785097270784782L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@Column(name="sop_instance_uid", length=100)
	private String sopInstanceUID;
	
	@Column(name="sop_class_uid", length=100)
	private String sopClassUID;
	
	@Column(name="instance_number")
	private Integer instanceNumber;
	
	@Column(name="patient_orientation", length=40)
	private String patientOrientation;
	
	@Column(name="media_storage_sop_instance_uid", length=100)
	private String mediaStorageSopInstanceUID;
	
	@Column(name="transfer_syntax_uid", length=100)
	private String transferSyntaxUID;	

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="acquisition_date_time")
	private Date acquisitionDateTime;
	
	@Column(name="image_type", length=40)
	private String imageType;
	
	@Column(name="pixel_spacing")
	private Float pixelSpacing;
	
	@Column(name="image_orientation", length=40)
	private String imageOrientation;
	
	@Column(name="image_position", length=80)
	private String imagePosition;
	
	@Column(name="slice_thickness")
	private Float sliceThickness;
	
	@Column(name="slice_location")
	private Float sliceLocation;
	
	@Column(name="window_center", length=40)
	private String windowCenter;
	
	@Column(name="window_width", length=40)
	private String windowWidth;
	
	@Column(name="xray_tube_current")
	private Integer xrayTubeCurrent;
	
	@Column(name="exposure_time")
	private Integer exposureTime;
	
	@Column(name="kvp", length=40)
	private String kvp;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="content_date_time")
	private Date contentDateTime;
	
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
	@JoinColumn(name="series_id")
	private Series series;

	public Instance() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSopInstanceUID() {
		return this.sopInstanceUID;
	}

	public void setSopInstanceUID(String sopInstanceUID) {
		this.sopInstanceUID = sopInstanceUID;
	}

	public String getSopClassUID() {
		return this.sopClassUID;
	}

	public void setSopClassUID(String sopClassUID) {
		this.sopClassUID = sopClassUID;
	}

	public Integer getInstanceNumber() {
		return this.instanceNumber;
	}

	public void setInstanceNumber(Integer instanceNumber) {
		this.instanceNumber = instanceNumber;
	}

	public String getPatientOrientation() {
		return this.patientOrientation;
	}

	public void setPatientOrientation(String patientOrientation) {
		this.patientOrientation = patientOrientation;
	}

	public String getMediaStorageSopInstanceUID() {
		return this.mediaStorageSopInstanceUID;
	}

	public void setMediaStorageSopInstanceUID(String mediaStorageSopInstanceUID) {
		this.mediaStorageSopInstanceUID = mediaStorageSopInstanceUID;
	}

	public String getTransferSyntaxUID() {
		return this.transferSyntaxUID;
	}

	public void setTransferSyntaxUID(String transferSyntaxUID) {
		this.transferSyntaxUID = transferSyntaxUID;
	}

	public Date getAcquisitionDateTime() {
		return this.acquisitionDateTime;
	}

	public void setAcquisitionDateTime(Date acquisitionDateTime) {
		this.acquisitionDateTime = acquisitionDateTime;
	}

	public String getImageType() {
		return this.imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public Float getPixelSpacing() {
		return this.pixelSpacing;
	}

	public void setPixelSpacing(Float pixelSpacing) {
		this.pixelSpacing = pixelSpacing;
	}

	public String getImageOrientation() {
		return this.imageOrientation;
	}

	public void setImageOrientation(String imageOrientation) {
		this.imageOrientation = imageOrientation;
	}

	public String getImagePosition() {
		return this.imagePosition;
	}

	public void setImagePosition(String imagePosition) {
		this.imagePosition = imagePosition;
	}

	public Float getSliceThickness() {
		return this.sliceThickness;
	}

	public void setSliceThickness(Float sliceThickness) {
		this.sliceThickness = sliceThickness;
	}

	public Float getSliceLocation() {
		return this.sliceLocation;
	}

	public void setSliceLocation(Float sliceLocation) {
		this.sliceLocation = sliceLocation;
	}

	public String getWindowCenter() {
		return this.windowCenter;
	}

	public void setWindowCenter(String windowCenter) {
		this.windowCenter = windowCenter;
	}

	public String getWindowWidth() {
		return this.windowWidth;
	}

	public void setWindowWidth(String windowWidth) {
		this.windowWidth = windowWidth;
	}

	public Integer getXrayTubeCurrent() {
		return this.xrayTubeCurrent;
	}

	public void setXrayTubeCurrent(Integer xrayTubeCurrent) {
		this.xrayTubeCurrent = xrayTubeCurrent;
	}

	public Integer getExposureTime() {
		return this.exposureTime;
	}

	public void setExposureTime(Integer exposureTime) {
		this.exposureTime = exposureTime;
	}

	public String getKvp() {
		return this.kvp;
	}

	public void setKvp(String kvp) {
		this.kvp = kvp;
	}

	public Date getContentDateTime() {
		return this.contentDateTime;
	}

	public void setContentDateTime(Date contentDateTime) {
		this.contentDateTime = contentDateTime;
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

	public Series getSeries() {
		return series;
	}

	public void setSeries(Series param) {
		this.series = param;
	}

	@Override
	public String toString() {
		return String.format(
				"Instance[id=%d, sopInstanceUID=%s, sopClassUID=%s, instanceNumber=%d, patientOrientation=%s, mediaStorageSopInstanceUID=%s, acquisitionDateTime=%s, imageType=%s, pixelSpacing=%f, imageOrientation=%s, imagePosition=%s, sliceThickness=%f, sliceLocation=%f, windowCenter=%s, windowWidth=%s, xrayTubeCurrent=%d, exposureTime=%d, kvp=%s, contentDateTime=%s, createdDate=%s, modifiedDate=%s]",
				id, sopInstanceUID, sopClassUID, instanceNumber, patientOrientation, mediaStorageSopInstanceUID,
				acquisitionDateTime, imageType, pixelSpacing, imageOrientation, imagePosition, sliceThickness,
				sliceLocation, windowCenter, windowWidth, xrayTubeCurrent, exposureTime, kvp, contentDateTime,
				createdDate, modifiedDate);
	}
   
}
