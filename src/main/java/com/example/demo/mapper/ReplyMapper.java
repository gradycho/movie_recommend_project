package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.ReplyVO;

@Mapper 
public interface ReplyMapper {
	
	// 게시판 번호를 가지고 그 번호에 등록된 모든 댓글목록을 가져오는 메소드
	@Select("SELECT * FROM TB_reply	WHERE r_board_num = #{r_board_num}")
	List<ReplyVO> reply_read(int r_board_num);	
	
	@Insert("INSERT INTO TB_reply VALUES (0, #{r_board_num},(SELECT user_num from TB_user where user_id = #{r_user_id}), #{r_user_id}, #{reply_content}, now())")
	int reply_insert(ReplyVO reply);
	
	@Delete("DELETE FROM TB_reply WHERE reply_num=#{reply_num}")
	int reply_delete(int reply_num);
	// 댓글 번호를 가지고 하나의 댓글 정보르 가져오는 메소드 
	
	@Select("SELECT * FROM TB_reply WHERE reply_num = #{reply_num}")
	ReplyVO selectReplyNum(int reply_num);
	
	@Update("UPDATE TB_board SET reply_count =  (SELECT count(reply_num)  FROM TB_reply  WHERE r_board_num = #{r_board_num}) WHERE board_num = #{r_board_num};")
	int replyCount_update(int r_board_num);
}
