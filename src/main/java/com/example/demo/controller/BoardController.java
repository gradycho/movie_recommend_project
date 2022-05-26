package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.svc.BoardSvc;
import com.example.demo.svc.ReplySvc;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.ReplyVO;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardSvc svc;
	@Autowired
	private ReplySvc replySvc;

	// ========================================= 글 작성 화면 view
	// http://localhost:8080/board/write_view
	@GetMapping("/write_view")
	public String board_write() {
		return "/board/board_write";
	}

	// ========================================= 글 작성 기능
	@PostMapping("/write")
	@ResponseBody
	public String board_writeAction(BoardVO board) {
		return String.format("{\"inserted\":%b}", svc.board_insert(board));
	}

	// ========================================= 글 리스트 화면 view
	// http://localhost:8080/board/board_list/i
	@GetMapping("/board_list/{pgNum}")
	public String getListByPage(@PathVariable("pgNum") int pg, Model model) {
		PageInfo<BoardVO> pgInfo = svc.board_getList_page(pg, 10);
		model.addAttribute("pageInfo", pgInfo);

		return "/board/board_list";
	}

	// ========================================= 글 상세 화면 view
	// http://localhost:8080/board/board_read/7
	@GetMapping("/board_read/{board_num}")
	public String board_read(@PathVariable("board_num") int board_num, Model model) {
		BoardVO board = svc.board_read(board_num);
		model.addAttribute("board", board);
		session.setAttribute("b_user_id", board.getB_user_id());

		// 댓글 리스트 불러오는 부분
		List<ReplyVO> replyList = replySvc.reply_read(board_num);
		model.addAttribute("replyList", replyList);
		if(svc.board_hitUpdate(board_num)>0) {
			return "/board/board_read";
		}
		return "board_hitUpdate 실패 ";
	}

	// ========================================= 글 삭제 기능
	@PostMapping("/delete")
	@ResponseBody
	public String board_delete(int board_num) {
		return String.format("{\"deleted\":%b}", svc.board_delete(board_num));
	}

	// ========================================= 글 수정화면 view
	// http://localhost:8080/board/board_update/3
	@GetMapping("/board_update/{board_num}")
	public String board_update(@PathVariable("board_num") int board_num, Model model) {
		BoardVO board = svc.board_read(board_num);
		model.addAttribute("board", board);
		return "/board/board_update";
	}

	// ========================================= 글 수정 기능
	@PostMapping("/update")
	@ResponseBody
	public String board_updateAction(BoardVO board, Model model) {
		boolean updated = svc.board_update(board);
		model.addAttribute("board", board);
		return String.format("{\"updated\":%b}", updated);
	}

	// ========================================= 글 검색 화면 view
	// http://localhost:8080/board/board_searchList?keyword={검색어}
	@GetMapping("/board_searchList")
	public String board_searchList(@RequestParam("keyword") String keyword, Model model) {
		List<BoardVO> list = svc.board_search(keyword);
		model.addAttribute("list", list);

		return "/board/board_searchList";
	}


}