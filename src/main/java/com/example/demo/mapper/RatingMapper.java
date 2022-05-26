package com.example.demo.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.RatingVO;

@Mapper
public interface RatingMapper {
	
	@Select("SELECT * FROM TB_rating WHERE mv_code = #{mv_code} AND rt_user_id = #{rt_user_id}")
	RatingVO select_mvRating(int mv_code, String rt_user_id);		// 해당 영화에 대한 그 유저의 별점 정보를 불러옴
	
	@Insert("INSERT INTO TB_rating VALUES ((select * from (select max(rating_num)+1 from TB_rating)as X), (SELECT user_num from TB_user WHERE user_id = #{rt_user_id}), #{rt_user_id}, #{movieId}, #{mv_code}, #{user_rating} )")
	int rating_insert(RatingVO rating);		// 별점 주기 기능 
	
	@Delete("DELETE FROM TB_rating WHERE rating_num = #{rating_num}")
	int rating_delete(int rating_num);		// 별점 삭제 기능
	
	@Select("SELECT * FROM TB_rating WHERE rating_num = #{rating_num}")
	RatingVO rating_read(int rating_num);	// 별졈 번호로 별점 가져오기 (수정 페이지 불러오는데 사용)
	
	@Update("UPDATE TB_rating SET user_rating=#{user_rating} WHERE rating_num=#{rating_num}")
	int rating_update(RatingVO rating);		// 별점 수정 기능 
}



