package com.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;




import com.manager.entity.BuyMaterialList;
import com.manager.entity.BuyOrder;
import com.manager.entity.BuyOrderList;
import com.manager.entity.Materials;
import com.manager.entity.QueryMaterial;
import com.manager.entity.Material;
import com.manager.entity.Time;
import com.manager.service.IBuyService;
import com.manager.util.Tools;
import com.manager.util.UuidCreat;

@Controller
@RequestMapping(value="/buy")
public class BuyController {
	@Autowired IBuyService ibuyService;
	@RequestMapping(value="/buymaterial")
	public String buyMaterial(Model model){
		List<Material> lista=ibuyService.selectMaterial();
		model.addAttribute("listA", lista);
		return "AddBuyMaterial";
	}
	@RequestMapping(value="/material")
	public String material(){
		return "Material";
	}
	@RequestMapping(value="/materialstate")
	public String materialState(Model m){
		List<Time> listb = ibuyService.selectTime();
		m.addAttribute("listB", listb);
		return "BuyMaterialState";
	}
	@RequestMapping(value="BuyMaterialjson")
	@ResponseBody
	public String buyMaterList(BuyOrder order){
		if(order.getBid()!=null){
			String yeartime = order.getBid();
			String[] time = yeartime.split(":");
			order.setYear(time[0]);
			order.setTime(time[1]);
		Pair<Integer, List<BuyMaterialList>> pair = ibuyService.buyMaterialList(order);
		return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());}else{
			return null;
		}
	}
	@RequestMapping(value="/Materiallist")
	@ResponseBody
	public String materialList(QueryMaterial qMaterial){
		Pair<Integer, List<Material>> pair=ibuyService.materialList(qMaterial);
		return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
		
	}
	@RequestMapping(value="/addMaterial")
	@ResponseBody
	public String addMaterial(Material material){
		if(material!=null){
			material.setMid(UuidCreat.getUuid("MID-"));
		}
		int count = ibuyService.addMaterial(material);
		if(count>0){
			
			return Tools.ToResult(true, "新增产品成功");
			
		}else{
			
			return Tools.ToResult(false, "新增产品失败");
			
		}
			
		
	}
	@RequestMapping(value="BuyMaterialList")
	public String buyMaterialList(){
		
		return "BuyMaterialList";
	}
	@RequestMapping(value="/BuyOrderList")
	@ResponseBody
	public String buyOrderList(BuyOrder buyOrder){
		
		Pair<Integer, List<BuyOrderList>> pair=ibuyService.orderlist(buyOrder);
		return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
	}
	@RequestMapping(value="/buymaterialsave")
	@ResponseBody
	public Map<String, String> buyMaterialSave(Materials materials){
		boolean lean=false;
		if(materials!=null){
		lean=ibuyService.saveBuyMaterial(materials);
			
		}
		Map<String, String> map=new HashMap<String, String>();
		 if(lean){
			    map.put("success", "true"); 
			    map.put("message", "保存成功");
			 }else{
				 map.put("success", "false"); 
				 map.put("message", "保存失败");
			 }
			return map;
	}
	

}
