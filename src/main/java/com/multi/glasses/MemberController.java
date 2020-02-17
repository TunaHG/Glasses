package com.multi.glasses;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
//import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	// templetes form
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	// get, 받아오기
	// 나중에 경로 ("/")
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String logIn() {
		
		return "/login";
	}

	// 나중에 경로 ("/")	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, MemberVO vo) {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session;
		
		// id, pw로 불러온 온전한 member
		MemberVO result = dao.getAccountInfo(vo);
		
		if (result == null) { // 로그인 실패
			mv.addObject("member", vo);
			mv.setViewName("loginfail");
			
		} else { // 로그인 성공
			session = request.getSession(true);		// 세션 생성
			session.setAttribute("member", result); // 세션 설정(멤버 등록)
			
			// 세선에 넣은 멤버 컨트롤러에서 꺼내는 방법
//			MemberVO member = (MemberVO)session.getAttribute("member");
//			System.out.println("session member : "+member);
//			mv.setViewName("sessiontest");
			mv.setViewName("homeinfo");
		}
		
		return mv;
	}
	
	// 로그인 실패 화면
	@RequestMapping("/loginfail")
	public String loginFail() {
		return "loginfail";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logOut(HttpSession session) {
		
		session.invalidate();
		
//		return "/sessiontest";
		return "/login";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
//	@RequestMapping("/membercheck")		// using in register - Ajax
	@RequestMapping(value="/membercheck", method=RequestMethod.POST)
	@ResponseBody
	public String registerIdCheck(HttpServletRequest request, MemberVO member) {
		System.out.println("before " +member);
		
		if(dao.isIdExist(member) == 0) {
			if(dao.isHouseExist(member) == 0) {	
				if(dao.insertMember(member) == 1) {
					System.out.println("after "+ dao.getAccountInfo(member));
					return "success";
				} else { return "error"; }
			} else {
				return "house";
			}
		} else {
			return "id";
		}

	}
	
	// userhome 화면(로그인 성공)
	@RequestMapping("/homeinfo")
	public String homeInfo() {
		
		return "homeinfo";
	}
	

// 	=============================================================================================
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(MemberVO vo, HttpServletRequest request, RedirectAttributes loginfail) {
//
//		HttpSession session = request.getSession();
//		MemberVO login = dao.getAccountInfo(vo);
//
//		if (login == null) {
//			session.setAttribute("member", loginfail);
//		} else {
//			session.setAttribute("member", login);
//		}
//		
//		return "redierct:/";
//	}

//	@RequestMapping("/login")
//	public String getSession(MemberVO vo, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		MemberVO getsession = dao.getAccountInfo(vo);
//		
//		if (getsession == null) {
//			System.out.println("세션 저장값 없음");
//			return "loginfail";
//		}
//		else {
//			System.out.println("세션저장 성공");
//			session.setAttribute("session", getsession);
//			return "homeinfo";
//		}
//	}

//	@RequestMapping(value = "/homeinfo", method = RequestMethod.GET)
//	public ModelAndView getAccountInfo(MemberVO vo) {
//		
//		MemberVO member = dao.getAccountInfo(vo);
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("member", member);
//		return mv;
//	}

//	// userhome 화면(로그인 성공)
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public ModelAndView homeInfo(@ModelAttribute("member") MemberVO vo) {
//		
//		ModelAndView mv = new ModelAndView();
//		if(vo.getMember_id().equals(dao.getAccountInfo(vo).member_id) && 
//				vo.getPassword().equals(dao.getAccountInfo(vo).password)) {
//			System.out.println("세션저장 성공");
//			mv.addObject("member", dao.getAccountInfo(vo));
//			mv.setViewName("homeinfo");
//		}
//		else {
//			System.out.println("세션저장 실패");
//			mv.addObject("member", false);
//			mv.setViewName("loginfail");
//		}
//		
//		return mv;
//	}

	// 로그인 성공/실패
	// 작동됨
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String loginProcess(MemberVO vo) {
//		System.out.println("/login post");
//		System.out.println(vo);
//		
//		MemberVO result = dao.getAccountInfo(vo);
//		if(result == null) {
//			return "loginfail";
//		}
//		else {
//			return "homeinfo";
//		}
//	
//	}
	
	/////////////////////////////khh.//////////////////////////////
	
	//page에 회원 리스트 출력 
	@RequestMapping("/membertable")
	public ModelAndView getCntEmp(int pagenum) {
		int count = dao.getCountMember();
		int cntPerPage = 5;
		int totalPage = 0;
		
		if(count%cntPerPage == 0) {
			totalPage = count/cntPerPage;	
		}else {
			totalPage = count/cntPerPage + 1;
		}
		ModelAndView mv = new ModelAndView();
		int start = (pagenum-1)*cntPerPage+1;
		int end = pagenum*cntPerPage;
		int param [] = new int[2];
		
		param[0] = start;
		param[1] = end;
		List<MemberVO> memberlist = dao.memberList(param);
		List<MemberVO> approvalList = dao.approvalList(); 
		mv.addObject("approvalList", approvalList );
		mv.addObject("memberlist", memberlist);
		mv.addObject("totalPage", totalPage);
		return mv;
	}
	
	@RequestMapping("/memberdetail")
	public ModelAndView detail(String member_id) {
		//System.out.println("11111houseID = "+vo.getHouse_id());
		MemberVO vo = dao.getdetail(member_id);
		ModelAndView mv = new ModelAndView();
		//System.out.println("444444houseID = "+vo.getHouse_id());
		mv.addObject("detail", vo);
		return mv;
	}
	
	@RequestMapping("/updatemember")
	public String updateMember(@ModelAttribute MemberVO vo) {
		System.out.println(vo);
		dao.updateMember(vo);
		System.out.println(vo.allowed+"2222222222222");
		return "redirect:/membertable?pagenum="+1;
	}
	
	@RequestMapping("/updateallowed")
	public String updateAllowed(String allowed, String house_id) {
		System.out.println("승인 key"+allowed);
		System.out.println("houseID =" +house_id);
		dao.updateAllowed(allowed, house_id);
		return "redirect:/membertable?pagenum="+1;
	}
	
	@RequestMapping("/deletemember")
	public String deleteMember(String house_id) {
		dao.deleteMember(house_id);
		System.out.println(house_id+"2222222222222");
		return "redirect:/membertable?pagenum="+1;
	}
//////////////////////////////////////////////////////////////////////////khh///
}
