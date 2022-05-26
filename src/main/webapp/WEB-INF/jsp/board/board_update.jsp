<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/header.jsp" %>
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
function updateAction(){
	var title = $('#board_title').val();
	var content = $('#board_content').val();
	if(title=='' || content==''){
		alert('필수항목을 입력주세요');
		return false;
	}
	var serData = $('#update_form').serialize();
	$.ajax({
		url:'/board/update',
		method:'post',
		cache:false,
		data:serData,
		dataType:'json',
		success:function(res){
			alert(res.updated?'글 수정 성공':'실패');
			location.href='/board/board_read/${board.board_num}';
		},
		error:function(xhr,status,err){
			alert('에러:'+err);
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
<body>
<form id="update_form">
	<div class="container">
		<div class="row">
 			
 				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
 	
		  			<input type="hidden"  id="board_num" name="board_num" value="${board.board_num} ">
					<input type="hidden"  id="board_date" name="board_date" value="${board.board_date}">
					<input type="hidden"  id="board_hit" name="board_hit" value="${board.board_hit}">
					<input type="hidden"  id="b_user_num" name="b_user_num" value="${board.board_hit}"> 
				<thead>
					<tr>
						<th colspan="4" style="background-color: #eeeeee; text-align:center;">글 수정</th>
			  		</tr>
			  	</thead>
			  	<tbody>
			  		<tr>
		  				<td style="width:20%">제목</td>
		  				<td colspan="3"><input type="text" class="form-control" id="board_title" name="board_title" value="${board.board_title }"></td>  
					</tr>
					<tr>
	  					<td>글내용</td>
						<td colspan="3"><textarea id="board_content" name="board_content" class="form-control" rows="3">${board.board_content}</textarea></td>
					</tr>		
				</tbody>
				</table>
					<button type="button" onclick="updateAction();">수정  </button>
					<button type="button" onclick="history.back();">취소 </button>
			
		</div>
	</div>
</form>
</body>
</html>