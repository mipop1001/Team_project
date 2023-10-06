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
<caption style="text-align: center;">설문지</caption>
<tr><th>
연령대</th><td>
<select name="survey_age">
<option value='' selected>-- 선택 --</option>
<option value='20~25세'>20~25세</option>
<option value='26~30세'>26~30세</option>
<option value='31세~35세'>31세~35세</option>
<option value='36세~40세'>36세~40세</option>
<option value='40세이상'>40세이상</option>
</select>
</td></tr>

 
 <tr><th>성별</th> 
 <td><input type="radio" name="survey_gender" value="남성">남성
 <input type="radio" name="survey_gender" value="여성">여성</td>
 </tr>
 
 
 <tr><th>즐겨가는 캠핑 지역은 어디인가요?</th><td>

<select name="survey_q1">
<option value='' selected>-- 선택 --</option>
<option value='경기/서울'>경기/서울</option>
<option value='강원'>강원</option>
<option value='충청'>충청</option>
<option value='전라'>전라</option>
<option value='경상'>경상</option>
</select>
</td></tr>

<tr><th>캠핑장비를 구매하는 평균 금액은 얼마인가요?</th><td>

<select name="survey_q2">
<option value='' selected>-- 선택 --</option>
<option value='10만원~20만원'>10만원~20만원</option>
<option value='30만원~50만원'>30만원~50만원</option>
<option value='60만원~100만원'>60만원~100만원</option>
<option value='100만원 이상'>100만원 이상</option>
</select>
</td></tr>

<tr><th>캠핑을 간다면,몇분이서 캠핑을 가시나요?</th><td>

<select name="survey_q3">
<option value='' selected>-- 선택 --</option>
<option value='혼자'>혼자</option>
<option value='2명'>2명</option>
<option value='3명'>3명</option>
<option value='4명'>4명</option>
<option value='5명 이상'>5명 이상</option>
</select>
</td></tr>


<tr><th>캠핑용품을 주로 구입하는 사이트를 입력해주세요.</th><td>

<input type="text" name="survey_q4" autofocus="autofocus">
</td></tr>





</table>
<tr>
<td><input type="submit" value="제출"></td></tr>
</form>

</body>
</html>