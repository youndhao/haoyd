package com.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;







import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manager.entity.InfoStockExport;
import com.manager.entity.Material;
import com.manager.entity.StockExport;
import com.manager.service.IStockExportService;
import com.manager.util.ExcelUtil;
import com.manager.util.Tools;
@Controller
@RequestMapping("/export")
public class ExportController {
	
	
	
		@Autowired
		IStockExportService stockExportService;
		
		
/**
 * 
 *导出全部
 * @param InfoStockExport 
 * @throws Exception 
 *
 * @see [相关类/方法](可选)
 * @since [产品/模块版本](可选)
 */
@RequestMapping(value = "/exportAll", method = RequestMethod.GET)
@ResponseBody
public void exportAll(HttpServletResponse response) throws Exception  {

    try {
       
      List<StockExport>   list = stockExportService.selectAll();
        exportExcel(response,list);
    } catch (IOException e) {   
        e.printStackTrace();
    }
    

}

/**
 * 
 * 导出功能
 *
 * @param response
 * @param list
 * @throws Exception
 * @see [相关类/方法](可选)
 * @since [产品/模块版本](可选)
 */
public void exportExcel(HttpServletResponse response, List<StockExport>    list) throws Exception {
    
   
    
     String productNumber="产品编号";
	 String productName="产品名字";
	 
	 String category="产品类别";
	 String privider="产品供应商";
	 String stockAmount="产品数量";
    
    String  sheetTitle = "产品库信息";
    List<Map <String , Object> > listMap = new ArrayList < Map < String,Object > >();
    Map<String,String> head = new LinkedHashMap<String, String>();
    head.put(productNumber, productNumber);
    head.put( productName,  productName);
    head.put(category, category);
    head.put(privider, privider);
    head.put(stockAmount, stockAmount);
    for(StockExport prick:  list){
        LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
     
        map.put(productNumber, prick.getProductNumber());
        map.put(productName,prick.getProductName());
        map.put(category, prick.getCategory());
        map.put(privider, prick.getPrivider());
        map.put(stockAmount, prick.getStockAmount());
        
        listMap.add(map);
        
    }
    HSSFWorkbook book = ExcelUtil.createExcelBook(sheetTitle, head, listMap, null);
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition","attachment;filename="+
        new String("企业产品库存信息.xls".getBytes("UTF-8"),"ISO8859-1"));
    ServletOutputStream out = null;
    try {
        out = response.getOutputStream();
        book.write(out);
        out.flush();
        out.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
  
    

} 
}
