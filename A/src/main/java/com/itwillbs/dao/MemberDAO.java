package com.itwillbs.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.sql.SqlMapClient;

public class MemberDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	
	public boolean insertMember(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertResult = session.insert("Member.insertMember", memberDTO); // namespace.id
		session.commit();
		session.close();
		return insertResult > 0 ? true : false;
		
	}

	public MemberDTO userCheck(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		memberDTO = session.selectOne("Member.userCheck", memberDTO);
		
		return memberDTO;
	}
	
	public boolean deleteMember(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int deleteResult = session.delete("Member.deleteMember", memberDTO);
		session.commit();
		session.close();
		
		return deleteResult > 0 ? true : false;
	}
	
	
	
}



//public boolean insert(CustomerDTO dto) {
//	SqlSession session = sqlSessionFactory.openSession();
//	int insertCnt = session.insert("Customer.insert", dto);
//	session.commit();
//	session.close();
//	
//	return insertCnt > 0 ? true : false;
//}