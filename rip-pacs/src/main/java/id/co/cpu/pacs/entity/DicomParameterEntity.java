package id.co.cpu.pacs.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

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
@Table(name="rip_dicom_parameter", schema = SchemaDatabase.PACS)
public class DicomParameterEntity extends BaseAuditEntity {

	private static final long serialVersionUID = 6245262777427705812L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "dicom_parameter_uuid", nullable = false, unique=true)
	private String id;
	
	@Column(name="corporate_id", length=50)
	private String corporateId;
	
	@Column(name="corporate_name", length=255)
	private String corporateName;
	
	@Column(name="ae_title", length=50)
	private String aeTitle;
	
	@Column(name="dicom_host", length=150)
	private String dicomHost;
	
	@Column(name="dicom_port")
	private Integer dicomPort;
	
	@Column(name="dicom_storage")
	private String dicomStorage;
	
	@Column(name="activated")
	private Boolean activated;
	   
}
