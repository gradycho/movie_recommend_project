package com.example.demo.vo;

public class BoardVO {
	private int board_num;
	private int b_user_num;
	private String b_user_id;
	private String board_title;
	private String board_content;
	private String board_date;
	private int board_hit;
	private int reply_count;
	
	public BoardVO() {}


	public BoardVO(int board_num, int b_user_num, String b_user_id, String board_title, String board_content,
			String board_date, int board_hit, int reply_count) {
		super();
		setBoard_num(board_num);
		setB_user_num(b_user_num);
		setB_user_id(b_user_id);
		setBoard_title(board_title);
		setBoard_content(board_content);
		setBoard_date(board_date);
		setBoard_hit(board_hit);
		setReply_count(reply_count);
	}


	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getB_user_num() {
		return b_user_num;
	}

	public void setB_user_num(int b_user_num) {
		this.b_user_num = b_user_num;
	}

	public String getB_user_id() {
		return b_user_id;
	}

	public void setB_user_id(String b_user_id) {
		this.b_user_id = b_user_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	
}
