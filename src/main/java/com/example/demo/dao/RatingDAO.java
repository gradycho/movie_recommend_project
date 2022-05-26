package com.example.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.RatingMapper;
import com.example.demo.vo.RatingVO;

@Repository("rating_dao")
public class RatingDAO {
	
	@Autowired
	private RatingMapper mapper;
	
	public RatingVO select_mvRating(int mv_code, String rt_user_id) {
		return mapper.select_mvRating(mv_code, rt_user_id);
	}
	public int rating_insert(RatingVO rating) {
		return mapper.rating_insert(rating);
	}
	public int rating_delete(int rating_num) {
		return mapper.rating_delete(rating_num);
	}
	public RatingVO rating_read(int rating_num) {
		return mapper.rating_read(rating_num);
	}
	public int rating_update(RatingVO rating) {
		return mapper.rating_update(rating);
	}
}
