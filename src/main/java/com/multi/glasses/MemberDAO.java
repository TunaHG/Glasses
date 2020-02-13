package com.multi.glasses;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	SqlSession session;
	
	// member테이블에서 회원 체크하기
	public int memberCheck(MemberVO vo) {
		return session.selectOne("membercheck", vo);
	}
	
	// 회원정보 가져오기
	public MemberVO getAccountInfo(MemberVO vo) {
		return session.selectOne("getaccountinfo", vo);
	}

}