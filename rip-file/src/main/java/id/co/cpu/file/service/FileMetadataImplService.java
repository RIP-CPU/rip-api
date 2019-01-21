package id.co.cpu.file.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import id.co.cpu.file.dao.FileMetadataRepo;
import id.co.cpu.file.utils.FileUtils;

@Service("fileMetadataService")
public class FileMetadataImplService {

	protected final Log LOGGER = LogFactory.getLog(getClass());

	@Autowired
	@Qualifier("fileMetadataRepo")
	private FileMetadataRepo fileMetadataRepo;
	
}