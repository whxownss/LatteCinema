package com.itwillbs.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {

	MemberDAO memberDAO = null;
	
	public void insertMember(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("postcode") + request.getParameter("address1") + request.getParameter("address2");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setIdx(idx);
			memberDTO.setId(id);
			memberDTO.setPass(pass);
			memberDTO.setName(name);
			memberDTO.setPhone(phone);
			memberDTO.setAddress(address);
			memberDTO.setBirth(birth);
			memberDTO.seteMail(email);
			memberDTO.setDate(date);
			
			System.out.println(memberDTO);
			
			memberDAO = new MemberDAO();
			
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}// insertMember()

	
	
}
