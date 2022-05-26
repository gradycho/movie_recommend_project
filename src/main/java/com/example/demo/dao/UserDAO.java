package com.example.demo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.UserXMLMapper;
import com.example.demo.vo.UserVO;

@Repository
public class UserDAO {
   
   @Autowired
   private UserXMLMapper userMapper;
   
   @Autowired SqlSession sql;
   
   
   // 회원가입
   public int join(UserVO userVO) {
      return userMapper.join(userVO);
   }
   
   // 로그인
   public UserVO login(UserVO userVO) {
      return userMapper.login(userVO);
   }
   
   // 회원 정보 
   public UserVO userInfo(String user_id) {
      return userMapper.userInfo(user_id);
   }
   
   // 회원 정보 수정
   public boolean userEdit(UserVO userVO) {
      return userMapper.userEdit(userVO);
   }
   
   // 회원 탈퇴
   public boolean userOut(String user_id) {
      return userMapper.userOut(user_id);
   }
   
   
   // 비밀번호 변경 페이지
   public UserVO userChgPwd(String user_id) {
      return userMapper.userChgPwd(user_id);
   }
   
   // 비밀번호 변경 기능
   public boolean userChgPwdProcess(UserVO userVO) {
      return userMapper.userChgPwdProcess(userVO);
   }
   
   // 아이디 중복 체크
   public int idChk(UserVO userVO) {
      int result = userMapper.idChk(userVO);
      return result;
   }
   

   

}