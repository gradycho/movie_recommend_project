package com.example.demo.svc;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.dao.UserDAO;
import com.example.demo.vo.UserVO;

@Service
public class UserSVC {
   
   @Autowired   
   private UserDAO userDao;
   
   @Autowired
   private HttpSession session;
   
   // 회원가입
   public int join(UserVO userVO) {
      return userDao.join(userVO);
   }
   
   // 로그인
//   public UserVO login(UserVO userVO) {
//      return userDao.login(userVO);
//   }
   
   // 세션 로그인
   public boolean login(UserVO userVO) {
      UserVO login = userDao.login(userVO);
      if (login != null) {
         session.setAttribute("user_id", userVO.getUser_id());
         return true;
      } else {
         return false;
      }
   }
   
   // 로그아웃
   public boolean logout(SessionStatus status) {
      status.setComplete();
      return status.isComplete();
   }
   
   // 회원 정보
   public UserVO userInfo(String user_id) {
      return userDao.userInfo(user_id);
   }
   
   // 회원 정보 수정
   public boolean userEdit(UserVO userVO) {
      return userDao.userEdit(userVO);
   }
   
   // 회원 탈퇴
   public boolean userOut(String user_id) {
      return userDao.userOut(user_id);
   }

   
   // 비밀번호 변경 페이지
   public UserVO userChgPwd(String user_id) {
      return userDao.userChgPwd(user_id);
   }
   
   // 비밀번호 변경 기능
   public boolean userChgPwdProcess(UserVO userVO) {
      return userDao.userChgPwdProcess(userVO);
   }
   
   // 아이디 중복 체크
   public int idChk(UserVO userVO) {
      int result = userDao.idChk(userVO);
      return result;
   }

   
}