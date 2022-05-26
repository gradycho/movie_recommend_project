package com.example.demo.svc;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.FileDAO;
import com.example.demo.vo.FileVO;

@Service
public class FileSvc {
	private FileDAO dao;

	@Autowired
	public FileSvc(@Qualifier("file_dao") FileDAO dao) {
		this.dao = dao;
	}

	public boolean ajax_upload(MultipartFile[] mfiles, HttpServletRequest request, String img) {
		int maxnum = dao.getMax();
		ServletContext context = request.getServletContext();
		String savePath = context.getRealPath("/WEB-INF/upload");
		//String imgName = "md" + maxnum + ".png";
		try {
			for (int i = 0; i < mfiles.length; i++) {
				mfiles[i].transferTo(new File(savePath + "/" + mfiles[i].getOriginalFilename()));
			}
			System.out.printf("파일(%d)개 저장 성공 ",mfiles.length);
			return mfiles.length > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public int file_insert(FileVO file) {
		return dao.file_insert(file);
	}

	public int file_delete(int file_num) {
		return dao.file_delete(file_num);
	}

	public int file_update(FileVO file) {
		return dao.file_update(file);
	}

	public FileVO select_file_num(int file_num) {
		return dao.select_file_num(file_num);
	}

	public List<FileVO> file_read(int f_board_num) {
		return dao.file_read(f_board_num);
	}

	public int getMax() {
		return dao.getMax();
	}
}
