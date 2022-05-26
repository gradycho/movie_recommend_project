package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.svc.RatingSvc;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.RatingVO;

@Controller
@RequestMapping("/rating")
public class RatingController {

	@Autowired
	private HttpSession session;
	@Autowired
	private RatingSvc svc;

	// ========================================= 별점 주기
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reply_insert(RatingVO rating) {
		svc.rating_insert(rating);
		int mv_code = rating.getMv_code();
		String rt_user_id = rating.getRt_user_id();

		return "redirect:/movie/movie_read/" + mv_code + "?mv_code=" + mv_code + "&rt_user_id=" + rt_user_id;
	}

	// ========================================= 별점 수정 기능
	@PostMapping("/update")
	@ResponseBody
	public String rating_updateAction(RatingVO rating, Model model) {		
		boolean updated = svc.rating_update(rating)>0;
		return String.format("{\"updated\":%b}", updated);
	}

}
