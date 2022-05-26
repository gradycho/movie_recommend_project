<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <!-- Meta -->
      <title>User Info</title>
      <meta charset="UTF-8">
      <meta name="description" content="Free HTML template">
      <meta name="keywords" content="HTML, template, free">
      <meta name="author" content="Nicola Tolin">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Styles -->
      <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="../resources/vendor/animate/animate.css" rel="stylesheet" type="text/css"/>
      <link href="../resources/css/info.css" rel="stylesheet" type="text/css"/>
      
      
      
<script>
	function user_out() {
		if(!confirm('탈퇴하시겠습니까?')) return;
		$.ajax({
			url:'/user_out/${user.user_id}',
			method:'get',
			dataType:'json',
			success:function(res) {
				alert(res.userout ? '탈퇴 성공' : '탈퇴 실패');
				location.href='/login';
			},
			error:function(xhr,status,err) {
				alert('error:' + err);
			}
		});
		return false;
	}
</script>

<script>
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
		
	function search() {
		var keyword = $('#keyword').val();
		alert(keyword);
		location.href = "/board/board_searchList/" + keyword;
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
      <div class="container-fluid products-2">
         <div class="row justify-content-md-center ">
            <div class="col-md-10 col-sm-12">
               <div class="row">
                  <div class="col-xl-8 col-md-10 col-sm-12">
                     <b><font size="6" color="black">가입정보</font></b>
                     <br>
                     <p><br>
                     	아이디 : ${user.user_id}
						<input type="hidden" id="user_pwd" name="user_pwd" value="${user.user_pwd }">
                        <br>
                        이름 : ${user.user_name}
                        <br>
                        전화번호 : ${user.user_phone}
                        <br>
						이메일 : ${user.user_email}
						<br>
						성별 : ${user.user_sex}
						<br>
						생년월일 : ${user.user_birth}
						<br>
                     </p>
                     <button type="submit" style="float: left;" onclick="location.href='/user_edit/${user.user_id}'">정보수정</button>
                     <button type="submit" onclick="location.href='javascript:user_out()'">회원탈퇴</button><br><br>
                     </div>
              
                     <div class="graph" style="text-align:center">
                        <hr>
                     	<b><font size="6" color="black">개인성향지표</font></b>
                    	 <br>
                    	 <br>
                     		<div class="left_text">배우별 성향</div>
                     		<div class="middle_text">장르별 성향</div>
                     		<div class="right_text">감독별 성향</div>
                     </div>
                 	<div class="grid-image"><br>
	  					<img alt="" src="../resources/img/actor${user.user_num}.png" style="display" />
						<img alt="" src="../resources/img/drama${user.user_num}.png" />	 
						<img alt="" src="../resources/img/director${user.user_num}.png" />
					</div>
					<div class="graph2">
						<hr>
						<div class="histogram1" style="text-align:center">	
							<b><font size="6" color="black">히스토그램</font></b>
							<p></p>
						</div>
					
						<div class="wordcloud1" style="text-align:center">
							<b><font size="6" color="black">워드클라우드</font></b>
							<p></p>
						</div>

						<div class="hisimg">
							<img alt="" src="../resources/img/histogram${user.user_num}.png" />	
						</div>
						<div class="wordimg">
							<img alt="" src="../resources/img/wordcloud${user.user_num}.png" />
						</div>
					</div>				  
				  </div>
               </div>
            </div>
         </div>

	<!-- End Products -->

		  <!--  Footer —>--> 
      <div class="container-fluid footer ">
         <div class="row">

            <div class="col-xl-2 col-md-8 offset-md-1 col-sm-12">
               <p>
                  Team Jojo, Project
               </p>
            </div>
         </div>
      </div>
      <!--  End Footer —>--> 
      <!-- Javascript —> --> 
      <script src="../resources/vendor/jquery.min.js"></script>
      <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
      <script src="../resources/vendor/wow/wow.js"></script>
      <script src="../resources/js/script.js"></script>
      <script>
         new WOW().init();
      </script>
      <!-- End Javascript —> --> 
</body>
</html>