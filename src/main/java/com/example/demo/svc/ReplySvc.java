package com.example.demo.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.ReplyVO;

@Service
public class ReplySvc {
	@Autowired
	private ReplyDAO dao;
	
	public ReplySvc(@Qualifier("reply_dao") ReplyDAO dao) {
		this.dao = dao;
	}
	

	public List<ReplyVO> reply_read(int r_board_num){
		return dao.reply_read(r_board_num);
	}

	public int reply_insert(ReplyVO reply) {
		return dao.reply_insert(reply);
	}

	public int reply_delete(int reply_num) {
		return dao.reply_delete(reply_num);
	}

	public 	ReplyVO selectReplyNum(int reply_num) {
		return dao.selectReplyNum(reply_num);
	}

	public int replyCount_update(int r_board_num) {
		return dao.replyCount_update(r_board_num);
		
	}


}
