package com.itwillbs.dao;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.sql.SqlMapClient;

public class MemberDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	
	// 회원가입 정보 입력
	public boolean insertMember(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertResult = session.insert("Member.insertMember", memberDTO); // namespace.id
		session.commit();
		session.close();
		return insertResult > 0 ? true : false;
		
	}

	// 아이디 중복체크
	public int checkId(String id) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.selectOne("Member.checkId", id);
		session.close();
		return result;
		
	}
	// 이메일 중복체크
	public int checkEmail(String email) {
		SqlSession session = sqlSessionFactory.openSession();
			int result = session.selectOne("Member.checkEmail", email);
			session.close();
		return result;
	}
	
	public MemberDTO userCheck(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		memberDTO = session.selectOne("Member.userCheck", memberDTO);
		
		return memberDTO;
	}
	
	// 회워탈퇴
	public boolean deleteMember(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int deleteResult = session.delete("Member.deleteMember", memberDTO);
		session.commit();
		session.close();
		
		return deleteResult > 0 ? true : false;
	}
	
	// 회원정보수정
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

	public boolean updatePasswd(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int updateResult = session.update("Member.updatePasswd", memberDTO);
		session.commit();
		session.close();
		
		return updateResult > 0 ? true : false;
		
	}

	public MemberDTO userFind(MemberDTO memberDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		memberDTO = session.selectOne("Member.userFind", memberDTO);
		System.out.println(memberDTO);
		session.close();
		return memberDTO;
	}
	
//	// 마이페이지 예약구매 페이지 페이징 작업         PageDTO pageDTO
//	public ArrayList<MemberDTO> getBoardList(Map<String, Integer> paramMap) { 
//		ArrayList<MemberDTO> getMemberList = null;
//		SqlSession session = sqlSessionFactory.openSession();
//		getMemberList = new ArrayList<MemberDTO>(session.selectList("Member.getBoardList", paramMap));
//		session.close();
//		return getMemberList;
//	}//
//
//	public int getBoardCount() {
//		int count = 0;
//		SqlSession session = sqlSessionFactory.openSession();
//		count = session.selectOne("Member.getBoardCount");
//		session.close();
//		return count;
//	}//

	// 간편로그인 관련 Id값 가져오기
	public String getSimpleId(String memEmail) {
		SqlSession session = sqlSessionFactory.openSession();
		String sId = session.selectOne("Member.getSimpleId", memEmail);
		session.close();
		return sId;
	}

	public ArrayList<ReservationDTO> getResBoardList(PageDTO pageDTO, String memId) {
		System.out.println("MemberDAO getResBoardList() search");
		ArrayList<ReservationDTO> resBoardList = null;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			Map<String, Object> params = new HashMap<>();
			params.put("pageDTO", pageDTO);
			params.put("memId", memId);

			resBoardList = new ArrayList<ReservationDTO>(session.selectList("CsAdmin.getResBoardList", params));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return resBoardList;
	}//getResBoardList()

	public int getResBoardCount(String memId) {
		int count = 0;
		SqlSession session = sqlSessionFactory.openSession();
		try {
			count = session.selectOne("CsAdmin.getResBoardCount",memId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return count;
	}//getResBoardCount()

	
}



//public boolean insert(CustomerDTO dto) {
//	SqlSession session = sqlSessionFactory.openSession();
//	int insertCnt = session.insert("Customer.insert", dto);
//	session.commit();
//	session.close();
//	
//	return insertCnt > 0 ? true : false;
//}