<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="customer_community_input_save" method="post"  enctype="multipart/form-data">
<table border="2" align="center" >
<tr><th>제목</th><td><input type="text" name="community_board_title"></td></tr>
<tr><th>글내용</th><td><textarea cols="10" rows="10" name="community_board_content"></textarea>></td></tr>
<tr><th>지역</th><td>
<select>
<option name="community_board_location" value="서울특별시">서울특별시</option>
<option name="community_board_location" value="인천광역시">인천광역시</option>
<option name="community_board_location" value="경기도">경기도</option>
<option name="community_board_location" value="강원도">강원도</option>
<option name="community_board_location" value="충청북도">충청북도</option>
<option name="community_board_location" value="충청남도">충청남도</option>
<option name="community_board_location" value="세종특별시">세종특별시</option>
<option name="community_board_location" value="대전광역시">대전광역시</option>
<option name="community_board_location" value="경상북도">경상북도</option>
<option name="community_board_location" value="경상남도">경상남도</option>
<option name="community_board_location" value="대구광역시">대구광역시</option>
<option name="community_board_location" value="울산광역시">울산광역시</option>
<option name="community_board_location" value="부산광역시">부산광역시</option>
<option name="community_board_location" value="전라북도">전라북도</option>
<option name="community_board_location" value="전라남도">전라남도</option>
<option name="community_board_location" value="광주광역시">광주광역시</option>
<option name="community_board_location" value="제주특별자치도">제주특별자치도</option>
</select>
</td></tr>
<tr><th>별</th><td>
<input type="radio" name="community_board_grade" value="1">★☆☆☆☆
<input type="radio" name="community_board_grade" value="2">★★☆☆☆
<input type="radio" name="community_board_grade" value="3">★★★☆☆
<input type="radio" name="community_board_grade" value="4">★★★★☆
<input type="radio" name="community_board_grade" value="5">★★★★★</td></tr>
<tr><th>메인이미지</th><td><input type="file" name="community_board_sum_image"></td></tr>
<tr><th>추가이미지</th><td><input type="file" name="community_board_detail_image1"></td></tr>
<tr><th>추가이미지</th><td><input type="file" name="community_board_detail_image2"></td></tr>
<tr><th>추가이미지</th><td><input type="file" name="community_board_detail_image3"></td></tr>
<tr><td><input type="submit" value="등록"></td></tr>
</table>
</form>
</body>
</html>