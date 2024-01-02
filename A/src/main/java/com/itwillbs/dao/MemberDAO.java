package com.itwillbs.dao;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

	public int checkId(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.selectOne("Member.checkId", id);
		session.close();
		return result;
		
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
	
	public boolean updateMember(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int updateResult = session.update("Member.updateMember", memberDTO);
		session.commit();
		session.close();
		
		return updateResult > 0 ? true : false;
		
	}
	
	
	public MemberDTO getMember(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberDTO memberDTO = session.selectOne("Member.getMember", id);
		
		System.out.println(memberDTO);
		session.close();
		
		return memberDTO;
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