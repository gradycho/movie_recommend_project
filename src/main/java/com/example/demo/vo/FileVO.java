package com.example.demo.vo;

public class FileVO {
	private int file_num;
	private int f_board_num;
	private String file_path;
	
	public FileVO() {}
	
	public FileVO(int file_num, int f_board_num, String file_path, String file_name) {
		super();
		setFile_num(file_num);
		setF_board_num(f_board_num);
		setFile_path (file_path);
		setFile_name(file_name);
	}
	
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public int getF_board_num() {
		return f_board_num;
	}
	public void setF_board_num(int f_board_num) {
		this.f_board_num = f_board_num;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	private String file_name;
}
