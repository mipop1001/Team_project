<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function check() {
    var community_inquiry_form = document.getElementById("community_inquiry_form");
	var requiredQuestions = [
		"inquiry_title",
		"inquiry_content",
		"inquiry_image1",
		"inquiry_image2",
		"inquiry_image3",
		"inquiry_image4"
	];
    // 각 질문을 순회하면서 체크
    for (var i = 0; i < requiredQuestions.length; i++) {
    	 var question = requiredQuestions[i];
         var inputElement = community_inquiry_form.elements[question];
        var inputValue = inputElement.value.trim(); // 입력값 공백 제거
        
        if (inputValue === "") {
            alert("필수 입력란이 비어 있습니다");
            // 필수 입력란이 비어 있을 때 작업을 중지하거나 추가 조치를 취할 수 있습니다.
            return;
        }
    }
    // 모든 필수 입력란이 값이 채워져 있을 때 가입 프로세스를 진행
    community_inquiry_form.submit(); // 또는 원하는 작업 수행
}

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="seller_inquiry_input_save" method="post"
		enctype="multipart/form-data" id="community_inquiry_form">
		<table align="center" style="width: 1000px">
		<caption>판매자 문의글 작성</caption>
			<tr>
				<th>제목</th>
				<td><hr><input type="text" id="inquiry_title" name="inquiry_title"></td>
			</tr>
			<tr>
				<th>문의 내용</th>
				<td><hr><textarea cols="10" rows="10" 
						id="inquiry_content" name="inquiry_content" style="width: 800px; resize: none;"></textarea></td>
			</tr>
			<tr>
				<th>이미지 미리보기</th>
				<td><hr><div id="image_container" width="50px" height="50px"></div><hr></td>
			</tr>
			<tr>
				<th>메인이미지</th>
				<td><hr><input type="file" id="inquiry_image1" name="inquiry_image1" onchange="setThumbnail(event);"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" id="inquiry_image2" name="inquiry_image2" onchange="setThumbnail(event);"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" id="inquiry_image3" name="inquiry_image3" onchange="setThumbnail(event);"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" id="inquiry_image4" name="inquiry_image4" onchange="setThumbnail(event);"></td>
				<input type="hidden" name="seller_number" value="${sellerDTO.seller_number }" >
				<input type="hidden" name="seller_name" value="${sellerDTO.seller_name }" >
			</tr>
			<tr>
				<td colspan="2" align="center"><hr><input type="button" value="등록" onclick="check()"></td>
			</tr>
		</table>
	</form>
</body>
</html>