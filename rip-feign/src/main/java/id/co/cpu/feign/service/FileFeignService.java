package id.co.cpu.feign.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import id.co.cpu.feign.dto.file.FileMetadataDto;
import id.co.cpu.feign.service.file.FileMetadataFeign;

//@Service
public class FileFeignService {
	
	@Autowired
	private FileMetadataFeign fileMetadataFeign;
	
	public FileMetadataDto putFileDicomDcm(File file, String path) throws Exception {
		return fileMetadataFeign.putFileDicomDcm(file, path, LocaleContextHolder.getLocale().toLanguageTag()).getBody();
	}
	
	public List<FileMetadataDto> putFileDicomZip(File file, String path) throws Exception {
		return fileMetadataFeign.putFileDicomZip(file, path, LocaleContextHolder.getLocale().toLanguageTag()).getBody();
	}

}
