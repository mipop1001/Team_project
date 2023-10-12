<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
	<form action="customer_community_input_save" method="post"
		enctype="multipart/form-data">
		<table align="center" style="width: 1000px">
		<caption>게시글 작성</caption>
			<tr>
				<th>제목</th>
				<td><hr><input type="text" name="community_board_title"></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><hr><textarea cols="10" rows="10"
						name="community_board_content" style="width: 800px"></textarea></td>
			</tr>
			<tr>
				<th>지역</th>
				<td><hr><select name="community_board_location">
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
				<td><hr><input type="radio" name="community_board_grade" value="1">★☆☆☆☆
					<input type="radio" name="community_board_grade" value="2">★★☆☆☆
					<input type="radio" name="community_board_grade" value="3">★★★☆☆
					<input type="radio" name="community_board_grade" value="4">★★★★☆
					<input type="radio" name="community_board_grade" value="5">★★★★★</td>
			</tr>
			<tr>
				<th>메인이미지</th>
				<td><hr><input type="file" name="community_board_sum_image"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" name="community_board_detail_image1"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" name="community_board_detail_image2"></td>
			</tr>
			<tr>
				<th>추가이미지</th>
				<td><hr><input type="file" name="community_board_detail_image3"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><hr><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>