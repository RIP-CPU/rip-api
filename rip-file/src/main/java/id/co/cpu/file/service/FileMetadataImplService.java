package id.co.cpu.file.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import id.co.cpu.feign.dto.file.FileMetadataDto;
import id.co.cpu.feign.service.file.FileMetadataService;
import id.co.cpu.file.dao.FileMetadataRepo;
import id.co.cpu.file.entity.FileMetadataEntity;
import id.co.cpu.file.utils.FileUtils;

@Service("fileMetadataService")
public class FileMetadataImplService implements FileMetadataService {

	protected final Log LOGGER = LogFactory.getLog(getClass());

	@Autowired
	@Qualifier("fileMetadataRepo")
	private FileMetadataRepo fileMetadataRepo;

	@Autowired
	private FileUtils fileUtils;

	@Override
	public FileMetadataDto putFileDicomDcm(String filePath, String filename, byte[] fileContent) throws Exception {
		FileMetadataDto fileMetadataDto = fileUtils.writeFile(filePath, filename, fileContent);
		FileMetadataEntity fileMetadata = new FileMetadataEntity();
		fileMetadata.setChecksum(fileMetadataDto.getChecksum());
		fileMetadata.setExtension(fileMetadataDto.getExtension());
		fileMetadata.setFileDate(fileMetadataDto.getFileDate());
		fileMetadata.setFileType(fileMetadataDto.getFileType());
		fileMetadata.setFullname(fileMetadataDto.getFullname());
		fileMetadata.setFullPath(fileMetadataDto.getFullPath());
		fileMetadata.setLocation(fileMetadataDto.getLocation());
		fileMetadata.setShortname(fileMetadataDto.getShortname());
		fileMetadata.setSize(fileMetadataDto.getSize());
		try {
			fileMetadataRepo.save(fileMetadata);
		} catch (DataIntegrityViolationException e) {
			LOGGER.warn(e.getLocalizedMessage());
		}
		return fileMetadataDto;
	}

	@Override
	public List<FileMetadataDto> putFileDicomZip(MultipartFile zip, String path) throws Exception {
		List<FileMetadataDto> fileMetadataDtos = fileUtils.extract(path, zip);
		List<FileMetadataEntity> fileMetadatas = new ArrayList<FileMetadataEntity>();
		fileMetadataDtos.forEach(fileMetadataDto->{
			FileMetadataEntity fileMetadata = new FileMetadataEntity();
			fileMetadata.setChecksum(fileMetadataDto.getChecksum());
			fileMetadata.setExtension(fileMetadataDto.getExtension());
			fileMetadata.setFileDate(fileMetadataDto.getFileDate());
			fileMetadata.setFileType(fileMetadataDto.getFileType());
			fileMetadata.setFullname(fileMetadataDto.getFullname());
			fileMetadata.setFullPath(fileMetadataDto.getFullPath());
			fileMetadata.setLocation(fileMetadataDto.getLocation());
			fileMetadata.setShortname(fileMetadataDto.getShortname());
			fileMetadata.setSize(fileMetadataDto.getSize());
			fileMetadatas.add(fileMetadata);
		});
		try {
			fileMetadataRepo.save(fileMetadatas);
		} catch (DataIntegrityViolationException e) {
			LOGGER.warn(e.getLocalizedMessage());
		}
		return fileMetadataDtos;
	}
	
}