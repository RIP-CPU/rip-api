package id.co.cpu.file.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.co.cpu.common.exceptions.BaseControllerException;
import id.co.cpu.file.service.FileMetadataImplService;

@RestController
@RequestMapping("/api/file")
public class FileMetadataController extends BaseControllerException {

	@Autowired
	private FileMetadataImplService fileMetadataService;
	
	@RequestMapping(value = "/trx/put/dicom-file/v.1", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> putFileDicomDcm(Authentication authentication,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception {
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/trx/put/dicom-zip/v.1", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> putFileDicomZip(Authentication authentication,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception {
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
	
}
