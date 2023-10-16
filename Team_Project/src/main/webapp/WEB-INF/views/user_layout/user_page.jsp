<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h2 {
	color: #333;
	text-align: center;
	margin-top: 20px;
}

ul {
	list-style: none;
	padding: 0;
	text-align: center;
}

ul li {
	display: inline-block;
	margin: 10px;
}

#slideshow-container {
	position: relative;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}

#hotItems {
	display: flex;
	transition: transform 1s;
}

.slide {
	min-width: 25%;
	padding: 10px;
}

#slideshow-container1 {
	position: relative;
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}

#hotItems1 {
	display: flex;
	transition: transform 1s;
}

.slide1 {
	min-width: 25%;
	padding: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<b>Ezen Camping</b>
	</h1>
	<img id="campingImage" src="./image_etc/캠핑사진1.jpg" width="1400px"
		height="500px">

	<hr>
	<h2>판매 상품 목록</h2>
	<div id="slideshow-container">
		<div id="hotItems">
			<c:forEach items="${list}" var="a">
				<div class="slide">
					<img src="./product_intro_image/${a.product_sum_image}"
						width="300px" height="300px">
					<p>${a.product_name}</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr>
	<hr>
	<h2>캠핑 경험담</h2>
	<div id="slideshow-container1">
		<div id="hotItems1">
			<c:forEach items="${list2}" var="a">
				<div class="slide1">
					<img src="./product_intro_image/${a.community_board_sum_image}"
						width="300px" height="300px">
					<p>${a.community_board_title}</p>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr>

	<script>
		var imageIndex = 1; // 시작 이미지 인덱스
		var imageCount = 3; // 전체 이미지 개수

		function changeImage() {
			var imageElement = document.getElementById("campingImage");
			imageIndex = (imageIndex % imageCount) + 1; // 이미지 순환
			imageElement.src = "./image_etc/캠핑사진" + imageIndex + ".jpg"; // 이미지 경로 업데이트
		}

		setInterval(changeImage, 3000);

		const slides = document.querySelectorAll('.slide');
		const slideshow = document.getElementById('hotItems');
		const container = document.getElementById('slideshow-container');

		let currentIndex = 0;

		function nextSlide() {
			currentIndex = (currentIndex + 4) % slides.length;
			updateSlide();
		}

		function updateSlide() {
			const offset = -currentIndex * (100 / 4) + '%';
			slideshow.style.transform = 'translateX(' + offset + ')';
		}

		setInterval(nextSlide, 4000);

		const slides1 = document.querySelectorAll('.slide1');
		const slideshow1 = document.getElementById('hotItems1');
		const container1 = document.getElementById('slideshow-container1');

		let currentIndex1 = 0;

		function nextSlide1() {
			currentIndex1 = (currentIndex1 + 4) % slides1.length;
			updateSlide1();
		}

		function updateSlide1() {
			const offset1 = -currentIndex1 * (100 / 4) + '%';
			slideshow1.style.transform = 'translateX(' + offset1 + ')';
		}

		setInterval(nextSlide1, 5000);
	</script>
</body>
</html>
