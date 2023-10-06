<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="survey_input_save" method="post">
<table border="2" align="center">
</tr>
<tr><th>나이</th>
<td>
<input type="radio" name="survey_age" value="19세이하">19세이하
<input type="radio" name="survey_age" value="20~25세">20~25세
<input type="radio" name="survey_age" value="26~39세">26~30세
<input type="radio" name="survey_age" value="30세~35세">31세~35세
<input type="radio" name="survey_age" value="36세~40세">36세~40세
<input type="radio" name="survey_age" value="41세~45세">41세~45세
<input type="radio" name="survey_age" value="46세~50세">46세~50세
<input type="radio" name="survey_age" value="50세이상">50세이상
</td>
 </tr>
 
 <tr><th>성별</th> 
 <td><input type="radio" name="survey_gender" value="남성">남성
 <input type="radio" name="survey_gender" value="여성">여성</td>
 </tr>

<tr><th>설문 내용</th>





</tr>


<tr>
<td><input type="submit" value="제출"></td></tr>
</table>
</form>

</body>
</html>