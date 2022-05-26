package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.BoardVO;

@Mapper 
public interface BoardMapper {
		/*
		 * board 기능 
		 * 1. 글 쓰기 board_insert -- 필요 인자 : boardVO / 반환값 : int(실행 결과 : 성공/실패) 
		 * 2. 글 리스트 불러오기 board_getList -- 필요 인자 : x / 반환값 : boardVO(게시판 내용) 
		 * 3. 글 상세 불러오기 board_read -- 필요 인자 : board_num / 반환값 : boardVO(board_num에 해당하는 글 내용) 
		 * 4. 글 삭제 board_delete -- 필요 인자 : board_num / 반환값 : int(실행 결과 : 성공/실패) 
		 * 5. 글 수정 board_update -- 필요 인자 : boardVO / 반환값 : int(실행 결과 : 성공/실패) 
		 * 6. 조회수 증가 board_hitUpdate 
		 * 
		 * */
	   @Insert("INSERT INTO TB_board VALUES (0, (SELECT user_num from TB_user WHERE user_id = #{b_user_id}), #{b_user_id}, #{board_title}, #{board_content}, now(), 1,0)")
	   int board_insert(BoardVO board);
	   
	   @Select("SELECT * FROM TB_board ORDER BY board_num desc")
	   List<BoardVO> board_getList();
	   //List<BoardVO> board_getList();
	   
	   @Select("SELECT * FROM TB_board WHERE board_num = #{board_num}")
	   BoardVO board_read( int board_num);	
	   
	   @Delete("DELETE FROM TB_board WHERE board_num=#{board_num}")
	   int board_delete(int board_num);
	   
	   @Update("UPDATE TB_board SET board_title=#{board_title}, board_content=#{board_content} WHERE board_num=#{board_num}")
	   int board_update(BoardVO bbs);
	   
	   @Select("SELECT * FROM TB_board	WHERE board_content LIKE CONCAT('%',#{keyword},'%')	OR board_title LIKE CONCAT('%',#{keyword},'%') ORDER BY board_num desc")
	   List<BoardVO>  board_search(String keyword);
	   //List<BoardVO>  board_search(String keyword);
	   
	   @Update("UPDATE TB_board SET board_hit = board_hit+1 WHERE board_num = #{board_num}")
	   int board_hitUpdate (int board_num);
	      
}
