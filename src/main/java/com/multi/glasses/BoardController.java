package com.multi.glasses;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	BoardDAO dao;
	
	@RequestMapping("freeboardlist")
	public ModelAndView freeBoardList() {
		List<BoardVO> list = dao.getAllfree();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("noticeboardlist")
	public ModelAndView noticeBoardList() {
		List<BoardVO> list = dao.getAllnotice();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}

//	public void readBoard() {
//
//	}
//
//	public void createBoard() {
//
//	}
	//1개 게시물 글쓰기 폼 화면
	@RequestMapping(value = "/boardinsert", method = RequestMethod.GET)
	public String createBoard() {
		return "boardCreateform";
	}

	// 글쓴 내용 전달 받아서 board 테이블 저장
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public String createBoard(@ModelAttribute("vo") BoardVO vo) {
		dao.createBoard(vo);
		return "redirect:/noticeboardlist";
	}
	
	
	
//
//	public void deleteBoard() {
//
//	}
//
//	public void updateBoard() {
//
//	}

}
