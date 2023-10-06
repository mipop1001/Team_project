<%@page import="com.team.project.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
  transition: background-color .5s;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
<c:choose>
	<c:when test="${loginstatus == true}">
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <p style="color: white;">${memberDTO.member_name}님 반갑습니다.</p>
		  <a href="customer_logout">로그아웃</a>
		  <a href="customer_info">사용자 정보조회(수정탈퇴)</a>
		  <a href="#">사용자 게시물관리(수정삭제)</a>
		  <a href="#">shop(상품출력)</a>
		  <a href="customer_community_out">community(게시글)</a>
		  <a href="customer_qna">QnA(자주묻는질문)</a>
		  <a href="survey_input">설문지</a>
		</div>
	</c:when>
	<c:otherwise>
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="customer_login">사용자 로그인</a>
		  <a href="#">shop(상품출력)</a>
		  <a href="customer_community_out">community(게시글)</a>
		  <a href="customer_qna">QnA(자주묻는질문)</a>
		  <a href="survey_input">설문지</a>
		</div>
	</c:otherwise>
</c:choose>

<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Menu</span>
</div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.body.style.backgroundColor = "white";
}
</script>
   
</body>
</html> 