<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<form action="pointCharge" method="get">
	<table align="center" width="300px">
	<caption>포인트 관리 페이지</caption>
		<c:forEach items="${list }" var="a">
			<tr>
				<th>이름 :</th>
				<td><hr>${a.member_name }<hr></td>
			</tr>
			<tr>
				<th>아이디 :</th>
				<td><hr>${a.member_id }<hr></td>
			</tr>
			<tr>
				<th>포인트 :</th>
				<td><hr>${a.member_point }<hr></td>
			</tr>
		</c:forEach>
		<tr>
		    <th>충전 금액</th>
		    <td>
		        <hr>
		        <input type="text" name="cash" id="cashInput"> 원
		    </td>
		</tr>
		<tr>
			<td colspan="2" align="center"> <hr> <input type="submit" value="포인트 충전"> </td>
		</tr>
	</table>
</form>
<script>
    document.getElementById('cashInput').addEventListener('input', function() {
        var inputValue = this.value.replace(/,/g, ''); // 기존 쉼표 제거
        if (!isNaN(inputValue)) {
            // 수치를 3자리마다 쉼표 추가
            var formattedValue = inputValue.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            this.value = formattedValue;
        }
    });
</script>
</body>
</html>