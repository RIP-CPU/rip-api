package id.co.cpu.file.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.math.BigDecimal;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import id.co.cpu.common.utils.FileSizeUnit;

@Component
public class FileUtils {

	public void writeFile(String filePath, byte[] fileContent) throws IOException {
		RandomAccessFile stream = new RandomAccessFile(filePath, "rw");
		FileChannel channel = stream.getChannel();
		FileLock lock = null;
		try {
			lock = channel.tryLock();
			ByteBuffer buffer = ByteBuffer.allocate(fileContent.length);
			buffer.put(fileContent);
			buffer.flip();
			channel.write(buffer);
			lock.release();
		} catch (final OverlappingFileLockException e) {
			stream.close();
			channel.close();
		}
		stream.close();
		channel.close();
	}

	public void zip(List<File> files, String zipLocation) throws IOException {
		FileOutputStream fos = new FileOutputStream(zipLocation);
		ZipOutputStream zipOut = new ZipOutputStream(fos);
		files.forEach(file->{
			FileInputStream fis;
			try {
				fis = new FileInputStream(file);
				ZipEntry zipEntry = new ZipEntry(file.getName());
				zipOut.putNextEntry(zipEntry);
				byte[] bytes = new byte[1024];
				int length;
				while ((length = fis.read(bytes)) >= 0) {
					zipOut.write(bytes, 0, length);
				}
				fis.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		zipOut.close();
		fos.close();
	}
	
	public void unzip(String fullPathZipFile, String unzipLocation) throws IOException {
		byte[] buffer = new byte[1024];
		ZipInputStream zis = new ZipInputStream(new FileInputStream(fullPathZipFile));
		ZipEntry zipEntry = zis.getNextEntry();
		while (zipEntry != null) {
			String fileName = zipEntry.getName();
			File newFile = new File(unzipLocation + fileName);
			FileOutputStream fos = new FileOutputStream(newFile);
			int len;
			while ((len = zis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
			fos.close();
			zipEntry = zis.getNextEntry();
		}
		zis.closeEntry();
		zis.close();
	}

	public static String fileChecksum(String hashAlgorithm, byte[] bytes) throws Exception {
		MessageDigest messageDigest = MessageDigest.getInstance(hashAlgorithm);
		messageDigest.update(bytes, 0, bytes.length);
		byte[] mdBytes = messageDigest.digest();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < mdBytes.length; i++) {
			sb.append(Integer.toString((mdBytes[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
	
	public static String fileType(File file) throws IOException {
		return Files.probeContentType(file.toPath());
	}
	
	public static String fileExtension(File file) throws IOException {
		return FilenameUtils.getExtension(file.getName());
	}

	public BigDecimal getSize(MultipartFile file, FileSizeUnit sizeUnit) {
		long bytes = file.getSize();
		double kilobytes = (bytes / 1024);
		double megabytes = (kilobytes / 1024);
		double gigabytes = (megabytes / 1024);
		double terabytes = (gigabytes / 1024);
		double petabytes = (terabytes / 1024);
		double exabytes = (petabytes / 1024);
		double zettabytes = (exabytes / 1024);
		double yottabytes = (zettabytes / 1024);
		BigDecimal size = BigDecimal.ZERO;
		if (sizeUnit.equals(FileSizeUnit.bytes)) {
			size = BigDecimal.valueOf(bytes);
		} else if (sizeUnit.equals(FileSizeUnit.kilobytes)) {
			size = BigDecimal.valueOf(kilobytes);
		} else if (sizeUnit.equals(FileSizeUnit.megabytes)) {
			size = BigDecimal.valueOf(megabytes);
		} else if (sizeUnit.equals(FileSizeUnit.gigabytes)) {
			size = BigDecimal.valueOf(gigabytes);
		} else if (sizeUnit.equals(FileSizeUnit.terabytes)) {
			size = BigDecimal.valueOf(terabytes);
		} else if (sizeUnit.equals(FileSizeUnit.petabytes)) {
			size = BigDecimal.valueOf(petabytes);
		} else if (sizeUnit.equals(FileSizeUnit.exabytes)) {
			size = BigDecimal.valueOf(exabytes);
		} else if (sizeUnit.equals(FileSizeUnit.zettabytes)) {
			size = BigDecimal.valueOf(zettabytes);
		} else if (sizeUnit.equals(FileSizeUnit.yottabytes)) {
			size = BigDecimal.valueOf(yottabytes);
		}
		return size;
	}

	public BigDecimal getSize(File file, FileSizeUnit sizeUnit) {
		long bytes = file.length();
		double kilobytes = (bytes / 1024);
		double megabytes = (kilobytes / 1024);
		double gigabytes = (megabytes / 1024);
		double terabytes = (gigabytes / 1024);
		double petabytes = (terabytes / 1024);
		double exabytes = (petabytes / 1024);
		double zettabytes = (exabytes / 1024);
		double yottabytes = (zettabytes / 1024);
		BigDecimal size = BigDecimal.ZERO;
		if (sizeUnit.equals(FileSizeUnit.bytes)) {
			size = BigDecimal.valueOf(bytes);
		} else if (sizeUnit.equals(FileSizeUnit.kilobytes)) {
			size = BigDecimal.valueOf(kilobytes);
		} else if (sizeUnit.equals(FileSizeUnit.megabytes)) {
			size = BigDecimal.valueOf(megabytes);
		} else if (sizeUnit.equals(FileSizeUnit.gigabytes)) {
			size = BigDecimal.valueOf(gigabytes);
		} else if (sizeUnit.equals(FileSizeUnit.terabytes)) {
			size = BigDecimal.valueOf(terabytes);
		} else if (sizeUnit.equals(FileSizeUnit.petabytes)) {
			size = BigDecimal.valueOf(petabytes);
		} else if (sizeUnit.equals(FileSizeUnit.exabytes)) {
			size = BigDecimal.valueOf(exabytes);
		} else if (sizeUnit.equals(FileSizeUnit.zettabytes)) {
			size = BigDecimal.valueOf(zettabytes);
		} else if (sizeUnit.equals(FileSizeUnit.yottabytes)) {
			size = BigDecimal.valueOf(yottabytes);
		}
		return size;
	}

}
