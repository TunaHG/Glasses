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
	BoardDAO bdao;
	@Autowired
	MemberDAO mdao;
	
	// 자유게시판 목록
	@RequestMapping("freeboardlist")
	public ModelAndView freeBoardList() {		
		List<BoardVO> list = bdao.getAllfree();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}

	// 공지사항 목록
	@RequestMapping("noticeboardlist")
	public ModelAndView noticeBoardList() {
		List<BoardVO> list = bdao.getAllnotice();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		return mv;
	}

	// 1개 게시물 상세정보
	@RequestMapping("detailboard")
	public ModelAndView readBoard(int board_no) {
		BoardVO vo = bdao.getDetailBoard(board_no);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		// Form이 공지사항인지 자유인지 확인하여 해당 게시물 상세정보로 이동
		if(vo.getForm().equals("notice")) {
			mv.setViewName("detailnoticeboard");
		} else {
			mv.setViewName("detailfreeboard");
		}
		return mv;
	}

	//1개 게시물 글쓰기 폼 화면
	@RequestMapping(value = "/boardinsert", method = RequestMethod.GET)
	public String createBoard(String form) {
		if(form.equals("free")) {
			return "freecreateform";
		} else {
			return "noticecreateform";
		}
	}

	// 글쓴 내용 전달 받아서 board 테이블 저장
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public String createBoard(@ModelAttribute("vo") BoardVO vo) {
		bdao.createBoard(vo);
		if(vo.getForm().equals("free")) {
			return "redirect:/freeboardlist";
		} else {
			return "redirect:/noticeboardlist";
		}
	}
	
	@RequestMapping("boarddelete")
	public String deleteBoard(int board_no) {
		BoardVO vo = bdao.getDetailBoard(board_no);
		bdao.deleteBoard(board_no);
		if(vo.getForm().equals("free")) {
			return "redirect:/freeboardlist";
		} else {
			return "redirect:/noticeboardlist";
		}
	}
	
	@RequestMapping(value = "boardupdate", method = RequestMethod.GET)
	public ModelAndView updateBoard(int board_no) {
		ModelAndView mv = new ModelAndView();
		BoardVO vo = bdao.getDetailBoard(board_no);
		mv.addObject("update", vo);
		if(vo.getForm().equals("free")) {
			mv.setViewName("freeupdateform");
		} else {
			mv.setViewName("noticeupdateform");
		}
		return mv;
	}
	
	@RequestMapping(value = "boardupdate", method = RequestMethod.POST)
	public String updateBoard(BoardVO vo) {
		bdao.updateBoard(vo);
		if(vo.getForm().equals("free")) {
			return "redirect:/freeboardlist";
		} else {
			return "redirect:/noticeboardlist";
		}
	}
}
