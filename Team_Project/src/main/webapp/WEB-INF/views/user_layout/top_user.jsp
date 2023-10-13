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
		<h4 align="right" style="color: red;">${memberDTO.member_name}님</h4>
		<h4 align="right" style="color: red;">포인트 : ${memberDTO.member_point}원</h4>
		<a href="#" onclick="updatePoint()"><h4 align="right" style="color: red;">포인트 업데이트</h4></a>
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="customer_logout">로그아웃</a>
		  <a href="customer_info">사용자 정보조회(수정탈퇴)</a>
		  <a href="customer_point_management">포인트 관리</a>
		  <a href="my_community_content">사용자 게시물관리(수정삭제)</a>
		  <a href="userproductnotice">shop(상품출력)</a>
		  <a href="user_product_cart_view?member_number=${memberDTO.member_number }">장바구니</a>
		  <a href="boardnotice">community(게시글)</a>
		  <a href="customer_qna">QnA(자주묻는질문)</a>
		  <a href="javascript:void(0);" onclick="openSurveyWindow()">설문지</a>
		  <a href="main">메인</a>
		</div>
	</c:when>
	<c:otherwise>
		<div id="mySidenav" class="sidenav">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="customer_login">사용자 로그인</a>
		  <a href="userproductnotice">shop(상품출력)</a>
<!-- 		  <a href="customer_community_out">community(게시글)</a> -->
		  <a href="boardnotice">community(게시글)</a>
		  <a href="customer_qna">QnA(자주묻는질문)</a>
		  <a href="main">메인</a>
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

function openSurveyWindow() {
    // 창의 가로와 세로 크기, 위치 설정
    var width = 1200;
    var height = 800;
    var left = (screen.width - width) / 2;
    var top = (screen.height - height) / 2;

    // 새 창 열기
    window.open("survey_input", "_blank", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
}

function updatePoint() {
	$.ajax({
		type: "post",
		url: "customer_point_update",
		async: true,
        success: function (data) {
            if (data === "ok") {
                alert("포인트 업데이트 완료");
                window.location.href = "customer_info";
            } else if (data === "no") {
                alert("포인트 업데이트 실패");
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            alert("오류 발생");
        }
	});
}
</script>

   
</body>
</html> 