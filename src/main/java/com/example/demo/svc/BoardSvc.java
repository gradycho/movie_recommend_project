package com.example.demo.svc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDAO;
import com.example.demo.vo.BoardVO;
import com.github.pagehelper.PageInfo;

@Service
public class BoardSvc {
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardDAO dao;

	
	public BoardSvc(@Qualifier("board_dao") BoardDAO dao) {
		this.dao = dao;
	}
	
	// 글 작성 기능 
	public boolean board_insert(BoardVO board) {
		return dao.board_insert(board)>0;
	}
	
	// 글 리스트 불러오기 기능 
	public List<BoardVO> board_getList() {
		return dao.board_getList();
	}

	public PageInfo<BoardVO> board_getList_page(int pageNum, int pageSize){
		return dao.board_getList_page(pageNum, pageSize);
	}

	public BoardVO board_read(int board_num) {
		return dao.board_read(board_num);
	}

	public boolean board_delete(int board_num) {
		return dao.board_delete(board_num);
	}

	public boolean board_update(BoardVO board) {
		return dao.board_update(board);
	}
	
	public  List<BoardVO>  board_search(String keyword) {
		return dao.board_search(keyword);
	}
	
	public int board_hitUpdate (int board_num) {
		return dao.board_hitUpdate(board_num);
	}
}
