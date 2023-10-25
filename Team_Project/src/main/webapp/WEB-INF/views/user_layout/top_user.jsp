<%@page import="com.team.project.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: 'Pretendard-Regular';
	transition: background-color .5s;
}

.container {
	font-family:
}

@font-face {
	font-family: 'Pretendard-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
	font-weight: 400;
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

.info-box {
	background-color: #000; /* 네모칸 배경색 설정 */
	color: #fff; /* 글자색 설정 */
	padding: 10px; /* 여백 설정 */
	border-radius: 5px; /* 네모칸의 모서리를 둥글게 만듭니다. */
	text-align: left;
	text-color: White;
}

/* /* /* /* /* /*  */
.wall_main {
	padding-top: 0;
	min-height: 15vh;
}

.head_wall {
	-webkit-box-align: center;
	align-items: center;
	background-color: white;
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
	margin-left: auto;
	margin-right: auto;
	top: -15px;
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

.seller_page {
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

.seller_page_span {
	font-family: "Pretendard Variable", sans-serif;
	font-size: 11px;
	line-height: 22px;
	letter-spacing: 0.025em;
	color: #fff;
	justify-content: center;
	align-items: center;
}

.head_menu {
	color: #000;
	position: relative;
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
						class="head_menu"> &#9776; <span>Menu</span></span>


				</div>
				<h1 class="logo">
					<a href="main">로고 <!-- <img src="/Team_Project/src/main/webapp/product_intro_image/피카츄.png"> --></a>
				</h1>
				<div class="aside_menu">
					<a href="seller_page" class="seller_page"> <span
						class="seller_page_span">SELLER</span></a>
				</div>
				<c:choose>
					<c:when test="${memberDTO != null }">
						<div id="mySidenav" class="sidenav">
							<a href="javascript:void(0)" class="closebtn"
								onclick="closeNav()">&times;</a>
							<div class="info-box">
								<h4>${memberDTO.member_name}님</h4>
								<h4>포인트 : ${memberDTO.member_point}원</h4>
								<h6>
									<a href="customer_point_management">포인트 충전</a><a
										href="customer_logout">로그아웃</a>
								</h6>
							</div>
							<a href="customer_info">사용자 정보조회(수정탈퇴)</a> <a
								href="customer_order_view">주문 조회</a> <a
								href="my_community_content">사용자 게시물관리(수정삭제)</a> <a
								href="userproductnotice">shop(상품출력)</a> <a
								href="user_product_cart_view?member_number=${memberDTO.member_number }">장바구니</a>
							<a href="boardnotice">community(게시글)</a> <a href="customer_qna">QnA(자주묻는질문)</a>
							<a href="Announcement_list_go">공지사항</a> <a
								href="javascript:void(0);" onclick="openSurveyWindow()">설문지</a>
								<a href="customer_inquiry_board">1:1 문의</a>
						</div>
					</c:when>
					<c:otherwise>
						<div id="mySidenav" class="sidenav">
							<a href="javascript:void(0)" class="closebtn"
								onclick="closeNav()">&times;</a> <a href="customer_login">사용자
								로그인</a> <a href="userproductnotice">shop(상품출력)</a> <a
								href="boardnotice">community(게시글)</a> <a href="customer_qna">QnA(자주묻는질문)</a>
							<a href="Announcement_list_go">공지사항</a> <a href="main">메인</a>
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

		function openSurveyWindow() {
			// 창의 가로와 세로 크기, 위치 설정
			var width = 1200;
			var height = 800;
			var left = (screen.width - width) / 2;
			var top = (screen.height - height) / 2;

			// 새 창 열기
			window.open("survey_input", "_blank", "width=" + width + ",height="
					+ height + ",left=" + left + ",top=" + top);
		}

		function updatePoint() {
			$.ajax({
				type : "post",
				url : "customer_point_update",
				async : true,
				success : function(data) {
					if (data === "ok") {
						alert("포인트 업데이트 완료");
						window.location.href = "customer_info";
					} else if (data === "no") {
						alert("포인트 업데이트 실패");
					}
				},
				error : function(xhr, textStatus, errorThrown) {
					alert("오류 발생");
				}
			});
		}
	</script>
</body>
</html>
