<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
	margin-top: -1px;
	border-top: 1px solid #cccccc;
}

.content {
	padding: 0 0 100px !important;
	min-height: 800px;
	margin: 0;
}

.sub_content {
	padding-top: 0;
	padding: 45px 0 0 0;
	position: relative;
	width: 1200px;
	margin: 0 auto;
}

.content_box {
	width: 1140px;
	margin: 0;
	padding: 0;
	display: block;
}

.page_name {
	overflow: hidden;
	border-bottom: 1px solid #dbdbdb;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none !important;
	color: black;
}

a:hover {
	color: black;
}
.modify_btn{
	margin-top: 50px;
	margin-bottom: 50px;
	height: 52px;
    width: 100px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 16px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}	
.reset_btn{
	height: 52px;
    width: 100px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 16px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    margin-left: 20px;
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}
.page_name {
	color: #777;
	align-content: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="seller_product_update" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<div class="content">
				<div class="sub_content">
					<div class="content_box">
						<div class="page_name">
							<H2>상품정보수정</H2></div>
						<table align="center">
							<input type="hidden" value="${dto.seller_id }" name="seller_id">
							<input type="hidden" value="${dto.product_number }"
								name="product_number">

							<tr>
								<th>상품명</th>
								<td><hr> <input type="text" name="product_name"
									value="${dto.product_name }" style="width: 300px;"></td>
							</tr>

							<tr>
								<th>원산지</th>
								<td><hr> <input type="text" name="product_country"
									value="${dto.product_country }" style="width: 300px;"></td>
							</tr>

							<tr>
								<th>메이커</th>
								<td><hr> <input type="text" name="product_maker"
									value="${dto.product_maker }" style="width: 300px;"></td>
							</tr>

							<tr>
								<th>가격</th>
								<td><hr> <input type="text" name="product_price"
									value="${dto.product_price}" style="width: 300px;"></td>
							</tr>

							<tr>
								<th>상품재고</th>
								<td><hr> <input type="number"
									name="product_sell_amount" value="${dto.product_sell_amount }"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>썸네일이미지</th>
								<td><hr> <input type="file" name="product_sum_image"
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>상세이미지1</th>
								<td><hr> <input type="file"
									name="product_detail_image1" style="width: 300px;"></td>
							</tr>
							<tr>
								<th>상세이미지2</th>
								<td><hr> <input type="file"
									name="product_detail_image2" style="width: 300px;"></td>
							</tr>
							<tr>
								<th>상세이미지3</th>
								<td><hr> <input type="file"
									name="product_detail_image3" style="width: 300px;"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="submit" class="modify_btn" value="수정">
									<input type="button" class="reset_btn" value="취소" onclick="location.href='seller_product_out?seller_id=${dto.seller_id }'"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>