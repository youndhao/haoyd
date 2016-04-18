package com.manager.util;


import java.util.Iterator;
import java.util.List;
import java.util.Map;



import com.manager.util.POIUtil;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * 
 * excel工具类
 * 〈功能详细描述〉
 *
 * @author chenling
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */

    public class ExcelUtil {
    	
    	
    	private ExcelUtil(){};
    	
    	/**
    	 * 创建Excel表格(简单表头)
    	 * @param sheetTitle 表格标题
    	 * @param head 头列表
    	 * @param dataList 数据列表
    	 * @param keyValueMap 键值对
    	 * @return
    	 * @throws Exception
    	 */
    	public static HSSFWorkbook createExcelBook(String sheetTitle, 
    	        Map<String, String> head, 
    	        List<Map<String, Object>> dataList,
    	        Map<String, Map<String, String>> valueTextMap) throws Exception{
    	    
    	    HSSFWorkbook book = new HSSFWorkbook();
    	    HSSFSheet sheet = book.createSheet(sheetTitle); // 产生工作表对象
    	    HSSFCellStyle style = book.createCellStyle();
            HSSFCellStyle styleRed = book.createCellStyle();
            // 设置字体垂直居中
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平
            style.setWrapText(true);//自动换行

            styleRed.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直
            styleRed.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平
            
            int columnSize = head.size();
            sheet.setColumnWidth(0, 100 * 37);
            for(int i = 1; i <= columnSize; i++){
                sheet.setColumnWidth(i, 150 * 37);
            }
            
            HSSFFont titleFont = POIUtil.createFont(book, 14, true);
            
            int rowNum = 0;
            //创建sheet页标题
            HSSFRow sheetTitleRow = POIUtil.createRow(sheet, rowNum++, 40);
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, columnSize));
            POIUtil.createCell(sheetTitleRow, 0, sheetTitle, titleFont, style);
            
            //创建数据标题
            HSSFRow headRow = POIUtil.createRow(sheet, rowNum++, 20);
            HSSFFont headFont = POIUtil.createFont(book, 10, true);
            POIUtil.createCell(headRow, 0, "序号", headFont, style);
            int headColumNum = 0;
            for(Iterator<String> it = head.values().iterator(); it.hasNext();){
                POIUtil.createCell(headRow, ++headColumNum, it.next(), headFont, style);
            }
            
            //填充数据
            HSSFFont dataFont = POIUtil.createFont(book, 10, false);
            int listNum = 1;
            for(Map<String, Object> data : dataList){
                HSSFRow dataRow = POIUtil.createRow(sheet, rowNum++, 18);
                POIUtil.createCell(dataRow, 0, String.valueOf(listNum++), dataFont, style);
                int columnNum = 1;
                for(Iterator<String> it = head.keySet().iterator(); it.hasNext();){
                	
                	  /*toString 前进行空值判断，当data为空值时不进行toString处理*/
                	 
                	String value ="";
                    String key = it.next();
                    if(!"".equals(data.get(key))&&data.get(key)!=null){
                    	value = data.get(key).toString();
                    }
                    if(valueTextMap != null && valueTextMap.containsKey(key)){
                        value = valueTextMap.get(key).get(value);
                    }
                    POIUtil.createCell(dataRow, columnNum++, value, headFont, style);
                }
            }
            return book;
    	}

}
