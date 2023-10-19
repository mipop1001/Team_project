<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function check() {
    var communityinputform = document.getElementById("community_input_form");

    // 체크해야 하는 질문 목록
    var requiredQuestions = [
        "community_board_title",
        "community_board_content",
        "community_board_location",
        "community_board_grade",
        "community_board_sum_image",
        "community_board_detail_image1",
        "community_board_detail_image2",
        "community_board_detail_image3"
    ];

    // 각 질문을 순회하면서 체크
    for (var i = 0; i < requiredQuestions.length; i++) {
        var question = requiredQuestions[i];
        var inputElement = communityinputform.elements[question];
        var inputValue = inputElement.value.trim(); // 입력값 공백 제거

        // 라디오 버튼 또는 셀렉트 박스인 경우 체크
        if (inputElement) {
            if (inputElement.type === "radio" || inputElement.tagName === "SELECT") {
                var isChecked = false;

                if (inputElement.type === "radio") {
                    // 라디오 버튼인 경우 체크된 항목 확인
                    var radioElements = document.getElementsByName(question);
                    for (var j = 0; j < radioElements.length; j++) {
                        if (radioElements[j].checked) {
                            isChecked = true;
                            break;
                        }
                    }
                } else if (inputElement.tagName === "SELECT") {
                    // 셀렉트 박스인 경우 선택된 항목 확인
                    if (inputElement.value !== "") {
                        isChecked = true;
                    }
                }

                // 체크되지 않은 경우 알림 및 진행 중지
                if (!isChecked) {
                    // 해당 질문에 대한 라벨(제목) 텍스트 가져오기
                    var label = document.getElementById(question + "_label").textContent;
                    alert(label + " 항목을 선택해주세요.");
                    return;
                }
            }
        }

        if (inputValue === "") {
            alert("필수 입력란이 비어 있습니다");
            // 필수 입력란이 비어 있을 때 작업을 중지하거나 추가 조치를 취할 수 있습니다.
            return;
        }
    }
    // 모든 필수 입력란이 값이 채워져 있을 때 가입 프로세스를 진행
    communityinputform.submit(); // 또는 원하는 작업 수행
}

</script>
<hr>
	<form action="customer_community_input_save" method="post"
		enctype="multipart/form-data" id="community_input_form">
		<table align="center" style="width: 1000px">
		<caption>게시글 작성</caption>
			<tr>
				<th>제목</th>
				<td><hr><input type="text" id="community_board_title" name="community_board_title"></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><hr><textarea cols="10" rows="10"
						id="community_board_content" name="community_board_content" style="width: 800px"></textarea></td>
			</tr>
			<tr>
				<th>지역</th>
				<td><hr><select id="community_board_location" name="community_board_location">
						<option value="">보기를 선택하세요</option>
						<option value="서울특별시">서울특별시</option>
						<option value="인천광역시">인천광역시</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="세종특별시">세종특별시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="대구광역시">대구광역시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="광주광역시">광주광역시</option>
						<option value="제주특별자치도">제주특별자치도</option>
				</select></td>
			</tr>
			<tr>
				<th>별</th>
				<td><hr><input type="radio" id="community_board_grade" name="community_board_grade" value="1">★☆☆☆☆
					<input type="radio" name="community_board_grade" value="2">★★☆☆☆
					<input type="radio" name="community_board_grade" value="3">★★★☆☆
					<input type="radio" name="community_board_grade" value="4">★★★★☆
					<input type="radio" name="community_board_grade" value="5">★★★★★</td>
			</tr>
			<tr>
				<th>메인이미지</th>
				<td><hr><input type="file" id="community_board_sum_image" name="community_board_sum_image"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" id="community_board_detail_image1" name="community_board_detail_image1"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" id="community_board_detail_image2" name="community_board_detail_image2"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" id="community_board_detail_image3" name="community_board_detail_image3"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><hr><input type="button" value="등록" onclick="check()"></td>
			</tr>
		</table>
	</form>
</body>
</html>