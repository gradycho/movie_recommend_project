package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.vo.BoardVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Repository("board_dao")
public class BoardDAO {
	@Autowired
	private BoardMapper mapper;

	// 글 작성 기능
	public int board_insert(BoardVO board) {
		return mapper.board_insert(board);
	}

	// 글 리스트 불러오기 기능
	public List<BoardVO> board_getList() {
		return mapper.board_getList();
	}

	/**
	 * Open Source, MyBatis PageHelper 사용 예
	 * 
	 * @param int pageNum : 추출하고자 하는 목록의 페이지 번호
	 * @param int pageSize : 한 페이지(화면)에 보여줄 목록의 아이템 수
	 * @return PageInfo : 목록의 한 페이지 아이템들과 페이징 관련 정보를 저장한 객체
	 */
	// 페이징 처리 메소드 :: board_list 에서 사용 
	public PageInfo<BoardVO> board_getList_page(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<BoardVO> pageInfo = new PageInfo<>(mapper.board_getList());
		return pageInfo;
	}

	public BoardVO board_read(int board_num) {
		return mapper.board_read(board_num);
	}

	public boolean board_delete(int board_num) {
		return mapper.board_delete(board_num)>0;
	}

	public boolean board_update(BoardVO board) {
		return mapper.board_update(board)>0;
	}
	
	public  List<BoardVO>  board_search(String keyword) {
		return mapper.board_search(keyword);
	}
	
	public int board_hitUpdate (int board_num) {
		return mapper.board_hitUpdate(board_num);
	}
}
