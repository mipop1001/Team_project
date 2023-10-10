<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="seller_product_update" method="post" enctype="multipart/form-data">
<table align="center">
<h3>상품 등록</h3>

<input type="hidden" value="${dto.seller_id }" name="seller_id">
<input type="hidden" value="${dto.product_number }" name="product_number">

<tr>
<th>상품명</th>
<td><input type="text" name="product_name" value="${dto.product_name }"></td>
</tr>

<tr>
<th>원산지</th>
<td><input type="text" name="product_country" value="${dto.product_country }"></td>
</tr>

<tr>
<th>메이커</th>
<td><input type="text" name="product_maker" value="${dto.product_maker }"></td>
</tr>

<tr>
<th>가격</th>
<td><input type="text" name="product_price" value="${dto.product_price}"></td>
</tr>

<tr>
<th>상품재고</th>
<td><input type="number" name="product_sell_amount" value="${dto.product_sell_amount }"></td>
</tr>

<tr>
<th>썸네일이미지</th>
<td><input type="file" name="product_sum_image"></td>
</tr>
<tr>
<th>상세이미지1</th>
<td><input type="file" name="product_detail_image1"></td>
</tr>
<tr>
<th>상세이미지2</th>
<td><input type="file" name="product_detail_image2"></td>
</tr>
<tr>
<th>상세이미지3</th>
<td><input type="file" name="product_detail_image3"></td>
</tr>


<tr>
<td colspan="2"><input type="submit" value="수정">
<button><a href="seller_product_out?seller_id=${dto.seller_id }">취소</a></button>
</td>

</tr>


</table>
</form>
</body>
</html>