package com.manager.controller;

import java.util.List;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manager.entity.BudgetList;
import com.manager.entity.BuyOrder;
import com.manager.entity.BuyOrderList;
import com.manager.service.IBuyService;
import com.manager.service.IManageService;
import com.manager.util.Tools;
@Controller
@RequestMapping(value="/manage")
public class ManageController {
     @Autowired IBuyService ibuyService;
     @Autowired IManageService imanageService;
     @RequestMapping(value="/managesalebudget")
     public String manageSale() {
		return "ManageSaleBudget";
	}
     @RequestMapping(value="/managebuyorder")
     private String manageBuy() {
		return "ManageBuyOrder";
	}
     @RequestMapping(value="/buyorderjson")
     @ResponseBody
     public String buyMaterialJson(BuyOrder buyOrder){
    	 Pair<Integer, List<BuyOrderList>> pair=ibuyService.orderlist(buyOrder);
    	 return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
    	 
     }
     @RequestMapping(value="salebudgetjson")
 	@ResponseBody
 	public String saleBudgetjson(BuyOrder buyOrder){
 		Pair<Integer, List<BudgetList>> pair = imanageService.budgetList(buyOrder);
 		return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
 	}
     @RequestMapping(value="updateorder")
 	@ResponseBody
 	public String updateOrder(BuyOrder buyOrder){
 		if(buyOrder!=null){
 		int count = imanageService.updateOrder(buyOrder);
 		if(count>0){
 			
 			return Tools.ToResult(true, "更新成功");
 			
 		}else{
 			
 			return Tools.ToResult(false, "更新失败");
 			
 		}
 		}else{
 			return Tools.ToResult(false, "更新失败");
 			
 		}
 		
 	}
     @RequestMapping(value="updatesale")
 	@ResponseBody
 	public String updateSale(BuyOrder buyOrder){
 		if(buyOrder!=null){
 		int count = imanageService.updateSale(buyOrder);
 		if(count>0){
 			
 			return Tools.ToResult(true, "更新成功");
 			
 		}else{
 			
 			return Tools.ToResult(false, "更新失败");
 			
 		}
 		}else{
 			return Tools.ToResult(false, "更新失败");
 			
 		}
 		
 	}
}
