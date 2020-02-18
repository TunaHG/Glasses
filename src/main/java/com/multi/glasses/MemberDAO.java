package com.multi.glasses;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
		
	@Autowired
	SqlSession session;

	//계정정보 확인
//	public int selectByMember(MemberVO member_id, MemberVO password) {
//		
//		return session.selectOne("loginsuccess", member_id);
//	}
	
	// Jzee
	// register - id check
	public int isIdExist(MemberVO member) {
		return session.selectOne("existid", member);
	}
	
	// register - id check
	public int isHouseExist(MemberVO member) {
		return session.selectOne("existhouse", member);
	}
	
	// register - insert new member
	public int insertMember(MemberVO member) {
		return session.update("insertmember", member);
	}
	
	// member테이블에서 회원 체크하기(select count(*))
	public int memberCheck(MemberVO vo) {
		return session.selectOne("membercheck", vo);
	}
	
	// 회원정보 가져오기(select *)
	public MemberVO getAccountInfo(MemberVO vo) {
		// memberVO.allowed check : getaccountinfo
		// memberVO.allowed not check : getaccountinfo2
		return session.selectOne("getaccountinfo2", vo);
	}
	
	// 희망온도 적용하기 
	public int getSelectTemp(HttpServletRequest requesttemp) { 
		return session.update("getSelectTemp", requesttemp);
	}
	
//		public int idCheck(MemberVO member_id) {
//			return session.selectOne("idcheck", member_id);
//		}
//		
//		public int insertMember(MemberVO vo) {
//			return session.insert("newmember", vo);
//		}
//		
//		public int updateMember(MemberVO vo) { 
//			int row = session.update("updatemember", vo);
//			return row;
//		}
//			
//		public int deleteMember(MemberVO vo) {
//			int row = session.delete("deletemember", vo);
//			return row;
//		}

}