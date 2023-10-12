<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function addToCart(product_number, member_number) {
    // Ajax 요청을 보내고 서버에서 처리합니다.
    $.ajax({
        type: 'POST',  // 또는 'GET'에 따라 상황에 맞게 설정
        url: 'user_product_cart_check', // 서버의 처리 URL로 변경해야 합니다.
        data: {
            product_number: product_number,
            member_number: member_number
        },
        success: function(response) {
            if (response === 'already') {
                alert('이미 등록된 상품입니다.');
            } else if (response === 'success') {
                alert('상품이 장바구니에 추가되었습니다.');
                var newLocation = 'user_product_cart?product_number=' + product_number + '&member_number=' + member_number;
                window.location.href = newLocation;
            } else {
                alert('알 수 없는 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('서버 요청 중 오류가 발생했습니다.');
        }
    });
}
</script>
<style type="text/css">
body {
	margin-top: -1px;
	border-top: 1px solid #cccccc;
	padding-top: 75px !important;
	align : center;
}

.content_box {
	padding-top: 75px !important;
	width: 100%;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
}

.sub_image_item_info {
	position: relative;
	width: 760px;
	border: 0;
	height: 600px;
	text-align: center;
	vertical-align: middle;
	display: flex;
	border-bottom: 1px solid #dbdbdb;
}

.sub_image {
	max-width: 100%;
	max-height: 100%;
	border: 0 none;
	vertical-align: top;
	width: 1000px;
	aspect-ratio: auto 1000/500;
	height: 500px;
	overflow-clip-margin: content-box;
	overflow: clip;
	color: #333;
	cursor: pointer;
}

.item_info_box {
	width: 440px;
	box-sizing: border-box;
	padding-left: 20px;
	float: right;
	position: relative;
	margin: 0;
	padding: 0;
}

.item_product_name {
	position: relative;
	padding: 0 0 10px 0;
	border-bottom: 1px solid #dbdbdb;
}

.item_product_info {
	border-bottom: 0;
	margin: 10px 0 0 0;
	padding: 0;
}

.item_product_price {
	float: left;
	width: 100%;
	min-height: 24px;
	padding: 7px 0 6px 0;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.item_product_maker {
	float: left;
	width: 100%;
	min-height: 24px;
	padding: 7px 0 6px 0;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.item_product_country {
	float: left;
	width: 100%;
	min-height: 24px;
	padding: 7px 0 6px 0;
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.item_choise_button {
	border-top: 1px solid #000;
	clear: both;
	width: 100%;
	padding: 20px 0 0 0;
	text-align: right;
}

.cart {
	width: 205px;
	margin-right: 3px;
	margin: 0;
	display: inline-block;
	height: 52px;
	padding: 0 10px 0 10px;
	color: #3e3d3c;
	font-size: 16px;
	border: 1px solid #cccccc;
	background: #ffffff;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	font-family: Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움",
		sans-serif;
}

.like {
	width: 205px;
	margin-right: 3px;
	margin: 0;
	display: inline-block;
	height: 52px;
	padding: 0 10px 0 10px;
	color: #3e3d3c;
	font-size: 16px;
	border: 1px solid #cccccc;
	background: #ffffff;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	font-family: Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움",
		sans-serif;
	cursor: pointer;
}

.buy {
	height: 52px;
	margin: 10px 0 0;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	font-family: Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움",
		sans-serif;
	cursor: pointer;
}

.intro_image {
	border-top: 1px solid #000;
	width: 100%;
    max-width: 100%;
    margin: 0 auto;
    border: 0 none;
    vertical-align: top;
    overflow-clip-margin: content-box;
    overflow: clip;
    font-size: 12px;
    line-height: 1.5;
    display: flex;
    justify-content: space-between;
    flex-direction: column
}

.intro_image img {
	display: block;
    max-width: 100%;
    margin: 0 auto;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list }" var="pnum">
		<div class="content_box">
			<div class="sub_image_item_info">
				<div class="sub_image">
					<img src="product_sum_image/${pnum.product_sum_image }">
				</div>
				<div class="item_info_box">
					<div class="item_product_name">${pnum.product_name }</div>
					<div class="item_product_info">
						<dl class="item_product_price">
							<dt>판매가</dt>
							<dd>
								<strong><strong>${pnum.product_price }</strong></strong>원
							</dd>
						</dl>
						<dl class="item_product_maker">
							<dt>메이커</dt>
							<dd>
								<strong><strong>${pnum.product_maker }</strong></strong>
							</dd>
						</dl>
						<dl class="item_product_country">
							<dt>made in</dt>
							<dd>
								<strong><strong>${pnum.product_country }</strong></strong>
							</dd>
						</dl>
					</div>
					<div class="item_choise_button">
<%-- 						<input type="button" class="cart" value="장바구니" onclick="location.href='user_product_cart?product_number=${pnum.product_number}&member_number=${memberDTO.member_number }'">  --%>
						<input type="button" class="cart" value="장바구니" onclick="addToCart(${pnum.product_number}, ${memberDTO.member_number})">
						<input type="button" class="like" value="찜하기"> 
						<input type="button" class="buy" value="바로구매">
					</div>
				</div>
			</div>
		</div>
		<div class="intro_image">
			<img src="product_intro_image/${pnum.product_detail_image1 }">
			<img src="product_intro_image/${pnum.product_detail_image2 }">
			<img src="product_intro_image/${pnum.product_detail_image3 }">
		</div>
	</c:forEach>
</body>
</html>