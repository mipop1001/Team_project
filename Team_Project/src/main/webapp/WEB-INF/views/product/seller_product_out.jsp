<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function validateSearchForm() {
		var searchType = document.getElementsByName("product_search_type")[0].value;
		var searchValue = document.getElementsByName("product_search_value")[0].value;

		if (searchType === "" && searchValue.trim() === "") {
			alert("검색어와 검색어 설정을 선택하세요.");
			return false; // 폼 제출을 중단합니다.
		}

		if (searchType === "") {
			alert("검색어 설정을 선택하세요.");
			return false; // 폼 제출을 중단합니다.
		}

		if (searchValue.trim() === "") {
			alert("검색어를 입력하세요.");
			return false; // 폼 제출을 중단합니다.
		}

		return true; // 검색어와 검색어 설정이 모두 입력되었으므로 폼을 제출합니다.
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.seller_input_wrap {
	margin: 0;
	padding: 0;
	display: block;
}

.seller_input_list_up {
	overflow: hidden;
	border-bottom: 1px solid #dbdbdb;
	margin: 0;
	padding: 0;
}

.seller_input_list_main {
	margin: 50px 0 10px 0;
	padding: 0;
	display: block;
}

.seller_input_list_title {
	padding: 0 0 10px 0;
	font-size: 16px;
	margin: 0;
	display: block;
}

.seller_input_list_about {
	margin: 0;
	padding: 0;
	display: block;
}

table {
	display: table;
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	text-align: center;
	box-sizing: border-box;
	text-indent: initial;
	border-color: gray;
	font-family: "Inter", "AppleSDGothicNeo", sans-serif;
	
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
	font-size: 20px;
}

th {
	vertical-align: middle;
	height: 31px;
	padding: 15px 10px 14px 10px;
	color: #777777;
	border-bottom: 1px solid #dbdbdb;
	background: #ffffff;
	font-size: 20px;
	line-height: 1.5;
	font-family: "Inter", "AppleSDGothicNeo", sans-serif;
}
.top_text_search{
	position: relative;
    border-bottom: 2px solid #222;
    padding-top: 30px;
}
.product_search_value{
	background: none;
    border: none;
    line-height: normal;
    width: 90%;
    height: auto;
    font-size: 28px;
    color: #222;
    padding: 0 0 22px 0;
    font-family: "Inter", "AppleSDGothicNeo", sans-serif;
}
.top_srarch_text{
    background: none;
    border: none;
    line-height: normal;
    width: 65%;
    height: auto;
    font-size: 20px;
    color: #222;
    padding: 0 0 22px 0;
    font-family: "Inter", "AppleSDGothicNeo", sans-serif;
}

select{
    background: none;
    border: none;
    line-height: normal;
    width: 25%;
    height: auto;
    font-size: 20px;
    color: #222;
    padding: 0 0 22px 0;
    font-family: "Inter", "AppleSDGothicNeo", sans-serif;
}

</style>
</head>
<body>

	<div class="container">
		<div class="content">
			<div class="sub_content">
				<div class="content_box">
					
					<div class="seller_input_wrap"></div>
					<div class="seller_input_list_up">
						<H2>상품전체조회</H2>
					</div>
					<!-- 검색 -->
					<div class="top_text_search">
						<form action="seller_product_search?seller_id=${seller_id }"method="post" onsubmit="return validateSearchForm();">
							<select name="product_search_type" >
								<option value="">선택 없음</option>
								<option value="product_number">상품번호</option>
								<option value="product_name">상품명</option>
							</select> 
							<input type="text" name="product_search_value" class="top_srarch_text" title="" placeholder="검색어를 입력해주세요."
								autocomplete="off">
							<td><input type="submit" value="검색"></td>
						</form>
					</div>
					<!-- 검색 완료 -->
					<div class="seller_input_list_main">
						<table>
						<colgroup>
							<col style="width: 3%">
							<!-- 체크박스 -->
							<col>
							<!-- 상품명/옵션 -->
							<col style="width: 5%">
							<!-- 수량 -->
							<col style="width: 10%">
							<!-- 상품금액 -->
							<col style="width: 13%">
							<!-- 할인/적립 -->
							<col style="width: 10%">
							<!-- 합계금액 -->
							<col style="width: 10%">
							<!-- 배송비 -->
						</colgroup>
							<div class="seller_input_list_title">
								<tr>
									<th>대표이미지</th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>원산지</th>
									<th>메이커</th>
									<th>가격</th>
									<th>등록 날짜</th>
									<th>판매수량</th>
									<th>재고</th>
									<th>조회수</th>
									<th>자세히보기</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</div>
							<div class="seller_input_list_about">
								<c:forEach items="${list }" var="i">
									<tr>
										<td><img src="product_sum_image/${i.product_sum_image }"
											width="100px" height="70px"></td>
										<td>${i.product_number }</td>
										<td>${i.product_name }</td>
										<td>${i.product_country }</td>
										<td>${i.product_maker }</td>
										<td><fmt:formatNumber value="${i.product_price}"
												type="number" pattern="#,###" /></td>
										<td><fmt:parseDate var="parsedDate"
												value="${i.product_date}" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" /></td>
										<td>${i.product_buy_amount }</td>
										<td>${i.product_sell_amount }</td>
										<td>${i.product_review_count }</td>
										<td><a
											href="seller_product_out_detail?seller_id=${i.seller_id }&product_number=${i.product_number}">자세히보기</a></td>
										<td><a
											href="seller_product_modify?seller_id=${i.seller_id }&product_number=${i.product_number}">수정</a></td>
										<td><a
											href="seller_product_delete?seller_id=${i.seller_id }&product_number=${i.product_number}">삭제</a></td>
								</c:forEach>
							</div>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%-- 	<table align="center" width="1000px">
		<h2>내 상품 리스트</h2>
		<tr>
			<th>대표이미지</th>
			<th>상품번호</th>
			<th>상품명</th>
			<th>원산지</th>
			<th>메이커</th>
			<th>가격</th>
			<th>등록 날짜</th>
			<th>판매수량</th>
			<th>재고</th>
			<th>조회수</th>
			<th>자세히보기</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${list }" var="i">
			<tr>
				<td><img src="product_sum_image/${i.product_sum_image }"
					width="100px" height="70px"></td>
				<td>${i.product_number }</td>
				<td>${i.product_name }</td>
				<td>${i.product_country }</td>
				<td>${i.product_maker }</td>
				<td><fmt:formatNumber value="${i.product_price}" type="number"
						pattern="#,###" /></td>
				<td><fmt:parseDate var="parsedDate" value="${i.product_date}"
						pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
						value="${parsedDate}" pattern="yyyy-MM-dd" /></td>
				<td>${i.product_buy_amount }</td>
				<td>${i.product_sell_amount }</td>
				<td>${i.product_review_count }</td>
				<td><a
					href="seller_product_out_detail?seller_id=${i.seller_id }&product_number=${i.product_number}">자세히
						보기</a></td>
				<td><a
					href="seller_product_modify?seller_id=${i.seller_id }&product_number=${i.product_number}">수정</a></td>
				<td><a
					href="seller_product_delete?seller_id=${i.seller_id }&product_number=${i.product_number}">삭제</a></td>
		</c:forEach>
	</table> --%>
	<%-- <form action="seller_product_search?seller_id=${seller_id }"
		method="post" onsubmit="return validateSearchForm();">
		<table align="center">
			<tr>
				<td><select name="product_search_type">
						<option value="">선택 없음</option>
						<option value="product_number">상품번호</option>
						<option value="product_name">상품명</option>
				</select></td>
				<td><input type="text" name="product_search_value"
					placeholder="검색어를 입력하세요."></td>
				<td><input type="submit" value="검색"></td>
			</tr>
		</table>
	</form> --%>
</body>

</html>