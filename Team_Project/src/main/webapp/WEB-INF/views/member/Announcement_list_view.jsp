<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.expand-button {
    background-color: transparent; /* 백그라운드 컬러 제거 */
    color: #007BFF; /* 텍스트 컬러 설정 */
    border: none;
    font-size: 20px; /* + 버튼 크기 조정 */
    cursor: pointer;
}

.content {
    display: none;
}

.content.active {
    display: block;
}

th {
    text-align: center; /* th 태그 중앙 정렬 */
}

.horizontal-line {
    border: none; /* 기본 선 제거 */
    border-top: 2px solid #000; /* 가로 줄의 두께와 색상을 조절할 수 있습니다. */
    margin: 10px 0; /* 가로 줄 위아래 여백 조절 */
    margin-left: 400px;
    margin-right: 400px;
}

.horizontal-line1 {
    border: none; /* 기본 선 제거 */
    border-top: 1px solid #e0e0e0; /* 가로 줄의 두께와 색상을 조절할 수 있습니다. */
    margin: 10px 0; /* 가로 줄 위아래 여백 조절 */
    margin-left: 400px;
    margin-right: 400px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const expandButtons = document.querySelectorAll(".expand-button");

        expandButtons.forEach((button) => {
            button.addEventListener("click", function () {
                const content = this.nextElementSibling;
                content.classList.toggle("active");
            });
        });
    });
</script>
<hr class="horizontal-line">
<table align="center" width="1000px">
    <tr>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
        <th>내용</th>
    </tr>
	<c:forEach items="${announcement_list }" var="announcement">
	    <tr class="announcement-row">
	        <td>${announcement.title }</td>
	        <td>${announcement.writer }</td>
	        <td>${announcement.announcement_date }</td>
	        <td>
	            <button class="expand-button">+</button>
	            <div class="content">
	                ${announcement.noticedoc}
	            </div>
	        </td>
	    </tr>
	    <tr class="horizontal-line1"></tr> <!-- 각 글 아래에 가로 줄 추가 -->
	</c:forEach>
</table>
</body>
</html>