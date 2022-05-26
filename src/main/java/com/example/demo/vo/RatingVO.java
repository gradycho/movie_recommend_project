package com.example.demo.vo;

public class RatingVO {
	private int rating_num;
	private double user_rating;
	private int userId;
	private String rt_user_id;
	private int mv_code;
	private int movieId;
	
	public RatingVO(int rating_num, double user_rating, int userId, String rt_user_id, int mv_code, 
			int movieId) {
		super();
		this.rating_num = rating_num;
		this.user_rating = user_rating;
		this.userId = userId;
		this.rt_user_id = rt_user_id;
		this.mv_code = mv_code;
		this.movieId = movieId;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public RatingVO() {}

	public int getRating_num() {
		return rating_num;
	}

	public void setRating_num(int rating_num) {
		this.rating_num = rating_num;
	}

	public double getUser_rating() {
		return user_rating;
	}

	public void setUser_rating(double user_rating) {
		this.user_rating = user_rating;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getRt_user_id() {
		return rt_user_id;
	}

	public void setRt_user_id(String rt_user_id) {
		this.rt_user_id = rt_user_id;
	}

	public int getMv_code() {
		return mv_code;
	}

	public void setMv_code(int mv_code) {
		this.mv_code = mv_code;
	}

	
}
