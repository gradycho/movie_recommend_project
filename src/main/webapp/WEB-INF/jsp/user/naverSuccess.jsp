<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
    src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
    charset="utf-8"></script>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body{
    margin: 0;
    padding: 0;
}

#button { width:150px; margin:auto; display:block; }

</style>
<script type="text/javascript">
    $(document).ready(function() {
        var name = ${result}.response.name;
        var email = ${result}.response.email;
        $("#name").html("환영합니다. "+name+"님");
        $("#email").html(email);
      });
    
    function toMain() {
    	location.href="/movie/main";
    }
</script>
 
</head>
<body>
    
    <br>
    <h2 style="text-align: center" id="name"></h2>
    <h4 style="text-align: center" id="email"></h4>
    
    <button type="button" id="button" onclick="toMain();">메인페이지로</button>
 
</body>
</html>