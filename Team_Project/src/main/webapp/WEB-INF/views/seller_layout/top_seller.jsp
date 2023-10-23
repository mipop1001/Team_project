<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function checkLogin() {
		var loginstate = "${sessionScope.loginstate}";
		if (loginstate !== "true") {
			alert("로그인 후 이용 가능합니다.");
			location.href = "seller_login";
		}
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: 'Pretendard-Regular';
	transition: background-color .5s;
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
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
	font-size: 16px;
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
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

/* /* /* /* /* /*  */
.wall_main {
	padding-top: 0;
	min-height: 15vh;
}

.head_wall {
	-webkit-box-align: center;
	align-items: center;
	background-color: transparent;
	border-bottom: none;
	/*     color: #fff; */
	z-index: 22;
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
}

.head {
	height: 80px;
	position: unset;
	box-shadow: none;
	padding: 0 10px;
}

.logo {
    position: relative;
	top: -15px;
	margin-left: auto;
	margin-right: auto;
	padding: 0;
	flex-direction: column;
	margin-top: 10px;
	display: flex;
	margin: 0 auto;
	align-items: center;
	justify-content: center;
	width: 60%;
}

.aside_menu {
	width: 70px;
	height: 80px;
	right: 0;
	position: absolute;
	top: 0;
	justify-content: center;
	align-items: center;
	background-color: rgba(0, 0, 0, 0.79);
	display: flex;
	-webkit-box-align: center;
	font-size: 14px;
}

.user_page {
	background: url(../images/new_white_cart.svg) no-repeat 45% 32%/30px;
	/* url(../images/new_white_cart.svg) image 첨부 필욧  */
	padding-top: 40px;
	padding-right: 0;
	margin-left: 0;
	height: 100%;
	width: 100%;
	justify-content: center;
	align-items: center;
	transition: opacity 0.3s linear;
	display: flex;
}

.user_page_span {
	font-family: "Pretendard Variable", sans-serif;
	font-size: 11px;
	line-height: 22px;
	letter-spacing: 0.025em;
	color: #fff;
}

.head_menu {
	color: #000;
	position:relative;
    top: 25px;
    left: 25px;
}
</style>
</head>
<body>
	<div class="wall_main">
		<div class="head_wall">
			<div class="head">
				<div id="menu">
					<span style="font-size: 30px; cursor: pointer" onclick="openNav()"
						class="head_menu">  &#9776; <span>Menu</span></span>
				</div>
				<h1 class="logo">
					<a href="main">로고 <!-- <img src="/Team_Project/src/main/webapp/product_intro_image/피카츄.png"> --></a>
				</h1>
				<div class="aside_menu">
					<a href="user_page" class="user_page"> <span
						class="user_page_span">STORE</span></a>
				</div>
				<c:choose>
					<c:when test="${loginstate==true }">
						<div id="mySidenav" class="sidenav">
							<a href="javascript:void(0)" class="closebtn"
								onclick="closeNav()">&times;</a> <a href="seller_logout">로그아웃</a>
							<a href="seller_info?seller_number=${seller_number}">${seller_name }님
								마이페이지</a> <a href="seller_product_join?seller_id=${seller_id }">상품등록</a>
							<a href="seller_product_out?seller_id=${seller_id }">상품
								조회/수정/삭제</a> <a href="seller_product_sales?seller_id=${seller_id }">판매내역</a> <a href="main">메인</a>
						</div>
					</c:when>
					<c:otherwise>
						<div id="mySidenav" class="sidenav">
							<a href="javascript:void(0)" class="closebtn"
								onclick="closeNav()">&times;</a> <a href="seller_login">로그인</a>
							<a href="#" onclick="checkLogin()">마이페이지</a> <a href="#"
								onclick="checkLogin()">상품등록</a> <a href="#"
								onclick="checkLogin()">상품 조회/수정/삭제</a> <a href="#"
								onclick="checkLogin()">판매내역</a> <a href="main">메인</a>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
			document.getElementById("main").style.marginLeft = "250px";
			document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "white";
		}
	</script>

</body>
</html>
