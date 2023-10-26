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
.body_place{
position: relative;
font-size: 12px;
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
.body_grade{
    padding-top: 0;
    padding-bottom: 30px;
    text-align: right;
    margin-right: 15px;
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
	margin: 10px; /* 원하는 간격 크기로 조절하세요 */
}
.re_write{
    margin-top: 20px;
}
.list_back_button{
    -ms-flex-pack: justify;
}
</style>
</head>
<body>
<div class="body_warp">
	<div class="body_main">
		<div class="body_big_title">
		캠핑경험담
		</div>
		<div class="body_info">
			<div class="body_wirter_date_place_title_content_grade">
				<div class="body_wirter_date_place">
				<c:forEach items="${list }" var="community_detail">
				<input type="hidden" value="${community_detail.community_board_number }" id="board_number">
				<input type="hidden" value="${memberDTO.member_id }" id="member_id">
					<div class="body_writer">
					<c:forEach items="${dto }" var="a">
					${a.member_id }
					</c:forEach>
					</div>
					<div class="body_date">
					${community_detail.community_board_date }
					</div>
					<div class="body_place">
					${community_detail.community_board_location }
					</div>
				</c:forEach>
				</div>
				<div class="body_title">
				<c:forEach items="${list }" var="community_detail">
				${community_detail.community_board_title }
				</c:forEach>
				</div>
				<div class="body_content_grade">
				<c:forEach items="${list }" var="community_detail">
					<div class="body_grade">
					${community_detail.community_board_grade }
					</div>
					<div class="body_content">
					${community_detail.community_board_content }
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="body_detail_image">
			<c:forEach items="${list }" var="community_detail">
				<div class="image_one">
<img src="product_sum_image/${community_detail.community_board_sum_image }">
<img src="product_intro_image/${community_detail.community_board_detail_image1 }">
<img src="product_intro_image/${community_detail.community_board_detail_image2 }">
<img src="product_intro_image/${community_detail.community_board_detail_image3 }">
				</div>
			</c:forEach>
			</div>
			<div class="re_write">
				<div id="commentList">
   	<c:forEach items="${list2}" var="comment">
        <div>
        	<hr>
            작성 시간: ${comment.comment_date} <br>
            작성자: ${comment.member_id} <br>
            내용: ${comment.comment_text} <br>
            <a href="javascript:void(0);" onclick="deleteComment('${comment.member_id}', '${comment.comment_text}', '${comment.comment_number}')">삭제</a>
            <hr>
        </div>
    </c:forEach>
    </div>
    <c:choose>
    	<c:when test="${loginstatus == true }">
			<h4>댓글</h4>
			<textarea id="commentInput" rows="5" cols="50" placeholder="댓글을 입력하세요."></textarea>
			<button onclick="addComment()" id="btn">작성</button>
    	</c:when>
    	<c:otherwise>
    		<h4>댓글 작성은 로그인 후 사용 가능합니다.</h4> <hr>
    	</c:otherwise>
    </c:choose>
			</div>
			<div class="list_back_button">
			
			</div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script>
function addComment() {
    var commentInput = document.getElementById("commentInput");
    var commentText = commentInput.value;
    var member_id = document.getElementById("member_id").value;
    var board_number = document.getElementById("board_number").value;

    if (commentText.trim() === "") {
        alert("댓글을 입력하세요.");
        return;
    } else {
        // AJAX 요청
        $.ajax({
            type: "post",
            async: true,
            url: "board_comment",
            dataType: "JSON",
            data: {
                "member_id": member_id,
                "board_number": board_number,
                "comment_text": commentText
            },
            success: function(comment) {
                var commentList = document.getElementById("commentList");
                commentList.innerHTML = ""; // 기존 댓글을 모두 지우고 새로 출력

                for (var i = 0; i < comment.length; i++) {
                    var commentData = comment[i];
                    commentList.appendChild(createCommentElement(commentData));
                }

                // 댓글 입력 필드를 초기화
                commentInput.value = "";
                location.reload();
            },
            error: function() {
                console.error("AJAX 오류 응답");
                alert("오류");
            }
        });
    }
}

// 새로운 댓글 요소를 생성하는 함수
function createCommentElement(commentData) {
    var commentElement = document.createElement("div");

    // 작성 시간, 작성자, 내용 추가
    commentElement.innerHTML = "<hr>"+ "작성 시간: " + commentData.comment_date + "<br> 작성자: " + commentData.member_id + "<br> 내용: " + commentData.comment_text;
    
    // 삭제 링크 추가
    var deleteLink = document.createElement("a");
    deleteLink.href = "javascript:void(0);";
    deleteLink.textContent = "삭제";
    deleteLink.onclick = function () {
        // 삭제 함수 호출 - 삭제 작업을 수행하는 함수를 여기에 호출하십시오
//         deleteComment(commentData.comment_id);
    };

    // 삭제 링크를 댓글에 추가
    commentElement.appendChild(deleteLink);

    // 수평선(hr) 추가
    var hr = document.createElement("hr");

    // 댓글 내용, 삭제 링크, 수평선을 모두 commentElement에 추가
    commentElement.appendChild(hr);

    return commentElement;
}

// 댓글 삭제 기능
function deleteComment(commentid, commenttext, commentnumber) {
    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.ajax({
            type: "post",
            async: true,
            url: "delete_comment", // 삭제를 처리할 서버 엔드포인트
            data: {
                "commentid": commentid,
                "commenttext" : commenttext,
                "commentnumber" : commentnumber
            },
            success: function (data) {
                if (data === "ok") {
                    // 댓글 삭제 후, 댓글 목록을 다시 로드하는 코드를 추가
                	location.reload();
                }
            },
            error: function () {
                console.error("AJAX 오류 응답");
                alert("작성자님만 삭제 가능합니다.");
            }
        });
    }
}

</script>

</body>
</html>