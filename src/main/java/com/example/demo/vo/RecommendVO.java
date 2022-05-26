package com.example.demo.vo;


public class RecommendVO {
   private int index;
   private int userID;
   private int section;
   private int rec_mv_id;
   private String title_kor;
   private String poster_url;
   
   public RecommendVO(int index, int userID, int section, int rec_mv_id, String title_kor, String poster_url) {
      super();
      this.index = index;
      this.userID = userID;
      this.section = section;
      this.rec_mv_id = rec_mv_id;
      this.title_kor = title_kor;
      this.poster_url = poster_url;
   }

   public int getIndex() {
      return index;
   }

   public void setIndex(int index) {
      this.index = index;
   }

   public int getUserID() {
      return userID;
   }

   public void setUserID(int userID) {
      this.userID = userID;
   }

   public int getSection() {
      return section;
   }

   public void setSection(int section) {
      this.section = section;
   }

   public int getRec_mv_id() {
      return rec_mv_id;
   }

   public void setRec_mv_id(int rec_mv_id) {
      this.rec_mv_id = rec_mv_id;
   }

   public String getTitle_kor() {
      return title_kor;
   }

   public void setTitle_kor(String title_kor) {
      this.title_kor = title_kor;
   }

   public String getPoster_url() {
      return poster_url;
   }

   public void setPoster_url(String poster_url) {
      this.poster_url = poster_url;
   }
   
   
   
   
   
   
}