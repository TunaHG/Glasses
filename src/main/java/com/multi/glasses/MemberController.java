package com.multi.glasses;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
//	@RequestMapping("/idcheck")
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public String registerIdCheck(HttpServletRequest request, MemberVO member) {
		//System.out.println(member);
		
		if(dao.isIdExist(member) == 0) {
			return "success";
		} else {
			return "fail";
		}

	}
	

}
