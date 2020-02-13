package com.multi.glasses;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAO {
		
		@Autowired
		SqlSession session;
		
		//계정정보 확인
		public int selectByMember(MemberVO member_id, MemberVO password) {
			
			return session.selectOne("loginsuccess", member_id);
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