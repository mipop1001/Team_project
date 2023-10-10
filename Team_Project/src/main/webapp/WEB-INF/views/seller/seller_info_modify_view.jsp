<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateForm() {
    var password = document.getElementsByName("seller_password")[0].value;
    var phoneNumber = document.getElementsByName("seller_phone_number")[0].value;
    var companyNumber = document.getElementsByName("seller_company_number")[0].value;

    // 비밀번호 유효성 검사 (6-15자 영문 대소문자와 숫자)
    var passwordPattern = /^[a-zA-Z0-9]{6,15}$/;
    if (!passwordPattern.test(password)) {
        alert("비밀번호는 6-15자 사이의 영문 대소문자와 숫자로만 입력하세요.");
        return false;
    }

    // 전화번호 유효성 검사 (11자리 숫자)
    var phoneNumberPattern = /^\d{11}$/;
    var sanitizedPhoneNumber = phoneNumber.replace(/-/g, '').replace(/\s/g, '');
    if (!phoneNumberPattern.test(sanitizedPhoneNumber)) {
        alert("전화번호는 11자리 숫자로 입력하세요.");
        return false;
    }

    // 사업자 번호 유효성 검사 (10자리 숫자)
    var companyNumberPattern = /^\d{10}$/;
    if (!companyNumberPattern.test(companyNumber)) {
        alert("사업자 번호는 10자리 숫자로 입력하세요.");
        return false;
    }

    return true; // 모든 유효성 검사를 통과하면 true 반환
}
</script>
</head>
<body>
<form action="seller_info_modify_update" method="post" onsubmit="return validateForm();">
<c:forEach items="${list }" var="i">
<table align="center">
<h2>마이페이지</h2>
<tr>
<th>아이디</th>
<td>${i.seller_id }</td>
</tr>
<input type="hidden" name="seller_number" value="${i.seller_number }">
<tr>
<th>비밀번호</th>
<td><input type="text" name="seller_password" value="${i.seller_password }"></td>
</tr>

<tr>
<th>이름</th>
<td>${i.seller_name }</td>
</tr>

<tr>
<th>전화번호</th>
<td><input type="text" name="seller_phone_number" value="${i.seller_phone_number }"></td>
</tr>

<tr>
<th>이메일</th>
<td>${i.seller_email }</td>
</tr>

<tr>
<th>사업자 번호</th>
<td><input type="text" name="seller_company_number" value="${i.seller_company_number }" maxlength="10"></td>
</tr>

<tr>
<th>사업장 주소</th>
<td><input type="text" id="seller_company_address" name="seller_company_address" value="${i.seller_company_address }"></td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="수정">
<button><a href="seller_page">취소</a></button>
</td>
</tr>
</table>
</c:forEach>
</form>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
		    document.getElementById("seller_company_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("seller_company_address").value = data.address; // 주소 넣기
		            }
		        }).open();
		    });
		}
	</script>
</body>
</html>