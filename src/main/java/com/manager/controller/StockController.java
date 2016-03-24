package com.manager.controller;



import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manager.entity.InfoStockEntity;
import com.manager.entity.StockEntity;
import com.manager.service.IStockService;
import com.manager.util.Tools;
import com.manager.util.UuidCreat;

@Controller
@RequestMapping("/stock")
public class StockController {
	@Autowired IStockService stockService;
	@RequestMapping(value="/editstock")
	public String stockPage(){
		return "EditStock";	
	}
	 @RequestMapping(value="updatestock")
	    @ResponseBody
	    public String updatestock(StockEntity stockentity){
	    	int count=stockService.updatestock(stockentity);
	    	if(count>0){
	    		return Tools.ToResult(true, "修改库存成功");
	    	}else{
	    		return Tools.ToResult(false, "修改库存失败");
	    	}
	    	
	    }
	 @RequestMapping(value="allstocklist",method=RequestMethod.GET)
	    @ResponseBody
	    public String allstocklist(InfoStockEntity stockentity){
	
	    	Pair<Integer,List<StockEntity>> pair=stockService.allStockList(stockentity);
	    	return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
	    }
	 @RequestMapping(value="stocklist")
		public String stocklist(){
			return "StockList";
		}
	 @RequestMapping(value="insertstock")
	    @ResponseBody
	    private String insertStock(StockEntity stockentity,Model model) {
		 if(stockentity!=null){
			 stockentity.setProductNumber(UuidCreat.getUuid("ID-"));
			}
	    	int count=stockService.insertstock(stockentity);
	    	if(count>0){
	    		return Tools.ToResult(true, "新增商品成功");
	    	}else {
				return Tools.ToResult(false, "新增商品失败");
			}
		}
	 @RequestMapping(value="deletestock")
	    @ResponseBody
	    private String deleteStock(@RequestParam(value="id[]") int id[]) {
	    	int count=stockService.deletestock(id);
	    	if(count>0){
	    		return Tools.ToResult(true, "删除商品成功");
	    	}else {
				return Tools.ToResult(false, "删除商品失败");
			}

		}
	 @RequestMapping(value="/selectstock")
		public String stockList(){
			return "SelectStock";	
		}

}
