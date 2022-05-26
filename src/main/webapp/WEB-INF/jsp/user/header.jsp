<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>JOJO</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	
	<style>
	div {
	}
	</style>
	
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
	</script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="/movie/main/${user_id}">JOJO</a>
	<div>
		<ul	class="navbar-nav navbar-dark"> 
				<c:if test="${user_id == null}">
					<a class="nav-link" href="/login">WELCOME! 로그인</a>
				</c:if>	
				<c:if test="${user_id != null}">
					<a class="nav-link">WELCOME, ${user_id}!</a>
				</c:if>
			<li class="nav-item active"> 
				<a class="nav-link" href="/board/board_list/1">Board</a>
			</li>
			
			<li class="nav-item active"> 
				<a class="nav-link" href="/movie/movie_list">Ratings</a>
			</li>
	  
			<li class="nav-item dropdown"> 
				<a class="nav-link dropdown-toggle" data-toggle="dropdown"> User </a> 
				<div class="dropdown-menu"> 
					<a class="dropdown-item" href="/user_info/${user_id}">My page</a> 
					<a class="dropdown-item" href="javascript:logout();">Logout</a> 
				</div> 
			</li> 
		</ul> 
	</div>
</nav>

	<Script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <Script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <Script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
</body>
</html>