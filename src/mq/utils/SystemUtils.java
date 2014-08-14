package mq.utils;

import java.io.IOException;
import java.util.Properties;

public class SystemUtils {
	public static String getPropertieFileValue(String filename, String key) {
		Properties p = new Properties();// 加载属性文件读取类
		try {
			p.load(Thread.currentThread().getContextClassLoader()
					.getResourceAsStream(filename));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p.getProperty(key);
	}
	public static String getSystemPropertie(String key){
		return getPropertieFileValue("user.properties", key);
	}
}
