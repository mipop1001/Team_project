<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wall_main{
padding-top: 0;
min-height: 100vh;
}
.body_wall{
overflow: hidden;
}
.body{
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    vertical-align: baseline;
    box-sizing: border-box;
    font-family: "malgun gothic",sans-serif;
    
    line-height: 1;
}
.video_image{

}
.seller_product{

}
</style>
</head>
<body>
<div class="wall_main">
	<div class="body_wall">
		<div class="body">
			<div class="video_image">
			
			</div>
			<div class="seller_product">
			
			</div>
			
			<div class="">
			
			</div>
		</div>
	</div>
</div>
<c:choose>
<c:when test="${loginstate==true }">
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</body>
</html>