package com.example.demo.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MovieDAO;
import com.example.demo.vo.MovieVO;
import com.example.demo.vo.RecommendVO;

@Service
public class MovieSvc {
	@Autowired
	private MovieDAO dao;

	public MovieSvc(@Qualifier("movie_dao") MovieDAO dao) {
		this.dao = dao;
	}

	// 영화 목록 띄우기
	public List<MovieVO> movie_list() {
		return dao.movie_list();
	}

	// 영화 상세 화면 띄우기
	public MovieVO movie_read(int code) {
		return dao.movie_read(code);
	}

	public List<MovieVO> movie_search(String keyword) {
		return dao.movie_search(keyword);
	}

	// 메인 페이지 영화 추천
	public List<RecommendVO> main_recommend(String user_id, int section) {		
		return dao.main_recommend(user_id, section);
	}
}
