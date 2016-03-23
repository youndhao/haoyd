package com.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;









import org.apache.ibatis.annotations.Param;
import org.javatuples.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manager.entity.InfoQueryEntity;
import com.manager.entity.User;
import com.manager.entity.UserPass;
import com.manager.service.IUserService;
import com.manager.util.Tools;


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
		model.addAttribute("result", "登陆失败,用户名或密码错误");
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
    @RequestMapping("/logout")
    public String logout(HttpServletRequest req,Model model){
    	req.getSession().removeAttribute("user");
    	return "login";
    	
    }
    @RequestMapping("register")
    public String register(User u,Model model){
    	int count=iuserService.register(u);
    	if(count==1){
    		model.addAttribute("result", "注册成功");
    		return "login";
    	}else {
			model.addAttribute("result", "注册失败,该用户已被注册！");
			return "login";
		}
    	
    }
    @RequestMapping("/selectinfo")
    public String selectInfo(){
    	return "UserInfo";
    }
    @RequestMapping(value="/infolist",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String infoList(InfoQueryEntity iEntity,HttpServletRequest req){
    	User u=(User) req.getSession().getAttribute("user");
    	if(u!=null){
    		iEntity.setFullName(u.getFullName());
    	}
    	Pair<Integer,List<User>> pair=iuserService.selectinfo(iEntity);
    	return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
    }
    @RequestMapping("changepassword")
    public String changepassword(){
    	return "ChangePass";
    }
    @RequestMapping("changepass")
    @ResponseBody
    public  Map<String, String> changepass(String password,HttpServletRequest req){
    	String userName=null;
    	User u=(User) req.getSession().getAttribute("user");
    	if(u!=null){
    		userName=u.getUserName();
    	}
    	UserPass up=new UserPass();
    	up.setUserName(userName);
    	up.setPassword(password);
    	
    	Map<String, String> map=new HashMap<String, String>();
    	if(iuserService.changepass(up)>0){
    		map.put("success", "true");
    		map.put("message", "修改成功");
    	}
    	else{
    		map.put("success", "false");
    		map.put("message", "修改失败");
    	}
    	return map;
    }
    @RequestMapping(value="userlist")
	public String userlist(){
		return "UserList";
	}
    @RequestMapping("alluserlist")
    @ResponseBody
    public String alluserlist(InfoQueryEntity iEntity){
    	
    	Pair<Integer,List<User>> pair=iuserService.allUserList(iEntity);
    	return Tools.toEasyuiDataGrid(pair.getValue0(), pair.getValue1());
    }
    @RequestMapping(value="register2")
    @ResponseBody
    private String register2(User u,Model model) {
    	int count=iuserService.register(u);
    	if(count>0){
    		return Tools.ToResult(true, "新增人员成功");
    	}else {
			return Tools.ToResult(false, "新增人员失败");
		}
	}
    @RequestMapping(value="editUser")
	public String edituser(){
		return "EditUsers";
	}
    @RequestMapping(value="deleteuser")
    @ResponseBody
    private String deleteuser(@RequestParam(value="id[]") int id[]) {
    	int count=iuserService.deleteuser(id);
    	if(count>0){
    		return Tools.ToResult(true, "删除人员成功");
    	}else {
			return Tools.ToResult(false, "删除人员失败");
		}

	}
    @RequestMapping(value="updateuser")
    @ResponseBody
    public String updateuser(User u){
    	int count=iuserService.updateuser(u);
    	if(count>0){
    		return Tools.ToResult(true, "更新人员成功");
    	}else{
    		return Tools.ToResult(false, "更新人员失败");
    	}
    	
    }
}
