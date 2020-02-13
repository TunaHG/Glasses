package com.multi.glasses;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
//
//	public void deleteBoard() {
//
//	}
//
//	public void updateBoard() {
//
//	}

	
}
