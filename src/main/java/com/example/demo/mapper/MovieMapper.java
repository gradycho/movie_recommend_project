package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.MovieVO;
import com.example.demo.vo.RecommendVO;

@Mapper
public interface MovieMapper {
	
	@Select("SELECT * FROM TB_movie order by naver_user_participate desc limit 100")
	List<MovieVO> movie_list ();		// 영화 목록 표시
	@Select("SELECT * FROM TB_movie	WHERE code = #{code}")
	MovieVO movie_read(int code);		// 영화 상세 보기
	@Select("SELECT * FROM TB_movie WHERE title_kor LIKE CONCAT('%',#{keyword},'%')	OR title_eng LIKE CONCAT('%',#{keyword},'%') OR director LIKE CONCAT('%',#{keyword},'%') OR directors_kor LIKE CONCAT('%',#{keyword},'%') OR cast LIKE CONCAT('%',#{keyword},'%') OR cast_kor LIKE CONCAT('%',#{keyword},'%') ORDER BY naver_user_rate desc")
	List<MovieVO> movie_search(String keyword);  // 영화 검색 
	//List<RecommendVO> main_recommend(int userID, int section);  // 메인 페이지 영화 추천
	@Select("SELECT * FROM recommend_movies WHERE userID =#{userID} AND section = #{section}")
	List<RecommendVO> main_recommend(int userID, int section);
}

/*
 * @Select("SELECT * FROM bbs WHERE deleteYn='N' AND category=#{ctgr} ORDER BY num DESC"
 * ) List<BBSVO> getList(String ctgr);
 * 
 * <select id="main_recommend" resultType="com.example.demo.vo.RecommendVO"
 * parameterType="Integer"> SELECT * FROM recommend_movies WHERE userID =
 * #{userID} AND section = #{section}
 * 
 * </select>
 */