<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@ include file="../user/header.jsp"%>

<%
String b_user_id = (String) session.getAttribute("b_user_id");
String user_id = null;
if (session.getAttribute("user_id") != null) {
	user_id = (String) session.getAttribute("user_id");
} else if (user_id == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요!')");
	script.println("location.href='/login'");
	script.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_write</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<style>
</style>
<script>
	function writeAction() {
		var serData = $('#write_form').serialize();
		$.ajax({
			url : '/board/write',
			method : 'post',
			cache : false,
			data : serData,
			dataType : 'json',
			success : function(res) {
				location.href = '/board/board_list/1';
			},
			error : function(xhr, status, err) {
				alert('에러:' + err);
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
	
</script>
</head>
<br>
<br>
<body>
<form id="write_form">
	<div class="container">
		<div class="row">		
				<input type="hidden" id="board_num" name="board_num" value="0">
				<input type="hidden" id="board_date" name="board_date" value="now()">
				<input type="hidden" id="board_hit" name="board_hit" value="1">
				<input type="hidden" id="b_user_id" name="b_user_id"
					value="${user_id }">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>
						<tr>
							<th colspan="4"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글제목</td>
							<td colspan="3"><input type="text" class="form-control"
								id="board_title" name="board_title" placeholder="제목을 입력하세요"></td>
						</tr>
						<tr>
							<td>글내용</td>
							<td colspan="3"><textarea id="board_content"
									class="form-control" placeholder="내용을 입력하세요"
									name="board_content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="button" onclick="writeAction();">작성 </button>
						</div>
				</div>
			</form>






</body>
</html>