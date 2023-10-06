<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function checkLogin(){
	var loginstate = "${sessionScope.loginstate}";
	if (loginstate !== "true") {
		alert("로그인 후 이용 가능합니다.");
		location.href="seller_login";
	}
}


</script>
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
<c:when test="${loginstate==true }">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="seller_logout">판매자 로그아웃</a>
  <a href="seller_info?seller_number=${seller_number}">${seller_name }님판매자 마이페이지</a>
  <a href="seller_product_join">판매자 상품등록</a>
  <a href="#">판매자 상품 수정삭제조회</a>
  <a href="seller_product_sales">판매자 판매내역</a>
</div>
</c:when>
<c:otherwise>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="seller_login">판매자 로그인</a>
  <a href="#" onclick="checkLogin()">판매자 마이페이지</a>
  <a href="#" onclick="checkLogin()">판매자 상품등록</a>
  <a href="#">판매자 상품 수정삭제조회</a>
  <a href="seller_product_sales">판매자 판매내역</a>
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