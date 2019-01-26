package id.co.cpu.feign.service.file;

import java.io.File;
import java.util.List;

import javax.validation.Valid;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import id.co.cpu.common.utils.RibbonContext;
import id.co.cpu.feign.dto.file.FileMetadataDto;

@FeignClient(value = RibbonContext.MASTER, fallback = FileMetadataFeign.FileMetadataFeignFallback.class)
@RequestMapping(RibbonContext.PATH_MASTER+"/api/file")
public interface FileMetadataFeign {
	
	@RequestMapping(value = "/trx/put/dicom-file/v.1", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)	
	public ResponseEntity<FileMetadataDto> putFileDicomDcm(
			@RequestPart("dicom") @Valid File dicom,
			@RequestParam("path") @Valid String path,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception;
	
	@RequestMapping(value = "/trx/put/dicom-zip/v.1", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FileMetadataDto>> putFileDicomZip(
			@RequestPart("zip") @Valid File zip,
			@RequestParam("path") @Valid String path,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception;
	
	static class FileMetadataFeignFallback implements FileMetadataFeign {

		@Override
		public ResponseEntity<FileMetadataDto> putFileDicomDcm(File dicom, String path, String locale) throws Exception {
			return null;
		}

		@Override
		public ResponseEntity<List<FileMetadataDto>> putFileDicomZip(File zip, String path, String locale) throws Exception {
			return null;
		}
		
	}
	
}
