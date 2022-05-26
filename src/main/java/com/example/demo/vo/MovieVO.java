package com.example.demo.vo;

public class MovieVO {
   private int movieId;
   private int code;
   private String title_eng;
   private String title_kor;
   private String genres;
   private String director;
   private String cast;
   private String directors_kor;
   private String cast_kor;
   private String naver_user_rate;
   private int naver_user_participate;
   private String naver_critics_rate;
   private String naver_critics_participate;
   private String nation;
   private String release_date;
   private String running_time;
   private String age;
   private String story;
   private String poster_url;
   private String url;
   
   
   public MovieVO(int movieId, int code, String title_eng, String title_kor, String genres, String director,
         String cast, String directors_kor, String cast_kor, String naver_user_rate, int naver_user_participate,
         String naver_critics_rate, String naver_critics_participate, String nation, String release_date,
         String running_time, String age, String story, String poster_url, String url) {
      super();
      this.movieId = movieId;
      this.code = code;
      this.title_eng = title_eng;
      this.title_kor = title_kor;
      this.genres = genres;
      this.director = director;
      this.cast = cast;
      this.directors_kor = directors_kor;
      this.cast_kor = cast_kor;
      this.naver_user_rate = naver_user_rate;
      this.naver_user_participate = naver_user_participate;
      this.naver_critics_rate = naver_critics_rate;
      this.naver_critics_participate = naver_critics_participate;
      this.nation = nation;
      this.release_date = release_date;
      this.running_time = running_time;
      this.age = age;
      this.story = story;
      this.poster_url = poster_url;
      this.url = url;
   }


   public int getMovieId() {
      return movieId;
   }


   public void setMovieId(int movieId) {
      this.movieId = movieId;
   }


   public int getCode() {
      return code;
   }


   public void setCode(int code) {
      this.code = code;
   }


   public String getTitle_eng() {
      return title_eng;
   }


   public void setTitle_eng(String title_eng) {
      this.title_eng = title_eng;
   }


   public String getTitle_kor() {
      return title_kor;
   }


   public void setTitle_kor(String title_kor) {
      this.title_kor = title_kor;
   }


   public String getGenres() {
      return genres;
   }


   public void setGenres(String genres) {
      this.genres = genres;
   }


   public String getDirector() {
      return director;
   }


   public void setDirector(String director) {
      this.director = director;
   }


   public String getCast() {
      return cast;
   }


   public void setCast(String cast) {
      this.cast = cast;
   }


   public String getDirectors_kor() {
      return directors_kor;
   }


   public void setDirectors_kor(String directors_kor) {
      this.directors_kor = directors_kor;
   }


   public String getCast_kor() {
      return cast_kor;
   }


   public void setCast_kor(String cast_kor) {
      this.cast_kor = cast_kor;
   }


   public String getNaver_user_rate() {
      return naver_user_rate;
   }


   public void setNaver_user_rate(String naver_user_rate) {
      this.naver_user_rate = naver_user_rate;
   }


   public int getNaver_user_participate() {
      return naver_user_participate;
   }


   public void setNaver_user_participate(int naver_user_participate) {
      this.naver_user_participate = naver_user_participate;
   }


   public String getNaver_critics_rate() {
      return naver_critics_rate;
   }


   public void setNaver_critics_rate(String naver_critics_rate) {
      this.naver_critics_rate = naver_critics_rate;
   }


   public String getNaver_critics_participate() {
      return naver_critics_participate;
   }


   public void setNaver_critics_participate(String naver_critics_participate) {
      this.naver_critics_participate = naver_critics_participate;
   }


   public String getNation() {
      return nation;
   }


   public void setNation(String nation) {
      this.nation = nation;
   }


   public String getRelease_date() {
      return release_date;
   }


   public void setRelease_date(String release_date) {
      this.release_date = release_date;
   }


   public String getRunning_time() {
      return running_time;
   }


   public void setRunning_time(String running_time) {
      this.running_time = running_time;
   }


   public String getAge() {
      return age;
   }


   public void setAge(String age) {
      this.age = age;
   }


   public String getStory() {
      return story;
   }


   public void setStory(String story) {
      this.story = story;
   }


   public String getPoster_url() {
      return poster_url;
   }


   public void setPoster_url(String poster_url) {
      this.poster_url = poster_url;
   }


   public String getUrl() {
      return url;
   }


   public void setUrl(String url) {
      this.url = url;
   }
   
   
   
   
   
   
}