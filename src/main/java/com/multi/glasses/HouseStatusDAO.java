package com.multi.glasses;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HouseStatusDAO {
	
	@Autowired
	SqlSession session;
	
	public HouseStatusVO getStatus(MemberVO member) {
		
//		return session.selectOne("existid", member);
		return session.selectOne("getstatus", member.getHouse_id());
	}

}
