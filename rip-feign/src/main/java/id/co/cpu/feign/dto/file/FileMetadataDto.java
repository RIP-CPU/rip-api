package id.co.cpu.feign.dto.file;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class FileMetadataDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -928821648193952510L;
	private String fileChecksum;
	private String fileFullname;
	private String fileShortname;
	private String fileExtension;
	private String fileFullPath;
	private String fileLocation;
	private Integer fileSize;
	private Date fileDate;
	private String fileType;
	private Integer fileDownloadCount;

}
