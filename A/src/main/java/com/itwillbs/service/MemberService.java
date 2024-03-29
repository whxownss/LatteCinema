package com.itwillbs.service;

import java.nio.file.spi.FileSystemProvider;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itwillbs.dao.CSBoardDAO;
import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.StorePayDTO;

public class MemberService {

	MemberDAO memberDAO = null;
	
	//회원가입
	public void insertMember(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone").replaceAll("-", "");
			String address = request.getParameter("postcode") + "/" + request.getParameter("address1") + "/" + request.getParameter("address2");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			System.out.println("@@@@@@@@@@@@@@@@@@");
			System.out.println(phone);
			System.out.println(birth);
			System.out.println(email);
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemIdx(idx);
			memberDTO.setMemId(id);
			memberDTO.setMemPass(pass);
			memberDTO.setMemName(name);
			memberDTO.setMemPhone(phone);
			memberDTO.setMemAddress(address);
			memberDTO.setMemBirthD(birth);
			memberDTO.setMemEmail(email);
			memberDTO.setMemJoinD(date);
			
			System.out.println(memberDTO);
			
			memberDAO = new MemberDAO();
			
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}// insertMember()
	
	//카카오간편로그인 관련
	public void insertSimpleMember(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String id = request.getParameter("memId");
			String name = request.getParameter("memName");
			String phone = request.getParameter("memPhone");
			String birth = request.getParameter("memBirth");
			String email = request.getParameter("memEmail");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemIdx(idx);
			memberDTO.setMemId(id);
			memberDTO.setMemName(name);
			memberDTO.setMemPhone(phone);
			memberDTO.setMemBirthD(birth);
			memberDTO.setMemEmail(email);
			memberDTO.setMemJoinD(date);
			
			System.out.println(memberDTO);
			memberDAO = new MemberDAO();
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertkakaoMember()

	// 유저체크
	public MemberDTO userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		MemberDTO memberDTO = new MemberDTO();
		try {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
//			String name = request.getParameter("name");
//			String phone = request.getParameter("phone");
//			String address = request.getParameter("postcode") + "/" + request.getParameter("address1") + "/" + request.getParameter("address2");
//			String birth = request.getParameter("birth");
//			String email = request.getParameter("email");
			System.out.println("@############3");
			System.out.println(id);
			System.out.println(pass);
			System.out.println("@############3");
			
			memberDAO = new MemberDAO();
			memberDTO.setMemId(id);
			memberDTO.setMemPass(pass);
//			memberDTO.setMemName(name);
//			memberDTO.setMemPhone(phone);
//			memberDTO.setMemAddress(address);
//			memberDTO.setMemBirthD(birth);
//			memberDTO.setMemEmail(email);
			memberDTO = memberDAO.userCheck(memberDTO);
			
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberDTO;
	}// userCheck()

	//회원탈퇴
	public void deleteMember(HttpServletRequest request) {
		System.out.println("MemberService deleteMember()");
		try {
			request.setCharacterEncoding("UTF-8");
			
			// requset 값을 가져와서 변수에 저장
			String id = request.getParameter("id");
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(id);
			
			// MemberDAO 객체 생성
			memberDAO = new MemberDAO();
			// deleteMember() 호출
			memberDAO.deleteMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// deleteMember()	
	
	//회원정보수정
	public void updateMember(HttpServletRequest request) {
		System.out.println("MemberService updateMember()");
		try {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(request.getParameter("id"));
			memberDTO.setMemName(request.getParameter("name"));
			memberDTO.setMemAddress(request.getParameter("postcode") + "/" + request.getParameter("addr1") + "/" + request.getParameter("addr2"));
			memberDTO.setMemEmail(request.getParameter("email"));
			String phone = request.getParameter("newPhone").replaceAll("-", "");
//			memberDTO.setMemPhone(phone);
			System.out.println(phone);
			
			if(phone.equals("")) {
				phone = request.getParameter("phone");
			}
			memberDTO.setMemPhone(phone);
			System.out.println(phone);
//			System.out.println(memberDTO);
			memberDAO = new MemberDAO();
			
			memberDAO.updateMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// updateMember()
	
	public MemberDTO getMember(String id) {
		System.out.println("MemberService getMember()");
		MemberDTO memberDTO = null;
		try {
			
			memberDAO = new MemberDAO();
			
			memberDTO = memberDAO.getMember(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// getMember()

	// 아이디 중복체크
	public int checkId(HttpServletRequest request) {
		System.out.println("MemberService checkId()");
		MemberDTO memberDTO = new MemberDTO();
		int result = 0;
		try {
			String id = request.getParameter("memId");
			memberDAO = new MemberDAO();
			result = memberDAO.checkId(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; 
		
	}//checkId()

	// 이메일 인증
	public int checkEmail(HttpServletRequest request) {
		System.out.println("MemberService checkEmail()");
		MemberDTO memberDTO = new MemberDTO();
		int result = 0;
		try {
			String email = request.getParameter("memEmail");
			memberDAO = new MemberDAO();
			result = memberDAO.checkEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//checkEmail()
	
	// 비밀번호 변경
	public void updatePasswd(HttpServletRequest request) {
		System.out.println("MemberService updatePasswd()");
		try {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(request.getParameter("id"));
			memberDTO.setMemPass(request.getParameter("newpasswd"));
			System.out.println(memberDTO);
			memberDAO = new MemberDAO();
			memberDAO.updatePasswd(memberDTO);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//updatePasswd()

	// 회원 아이디 찾기
	public MemberDTO userFind(HttpServletRequest request) {
		System.out.println("MemberService userFind()");
		MemberDTO memberDTO = new MemberDTO();
		try {
			String name = request.getParameter("memName");
			String birth = request.getParameter("memBirth");
			String phone = request.getParameter("memPhone");
			String id = request.getParameter("memId");
			String email = request.getParameter("memEmail");
			System.out.println("@@@@@@@@@@@@@@@@@@@@@");
			System.out.println(name);
			System.out.println(birth);
			System.out.println(phone);
			System.out.println(id);
			System.out.println(email);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
			
			memberDTO.setMemName(name);
			memberDTO.setMemBirthD(birth);
			memberDTO.setMemPhone(phone);
			memberDTO.setMemEmail(email);
			memberDTO.setMemId(id);
			
			memberDAO = new MemberDAO();
			memberDTO = memberDAO.userFind(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberDTO;
	}//userFind()
	
//	// 마이페이지 예약구매 페이지 페이징 작업
//	public ArrayList<MemberDTO> getBoardList(PageDTO pageDTO) {
//		
//		ArrayList<MemberDTO> memberList = null;
//		try {
//			// 시작하는 행번호 구하는 식 
//			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
//			// 끝나는 행번호 구하는 식 
//			int endRow = startRow + pageDTO.getPageSize()-1;
//			
//			pageDTO.setStartRow(startRow-1);
//			pageDTO.setEndRow(pageDTO.getPageSize());
//			
//			// BoardDAO 객체생성
//			memberDAO = new MemberDAO();
//			// getBoardList(startRow,pageSize) 메서드 호출
////			memberList = memberDAO.getBoardList(pageDTO);
//			
//			Map<String, Integer> paramMap = new HashMap<String, Integer>();
//			paramMap.put("startRow", startRow);
//			paramMap.put("pageSize", pageDTO.getPageSize());
//			
//			memberList = memberDAO.getBoardList(paramMap);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return memberList;
//	}//getBoardList()
//
//	public int getBoardCount() {
//		int count = 0;
//		try {
//			memberDAO = new MemberDAO();
//			count = memberDAO.getBoardCount();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return count;
//	}//getBoardCount()

	public String getSimpleId(HttpServletRequest request) {
		String sId = null;
		try {
//			MemberDTO memberDTO = new MemberDTO();
//			memberDTO.setMemEmail(request.getParameter("memEmail"));
			
			memberDAO = new MemberDAO();
			sId = memberDAO.getSimpleId(request.getParameter("memEmail"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sId;
	}

	public ArrayList<ReservationDTO> getResBoardList(PageDTO pageDTO, String memId) {
		System.out.println("MemberService getResBoardList()");
		ArrayList<ReservationDTO> resBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			MemberDAO memberDAO = new MemberDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			resBoardList = memberDAO.getResBoardList(pageDTO,memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resBoardList;
	}//getResBoardList()

	public int getResBoardCount(String memId) {
		System.out.println("CSBoardService getResBoardCount()");
		int count = 0;
		try {
			MemberDAO memberDAO = new MemberDAO();
			count = memberDAO.getResBoardCount(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getResBoardCount()

	public ArrayList<StorePayDTO> getStoreBoardList(PageDTO pageDTO, String memId) {
		System.out.println("MemberService getStoreBoardList()");
		ArrayList<StorePayDTO> storeBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			MemberDAO memberDAO = new MemberDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			storeBoardList = memberDAO.getStoreBoardList(pageDTO,memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return storeBoardList;
	}//getStoreBoardList()

	public int getStoreBoardCount(String memId) {
		System.out.println("CSBoardService getStoreBoardCount()");
		int count = 0;
		try {
			MemberDAO memberDAO = new MemberDAO();
			count = memberDAO.getStoreBoardCount(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getStoreBoardCount()

	public ArrayList<ReservationDTO> getResRefundList(String memId) {
		System.out.println("MemberService getResRefundList()");
		ArrayList<ReservationDTO> resRefundList = null;
		try {
			MemberDAO memberDAO = new MemberDAO();
			resRefundList = memberDAO.getResRefundList(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resRefundList;
	}//getResRefundList()

	
	// 예약3 페이지에서 포인트 정보 가져올 때 
	public String getMemPoint(String sId) {
		memberDAO = new MemberDAO();
		return memberDAO.getMemPoint(sId);
	}

	// 예약3 결제하고 포인트 적립
	public void setPoint(String rsp, String sId, HttpServletRequest request) {
		memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemId(sId);
		int minusPoint = Integer.parseInt(request.getParameter("minusPoint"));
		int plusPoint = Integer.parseInt(request.getParameter("plusPoint"));
		memberDTO.setMemPoint((plusPoint - minusPoint) + "");
		memberDAO.setPoint(memberDTO);

		System.out.println("service()");
		System.out.println(minusPoint);
		System.out.println(plusPoint);
		System.out.println("service()");
		// 포인트 테이블
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		ReservationDTO reservationDTO = gson.fromJson(rsp, ReservationDTO.class);
		PointDTO pointDTO = new PointDTO();
		pointDTO.setMemId(sId);
		pointDTO.setPointMinus(minusPoint + "");
		pointDTO.setPointPlus(plusPoint + "");
		pointDTO.setMerchantUid(reservationDTO.getMerchantUid());
		System.out.println("service()");
		System.out.println(pointDTO.getPointMinus());
		System.out.println(pointDTO.getPointPlus());
		System.out.println("service()");
		memberDAO.setPointInfo(pointDTO);
	}


	// 회원가입 연락처 중복체크
	public int checkPhone(HttpServletRequest request) {
		
		int result = 0;
		memberDAO = new MemberDAO();
		result = memberDAO.checkPhone(request.getParameter("memPhone"));
		
		return result;
	}

	// 비밀번호 변경 현재비밀번호 일치 유무
	public int changePassCheck(HttpServletRequest request) {
		int result = 0;
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemId(request.getParameter("memId"));
		memberDTO.setMemPass(request.getParameter("memPass"));
		memberDAO = new MemberDAO();
		result = memberDAO.changePassCheck(memberDTO);
		
		return result;
	}

	public List<PointDTO> getPointList(String sId) {
		memberDAO = new MemberDAO();
		
		return memberDAO.getPointList(sId);
	}

	public ArrayList<StorePayDTO> getStoreRefundList(String memId) {
		System.out.println("MemberService getStoreRefundList()");
		ArrayList<StorePayDTO> storeRefundList = null;
		try {
			MemberDAO memberDAO = new MemberDAO();
			storeRefundList = memberDAO.getStoreRefundList(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return storeRefundList;
	}



//	public MemberDTO kakaoCheck(HttpServletRequest request) {
//
//		
//		return null;
//	}//kakaoCheck

//	public void sendGmail(HttpServletRequest request) {
//		System.out.println("MemberService sendGmail()");	
//		
//	}//sendGmail()
	
	
}
