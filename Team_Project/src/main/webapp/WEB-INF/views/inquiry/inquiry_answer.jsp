<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body_warp{
    overflow: hidden;
}
.body_main{
    max-width: 1170px;
    margin: 0 auto;
    padding-bottom: 100px;
}
.body_big_title{
    margin-bottom: 40px;
    margin: 0 0 62px;
    font-size: 22px;
    line-height: 24px;
}
.body_info{

}
.body_wirter_date_place_title_content_grade{

}
.body_wirter_date_place{
display: flex;
    padding-bottom: 12px;
    border-bottom: 1px solid #cccccc;
}
.body_writer{
font-size: 12px;
}

.body_date::before{
content: "";
    display: inline-block;
    width: 1px;
    height: 10px;
    margin: 0 10px;
    vertical-align: middle;
    background-color: #cccccc;
}

.body_date{
position: relative;
font-size: 12px;
}

.body_place::before{
content: "";
    display: inline-block;
    width: 1px;
    height: 10px;
    margin: 0 10px;
    vertical-align: middle;
    background-color: #cccccc;
}
.body_title{
font-size: 18px;
    padding-top: 20px;
    padding-bottom: 20px;
    font-weight: 700;
    text-align: center;
}
.body_content_grade{
padding-top: 20px;
    padding-bottom: 60px;
    border-top: 1px solid #cccccc;
    border-bottom: 1px solid #cccccc;
}
.body_content{
white-space: pre-line;
    font-size: 14px;
    line-height: 20px;
    font-weight: 300;
}
.body_detail_image{
    margin-top: 30px;
}
.image_one{
    display: flex;
    flex-wrap: wrap;
    margin-top	: -10px;
    margin-left: -26px;
        justify-content: center;
}

.image_one img{
	width: 273px;
	height: auto;
}
.re_write{
    margin-top: 20px;
}
.list_back_button{
    -ms-flex-pack: justify;
}
.inquiry_answer_date{
	text-align: left;
}
</style>
</head>
<body>
<div class="body_warp">
	<div class="body_main">
		<div class="body_big_title">
		1:1 문의
		</div>
		<div class="body_info">
			<div class="body_wirter_date_place_title_content_grade">
				<div class="body_wirter_date_place">
					<div class="body_writer">
					${inquiryDTO.inquiry_writer_name }
					</div>
					<div class="body_date">
					${inquiryDTO.inquiry_date}
					</div>
				</div>
				<div class="body_title">
				${inquiryDTO.inquiry_title }
				</div>
				<div class="body_content_grade">
					<div class="body_content">
					${inquiryDTO.inquiry_content }
					</div>
				</div>
			</div>
			<div class="body_detail_image">
				<div class="image_one">
<img src="inquiry_images/${inquiryDTO.inquiry_image1 }">
<img src="inquiry_images/${inquiryDTO.inquiry_image2 }">
<img src="inquiry_images/${inquiryDTO.inquiry_image3 }">
<img src="inquiry_images/${inquiryDTO.inquiry_image4 }">
				</div>
			</div>
			<h4>답변</h4>
			<c:choose>
			<c:when test="${inquiryDTO.inquiry_answer != null }">
			<div class="inquiry_answer_date">답변 일자 : ${inquiryDTO.inquiry_answer_date }</div><br>
			<div>${inquiryDTO.inquiry_answer }</div>
			</c:when>
			<c:otherwise>
			아직 답변이 없습니다.
			</c:otherwise>
			</c:choose>
			<hr>
		</div>
	</div>
</div>
</body>
</html>