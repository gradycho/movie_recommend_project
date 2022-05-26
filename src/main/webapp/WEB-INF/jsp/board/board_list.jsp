<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../user/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<style>
.writebox {
	margin-left: 950px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script>
	function search() {
		var keyword = $('#keyword').val();
		location.href = "/board/board_searchList/" + keyword;
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
<br><br>
	<div class="container">
	<div class="row">	
		<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">번호 </th>
			      <th scope="col">제목 </th>
			      <th scope="col">작성자 </th>
			      <th scope="col">작성일 </th>
			      <th scope="col">조회수 </th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="board" items="${pageInfo.list }">
				   <tr>
						<td>${board.board_num }</td>
						<td><a href="/board/board_read/${board.board_num }" style="text-decoration: none; color: black;"> ${board.board_title }</a> 
						<c:if test="${board.reply_count ne 0}">	
							<small>[ ${board.reply_count } ]</small> 
						</c:if>				
						</td>
						<td>${board.b_user_id }</td>
						<td>${board.board_date }</td>
						<td>${board.board_hit }</td>
					</tr>
				</c:forEach>
			  </tbody>
		</table>

			<!-- ------------------------- 게시판 영역 끝 --------------------------------- -->

			<!-- ------------------------- 페이징 처리 영역 시작  --------------------------------- -->
			
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach var="i" items="${pageInfo.navigatepageNums}">
		<c:choose>
			<c:when test="${i==pageInfo.pageNum}">
				<a href="/board/board_list/${i}" class="page-link">${i}</a>
			</c:when>
			<c:otherwise>
				<a href="/board/board_list/${i}" class="page-link">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
 
</nav>	
</div>
		<!-- ------------------------- 페이징 처리 영역 끝  --------------------------------- -->
</div>

<div class="container">
	<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
       <a href="/board/write_view" class="btn btn-primary pull-right">글쓰기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <form id="search_form" method="get" action="/board/board_searchList">
			<input type="text" id="keyword" name="keyword" placeholder="Search">
			<button type="submit">&nbsp;&nbsp;search</button>
		</form>
      </div>
</div>


	
</body>
</html>