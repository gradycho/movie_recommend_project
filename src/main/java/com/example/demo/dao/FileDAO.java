package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.mapper.FileMapper;
import com.example.demo.vo.FileVO;

@Repository("file_dao")
public class FileDAO {

	private FileMapper mapper;
	

	public int file_insert(FileVO file) {
		return mapper.file_insert(file);
	}

	public int file_delete(int file_num) {
		return mapper.file_delete(file_num);
	}

	public int file_update(FileVO file) {
		return mapper.file_update(file);
	}

	public FileVO select_file_num(int file_num) {
		return mapper.select_file_num(file_num);
	}

	public List<FileVO> file_read(int f_board_num) {
		return mapper.file_read(f_board_num);
	}

	public int getMax() {
		return mapper.getMax();
	}

}
