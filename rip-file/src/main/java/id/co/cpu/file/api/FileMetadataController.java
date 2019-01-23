package id.co.cpu.file.api;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import id.co.cpu.common.exceptions.BaseControllerException;
import id.co.cpu.feign.dto.file.FileMetadataDto;
import id.co.cpu.file.service.FileMetadataImplService;

@RestController
@RequestMapping("/api/file")
public class FileMetadataController extends BaseControllerException {

	@Autowired
	private FileMetadataImplService fileMetadataService;
	
	@RequestMapping(value = "/trx/put/dicom-file/v.1", method = RequestMethod.PUT, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)	
	public ResponseEntity<FileMetadataDto> putFileDicomDcm(Authentication authentication,
			@RequestPart @Valid MultipartFile dicom,
			@RequestParam @Valid String path,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception {
		return new ResponseEntity<FileMetadataDto>(fileMetadataService.putFileDicomDcm(dicom, path), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/trx/put/dicom-zip/v.1", method = RequestMethod.PUT, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileMetadataDto>> putFileDicomZip(Authentication authentication,
			@RequestPart @Valid MultipartFile zip,
			@RequestParam @Valid String path,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception {
		return new ResponseEntity<List<FileMetadataDto>>(fileMetadataService.putFileDicomZip(zip, path), HttpStatus.OK);
	}
	
}
