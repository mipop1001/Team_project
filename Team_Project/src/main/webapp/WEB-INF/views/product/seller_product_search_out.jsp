<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<title>내 상품 리스트</title>
</head>
<body>
<table align="center" width="1000px">
<h2>내 상품 리스트</h2>
<c:choose>
    <c:when test="${empty list}">
        <!-- ${list}에 값이 없을 때 -->
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
        <tr>
            <td colspan="13">검색된 결과가 없습니다.</td>
        </tr>
    </c:when>
    <c:otherwise>
        <!-- ${list}에 값이 있을 때 -->
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
        <c:forEach items="${list}" var="i">
            <tr>
                <td><img src="product_sum_image/${i.product_sum_image}" width="50px" height="30px"></td>
                <td>${i.product_number}</td>
                <td>${i.product_name}</td>
                <td>${i.product_country}</td>
                <td>${i.product_maker}</td>
                <td>
                    <fmt:formatNumber value="${i.product_price}" type="number" pattern="#,###"/>
                </td>
                <td>
                    <fmt:parseDate var="parsedDate" value="${i.product_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${i.product_buy_amount}</td>
                <td>${i.product_sell_amount}</td>
                <td>${i.product_review_count}</td>
                <td><a href="#">자세히 보기</a></td>
                <td><a href="#">수정</a></td>
                <td><a href="#">삭제</a></td>
            </tr>
        </c:forEach>
    </c:otherwise>
</c:choose>
</table>
<form action="seller_product_search?seller_id=${seller_id}" method="post" onsubmit="return validateSearchForm();">
<table align="center">
<tr>
<td>
    <select name="product_search_type">
    <option value="">선택 없음</option>
        <option value="product_number">상품번호</option>
        <option value="product_name">상품명</option>
    </select>
</td>
<td><input type="text" name="product_search_value" placeholder="검색어를 입력하세요."></td>
<td><input type="submit" value="검색"></td>
</tr>
</table>
</form>
</body>
</html>
