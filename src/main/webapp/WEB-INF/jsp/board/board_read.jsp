<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>
<%@ include file="../user/header.jsp" %>
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
<html>
<head> 
<meta charset="UTF-8">
<title>board_read</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<style>

</style>
<script>

function del(num){
	if(!confirm('삭제한 게시글은 되돌릴 수 없습니다. 정말로 삭제하시겠어요?')){
		return;
	}
	$.ajax({
		url:'/board/delete?board_num='+num,
		method:'post',
		cache:false,
		dataType:'json',
		success:function(res){
			location.href='/board/board_list/1';
		},
		error:function(xhr,status,error){
			alert('에러 : ' + err);
		}
	});
}
function delReply(num){
	if(!confirm('댓글을 정말로 삭제하시겠어요?')){
		return;
	}
	$.ajax({
		url:'/reply/delete?reply_num='+num,
		method:'post',
		cache:false,
		dataType:'json',
		success:function(res){
			alert(res.deleted ? '댓글이 삭제되었습니다 ':'삭제 실패 ');
			location.href='/board/board_read/${board.board_num}';
		},
		error:function(xhr,status,error){
			alert('에러 : ' + err);
		}
	});
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
	<div class="container">
		<div class="row">	
		<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>						
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">제목</td>
					<td colspan="2">no.${board.board_num}  &vellip; &vellip; ${board.board_title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">${board.b_user_id}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2">${board.board_date}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="23" style="min-height: 200px; text-align: left;">${board.board_content }</td>
				</tr>
			</tbody>
		</table>
	<!-- 로그인한 아이디와 글 작성자가 같은 경우에만 수정/삭제 버튼 보임  -->
	<c:if test="${user_id eq board.b_user_id }">
		
		<a href="/board/board_update/${board.board_num}" class="btn btn-primary">수정&nbsp;</a>
			<a href="javascript:del(${board.board_num })" class="btn btn-primary">삭제&nbsp;</a>
			<a href="javascript:history.back()" class="btn btn-primary">이전&nbsp;</a>
	</c:if>			
	<!-- 로그인한 아이디와 글 작성자가 다른 경우 : 수정/삭제 버튼 안 보임   -->
	<c:if test="${user_id ne board.b_user_id }">
			<a href="javascript:history.back()" class="btn btn-primary">이전&nbsp;</a>
	</c:if>
	
		</div>
	</div>




	<!-- 댓글 출력 영역  -->
<br>


<div class="container">
<div class="list-group">
  <c:forEach items="${replyList }" var="replyList">
	  <a class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
	    <div class="d-flex gap-2 w-100 justify-content-between">
		      <div>
		        <h6 class="mb-0"><strong>${replyList.r_user_id  }</strong> &vellip;&vellip; ${replyList.reply_content }</h6>
		        <small class="mb-0 opacity-59">${replyList.reply_date } </small>
		      </div>
		      <c:if test="${user_id eq replyList.r_user_id }">	
					<button type="button" class="btn btn-outline-danger btn-sm" id="deleteReply" onclick="javascript:delReply(${replyList.reply_num})" data-reply_number="${replyList.reply_num}">삭제</button>			
			</c:if>	
	    </div>
	  </a>
  </c:forEach>
</div>
</div>


	<!-- 댓글 작성 영역  -->
<hr>

		<form class="form form" method="post" action="/reply/write">
		<div class="container">
			<div class="row">
			<input type="hidden" id="reply_num" name="reply_num" value="0"> 
			<input type="hidden" id="r_board_num" name="r_board_num" value="${board.board_num}">
			<input type="hidden" id="r_user_id" name="r_user_id" value="${user_id}"> 
			<input type="hidden" id="reply_date" name="reply_date" value="now()"> 
			<strong>${user_id}</strong>
			<input type="text"   id="reply_content" name="reply_content" required
				placeholder="댓글을 작성할 때에는 상대방을 배려하는 친절한 언어를 사용해주세요.">
			<button type="submit">작성</button>
	</div></div>
		</form>



</body>
</html>