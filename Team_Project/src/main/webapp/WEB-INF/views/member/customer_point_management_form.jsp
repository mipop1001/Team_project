<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.point_btn{
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
</style>
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
		    <td colspan="2" align="center"><hr>
		        <div id="submitButton" style="display: none;">
		            <input type="submit" class="point_btn" value="포인트 충전" onclick="pointupdate()">
		        </div>
		    </td>
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
    
    function pointupdate() {
		$.ajax({
			type: "post",
			url: "customer_point_update",
			async: true,
            success: function (data) {
            },
            error: function (xhr, textStatus, errorThrown) {
                alert("오류 발생");
            }
		});
	}
    
	// 입력 필드에서 텍스트 입력을 감지하는 함수
    function checkCashInput() {
        var cashInput = document.getElementById("cashInput");
        var submitButton = document.getElementById("submitButton");

        if (cashInput.value.trim() !== "") {
            submitButton.style.display = "block"; // 버튼을 보이게 설정
        } else {
            submitButton.style.display = "none"; // 버튼을 숨김
        }
    }

    // 입력 필드에 이벤트 리스너 추가
    document.getElementById("cashInput").addEventListener("input", checkCashInput);
</script>
</body>
</html>