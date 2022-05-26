<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<% String user_id = (String)session.getAttribute("user_id"); %>
<%
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
      <title>Home</title>
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
      
      function toLogin() {
         alert('로그인을 먼저 해주세요.');
         location.href="/login";
      }
      
      
     </script>
      <meta charset="UTF-8">
      <meta name="description" content="Free HTML template">
      <meta name="keywords" content="HTML, template, free">
      <meta name="author" content="Nicola Tolin">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Styles -->
      <link href="/../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
      <link href="/../resources/vendor/animate/animate.css" rel="stylesheet" type="text/css"/>
      <link href="/../resources/css/style.css" rel="stylesheet" type="text/css"/>
	  <!-- FontAwesome -->
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
	  <script src="https://kit.fontawesome.com/788fe293dc.js" crossorigin="anonymous"></script>



   </head>
   <body>
      <!-- Navbar -->
      <div class="navigation container-fluid">
         <div class="row justify-content-md-center ">
            <div class="col-md-10 col-sm-12">
               <nav class="navbar navbar-default">
                  <a class="navbar-brand" href="/movie/main/${user_id}">JOJO</a>
                  <div class="navbar-welcome">                          
                   <c:if test="${user_id == null}">
                  <a class="nav-link" href="/login">WELCOME! 로그인</a>
               </c:if>   
               <c:if test="${user_id != null}">
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
                           <c:if test="${user_id == null}">
                              <li> <a href="/movie/movie_list">Ratings</a></li>
                        <li> <a href="/board/board_list/1">Board</a></li>
                        <li> <a href="javascript:toLogin();">My page</a></li>
                     </c:if>
                        </ul>
                        <ul>
                           <c:if test="${user_id != null}">
                              <li> <a href="/movie/movie_list">Ratings</a></li>
                        <li> <a href="/board/board_list/1">Board</a></li>
                               <li> <a href="/user_info/${user_id}">My page</a></li>
                               <li> <a href="javascript:logout();">Logout</a></li>
                     </c:if>
                        </ul>
                     </nav>
                  </div>
               </nav>
            </div>
         </div>
      </div>
      <!-- End Navbar -->
      <!-- Portfolio-Text -->
      <div class="container-fluid pb-5 portfolio-text">
         <div class="row">
            <div class="col-md-7 offset-md-1 col-sm-12">
               <h2>영화 추천 사이트에 오신 것을 환영합니다.
               </h2>
            </div>
         </div>
         <div class="row">
            <div class="col-md-7 offset-md-1 col-sm-12">
               <p class="pb-5 pt-5">
                  <i class="fa-solid fa-ice-cream fa-2x"></i> &nbsp;<strong>좋아하는 영화와 비슷한 영화</strong>
               </p>
            </div>
         </div>
      </div>
      <!-- End Portfolio-Text -->
      <!-- Gallery -->
      <div class="scrollblock">
         <div class="container-fluid pt-10">
            <div class="row justify-content-md-center ">
               <div class="col-md-10 col-sm-12">
                  <div class="card-columns">
                  <c:forEach var="main_movie1" items="${main_movie1 }">
                  <!--  이게 반복됨  -->
                     <div class="card card-hover h-100" >
                        <div class="card-body">
                           <a href="/movie/movie_read/${main_movie1.rec_mv_id}?mv_code=${main_movie1.rec_mv_id}&rt_user_id=${user_id}">
                              <img class="card-img-top" src="${main_movie1.poster_url }" alt="Card image cap">
                                 <div class="reveal h-100 p-2 d-flex ">
                                    <div class="w-100 align-self-center">
                                       <p>+</p>
                                 </div>
                              </div>
                           </a>
                        </div>
                     </div>
                   </c:forEach>    
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Gallery -->
      <div class="container-fluid pb-5 portfolio-text">
         <div class="row">
           <div class="col-md-7 offset-md-1 col-sm-12">
               <p class="pb-5 pt-5">
                  <i class="fas fa-user-group fa-2x"></i> &nbsp;<strong>${user_id}님과 성향이 비슷한 사람이 본 영화</strong>
               </p>
            </div>
         </div>
       </div>
      <!-- Gallery -->
      <div class="scrollblock">
         <div class="container-fluid pt-10">
            <div class="row justify-content-md-center ">
               <div class="col-md-10 col-sm-12">
                  <div class="card-columns">
                 <c:forEach var="main_movie2" items="${main_movie2 }">        
                  <!--  이게 반복됨  -->
                     <div class="card card-hover h-100" >
                        <div class="card-body">
                           <a href="/movie/movie_read/${main_movie2.rec_mv_id}?mv_code=${main_movie2.rec_mv_id}&rt_user_id=${user_id}">
                              <img class="card-img-top" src="${main_movie2.poster_url }" alt="Card image cap">
                              <div class="reveal h-100 p-2 d-flex ">
                                 <div class="w-100 align-self-center">
                                    <p>+</p>
                                 </div>
                              </div>
                           </a>
                        </div>
                     </div>
                 </c:forEach>               
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Gallery -->  

      <div class="container-fluid pb-5 portfolio-text">
         <div class="row">
           <div class="col-md-7 offset-md-1 col-sm-12">
               <p class="pb-5 pt-5">
                  <i class="fas fa-heart fa-2x"></i> &nbsp;<strong>좋아하는 장르와 유사한 영화</strong>
               </p>
            </div>
         </div>
       </div>
      <!-- Gallery -->
      <div class="scrollblock">
         <div class="container-fluid pt-10">
            <div class="row justify-content-md-center ">
               <div class="col-md-10 col-sm-12">
                  <div class="card-columns">
                 <c:forEach var="main_movie3" items="${main_movie3 }">    
                  <!--  이게 반복됨  -->
                     <div class="card card-hover h-100" >
                        <div class="card-body">
                           <a href="/movie/movie_read/${main_movie3.rec_mv_id}?mv_code=${main_movie3.rec_mv_id}&rt_user_id=${user_id}">
                              <img class="card-img-top" src="${main_movie3.poster_url }" alt="Card image cap">
                              <div class="reveal h-100 p-2 d-flex ">
                                 <div class="w-100 align-self-center">
                                    <p>+</p>
                                 </div>
                              </div>
                           </a>
                        </div>
                     </div>
                  </c:forEach>                 
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Gallery -->  

     <div class="container-fluid pb-5 portfolio-text">
         <div class="row">
           <div class="col-md-7 offset-md-1 col-sm-12">
               <p class="pb-5 pt-5">
                  <i class="fas fa-clapperboard fa-2x"></i> &nbsp;<strong>선호 감독 & 배우 관련 영화</strong>
               </p>
            </div>
         </div>
       </div>
      <!-- Gallery -->
      <div class="scrollblock">
         <div class="container-fluid pt-10">
            <div class="row justify-content-md-center ">
               <div class="col-md-10 col-sm-12">
                  <div class="card-columns">
                <c:forEach var="main_movie4" items="${main_movie4 }">  
                  <!--  이게 반복됨  -->
                     <div class="card card-hover h-100" >
                        <div class="card-body">
                           <a href="/movie/movie_read/${main_movie4.rec_mv_id}?mv_code=${main_movie4.rec_mv_id}&rt_user_id=${user_id}">
                              <img class="card-img-top" src="${main_movie4.poster_url }" alt="Card image cap">
                              <div class="reveal h-100 p-2 d-flex ">
                                 <div class="w-100 align-self-center">
                                    <p>+</p>
                                 </div>
                              </div>
                           </a>
                        </div>
                     </div>
                 </c:forEach> 
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Gallery --> 
      
      <div class="container-fluid pb-5 portfolio-text">
         <div class="row">
           <div class="col-md-7 offset-md-1 col-sm-12">
               <p class="pb-5 pt-5">
                  <img src="/../resources/img/jojo.PNG" style="width:60px; height:60px;"> &nbsp;<strong>JOJO AI가 추천하는 영화</strong>
               </p>
            </div>
         </div>
       </div>
      <!-- Gallery -->
      <div class="scrollblock">
         <div class="container-fluid pt-10">
            <div class="row justify-content-md-center ">
               <div class="col-md-10 col-sm-12">
                  <div class="card-columns">
                 <c:forEach var="main_movie5" items="${main_movie5 }">     
                  <!--  이게 반복됨  -->
                     <div class="card card-hover h-100" >
                        <div class="card-body">
                           <a href="/movie/movie_read/${main_movie5.rec_mv_id}?mv_code=${main_movie5.rec_mv_id}&rt_user_id=${user_id}">
                              <img class="card-img-top" src="${main_movie5.poster_url }" alt="Card image cap">
	                              <div class="reveal h-100 p-2 d-flex">
	                                 <div class="w-100 align-self-center">
	                                    <p>+</p>
	                                 </div>
	                              </div>
                        	</a>
                        </div>
                     </div>
                 </c:forEach>              
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- End Gallery -->  

      <!-- Footer -->
      <div class="container-fluid footer ">
         <div class="row">
            <div class="col-xl-2 col-md-8 offset-md-1 col-sm-12">
               <p>
                  Team Jojo, Project
               </p>
            </div>
         </div>
      </div>
      <!-- End Footer -->
      <!-- Javascript -->
      <script src="/../resources/vendor/jquery.min.js"></script>
      <script src="/../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
      <script src="/../resources/vendor/wow/wow.js"></script>
      <script src="/../resources/js/script.js"></script>
      <script>
         new WOW().init();
      </script>
      <!-- End Javascript -->
   </body>
</html>