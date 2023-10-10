<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
<table align="center">
<h2>상품 자세히 보기</h2>
<tr>
    <th>상품번호</th>
    <td>${dto.product_number}</td>
    </tr>
    <tr>
    <th>상품명</th>
    <td>${dto.product_name}</td>
    </tr>
    <tr>
    <th>원산지</th>
    <td>${dto.product_country}</td>
    </tr>
    <tr>
    <th>메이커</th>
    <td>${dto.product_maker}</td>
    </tr>
    <tr>
    <th>가격</th>
    <td>
	<fmt:formatNumber value="${dto.product_price}" type="number" pattern="#,###"/>
    </td>
    </tr>
    <tr>
    <th>등록 날짜</th>
    <td>
    <fmt:parseDate var="parsedDate" value="${dto.product_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
    <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
    </td>
    </tr>
    <tr>
    <th>판매수량</th>
    <td>${dto.product_buy_amount}</td>
    </tr>
    <tr>
    <th>재고</th>
    <td>${dto.product_sell_amount}</td>
    </tr>
    <tr>
    <th>조회수</th>
    <td>${dto.product_review_count}</td>
    </tr>
    <tr>
    <th>대표이미지</th>
    <td><img src="product_sum_image/${dto.product_sum_image}" width="200px" height="150px"></td>
    </tr>
    <tr>
    <th>상세이미지</th>
    <td><img src="product_intro_image/${dto.product_detail_image1}" width="200px" height="150px">
    <img src="product_intro_image/${dto.product_detail_image2}" width="200px" height="150px">
    <img src="product_intro_image/${dto.product_detail_image3}" width="200px" height="150px"></td>
    </tr>
    
</table>
</body>
</html>
