<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
  textarea {
    width: 50%;
    height: 6.25em;
    resize: none;
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<table border="1" align="center" height="500px", width="1000px">
<c:forEach items="${list }" var="community_detail">
<tr><th>제목</th><td colspan="4">${community_detail.community_board_title }</td></tr>
<tr><th>작성자</th><td colspan="4"> db생성 및 출력 기능 추가 필요</td></tr>
<tr><th>작성일자</th><td colspan="4">${community_detail.community_board_date }</td></tr>
<tr><th>지역</th><td colspan="2">${community_detail.community_board_location }</td>
<th>별점</th><td>${community_detail.community_board_grade }</td></tr>
<tr><th>내용</th><td colspan="4">${community_detail.community_board_content }</td></tr>

<tr><th>이미지</th><br>
<td><img src="product_sum_image/${community_detail.community_board_sum_image }"></td>
<td><img src="product_intro_image/${community_detail.community_board_detail_image1 }"></td>
<td><img src="product_intro_image/${community_detail.community_board_detail_image2 }"></td>
<td><img src="product_intro_image/${community_detail.community_board_detail_image3 }"></td></tr>

<input type="hidden" value="${community_detail.community_board_number }" id="board_number">
<input type="hidden" value="${memberDTO.member_id }" id="member_id">
</c:forEach>
</table>
<hr>
<h4>댓글</h4>
<textarea id="commentInput" rows="5" cols="50" placeholder="댓글을 입력하세요."></textarea>
<button onclick="addComment()" id="btn">작성</button>
<div id="commentList">
<hr>
   <c:forEach items="${list2}" var="comment">
        <div>
            작성 시간: ${comment.comment_date}
            작성자: ${comment.member_id}
            내용: ${comment.comment_text}
        </div>
    </c:forEach>
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
    commentElement.innerHTML = "작성 시간: " + commentData.comment_date + " 작성자: " + commentData.member_id + " 내용: " + commentData.comment_text;
    return commentElement;
}
</script>

</body>
</html>