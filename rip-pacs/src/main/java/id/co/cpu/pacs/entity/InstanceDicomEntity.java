package id.co.cpu.pacs.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import id.co.cpu.common.entity.BaseAuditEntity;
import id.co.cpu.common.utils.SchemaDatabase;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name="dcm_instance", schema = SchemaDatabase.PACS)
public class InstanceDicomEntity extends BaseAuditEntity {

	private static final long serialVersionUID = -4366785097270784782L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "instance_uuid", nullable = false, unique=true)
	private String id;
	
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

	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="series_uuid")
	private SeriesDicomEntity series;

	@Override
	public String toString() {
		return String.format(
				"Instance[id=%s, sopInstanceUID=%s, sopClassUID=%s, instanceNumber=%d, patientOrientation=%s, mediaStorageSopInstanceUID=%s, acquisitionDateTime=%s, imageType=%s, pixelSpacing=%f, imageOrientation=%s, imagePosition=%s, sliceThickness=%f, sliceLocation=%f, windowCenter=%s, windowWidth=%s, xrayTubeCurrent=%d, exposureTime=%d, kvp=%s, contentDateTime=%s, createdDate=%s, modifiedDate=%s]",
				id, sopInstanceUID, sopClassUID, instanceNumber, patientOrientation, mediaStorageSopInstanceUID,
				acquisitionDateTime, imageType, pixelSpacing, imageOrientation, imagePosition, sliceThickness,
				sliceLocation, windowCenter, windowWidth, xrayTubeCurrent, exposureTime, kvp, contentDateTime,
				createdDate, modifiedDate);
	}
   
}
