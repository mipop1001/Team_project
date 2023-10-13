<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	float: left;
	width: 100%;
	margin: 0;
	padding: 0;
	display: block;
}

a {
	text-decoration: none !important;
	color: black;
}

a:hover {
	color: black;
}

.page_name {
	overflow: hidden;
	border-bottom: 1px solid #dbdbdb;
	margin: 0;
	padding: 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<form action="seller_product_join_save" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<div class="content">
				<div class="sub_content">
					<div class="content_box">
						<div class="page_name">
							<H2>상품입력</H2>
						</div>
						<table align="center" width="600px">

							<input type="hidden" value="${seller_id }" name="seller_id">

							<tr>
								<th>상품명</th>
								<td><hr> <input type="text" name="product_name"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>원산지</th>
								<td><hr> <input type="text" name="product_country"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>메이커</th>
								<td><hr> <input type="text" name="product_maker"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>가격</th>
								<td><hr> <input type="text" name="product_price"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>상품재고</th>
								<td><hr> <input type="number"
									name="product_sell_amount" style="width: 300px;"></td>
							</tr>

							<tr>
								<th>썸네일이미지</th>
								<td><hr> <input type="file" name="product_sum_image"></td>
							</tr>
							<tr>
								<th>상세이미지1</th>
								<td><hr> <input type="file"
									name="product_detail_image1"></td>
							</tr>
							<tr>
								<th>상세이미지2</th>
								<td><hr> <input type="file"
									name="product_detail_image2"></td>
							</tr>
							<tr>
								<th>상세이미지3</th>
								<td><hr> <input type="file"
									name="product_detail_image3"></td>
							</tr>


							<tr>
								<td colspan="2"><hr> <input type="submit" value="등록">
									<button>
										<a href="seller_page">취소</a>
									</button>
									<hr></td>
							</tr>


						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>