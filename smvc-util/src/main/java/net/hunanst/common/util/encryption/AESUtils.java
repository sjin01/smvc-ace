package net.hunanst.common.util.encryption;

import java.security.Key;
import java.security.Security;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;

public class AESUtils {
	
	private static byte[] keybytes = { 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38,
			0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38 };
	
	private static byte[] iv = { 0x38, 0x37, 0x36, 0x35, 0x34, 0x33, 0x32, 0x31, 0x38,
			0x37, 0x36, 0x35, 0x34, 0x33, 0x32, 0x31 };
	
	/**
	 * 加密
	 * @param content 要加密的内容
	 * @return 加密后的结果
	 */
	public static String encrypt(String content){
		String code = "";
		try {
			Security.addProvider(new BouncyCastleProvider());
			Key key = new SecretKeySpec(keybytes, "AES");
			Cipher in = Cipher.getInstance("AES/CBC/PKCS7Padding", "BC");
			in.init(Cipher.ENCRYPT_MODE, key, new IvParameterSpec(iv));
			byte[] enc = in.doFinal(content.getBytes());
			code = new String(Hex.encode(enc));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return code;
	}
	
	/**
	 * 解密
	 * @param content 要解密的内容
	 * @return 解密后的结果
	 */
	public static String decrypt(String content){
		String code = "";
		try {
			Security.addProvider(new BouncyCastleProvider());
			Key key = new SecretKeySpec(keybytes, "AES");
			Cipher out = Cipher.getInstance("AES/CBC/PKCS7Padding", "BC");
			out.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(iv));
			byte[] dec = out.doFinal(Hex.decode(content.getBytes()));
			code = new String(dec);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return code;
	}
	
	public static void main(String[] args) {
		System.out.println(decrypt("4ef08f21a8dcf6ce17ce01c3a8588e53"));
	}
	
}
