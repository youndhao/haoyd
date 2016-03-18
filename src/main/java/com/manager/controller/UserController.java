package com.manager.controller;

import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manager.entity.User;
import com.manager.service.IUserService;
import com.manager.util.Md5Util;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired 
	private IUserService iuserService;
	@RequestMapping("/login")
	public String login(User u,HttpServletRequest req,Model model) {
		//u.setPassword(Md5Util.generatePassword(u.getPassword()));
		User user=iuserService.login(u);
		if(user==null){
		model.addAttribute("result", "µÇÂ¼Ê§°Ü£¬ÓÃ»§Ãû»òÃÜÂë´íÎó");
		return "login";
	}else{
		
	req.getSession().setAttribute("user", user);
	return "index";
	}
	}
	@RequestMapping("/index2")
	public String toIndex2(){
		return "index2";
	}
	@RequestMapping("/index3")
	public String toIndex3(){
		return "index3";
	}
	@RequestMapping("/index4")
	public String toIndex4(){
		return "index4";
	}

}
