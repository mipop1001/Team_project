<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="announcement_input_save" method="get">
		<table align="center" width="800px">
		<caption>공지사항 작성</caption>
			<tr>
				<th>제목</th>
				<td> <hr> <input type="text" name="title"> <hr> </td>
			</tr>
			<tr>
				<th>작성자</th>
				<td> <hr> <input type="text" name="writer"> <hr> </td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<div class ='content'>
						<jsp:include page="note.jsp"/>
					</div>	
				</td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="등록"><button onclick="announcement_input_cancel()">취소</button> </td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
function announcement_input_cancel() {
	history.back();
	
}
</script>
</html>