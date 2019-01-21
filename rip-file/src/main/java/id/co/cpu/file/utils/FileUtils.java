package id.co.cpu.file.utils;

import java.security.MessageDigest;

public class FileUtils {

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

}
