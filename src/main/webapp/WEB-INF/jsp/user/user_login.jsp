<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

 <title>Log In</title>
        <meta charset="utf-8">
        <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
      crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../resources/css/login.css">
        <script>
         
        function login() {
           var user_id = $('#user_id').val();
           var serData = $('#login_form').serialize();
           $.ajax({
              url:'/login',
              method:'post',
              cache:false,
              data:serData,
              dataType:'json',
              success:function(res) {
                 alert(res.loginsuccess ? '로그인 성공' : '로그인 실패');
                 if (res.loginsuccess == true) {
                    location.href = '/movie/main/' + user_id;
                 }
              },
              error:function(xhr,status,err) {
                 alert('error:' + err);
              }
           });
           return false;
        }
        
        </script>
    </head>
    <body>
       <form id="login_form" onsubmit="return login();">
           <div class="wrapper">
               <h1>Log In</h1>
               <div class="ID">
                   <input type="text" id="user_id" name="user_id" placeholder="ID" required><br>
               </div>
               <div class="password">
                   <input type="password" id="user_pwd" name="user_pwd" placeholder="Password" required><br><br>
               </div>
               <div id="naver_id_login"><a href="${url }">
                  <img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
               <div class="div_button">
               
                   <button class="button" type="submit">Log In</button>
                   
                   <button class="button" type="button" onclick="location.href='/join' ">회원가입</button>
               </div>
           </div>
      </form>
    </body>
</html> 