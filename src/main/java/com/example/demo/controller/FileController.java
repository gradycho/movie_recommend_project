package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.svc.FileSvc;

@Controller
@RequestMapping("/file")
public class FileController {
	@Autowired
	private HttpSession session;
	@Autowired
	private FileSvc svc;

	

}
