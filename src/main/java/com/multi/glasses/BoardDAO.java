package com.multi.glasses;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	SqlSession session;
	
	public List<BoardVO> getAllfree(){
		List<BoardVO> list = session.selectList("freeboardlist");
		return list;
	}
	
	public List<BoardVO> getAllnotice(){
		List<BoardVO> list = session.selectList("noticeboardlist");
		return list;
	}
	
	public void createBoard(BoardVO vo) {
		session.insert("insertboard", vo);
	}
	
	public BoardVO getDetailBoard(int board_no) {
		session.update("updateviewcnt", board_no);
		BoardVO vo = session.selectOne("detailboard", board_no);
		return vo;
	}
	
	public void updateBoard(BoardVO vo) {
		session.update("updateboard", vo);
	}
	
	public void deleteBoard(int board_no) {
		session.delete("deleteboard", board_no);
	}
}
