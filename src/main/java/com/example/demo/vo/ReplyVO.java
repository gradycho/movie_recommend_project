package com.example.demo.vo;

public class ReplyVO {
	private int reply_num;
	private int r_board_num;
	private int r_user_num;
	private String r_user_id;
	private String reply_content;
	private String reply_date;
	
	public ReplyVO() {}

	public ReplyVO(int reply_num, int r_board_num, int r_user_num, String r_user_id, String reply_content,
			String reply_date) {
		super();
		setReply_num(reply_num);
		setR_board_num(r_board_num);
		setR_user_num(r_user_num);
		setR_user_id(r_user_id);
		setReply_content(reply_content);
		setReply_date(reply_date);
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public int getR_board_num() {
		return r_board_num;
	}

	public void setR_board_num(int r_board_num) {
		this.r_board_num = r_board_num;
	}

	public int getR_user_num() {
		return r_user_num;
	}

	public void setR_user_num(int r_user_num) {
		this.r_user_num = r_user_num;
	}

	public String getR_user_id() {
		return r_user_id;
	}

	public void setR_user_id(String r_user_id) {
		this.r_user_id = r_user_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	
}
