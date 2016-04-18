package com.manager.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;


/**
 * 
 * poi工具类
 * 〈功能详细描述〉
 *
 * @author chenling
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class POIUtil {

/**
* 创建行
* @param sheet
* @param index 索引
* @param height 行高,单位像素
* @return
*/
    public static HSSFRow createRow(HSSFSheet sheet, int index, int height){
        HSSFRow row = sheet.createRow(index);
        row.setHeightInPoints(height);
        return row;
    }

/**
* 创建字体
* @param book
* @param size 字体大小,单位像素
* @param bold 是否加粗
* @return
*/
    public static HSSFFont createFont(HSSFWorkbook book, int size, boolean bold){
        HSSFFont font = book.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short)size);
        if(bold){
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        }
        return font;
    }
    
/**
* 创建单元格
* @param row
* @param index 列索引
* @param content 文本内容
* @param font 字体
* @param style 样式
* @return
*/
    public static HSSFCell createCell(HSSFRow row, int index, String content, HSSFFont font, HSSFCellStyle style){
        HSSFCell cell = row.createCell(index);
        HSSFRichTextString richTextString = new HSSFRichTextString(content);
        richTextString.applyFont(font);
        cell.setCellValue(richTextString);
        cell.setCellStyle(style);
        return cell;
    }


/**
* 判断指定的单元格是否是合并单元格
* @param sheet
* @param row
* @param column
* @return
*/
    public static boolean isMergedRegion(Sheet sheet , int row , int column){
        int sheetMergeCount = sheet.getNumMergedRegions();
        for(int i = 0 ; i < sheetMergeCount ; i++ ){
            CellRangeAddress ca = sheet.getMergedRegion(i);
            int firstColumn = ca.getFirstColumn();
            int lastColumn = ca.getLastColumn();
            int firstRow = ca.getFirstRow();
            int lastRow = ca.getLastRow();
            if(row >= firstRow && row <= lastRow){
                if(column >= firstColumn && column <= lastColumn){
                    return true ;
                }
            }
        }
        return false ;
    }
/**
* 获取合并单元格的值
* @param sheet
* @param row
* @param column
* @return
*/
    public static String getMergedRegionValue(Sheet sheet ,int row , int column){
        int sheetMergeCount = sheet.getNumMergedRegions();
        for(int i = 0 ; i < sheetMergeCount ; i++){
            CellRangeAddress ca = sheet.getMergedRegion(i);
            int firstColumn = ca.getFirstColumn();
            int lastColumn = ca.getLastColumn();
            int firstRow = ca.getFirstRow();
            int lastRow = ca.getLastRow();
            if(row >= firstRow && row <= lastRow){
                if(column >= firstColumn && column <= lastColumn){
                    Row fRow = sheet.getRow(firstRow);
                    Cell fCell = fRow.getCell(firstColumn);
                    return getCellValue(fCell) ;
                }
            }
        }
        return null ;
    }
/**
* 获取单元格的值
* @param cell
* @return
*/
    public static String getCellValue(Cell cell){
        if(cell.getCellType() == Cell.CELL_TYPE_STRING){
            return cell.getStringCellValue();
        }else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
            return String.valueOf(cell.getNumericCellValue());
        }
        return "";
    }

}
