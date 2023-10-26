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

.brand-main .event-list {
    padding: 118px; /* 원하는 패딩 값을 적용하세요 */
    margin-bottom: 100px; /* 원하는 마진 값을 적용하세요 */
    background-color: whitesmoke; /* 배경 색상을 설정하세요 */
}

.event-item {
    display: inline-block;
    margin: 20px; /* 각 이미지 사이의 간격을 조정하세요 */
}

.image-size {
    width: 300px; /* 원하는 가로 크기를 설정하세요 */
    height: 200px; /* 원하는 세로 크기를 설정하세요 */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img id="campingImage" src="./image_etc/캠핑사진1.jpg" width="1900px"
		height="600px">

	<hr>
	<h2>판매 상품 목록</h2>
	<div id="slideshow-container">
		<div id="hotItems">
			<c:forEach items="${list}" var="a">
				<div class="slide">
					<a href="user_product_detail?product_number=${a.product_number }">
						<img src="./product_sum_image/${a.product_sum_image}"
							width="auto" height="300px">
						<p>${a.product_name}</p>
					</a>
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
					<a href="customer_community_detail?community_board_number=${a.community_board_number }">
						<img src="./product_sum_image/${a.community_board_sum_image}"
							width="auto" height="300px">
						<p>${a.community_board_title}</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr>
	<h2>이젠 캠핑 이벤트</h2>
<div class="brand-main event-list">
    <div class="list">
        <div class="event-item">
            <img src="./image_etc/a.PNG" alt="이벤트사진" class="image-size">
            <div class="text-box">
                <div class="title">
                </div>
                <a href="#">바로가기</a>
            </div>
        </div>
        <div class="event-item">
            <img src="./image_etc/c.PNG" alt="이벤트사진" class="image-size">
            <div class="text-box">
                <div class="title">
                </div>
                <a href="#">바로가기</a>
            </div>
        </div>
        <div class="event-item">
            <img src="./image_etc/b.PNG" alt="이벤트사진" class="image-size">
            <div class="text-box">
                <div class="title">
                </div>
                <a href="#">바로가기</a>
            </div>
        </div>
        <div class="event-item"> 
            <img src="./image_etc/d.PNG" alt="이벤트사진" class="image-size">
            <div class "text-box">
                <div class="title">
                </div>
                <a href="#">바로가기</a>
            </div>
        </div>
    </div>
</div>
	<hr>

	<script>
		var imageIndex = 1; // 시작 이미지 인덱스
		var imageCount = 5; // 전체 이미지 개수

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
