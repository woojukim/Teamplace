package com.scsa.teamplace2.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scsa.teamplace2.service.UserInfoService;
import com.scsa.teamplace2.vo.UserInfo;


/**
 * @author student
 * @version 1.0
 * @created 20-11-2014 ���� 3:31:10
 */
@Controller
public class UserInfoController {

	public UserInfoService userinfoservice;
	
	@Autowired
	public void setUserinfoservice(UserInfoService userinfoservice) {
		this.userinfoservice = userinfoservice;
	}

	public UserInfoController(){}

	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("checkpassword.do")
	@ResponseBody
	public HashMap<String, Object> checkpassword(String userpassword,HttpSession session){
		HashMap<String, Object> map =new HashMap<String, Object>();
		UserInfo userinfo = (UserInfo)session.getAttribute("userinfo");
		String originaluserpassword = userinfo.getUserpassword();
		if(userpassword.equals(originaluserpassword)){
			map.put("flag", 1);
			return map;
		}else{
			map.put("flag", 2);
			return map;
		}
	}
	@RequestMapping("ajax/checknickname.do")
	@ResponseBody
	public HashMap<String, Object> checknickname(String usernickname){
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserInfo finduserinfo = userinfoservice.find(usernickname);
		if(finduserinfo!=null){
			map.put("flag", false);
			map.put("usernickname", usernickname);
		}else{
			map.put("flag", true);
			map.put("usernickname", usernickname);
		}
		return map;
	}
	
	@RequestMapping("ajax/modifynickname.do")
	@ResponseBody
	public boolean modifynickname(String usernickname, HttpSession session){
		boolean flag;
		try {
			UserInfo userinfo = (UserInfo)session.getAttribute("userinfo");
			userinfo.setUsernickname(usernickname);
			userinfoservice.modify(userinfo);
			session.setAttribute("userinfo", userinfo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		return flag;
	}
	
	
	
	@RequestMapping("updateinformation.do")
	@ResponseBody
	public UserInfo updateinformation(String userpassword, HttpSession session){
		UserInfo olduserinfo = (UserInfo)session.getAttribute("userinfo");
		String useremail = olduserinfo.getUseremail();
		String usernickname = olduserinfo.getUsernickname();
		UserInfo userinfo = new UserInfo(useremail, usernickname, userpassword);
		userinfoservice.modify(userinfo);
		UserInfo finduserinfo = (UserInfo)userinfoservice.find(useremail);
		session.setAttribute("userinfo", finduserinfo);
		UserInfo newuserinfo = (UserInfo)session.getAttribute("userinfo");
		return newuserinfo;
	}
	
	@RequestMapping("saveUser.do")
	public String saveUser(UserInfo userinfo){
		userinfoservice.save(userinfo);
		return "index";
	}
	
	@RequestMapping("/ajax/signupemailcheck.do")
	@ResponseBody
	public boolean signupEmailCheck(String useremail){
		boolean flag;
		UserInfo userinfo = userinfoservice.find(useremail);
		if (userinfo!=null) {
			flag=false;
		}else{
			flag=true;
		}
		return flag;
	}
}