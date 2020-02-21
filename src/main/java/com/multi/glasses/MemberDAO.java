package com.multi.glasses;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


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
		return session.selectOne("getaccountinfo", vo);
	}
	
	// 희망온도 적용하기 
	public int updateSelTemp(MemberVO vo) { 
		return session.update("updatetemp", vo);
	}
	
//	public int getSelectTemp(HttpServletRequest requesttemp) { 
//		return session.update("getSelectTemp", requesttemp);
//	}
	
	
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
	//////member LIst 출력////////
	public List<MemberVO> memberList(int[] param){
		List<MemberVO> list = session.selectList("pagelist", param);
		return list;
	}
	////////member count////////
	public int getCountMember() {
		int count = session.selectOne("cntmember");
		return count;
	}
	/////회원 정보 수정 데이터 //////
	public MemberVO getdetail(String member_id) {
		System.out.println("222221houseID = "+member_id);
		MemberVO vo = session.selectOne("detail", member_id);
		System.out.println("333333houseID = "+member_id);
		return vo;
	}
	
	public void updateMember(MemberVO vo) {
		session.update("updatemember", vo);
	}
	
	public void updateAllowed(String allowed, String member_id) {
		MemberVO vo = new MemberVO();
		vo.setAllowed(allowed);
		vo.setMember_id(member_id);
		System.out.println(allowed+"111111111");
		session.update("updateallowed", vo);
	}
	
	public List<MemberVO> approvalList(){
		List<MemberVO> list = session.selectList("allowedlist");
		return list;
	}
	
	public void deleteMember(String member_id) {
		System.out.println(member_id+"111111111");
		session.delete("deletemember", member_id);
	}
///////////////////khh//////////////////////////////////////
}