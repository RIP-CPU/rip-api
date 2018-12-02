package id.co.cpu.master.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

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
@Table(name="mst_equipment")
public class Equipment extends BaseAuditEntity {

	private static final long serialVersionUID = 6245262777427705812L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "equipment_uuid", nullable = false, unique=true)
	private String id;
	
	@Column(name="modality", length=50)
	private String modality;
	
	@Column(name="conversion_type", length=50)
	private String conversionType;
	
	@Column(name="station_name", length=60)
	private String stationName;
	
	@Column(name="institution_name", length=100)
	private String institutionName;
	
	@Column(name="institution_address", length=150)
	private String institutionAddress;
	
	@Column(name="institutional_department_name", length=50)
	private String institutionalDepartmentName;
	
	@Column(name="manufacturer", length=100)
	private String manufacturer;
	
	@Column(name="manufacturer_model_name", length=100)
	private String manufacturerModelName;
	
	@Column(name="software_version", length=100)
	private String softwareVersion;
	
	@Column(name="device_serial_number", length=100)
	private String deviceSerialNumber;
	
	@OneToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="series_uuid")
	private Series series;
	
	@PreUpdate
    @PrePersist
    public void updateTimeStamps() {    	
    	modifiedDate = new Date();
        if (createdDate==null) {
        	createdDate = new Date();
        }
    }
	
	@Override
	public String toString(){
		return String.format(
				"Equipment[id=%s, modality=%s, conversionType=%s, stationName=%s, institutionName=%s, institutionAddress=%s, institutionalDepartmentName=%s, manufacturer=%s, manufacturerModelName=%s, softwareVersion=%s, deviceSerialNumber=%s]", 
				id, modality, conversionType, stationName, institutionName, institutionAddress, institutionalDepartmentName, manufacturer, manufacturerModelName, softwareVersion, deviceSerialNumber);
	}
	   
}
