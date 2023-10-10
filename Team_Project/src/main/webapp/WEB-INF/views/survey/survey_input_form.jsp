<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
</head>
<body>
<script>
    function check() {
        var surveyForm = document.getElementById("survey_form");

        // 체크해야 하는 질문 목록
        var requiredQuestions = [
            "campingNumberPeople", // 캠핑 인원
            "campingType", // 캠핑 형태
            "campingCareer", // 캠핑 경력
            "campingSite" // 캠핑 장소 찾는 방법
        ];

        // 각 질문을 순회하면서 체크
        for (var i = 0; i < requiredQuestions.length; i++) {
            var question = requiredQuestions[i];
            var inputElements = surveyForm.elements[question];

            // 라디오 버튼 또는 셀렉트 박스인 경우 체크
            if (inputElements) {
                if (inputElements.type === "radio" || inputElements.tagName === "SELECT") {
                    var isChecked = false;

                    if (inputElements.type === "radio") {
                        // 라디오 버튼인 경우 체크된 항목 확인
                        for (var j = 0; j < inputElements.length; j++) {
                            if (inputElements[j].checked) {
                                isChecked = true;
                                break;
                            }
                        }
                    } else if (inputElements.tagName === "SELECT") {
                        // 셀렉트 박스인 경우 선택된 항목 확인
                        if (inputElements.value !== "") {
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
        }

        // 텍스트 입력 필드 유효성 검사 추가
        var textInput = document.getElementById("campingLink");
        if (textInput && textInput.value.trim() === "") {
            alert("캠핑 장소 찾는 선택에서 캠핑장소를 찾을 때 쓰는 구체적인 서비스명을 입력해주세요.");
            return;
        }

        // 유효성 검사 통과 시, 폼 제출
        alert("설문 조사 완료");
		surveyForm.submit();
    }
</script>

<h1>이젠 캠핑</h1>
<hr>
	<form action="survey_input_save" method="post" id="survey_form">
		<table align="center" width="700px">
		<caption>설문조사</caption>
			<tr height="80px">
				<th id="campingNumberPeople_label">주로 캠핑 가는 인원은?</th>
				<td>
				<hr>
					<select name="campingNumberPeople" id="campingNumberPeople">
						<option value="">선택 하세요</option>
						<option value="나홀로 캠핑">나홀로 캠핑</option>
						<option value="2명">2명</option>		
						<option value="3명">3명</option>		
						<option value="4명">4명</option>		
						<option value="5명 이상">5명 이상</option>		
					</select> 
				<hr>
				</td>
			</tr>
			<tr height="120px">
				<th id="campingType_label">좋아하는 캠핑 형태는 무엇인가요?</th>
				<td>
				<hr>
					<select name="campingType" id="campingType">
						<option value="">선택 하세요</option>
						<option value="일반 캠핑장">일반 캠핑장</option>
						<option value="글램핑">글램핑</option>
						<option value="카라반(캠핑카)">카라반(캠핑카)</option>
						<option value="차박">차박</option>
						<option value="노지캠핑">노지캠핑</option>
						<option value="백패킹">백패킹</option>
					</select>
				<hr>
				</td>
			</tr>
			<tr height="100px">
				<th id="campingCareer_label">귀하의 캠핑 경력이 어떻게 되시나요?</th>
				<td>
				<hr>
					<select name="campingCareer" id="campingCareer">
						<option value="">선택 하세요</option>
						<option value="1년 미만 신입캠퍼">1년 미만 신입캠퍼</option>
						<option value="2년 이상 5년 미만 캠핑 매니아">2년 이상 5년 미만 캠핑 매니아</option>
						<option value="5년 이상 캠핑 초고수">15년 이상 캠핑 초고수</option>
					</select>
				<hr>
				</td>
			</tr>
			<tr height="100px">
				<th id="campingSite_label">캠핑 장소는 어떻게 찾으시나요?</th>
				<td>
				<hr>
					<select name="campingSite" id="campingSite">
						<option value="">선택 하세요</option>
						<option value="인터넷 검색">인터넷 검색</option>
						<option value="인터넷 커뮤니티">인터넷 커뮤니티</option>
						<option value="카페 및 블로그">카페 및 블로그</option>
						<option value="지인 추천">지인 추천</option>
						<option value="캠핑 전문 서비스">캠핑 전문 서비스</option>
					</select>
				<hr>
				</td>
			</tr>
			<tr height="100px" align="center">
				<th id="campingLink_label">캠핑 장소 찾는 선택에서 캠핑장소를 찾을 때 <br> 쓰는 구체적인 서비스명을 알려주세요!</th>
				<td>예)차박캠핑카페, 캠프링크 등 </td>
			</tr>
			<tr>
				<td> <input type="text" name="campingLink" id="campingLink" placeholder="여기에 답변을 입력해주세요." style="width: 500px;"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <hr> <input type="button" value="설문 작성 완료" onclick="check()"> <input type="button" value="취소" onclick="window.close();">
 </td>
			</tr>
		</table>
	</form>
</body>
</html>