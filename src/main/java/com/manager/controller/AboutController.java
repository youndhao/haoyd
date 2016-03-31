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

import com.manager.entity.Contact;
import com.manager.entity.InfoContactEntity;
import com.manager.entity.StockEntity;
import com.manager.service.IContactService;
import com.manager.util.Tools;


@Controller
@RequestMapping(value="/about")
public class AboutController {
	@Autowired IContactService contactService;
	@RequestMapping(value="/about1")
	public String toAbout1(){
		return "AboutUs1";
	}
	@RequestMapping(value="/about2")
	public String toAbout2(){
		return "AboutUs2";
	}
	@RequestMapping(value="/about3")
	public String toAbout3(){
		return "AboutUs3";
	}
	@RequestMapping(value="/contact")
	public String toContact(){
		return "ContactUs";
	}
	 @RequestMapping(value="allcontactlist",method=RequestMethod.GET)
	    @ResponseBody
	    public String allstocklist(InfoContactEntity contactentity){
	
	    	Pair<Integer,List<Contact>> pair=contactService.allContactList(contactentity);
	    	return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
	    }
	 @RequestMapping(value="insertcontact")
	    @ResponseBody
	    private String insertContact(Contact contact,Model model) {
	
			 
	    	int count=contactService.insertcontact(contact);
	    	if(count>0){
	    		return Tools.ToResult(true, "新增负责人成功");
	    	}else {
				return Tools.ToResult(false, "新增负责人失败");
			}
		 
		}
	 @RequestMapping(value="deletecontact")
	    @ResponseBody
	    private String deleteContact(@RequestParam(value="id[]") int id[]) {
	    	int count=contactService.deletecontact(id);
	    	if(count>0){
	    		return Tools.ToResult(true, "删除人员成功");
	    	}else {
				return Tools.ToResult(false, "删除人员失败");
			}

		}
	 @RequestMapping(value="updatecontact")
	    @ResponseBody
	    public String updatecontact(Contact contact){
	    	int count=contactService.updatecontact(contact);
	    
	    	if(count>0){
	    		return Tools.ToResult(true, "修改库存成功");
	    	}else{
	    		return Tools.ToResult(false, "修改库存失败");
	    	}
	    	
	    }
}
