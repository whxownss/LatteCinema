package com.itwillbs.service;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.MovieDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MovieService {
	
	MovieDAO movieDAO = null;
	MovieDTO movieDTO = null;

	public MovieDTO insertMovie(HttpServletRequest request) {
		
		System.out.println("insertMovie() 서비스");
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			String uploadPath = request.getServletContext().getRealPath("/upload");
			
			System.out.println(uploadPath);
			
			int maxSize =10*1024*1024;
			
			MultipartRequest multi 												//중복) 업로드 파일 이름 같은 경우 변환
			= new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			
			movieDAO = new MovieDAO();
			movieDTO = new MovieDTO();
			
			movieDTO.setMovieIdx(multi.getParameter("movieIdx"));
            movieDTO.setTitle(multi.getParameter("title"));
            movieDTO.setRating(multi.getParameter("rating"));
            movieDTO.setRunTime(multi.getParameter("runtime"));
            movieDTO.setFilmMade(multi.getParameter("filmMade"));
            movieDTO.setNation(multi.getParameter("nation"));
            movieDTO.setSynopsis(multi.getParameter("synopsis"));
            movieDTO.setOpenDate(multi.getParameter("openDate"));
            movieDTO.setDirector(multi.getParameter("director"));
            movieDTO.setGenre(multi.getParameter("genre"));
            movieDTO.setPoster(multi.getParameter("poster"));
           
            File posterFile = multi.getFile("poster");
            if (posterFile != null) {
                String posterFileName = posterFile.getName();
                movieDTO.setPoster(posterFileName);
            }
   
			movieDAO.insertMovie(movieDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null; 
		
	}

}
