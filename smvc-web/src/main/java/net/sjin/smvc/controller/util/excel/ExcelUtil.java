package net.sjin.smvc.controller.util.excel;

import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;

public class ExcelUtil {

	/**
	 * 根据HSSFCell类型设置数据
	 * 
	 * @param cell
	 * @return
	 */
	public static String getCellFormatValue(HSSFCell cell) {
		
		if(cell == null) return null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		switch (cell.getCellType()) { // 判断当前Cell的Type
		case HSSFCell.CELL_TYPE_NUMERIC:
		case HSSFCell.CELL_TYPE_FORMULA:
			if (HSSFDateUtil.isCellDateFormatted(cell)) { // 判断当前的cell是否为Date
				Date date = cell.getDateCellValue();
				return sdf.format(date);
			} else { // 如果是纯数字
				return String.valueOf(cell.getNumericCellValue());
			}
		case HSSFCell.CELL_TYPE_STRING:
			return cell.getRichStringCellValue().getString().trim();
		default:
			return null;
		}
	}

}
