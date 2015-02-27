package net.sjin.common.util.json;

import net.sf.json.JsonConfig;

import java.util.Date;

public class JsonConfigUtil {
	
	public static JsonConfig getJsonDateConfig(){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
		return jsonConfig;
	}
	
	public static JsonConfig getJsonDateConfig(String format){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor(format));
		return jsonConfig;
	}

}