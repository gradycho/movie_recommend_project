package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.svc.ReplySvc;
import com.example.demo.vo.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ReplySvc svc;

	// 댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reply_insert(ReplyVO reply) {
		svc.reply_insert(reply);
		int r_board_num = reply.getR_board_num();

		// TB_board reply_count 업데이트하는 기능
		svc.replyCount_update(r_board_num);

		return "redirect:/board/board_read/" + r_board_num;
	}

	// ========================================= 댓글 삭제
	@PostMapping("/delete")
	@ResponseBody
	public String reply_delete(int reply_num) {
		ReplyVO reply = svc.selectReplyNum(reply_num);
		int r_board_num = reply.getR_board_num();
		
		// TB_board reply_count 업데이트하는 기능
		svc.replyCount_update(r_board_num);
		return String.format("{\"deleted\":%b}", svc.reply_delete(reply_num));
		
	}
}
