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
		session.selectOne("insertmember", vo);
	}
}
