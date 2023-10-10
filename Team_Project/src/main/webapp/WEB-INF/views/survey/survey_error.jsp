<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>

	<script>
	    // 에러 메시지를 표시하고 경고 창을 띄우는 함수
	    function showError(errorMessage) {
	        alert(errorMessage);
	        window.close(); // 경고 창을 닫음
	    }
	
	    // 웹 페이지 로드 시 에러 메시지 호출
	    window.onload = function() {
	        var errorMessage = "설문조사가 이미 완료된 회원입니다.";
	        showError(errorMessage);
	    };
	</script>

</body>
</html>

