package id.co.cpu.file.entity;

import java.util.Date;

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
@Table(name="mst_file_metadata", schema = SchemaDatabase.MASTER)
public class FileMetadataEntity extends BaseAuditEntity {

	private static final long serialVersionUID = 657390142518153080L;

	@Id
	@GenericGenerator(name = "uuid", strategy = "uuid2")
	@GeneratedValue(generator = "uuid")
    @Column(name = "file_metadata_uuid", nullable = false, unique=true)
	private String id;	
	
	@Column(name="file_checksum")
	private String fileChecksum;	
	
	@Column(name="file_full_name")
	private String fileFullname;
	
	@Column(name="file_short_name")
	private String fileShortname;
	
	@Column(name="file_extension")
	private String fileExtension;
	
	@Column(name="file_full_path")
	private String fileFullPath;
	
	@Column(name="file_location")
	private String fileLocation;
	
	@Column(name="file_size")
	private Integer fileSize;
	
	@Column(name="file_date")
	private Date fileDate;
	
	@Column(name="file_type")
	private String fileType;
	
	@Column(name="file_download_count")
	private Integer fileDownloadCount;
	
}
