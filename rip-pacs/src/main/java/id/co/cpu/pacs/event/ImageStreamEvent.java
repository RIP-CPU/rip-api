package id.co.cpu.pacs.event;

import java.io.File;
import java.io.InputStream;
import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class ImageStreamEvent implements Serializable {

	private static final long serialVersionUID = 8244229216737621902L;
	private final InputStream inputStream;
	private final File file;
	private final String ipAddress;
	private final String aeTitle;
	private final String aePath;
	private final Integer aePort;
	private final String associationName;
	private final String cuid;
	private final String iuid;
	private final String tsuid;
	
}
