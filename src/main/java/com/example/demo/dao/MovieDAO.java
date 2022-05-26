package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.MovieMapper;
import com.example.demo.mapper.UserXMLMapper;
import com.example.demo.vo.MovieVO;
import com.example.demo.vo.RecommendVO;
import com.example.demo.vo.UserVO;

@Repository("movie_dao")
public class MovieDAO {

	@Autowired
	private MovieMapper mapper;
	
	@Autowired
	private UserXMLMapper umapper;

	// 영화 목록 띄우기
	public List<MovieVO> movie_list() {
		return mapper.movie_list();
	}

	// 영화 상세 화면 띄우기
	public MovieVO movie_read(int code) {
		return mapper.movie_read(code);
	}

	public List<MovieVO> movie_search(String keyword) {
		return mapper.movie_search(keyword);
	}

	// 메인 페이지 영화 추천
	public List<RecommendVO> main_recommend(String user_id, int section) {
		UserVO user = umapper.userInfo(user_id);
		return mapper.main_recommend(user.getUser_num(), section);
	}
}
