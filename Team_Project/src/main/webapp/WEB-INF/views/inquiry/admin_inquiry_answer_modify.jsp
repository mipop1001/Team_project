<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="admin_inquiry_answer_modify_save" method="post">
		<table align="center" width="800px">
		<caption>1:1 문의 답변 작성</caption>
			<tr>
				<th>제목</th>
				<td> <hr> ${inquiryDTO.inquiry_title } <hr> </td>
			</tr>
			<tr>
				<th>문의 날짜</th>
				<td> <hr> ${inquiryDTO.inquiry_date } <hr> </td>
			</tr>
			<tr>
				<th>작성자</th>
				<td> <hr> ${inquiryDTO.inquiry_writer_name }(${inquiryDTO.inquiry_writer_type })  <hr> </td>
			</tr>
			<tr>
				<th>내용</th>
				<td> <hr> ${inquiryDTO.inquiry_content }  <hr></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td> <hr> <img src="inquiry_images/${inquiryDTO.inquiry_image1 }">
						  <img src="inquiry_images/${inquiryDTO.inquiry_image2 }">
						  <img src="inquiry_images/${inquiryDTO.inquiry_image3 }">
						  <img src="inquiry_images/${inquiryDTO.inquiry_image4 }">
				 <hr> </td>
			</tr>
			<tr>
				<th>이전 답변</th>
				<td> <hr> ${inquiryDTO.inquiry_answer }  <hr></td>
			</tr>
			<tr>
				<th>답변</th>
				<td>
				<div class ='content'>
					<jsp:include page="note.jsp"/>
				</div>	
				</td>
			</tr>
			<tr>
			<input type="hidden" name="inquiry_number" value="${ inquiryDTO.inquiry_number}">
				<td colspan="2"> <input type="submit" value="수정하기"><button onclick="admin_inquiry_answer_cancel()">취소</button> </td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
function admin_inquiry_answer_cancel(){
	
	history.back();
}

</script>
</html>