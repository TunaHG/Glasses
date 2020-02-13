package com.multi.glasses;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;

	// 로그인 성공/실패
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(MemberVO vo) {


		if (dao.memberCheck(vo) == 1) {

			MemberVO result = dao.getAccountInfo(vo);
			if (result != null) {
			}
			return "homeinfo"; //성공
		} else {
			return "loginfail"; //실패
		}

	}

	// 회원가입 페이지 이동
	@RequestMapping("/register")
	public String registerGo() {

		return "register"; //회원가입
	}
}