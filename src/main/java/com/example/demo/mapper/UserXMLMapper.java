package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.UserVO;

@Mapper
public interface UserXMLMapper {
   
   int join(UserVO userVO);  // 회원가입
   int addAndGetKey(UserVO userVO);  // user_num 자동 증가 값
   UserVO login(UserVO userVO);  // 로그인
   UserVO userInfo(String user_id);  // 회원 정보 
   boolean userEdit(UserVO userVO);  // 회원 정보 수정
   boolean userOut(String user_id);  // 회원 탈퇴
   UserVO userChgPwd(String user_id);  // 비밀번호 변경 페이지
   boolean userChgPwdProcess(UserVO userVO);  // 비밀번호 변경 기능
   int idChk(UserVO userVO);  // 아이디 중복 체크
}