package id.co.cpu.feign.service.file;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import id.co.cpu.feign.dto.file.FileMetadataDto;

public interface FileMetadataService {
	
	public FileMetadataDto putFileDicomDcm(String filePath, String filename, byte[] fileContent) throws Exception;
	
	public List<FileMetadataDto> putFileDicomZip(MultipartFile zip, String path) throws Exception;

}
