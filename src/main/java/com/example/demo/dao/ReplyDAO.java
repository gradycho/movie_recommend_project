package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.ReplyMapper;
import com.example.demo.vo.ReplyVO;
@Repository("reply_dao")
public class ReplyDAO implements ReplyMapper {

	@Autowired
	private ReplyMapper mapper;

	public List<ReplyVO> reply_read(int r_board_num){
		return mapper.reply_read(r_board_num);
	}

	public int reply_insert(ReplyVO reply) {
		return mapper.reply_insert(reply);
	}

	public int reply_delete(int reply_num) {
		return mapper.reply_delete(reply_num);
	}

	public 	ReplyVO selectReplyNum(int reply_num) {
		return mapper.selectReplyNum(reply_num);
	}

	public int replyCount_update(int r_board_num) {
		return mapper.replyCount_update(r_board_num);
	}


}
