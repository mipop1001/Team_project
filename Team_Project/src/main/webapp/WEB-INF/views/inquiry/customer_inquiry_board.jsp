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
<table align="center" width="1000px">
<tr>
<td colspan="4" style="text-align: right;">
<button id="inquiryButton">문의하기</button>
</td>
</tr>
<caption>1:1 문의</caption>
<tr>
<th>상태</th>
<th>제목</th>
<th>작성자</th>
<th>날짜</th>
</tr>

<c:choose>
<c:when test="${list != null }">
<c:forEach items="${list }" var="i">
<tr>
<td>${i.inquiry_status }</td>
<td>${i.inquiry_title }</td>
<td>${i.member_name }</td>
<td>${i.inquiry_date }</td>
</tr>
</c:forEach>
</c:when>

<c:otherwise>
<tr>
<td colspan="4">문의 내역이 없습니다.</td>
</tr>
</c:otherwise>
</c:choose>
</table>
</body>
<script>
// 문의하기 버튼 클릭 시 이동할 페이지 URL
var inquiryURL = "customer_inquiry_form"; // 원하는 페이지 URL로 설정하세요
// 문의하기 버튼 클릭 이벤트 처리
document.getElementById("inquiryButton").addEventListener("click", function() {
console.log("gd");
    window.location.href = inquiryURL;
});
</script>
</html>