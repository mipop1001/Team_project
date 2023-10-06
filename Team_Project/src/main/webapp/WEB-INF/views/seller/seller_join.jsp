<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    $("#btn").click(function () {
        var f = document.seller_join_form;
        var seller_id = f.seller_id.value;
        // 정규 표현식 패턴을 사용하여 아이디 유효성 검사
        var seller_id_Pattern = /^[a-zA-Z0-9]{6,15}$/;
        // 양 끝의 공백을 제거한 아이디
        var trimmed_seller_id = seller_id.trim();

        if (trimmed_seller_id === "") {
            alert("아이디를 입력하세요.");
            f.seller_id.select();
            return false;
        }

        if (!seller_id_Pattern.test(trimmed_seller_id)) {
            alert("아이디는 영문 대소문자와 숫자로만 6-15자 사이로 공백 없이 입력하세요.");
            f.seller_id.select();
            return false;
        }

        // AJAX 요청을 통해 아이디 중복 확인
        $.ajax({
            type: "post",
            async: true,
            url: "seller_id_check",
            data: { "seller_id": trimmed_seller_id },
            success: function (result) {
                if (result == "ok") {
                    // 사용 가능한 아이디인 경우 폼을 제출
                    alert("사용 가능한 아이디입니다.");
                } else {
                    // 사용 중인 아이디인 경우 경고 메시지 표시
                    alert("사용 중인 아이디입니다.");
                }
            },
            error: function (xhr, status, error) {
                alert("에러");
            }
        });
    });
});


function seller_join_check() {	
	
    var f = document.seller_join_form;

	
    var seller_password = f.seller_password.value;
    // 정규 표현식 패턴을 사용하여 비밀번호 유효성 검사
    var seller_password_Pattern = /^[a-zA-Z0-9]{6,15}$/;

    // 양 끝의 공백을 제거한 비밀번호
    var trimmed_seller_password = seller_password.trim();

    if (trimmed_seller_password === "") {
        alert("비밀번호를 입력하세요.");
        f.seller_password.select();
        return false;
    }

    if (!seller_password_Pattern.test(trimmed_seller_password)) {
        alert("비밀번호는 영문 대소문자와 숫자로만 6-15자 사이로 공백 없이 입력하세요.");
        f.seller_password.select();
        return false;
    }
	
    var seller_name = f.seller_name.value;
    // 정규 표현식 패턴을 사용하여 이름 유효성 검사
    var seller_name_Pattern = /^[가-힣]{2,5}$/;

    // 양 끝의 공백을 제거한 이름
    var trimmed_seller_name = seller_name.trim();

    if (trimmed_seller_name === "") {
        alert("이름을 입력하세요.");
        f.seller_name.select();
        return false;
    }

    if (!seller_name_Pattern.test(trimmed_seller_name)) {
        alert("이름은 한글로만 2-5자 사이로 공백 없이 입력하세요.");
        f.seller_name.select();
        return false;
    }
	    
    var seller_phone_number = f.seller_phone_number.value;
    // 정규 표현식 패턴을 사용하여 전화번호 유효성 검사
    var seller_phone_number_Pattern = /^\d{11}$/;

    // "-"를 제거하고 공백도 제거
    var sanitized_phone_number = seller_phone_number.replace(/-/g, '').replace(/\s/g, '');

    if (sanitized_phone_number === "") {
        alert("전화번호를 입력하세요.");
        f.seller_phone_number.select();
        return false;
    }

    if (!seller_phone_number_Pattern.test(sanitized_phone_number)) {
        alert("-를 빼고 입력하세요.");
        f.seller_phone_number.select();
        return false;
    }
	    
    var seller_email = f.seller_email.value;
    // 정규 표현식 패턴을 사용하여 이메일 유효성 검사
    var seller_email_Pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (seller_email === "") {
        alert("이메일을 입력하세요.");
        f.seller_email.select();
        return false;
    }

    if (!seller_email_Pattern.test(seller_email)) {
        alert("올바른 이메일 형식으로 입력하세요.");
        f.seller_email.select();
        return false;
    }
	    
    var seller_company_number = f.seller_company_number.value;
    // 정규 표현식 패턴을 사용하여 10자리 숫자인지 확인
    var seller_company_number_Pattern = /^[0-9]{10}$/;

    if (seller_company_number === "") {
        alert("사업자 번호를 입력하세요.");
        f.seller_company_number.select();
        return false;
    }

    if (!seller_company_number_Pattern.test(seller_company_number)) {
        alert("사업자 번호는 -를 뺀 10자리 숫자로만 입력하세요.");
        f.seller_company_number.select();
        return false;
    }

	    
	    var seller_company_address = f.seller_company_address.value;
	    if (seller_company_address.trim() === "") {
	        alert("사업장주소를 입력하세요.");
	        f.seller_company_address.select();
	        return false;
	    }
	//모든 유효성 검사가 끝나면 컨트롤러로 폼을 제출
	f.submit();
}
</script>
</head>
<body>
<form action="seller_join_save" method="post" name="seller_join_form">
<table align="center">
<tr>
<h2>회원가입</h2>
</tr>
<tr>
<th>아이디</th>
<td><input type="text" id="seller_id" name="seller_id" placeholder="아이디를 입력하세요.">
<input type="button" id="btn" value="아이디 중복 확인">
</td>
</tr>

<tr>
<th>비밀번호</th>
<td><input type="text" id="seller_password" name="seller_password" placeholder="비밀번호를 입력하세요."></td>
</tr>

<tr>
<th>이름</th>
<td><input type="text" id="seller_name" name="seller_name" placeholder="이름을 입력하세요."></td>
</tr>

<tr>
<th>전화번호</th>
<td><input type="text" id="seller_phone_number" name="seller_phone_number" placeholder="-빼고 입력하세요."></td>
</tr>

<tr>
<th>이메일</th>
<td><input type="text" id="seller_email" name="seller_email" placeholder="이메일을 입력하세요."></td>
</tr>

<tr>
<th>사업자번호</th>
<td><input type="text" id="seller_company_number" name="seller_company_number" placeholder="-를뺀 10자리 사업자번호를 입력하세요."></td>
</tr>

<tr>
<th>사업장주소</th>
<td><input type="text" id="seller_company_address" name="seller_company_address" placeholder="사업장주소를 입력하세요."></td>
</tr>

<tr>
<td><input type="button" value="회원가입" onclick="seller_join_check()"></td>
<td><input type="reset" value="취소"></td>
</tr>
</table>
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