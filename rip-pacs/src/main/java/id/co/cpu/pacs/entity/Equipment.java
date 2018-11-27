package id.co.cpu.pacs.entity;

import java.io.Serializable;
import java.lang.String;
import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import id.co.cpu.pacs.entity.Series;

/**
 * Entity implementation class for Entity: Equipment
 *
 */
@Entity
@Table(name="mst_equipment")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="@id")
public class Equipment implements Serializable {

	private static final long serialVersionUID = 6245262777427705812L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name="entity_equipment_id")
	private Long id;
	
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
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="created_date", updatable = false, insertable=true)
	private Date createdDate;
	
	@Temporal(TemporalType.TIMESTAMP)
    @Column(name="modified_date", insertable = true, updatable=true)
	private Date modifiedDate;
	
	@OneToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="entity_series_id")
	private Series series;
		
	public Equipment() {
		super();
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getModality() {
		return this.modality;
	}
	public void setModality(String modality) {
		this.modality = modality;
	}
	
	public String getConversionType(){
		return this.conversionType;
	}
	public void setConversionType(String conversionType){
		this.conversionType = conversionType;
	}
	
	public String getStationName() {
		return this.stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	
	public String getInstitutionName() {
		return this.institutionName;
	}
	public void setInstitutionName(String institutionName) {
		this.institutionName = institutionName;
	}
	
	public String getInstitutionAddress() {
		return this.institutionAddress;
	}
	public void setInstitutionAddress(String institutionAddress) {
		this.institutionAddress = institutionAddress;
	}
	
	public String getInstitutionalDepartmentName() {
		return this.institutionalDepartmentName;
	}
	public void setInstitutionalDepartmentName(String institutionalDepartmentName) {
		this.institutionalDepartmentName = institutionalDepartmentName;
	}
	
	public String getManufacturer() {
		return this.manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	public String getManufacturerModelName() {
		return this.manufacturerModelName;
	}
	public void setManufacturerModelName(String manufacturerModelName) {
		this.manufacturerModelName = manufacturerModelName;
	}
	
	public String getSoftwareVersion() {
		return this.softwareVersion;
	}
	public void setSoftwareVersion(String softwareVersion) {
		this.softwareVersion = softwareVersion;
	}
	
	public String getDeviceSerialNumber() {
		return this.deviceSerialNumber;
	}
	public void setDeviceSerialNumber(String deviceSerialNumber) {
		this.deviceSerialNumber = deviceSerialNumber;
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
        if (createdDate==null) {
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
	public String toString(){
		return String.format(
				"Equipment[id=%d, modality=%s, conversionType=%s, stationName=%s, institutionName=%s, institutionAddress=%s, institutionalDepartmentName=%s, manufacturer=%s, manufacturerModelName=%s, softwareVersion=%s, deviceSerialNumber=%s, createdDate=%s, modifiedDate=%s]", 
				id, modality, conversionType, stationName, institutionName, institutionAddress, institutionalDepartmentName, manufacturer, manufacturerModelName, softwareVersion, deviceSerialNumber, createdDate, modifiedDate);
	}
	   
}
