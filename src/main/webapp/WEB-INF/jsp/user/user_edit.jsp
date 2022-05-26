<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>User Info</title>
      <meta charset="UTF-8">
      <meta name="description" content="Free HTML template">
      <meta name="keywords" content="HTML, template, free">
      <meta name="author" content="Nicola Tolin">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Styles -->
      <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="../resources/vendor/animate/animate.css" rel="stylesheet" type="text/css"/>
      <link href="../resources/css/style.css" rel="stylesheet" type="text/css"/>
      
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<script>
   function user_edit() {
      var serData = $('#user_edit').serialize();
      $.ajax({
         url:'/user_update',
         method:'post',
         cache:false,
         data:serData,
         dataType:'json',
         success:function(res) {
            alert(res.userupdated ? '수정 성공' : '수정 실패');
            location.href='/user_info/${user_id}';
         },
         error:function(xhr,status,err) {
            alert('error:' + err);
         }
      });
      return false;
   }
   

    function logout() {
       if(!confirm('로그아웃 하시겠습니까?')) return;
       $.ajax({
          url:'/logout',
          method:'get',
          dataType:'json',
          cache:false,
          success:function(res) {
             alert(res.logoutok ? '로그아웃 성공' : '로그아웃 실패');
             if (res.logoutok) {
                location.href="/login";
             }
          },
          error:function(xhr,status,err) {
             alert('error:' + err);
          } 
       });
       return false;
    }
    
    function openPopup() {
       var popUrl = "/user_chkpwd_popup/${user.user_id}";
       var popName = "chkPassword"
       var popOption = "top = 200, left = 500, width = 700, height = 500";
       window.open(popUrl, popName, popOption);
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
       <!-- Products -->
      <div class="container-fluid contact-form">
         <div class="row">
            <div class="col-md-10 offset-md-1">
               <div class="row">
                  <div class="col-xl-5 offset-xl-1 col-md-12 col-sm-12">
                     <form id="user_edit" onsubmit="return user_edit();">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="md-form form-group">
                              <b><font size="6" color="black">가입정보수정</font></b>
                                    <br>
                                 <br>
                                 아이디 : ${user.user_id} 
                                 <input type="hidden" id="user_id" name="user_id" value="${user.user_id }">
                                 <br>
                                 비밀번호 : 
                                 <input type="password" id="user_pwd" name="user_pwd" value="${user.user_pwd }"><button type="button" onclick="openPopup();">수정</button>
                                 <br>
                                 이름 : ${user.user_name} 
                                 <input type="hidden" id="user_name" name="user_name" value="${user.user_name }" >
                                 <br>
                                 전화번호 :<input type="text" id="user_phone" name="user_phone" class="form-control" value="${user.user_phone}" required>
                                 <br>
                           이메일 :<input type="text" id="user_email" name="user_email" class="form-control" value="${user.user_email}" required>
                           <br>
                           성별 : ${user.user_sex}
                           <br>
                           생년월일 : ${user.user_birth}
                           <br>
                                 <button type="submit">수정하기</button>
                           </div>
                        </div>
                  </div>
            </form>
            </div>
         </div>
      </div>
     </div>
    </div>
      <!-- End Products -->
      
      
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