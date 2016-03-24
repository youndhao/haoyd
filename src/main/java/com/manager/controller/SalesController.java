package com.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.manager.entity.Time;
import com.manager.entity.QueryProduct;
import com.manager.entity.BuyOrder;
import com.manager.entity.SaleBudgetList;
import com.manager.entity.Products;
import com.manager.entity.Product;
import com.manager.service.ISaleService;
import com.manager.util.Tools;
import com.manager.util.UuidCreat;

@Controller
@RequestMapping(value="/sale")
public class SalesController {
	@Autowired ISaleService isaleService;
	@RequestMapping(value="/addsalehistory")
	public String addSalehistory(Model model) {
		List<Product> lista=isaleService.selectProducts();
		model.addAttribute("listA", lista);
		return "AddSaleHistory";
		
	}
	@RequestMapping(value="/salehistorysave")
	public Map<String, String> saleHistorySave(Products products){

		boolean b = false;
		if(products!=null){
			b = isaleService.saveSaleHistory(products);
		}
		Map<String, String> map = new HashMap<String, String>(); 
		 if(b){
		    map.put("success", "true"); 
		    map.put("message", "保存成功");
		 }else{
			 map.put("success", "false"); 
			 map.put("message", "保存失败");
		 }
		return map;
	}
	@RequestMapping(value="/salehistory")
	public String saleHistory(){
		return "SaleHistory";
	}
	@RequestMapping(value="saleyearlist")
	@ResponseBody
	public Map<String, Float> saleyearList(BuyOrder order){
		 Map<String, Float> map = new HashMap<String, Float>(); 
		 map.put("a", 0f);
		 map.put("b", 0f);
		 map.put("c", 0f);
		 map.put("d", 0f);
		List<SaleBudgetList> list = isaleService.saleYearList(order);
		if(list==null){
			return map;
		}else{
			for(SaleBudgetList saleBudgetList:list){
				if("1".equals(saleBudgetList.getTime())){
					map.put("a", saleBudgetList.getMoney()/10000);
				}
				if("2".equals(saleBudgetList.getTime())){
					map.put("b", saleBudgetList.getMoney()/10000);
				}
				if("3".equals(saleBudgetList.getTime())){
					map.put("c", saleBudgetList.getMoney()/10000);
				}
				if("4".equals(saleBudgetList.getTime())){
					map.put("d", saleBudgetList.getMoney()/10000);
				}
				}
			return map;
				
			}
	
	}
	@RequestMapping(value="saletimelist")
	@ResponseBody
	public List<SaleBudgetList> saletimeList(BuyOrder order){
		
		List<SaleBudgetList> list = isaleService.saleTimeList(order);
			return list;
		
	}	
	@RequestMapping(value="/product")
	public String product(){
		return "Products";
	}
	@RequestMapping(value="/productlist", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String infoList(QueryProduct qproduct,HttpServletRequest requ){
		
		Pair<Integer, List<Product>> pair = isaleService.productList(qproduct);
		return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
	}
	
	@RequestMapping("/addProduct")
	@ResponseBody
	public String register2(Product p,Model m){
	if(p!=null){
		p.setPid(UuidCreat.getUuid("PID-"));
	}
	int count = isaleService.addProduct(p);
	if(count>0){
		
		return Tools.ToResult(true, "新增产品成功");
		
	}else{
		
		return Tools.ToResult(false, "新增产品失败");
		
	}
	}
	@RequestMapping(value="/salebudget")
	public String saleBudget(Model m){
		List<Product> lista = isaleService.selectProducts();
		m.addAttribute("listA", lista);
		return "AddSaleBudget";
	}
	@RequestMapping(value="salebudgetlist")
	public String saleBudgetlist(Model m){
		List<Time> listb = isaleService.selectTime();
		m.addAttribute("listB", listb);
		return "SaleBudgetList";
	}
	@RequestMapping(value="SaleBudgetList")
	@ResponseBody
	public String saleBudgetList(BuyOrder order){
		if(order.getBid()!=null){
			String yeartime = order.getBid();
			String[] time = yeartime.split(":");
			order.setYear(time[0]);
			order.setTime(time[1]);
		Pair<Integer, List<SaleBudgetList>> pair = isaleService.budgetList(order);
		return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
		}else{
			return null;
		}
	}
	 

	

}
