package id.co.cpu.feign.service.file;

import java.io.File;
import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import id.co.cpu.feign.dto.file.FileMetadataDto;

@RequestMapping("/api/files")
@FeignClient(value="rip-file", fallback = FileMetadataFeign.FileMetadataFallback.class)
public interface FileMetadataFeign  {
	
	@RequestMapping(value = "/trx/put/dicom-file/v.1", method = RequestMethod.PUT, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)	
	public ResponseEntity<FileMetadataDto> putFileDicomDcm(
			@RequestParam("dicom") File dicom,
			@RequestParam("path") String path,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception;
	
	@RequestMapping(value = "/trx/put/dicom-zip/v.1", method = RequestMethod.PUT, consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileMetadataDto>> putFileDicomZip(
			@RequestParam("zip") File zip,
			@RequestParam("path") String path,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception;
	
	static class FileMetadataFallback implements FileMetadataFeign {

		@Override
		public ResponseEntity<FileMetadataDto> putFileDicomDcm(File dicom, String path, String locale) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public ResponseEntity<List<FileMetadataDto>> putFileDicomZip(File zip, String path, String locale) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
    }
}
