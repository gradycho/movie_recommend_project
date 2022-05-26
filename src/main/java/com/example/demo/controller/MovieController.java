package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.svc.MovieSvc;
import com.example.demo.svc.RatingSvc;
import com.example.demo.vo.MovieVO;
import com.example.demo.vo.RatingVO;
import com.example.demo.vo.RecommendVO;

@Controller
@RequestMapping("/movie")
@SessionAttributes("user_id")
public class MovieController {

	@Autowired
	private MovieSvc svc;
	@Autowired
	private RatingSvc rtsvc;

	// ========================================= 영화 메인 화면
	@GetMapping("/movie_list")
	public String getListByPage(Model model) {
		model.addAttribute("movie", svc.movie_list());
		return "/movie/movie_list";
	}

	// ========================================= 영화 상세 화면
	@GetMapping("/movie_read/{code}")
	public String movie_read(@PathVariable("code") int code, @RequestParam("mv_code") int mv_code,
			@RequestParam("rt_user_id") String rt_user_id, Model model) {
		
		MovieVO movie = svc.movie_read(code);
		model.addAttribute("movie", movie);

		RatingVO rating = rtsvc.select_mvRating(mv_code, rt_user_id);
		model.addAttribute("rating", rating);

		return "/movie/movie_read";
	}

	// ========================================= 별점 수정 화면
	@GetMapping("/rating_update/{code}")
	public String rating_update(@PathVariable("code") int code, @RequestParam("rating_num") int rating_num,
			Model model) {
		MovieVO movie = svc.movie_read(code);
		model.addAttribute("movie", movie);

		RatingVO rating = rtsvc.rating_read(rating_num);
		model.addAttribute("rating", rating);
		return "/movie/movie_read_ratingUpdate";
	}

	// ========================================= 영화 검색 화면
	// http://localhost:8080/movie/movie_searchList?keyword={검색어}
	@GetMapping("/movie_searchList")
	public String movie_searchList(@RequestParam("keyword") String keyword, Model model) {
		List<MovieVO> list = svc.movie_search(keyword);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		return "/movie/movie_searchList";
	}

	// ========================================= 메인 페이지 영화 추천
	/**
	 * 
	 * @param user_num 유저번호
	 * @param section2 영화분류
	 * @param model
	 * @return main 페이지 반환
	 */
	@GetMapping("/main/{user_id}")
	public String main_recommend(@PathVariable("user_id") String user_id, Model model) {
		int section1 = 1;
		int section2 = 2;
		int section3 = 3;
		int section4 = 4;
		int section5 = 5;
		
		List<RecommendVO> main_movie1 = svc.main_recommend(user_id, section1);
		model.addAttribute("main_movie1", main_movie1);

		List<RecommendVO> main_movie2 = svc.main_recommend(user_id, section2);
		model.addAttribute("main_movie2", main_movie2);

		List<RecommendVO> main_movie3 = svc.main_recommend(user_id, section3);
		model.addAttribute("main_movie3", main_movie3);

		List<RecommendVO> main_movie4 = svc.main_recommend(user_id, section4);
		model.addAttribute("main_movie4", main_movie4);

		List<RecommendVO> main_movie5 = svc.main_recommend(user_id, section5);
		model.addAttribute("main_movie5", main_movie5);

		return "/user/main";
	}

}
