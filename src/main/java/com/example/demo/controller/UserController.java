package com.example.demo.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.demo.naverLogin.NaverLoginBO;
import com.example.demo.svc.MovieSvc;
import com.example.demo.svc.UserSVC;
import com.example.demo.vo.UserVO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@SessionAttributes("user_id")
public class UserController {
   
   @Autowired
   private UserSVC userSvc;
   @Autowired
   private MovieSvc movieSvc;
   

//   // 로그인 화면
//   @GetMapping("/login")
//    public String login() {
//      return "/user/user_login";
//   }
   
    /* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
 
    //로그인 첫 화면 요청 메소드
    @GetMapping("/login")
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
        return "/user/user_login";
    }
 
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/user/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("result", apiResult);
 
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "/user/naverSuccess";
    }
   
   
   // 회원가입 화면
   @GetMapping("/join")
   public String join() {
      return "/user/user_join";
   }
   
   
//   // 회원가입 기능
//   @PostMapping("/join")
//   @ResponseBody
//   public String joinProcess(UserVO userVO) {
//      return String.format("{\"joined\":%b}", userSvc.join(userVO));
//   }
   
   // 회원가입 기능
   @PostMapping("/join")
   @ResponseBody
   public String joinProcess(UserVO userVO) {
      int result = userSvc.idChk(userVO);
      if (result == 1) {  // result == 1 : 아이디 중복 -> 다시 user_join으로 보냄
         return "/user/user_join";
      } else {  // result == 0 : 아이디 중복 없음 -> 회원가입 완료
         return String.format("{\"joined\":%b}", userSvc.join(userVO));
      }
      
   }
   
   // 로그인 기능
   @PostMapping("/login")
   @ResponseBody
   public String loginsuccess(UserVO userVO) {
      return String.format("{\"loginsuccess\":%b}", userSvc.login(userVO));
   }
   
   // 로그아웃
   @GetMapping("/logout")
   @ResponseBody
   public String logout(SessionStatus status) {
      return String.format("{\"logoutok\":%b}", userSvc.logout(status));
   }
   
   // 회원 정보 페이지
   @GetMapping("/user_info/{user_id}")
   public String userInfo(@PathVariable("user_id") String user_id, Model model) {
      if (user_id == null) {
         return "/user/main";
      } else {
         model.addAttribute("user", userSvc.userInfo(user_id));
         return "/user/user_info";
      }
   }
   
   // 회원 정보 수정
   @GetMapping("/user_edit/{user_id}")
   public String userEdit(@PathVariable("user_id") String user_id, Model model) {
      model.addAttribute("user", userSvc.userInfo(user_id));
      return "/user/user_edit";
   }
   
   // 회원 정보 수정 기능
   @PostMapping("/user_update")
   @ResponseBody
   public String userUpdate(UserVO userVO) {
      boolean userupdated = userSvc.userEdit(userVO);
      return String.format("{\"userupdated\":%b}", userupdated);
   }
   
   // 회원 탈퇴
   @GetMapping("/user_out/{user_id}")
   @ResponseBody
   public String userOut(@PathVariable("user_id") String user_id, SessionStatus status) {
      status.setComplete();
      return String.format("{\"userout\":%b}", userSvc.userOut(user_id));
   }
   
   // 비밀번호 확인 팝업창
   @GetMapping("/user_chkpwd_popup/{user_id}")
   public String userChkPwdPopup(@PathVariable("user_id") String user_id, Model model) {
      model.addAttribute("user", userSvc.userInfo(user_id));
      return "/user/user_chkpwd_popup";
   }
   

   // 비밀번호 변경 페이지 
   @GetMapping("/user_chgpwd/{user_id}")
   public String userChgPwd(@PathVariable("user_id") String user_id, Model model) {
      model.addAttribute("user", userSvc.userChgPwd(user_id));
      return "/user/user_chgpwd";
   }
   
   // 비밀번호 변경 기능
   @PostMapping("/user_chgpwd_process")
   @ResponseBody
   public String userChgPwdProcess(UserVO userVO) {
      boolean chgpwdok = userSvc.userChgPwdProcess(userVO);
      return String.format("{\"chgpwdok\":%b}", chgpwdok);
   }
   
   // 아이디 중복 체크
   @PostMapping("/idChk")
   @ResponseBody
   public int idChk(UserVO userVO) {
      System.out.println("idchk");
      int result = userSvc.idChk(userVO);
      return result;
   }

   
   
}