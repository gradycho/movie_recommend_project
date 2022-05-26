<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <title>회원가입</title>
      <meta charset="UTF-8">
      <meta name="description" content="Free HTML template">
      <meta name="keywords" content="HTML, template, free">
      <meta name="author" content="Nicola Tolin">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Styles -->
      <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="../resources/vendor/animate/animate.css" rel="stylesheet" type="text/css"/>
      <link href="../resources/css/style.css" rel="stylesheet" type="text/css"/>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<script>

   
   $(document).ready(function(){
      
      $("#submit").on("click", function(){
         var idChkVal = $("#idChk").val();
         if(idChkVal == "N"){
            alert("중복확인 버튼을 눌러주세요.");
         }else if(idChkVal == "Y"){
            return join();
         }
      });
   })

   function join() { 
      
      var serData = $('#join_form').serialize();
      $.ajax({
         url:'/join',
         method:'post',
         cache:false,
         data:serData,
         dataType:'json',
         success:function(res) {
            alert(res.joined ? '회원가입 성공' : '회원가입 실패');
            if (res.joined == true) {
               alert('로그인 페이지로 이동합니다!')
               location.href = '/login';
            }
         },
         error:function(xhr,status,err) {
            console.log('error?' + err);
         }
      });
      return false;
   }
   
   
   function fn_idChk() {
      var user_id = $('#user_id').val();
      var data = {'user_id' : user_id};
      
      $.ajax({
         url:'/idChk',
         type:'post',
         dataType:'json',
         data:data,
         success:function(res) {
            if (res == 1) {
               alert('중복된 아이디입니다. 다른 아이디를 사용해주세요.');
            } else if (res == 0) {
               $('#idChk').attr('value', 'Y');
               alert('사용가능한 아이디입니다.');
            }
         }
      });
   }
         
   
</script>
</head>
<body>


  <!-- Navbar -->
       <div class="navigation container-fluid">
         <div class="row justify-content-md-center ">
            <div class="col-md-10 col-sm-12">
               <nav class="navbar navbar-default">
                  <a class="navbar-brand" href="/movie/main/${user_id}">JOJO</a>
                  <div class="navbar-welcome">                          
                   <c:if test="${user_id ne user.user_id}">
                  <a class="nav-link" href="/login">WELCOME! 로그인</a>
               </c:if>   
               <c:if test="${user_id eq user.user_id}">
                  <a class="nav-link">WELCOME, ${user_id}!</a>
               </c:if>
                  </div>
                  <div class="button_container" id="toggle">
                     <span class="black top"></span>
                     <span class="black middle"></span>
                     <span class="black bottom"></span>
                  </div>
                  <div class="overlay" id="overlay">
                     <nav class="overlay-menu">
                        <ul>
                           <li> <a href="/movie/movie_list">Ratings</a></li>
                           <li> <a href="/board/board_list/1">Board</a></li>
                           <li> <a href="/user_info/${user_id}">My page</a></li>
                           <li> <a href="javascript:logout();">Logout</a></li>
                        </ul>
                     </nav>
                  </div>
               </nav>
            </div>
         </div>
      </div>
      <!-- End Navbar -->

<div class="container-fluid contact-form">
         <div class="row">
            <div class="col-md-10 offset-md-1">
               <div class="row">
                  <div class="col-xl-5 offset-xl-1 col-md-12 col-sm-12">
                     <form id="join_form" onsubmit="return join();" name="join_form">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="md-form form-group">
                              <b><font size="6" color="black">회원가입</font></b>
                                    <br>
                                 <br>
                                 아이디 :<input type="text" id="user_id" name="user_id" class="form-control">
                           <button type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                                 <br>
                                 비밀번호 :<input type="password" id="user_pwd" name="user_pwd" class="form-control">
                                 <br>
                                 이름 :<input type="text" id="user_name" name="user_name" class="form-control">
                                 <br>
                                 전화번호 :<input type="text" id="user_phone" name="user_phone" class="form-control">
                                 <br>
                           이메일 :<input type="email" id="user_email" name="user_email" class="form-control" >
                           <br>
                           성별 : 남성<input type="radio" id="user_sex" name="user_sex" value="M">여성<input type="radio" id="user_sex" name="user_sex" value="F">
                           <br>
                           생년월일 :<input type="date" id="user_birth" name="user_birth" required>
                           <br>
                                 <button type="submit" id="submit">회원가입</button>
                                 <button type="reset">초기화</button>
                                 <button type="button" onclick="location.href='/login';">로그인</button>
                     </div>
                  </div>
               </div>
               </form>
            </div>
         </div>
      </div>
  </div>
  </div>
      <!-- Footer -->
      <div class="container-fluid footer ">
         <div class="row">
            <div class="col-xl-2 col-md-8 offset-md-1 col-sm-12">
               <p>
                  Team Jojo, Project
               </p>
            </div>
         </div>
      </div>
      <!-- End Footer -->
      <!-- Javascript -->
      <script src="../resources/vendor/jquery.min.js"></script>
      <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
      <script src="../resources/vendor/wow/wow.js"></script>
      <script src="../resources/js/script.js"></script>
      <script>
         new WOW().init();
      </script>
      <!-- End Javascript -->
   
  
</body>
</html>