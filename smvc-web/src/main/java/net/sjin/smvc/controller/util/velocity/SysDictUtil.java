package net.sjin.smvc.controller.util.velocity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import net.sjin.smvc.api.sys.AcDict;
import net.sjin.smvc.api.sys.AcDictType;

public class SysDictUtil extends org.apache.velocity.tools.generic.FormatConfig {

	/**
	 * 根据字典类型的code得到字典值的列表
	 * 
	 * @param sysdicts
	 * @param dictTypeCode
	 * @return
	 */
	public static List<AcDict> getDictList(Map<String, AcDictType> sysdicts,
			String dictTypeCode) {
		if(sysdicts.get(dictTypeCode)==null) return new ArrayList<AcDict>();
		return sysdicts.get(dictTypeCode).getDicts();
	}
	
	/**
	 * 根据字典类型的code得到字典值的列表，然后转化成Map
	 * 
	 * @param sysdicts
	 * @param dictTypeCode
	 * @return
	 */
	public static Map<String,Object> getDictMap(Map<String, AcDictType> sysdicts,
			String dictTypeCode) {
		if(sysdicts.get(dictTypeCode)==null) return new HashMap<String, Object>();
		List<AcDict> dicts = sysdicts.get(dictTypeCode).getDicts();
		Map<String,Object> map = new HashMap<String, Object>();
		for (AcDict acDict : dicts) {
			map.put(acDict.getTvalue(), acDict.getTname());
		}
		return map;
	}

	/**
	 * 根据字典类型的code得到字典值的列表，然后转化成select标签的option字符串在前台输出
	 * 
	 * @param sysdicts
	 * @param dictTypeCode
	 * @return
	 */
	public static String getDictSelectString(Map<String, AcDictType> sysdicts,
			String dictTypeCode) {
		if(sysdicts.get(dictTypeCode)==null) return "";
		List<AcDict> dicts = sysdicts.get(dictTypeCode).getDicts();
		StringBuffer sb = new StringBuffer("");
		for (AcDict acDict : dicts) {
			sb.append("<option value='" + acDict.getTvalue() + "'>"
					+ acDict.getTname() + "</option>");
		}
		return sb.toString();
	}
	
	/**
	 * 根据字典类型的code得到字典值的列表，然后转化成javascirpt的Object对象（key是字典值，value是显示的值）
	 * 
	 * @param sysdicts
	 * @param dictTypeCode
	 * @return
	 */
	public static String getDictMapString(Map<String, AcDictType> sysdicts,
			String dictTypeCode) {
		if(sysdicts.get(dictTypeCode)==null) return "{}";
		List<AcDict> dicts = sysdicts.get(dictTypeCode).getDicts();
		Map<String,Object> map = new HashMap<String, Object>();
		for (AcDict acDict : dicts) {
			map.put(acDict.getTvalue(), acDict.getTname());
		}
		return new Gson().toJson(map);
	}

	/**
	 * 根据字典类型和字典值取得对应的显示名字
	 * 
	 * @param sysdicts
	 * @param dictTypeCode
	 * @param dictValue
	 * @return
	 */
	public static String getDictName(Map<String, AcDictType> sysdicts,
			String dictTypeCode, String dictValue) {
		if(sysdicts.get(dictTypeCode)==null) return dictValue;
		List<AcDict> dicts = sysdicts.get(dictTypeCode).getDicts();
		for (AcDict acDict : dicts) {
			if (acDict.getTvalue().equals(dictValue)) {
				return acDict.getTname();
			}
		}
		return dictValue;
	}
}
