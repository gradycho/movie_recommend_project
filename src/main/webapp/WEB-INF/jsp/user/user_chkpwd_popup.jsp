<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 확인</title>
   <!-- Styles -->
     <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
     <link href="../resources/vendor/animate/animate.css" rel="stylesheet" type="text/css"/>
     <link href="../resources/css/style.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<script>
   
   
   function dbchkPwd() {
      var user_pwd = $('#user_pwd').val();
      var input_pwd = $('#input_pwd').val();
   
      if (user_pwd == input_pwd) {
         window.opener.location.href = '/user_chgpwd/${user_id}';
         window.close();
      } else {
         alert('비밀번호를 다시 확인해주세요.');
         window.close();
      }
   }
   
</script>
</head>
<body>

<!-- Products -->
      <div class="container-fluid contact-form">
         <div class="row">
            <div class="col-md-10 offset-md-1">
               <div class="row">
                  <div class="col-xl-5 offset-xl-1 col-md-12 col-sm-12">
                        <div class="row">
                           <div class="col-md-12">
                              <div class="md-form form-group">
                              <b><font size="6" color="black">가입정보수정</font></b>
                                    <br>
                                 <br>
                                 
                                 <div><input type="hidden" id="user_id" name="user_id" value="${user.user_id }" readonly></div>
                           <form id="dbchkPwd" onsubmit="return dbchkPwd();"> 
                              <div><input type="hidden" id="user_pwd" name="user_pwd" value="${user.user_pwd }" readonly></div>   
                              <div>현재 비밀번호<input type="password" id="input_pwd" name="input_pwd" class="form-control"></div>
                              <br>
                              <button type="submit">비밀번호 확인</button>
                           </form>
                                 
                                 
                           </div>
                        </div>
                  </div>
            </div>
         </div>
      </div>
     </div>
    </div>
      <!-- End Products -->
      
   
   
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