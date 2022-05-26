<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.PrintWriter"%>
<%@ include file="../user/header.jsp"%>

<%

	String b_user_id  = (String) session.getAttribute("b_user_id");
	String user_id = null;
	if(session.getAttribute("user_id")!=null){
		user_id = (String) session.getAttribute("user_id");
	}else if(user_id==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요!')");
		script.println("location.href='/login'");
		script.println("</script>");
	}
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<!-- Meta -->
<title>movie_read_ratingUpdate</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<script>
	function logout() {
		if (!confirm('로그아웃 하시겠습니까?'))
			return;
		$.ajax({
			url : '/logout',
			method : 'get',
			dataType : 'json',
			cache : false,
			success : function(res) {
				alert(res.logoutok ? '로그아웃 성공' : '로그아웃 실패');
				if (res.logoutok) {
					location.href = "/login";
				}
			},
			error : function(xhr, status, err) {
				alert('error:' + err);
			}
		});
		return false;
	}
	
	function updateAction(){
		var serData = $('#update_form').serialize();
		$.ajax({
			url:'/rating/update',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				location.href='/movie/movie_read/${rating.mv_code}?mv_code=${rating.mv_code}&rt_user_id=${rating.rt_user_id}';
			},
			error:function(xhr,status,err){
				alert('에러:'+err);
			}
		});
		return false;
	}

</script>
<meta charset="UTF-8">
<meta name="description" content="Free HTML template">
<meta name="keywords" content="HTML, template, free">
<meta name="author" content="Nicola Tolin">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Styles -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="../resources/vendor/animate/animate.css" rel="stylesheet"
	type="text/css" />
<link href="../resources/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>


	<div
		class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
		<div class="my-3 p-3">
			<h1 class="display-5"><B>${movie.title_kor }</B></h1>
			<p class="lead">
				<I>${movie.title_eng }</I>
			</p>
		</div>
		<div class="bg-body shadow-sm mx-auto"
			style="width: 60%; height: 450px; border-radius: 21px 21px 0 0;">
			<img src="${movie.poster_url }"
				onclick="location.href='https://movie.naver.com/movie/bi/mi/basic.naver?code=${movie.code}'">
			<br><br>

			<div class="text-center">
				<form id="update_form">
					<strong> &starf;별점을 매겨보세요!&starf; </strong><br> 
					<input type="hidden" id="rating_num" name="rating_num" value="${rating.rating_num }" > 
				 		 <input style="width: 500px;" type="range" id="user_rating" name="user_rating" min="0.5" max="10" step="0.5" value="${rating.user_rating }" oninput="document.getElementById('value1').innerHTML=this.value;">
				 		  <strong><span id="value1"></span><br></strong>
				 		 <input type="hidden" id="rt_user_id" name="rt_user_id" value="${user_id}"> 
				 		 <input type="hidden" id="mv_code" name="mv_code" value="${rating.mv_code}"> 
				 		 
			    		  <button type="button" onclick="updateAction();" class="btn btn-outline-primary btn-sm"> 확인  </button>
			
				</form>
			</div>
			<p>네티즌 평점 <strong> ${movie.naver_user_rate } 점 </strong><br>
				평가자 수 <fmt:formatNumber value="${movie.naver_user_participate }" pattern="0,000명" />
			</p>
		</div>
		<br>
		
	</div>
	<br>
	<div class="container">
<div class="list-group">
  <a class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
    <div class="d-flex gap-2 w-100 justify-content-between">
      <div>
        <h6 class="mb-0"><strong>${movie.title_kor }</strong> <I>${movie.title_eng }</I>  &vellip;&vellip; <small>${movie.running_time} &wreath; ${movie.age }</small></h6>
      </div>
    </div>
  </a>
  <a class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
    <div class="d-flex gap-2 w-100 justify-content-between">
      <div>
        <h6 class="mb-0"><strong>감독</strong>  &vellip;&vellip; ${movie.directors_kor } </h6>
      </div>
    </div>
  </a>
  <a  class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
    <div class="d-flex gap-2 w-100 justify-content-between">
      <div>
        <h6 class="mb-0"><strong>배우</strong> &vellip;&vellip; ${movie.cast_kor } </h6>
      </div>
    </div>
  </a>
   <a  class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
    <div class="d-flex gap-2 w-100 justify-content-between">
      <div>
        <h6 class="mb-0"><strong>장르</strong> &vellip;&vellip; ${movie.genres } </h6>
      </div>
    </div>
  </a>
</div>
	</div>
      
  <div class="container">
    <h4 class="mt-5">줄거리...</h4>
    <p class="lead"><I>${movie.story }</I></p>
    <p><button type="button" class="btn btn-success"
			onclick="location.href='https://movie.naver.com/movie/bi/mi/basic.naver?code=${movie.code}'">예매하러 가기</button>
	</p>
  </div>
      

			
</body>
</html>