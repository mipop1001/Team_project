<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//HTML 엘리먼트를 찾습니다.
$(document).ready(function() {
    var sellerNumberInputs = document.querySelectorAll('.seller_number');
    var sellerNumbers = [];
    sellerNumberInputs.forEach(function(input) {
        var sellerNumber = input.value;
        sellerNumbers.push(sellerNumber);
    });

    // 모든 게시글을 담아둘 변수
    var allInquiries = '';
    var session_seller_number = $(".session_seller_number").val(); // 세션에서 seller_number 가져오기
    // 체크박스 상태 변경 이벤트 핸들러
// 체크박스 상태 변경 이벤트 핸들러
$(".myPostsCheckbox").change(function() {
    if (this.checked) {
        // 체크된 경우, Ajax 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "inquiry_my_only",
            data: {
                "seller_numbers": sellerNumbers,  // 판매자 번호의 배열을 전송
                "myPosts": true
            },
            success: function(response) {
                var inquiry_my_only = "";
                $(response).each(function(index, item) {
                    inquiry_my_only += `
                        <tr>
                        <input type="hidden" value="\${item.seller_number}" class="seller_number">
                        <td>\${item.inquiry_status}</td>
                        <td>\${item.inquiry_title}</td>
                        <td>\${item.inquiry_writer_name}</td>
                        <td>\${item.inquiry_date}</td>
                        <td><button onclick="inquiry_answer('\${item.inquiry_number}')">답변 확인</button>
                        <button onclick="confirm_delete(\${item.inquiry_number})">문의 삭제</button>
                        </td>
                        </tr>`;
                });
                $("#myTable").html(inquiry_my_only);
            },
            error: function() {
                alert("Request error!");
            }
        });
    } else {
        // 체크 해제된 경우, 모든 게시글을 보여줍니다.
        $("#myTable").html(allInquiries);
    }
});

    // 초기 페이지 로딩 시 모든 게시글을 미리 불러옵니다.
    $.ajax({
        type: "POST",
        url: "inquiry_all",  // 모든 게시글을 불러올 엔드포인트 URL
        success: function(response) {
            var session_seller_numbers = document.querySelectorAll('.session_seller_number');
            var sellerNumbers = [];
            // sellerNumbers 배열에 session_seller_numbers의 값을 추가
            session_seller_numbers.forEach(function(input) {
                var session_seller_number = input.value;
                sellerNumbers.push(session_seller_number);
            });

            $(response).each(function(index, item) {
                var isOwner = session_seller_number==item.seller_number;
                var buttonHtml = '';
                console.log(sellerNumbers);
                if (!isOwner) {
                    buttonHtml = `<td>본인의 문의글만 확인 가능합니다.</td>`;
                } else {
                    buttonHtml = `<td><button onclick="inquiry_answer('\${item.inquiry_number}')">답변 확인</button>
                    	<button onclick="confirm_delete(\${item.inquiry_number})">문의 삭제</button>
                    </td>`;
                }

                    console.log(buttonHtml);
                allInquiries += `
                    <tr>
                        <input type="hidden" value="\${item.seller_number}" class="seller_number">
                        <td>\${item.inquiry_status}</td>
                        <td>\${item.inquiry_title}</td>
                        <td>\${item.inquiry_writer_name}</td>
                        <td>\${item.inquiry_date}</td>
                        \${buttonHtml}
                    </tr>`;
            });
        },
        error: function() {
            alert("Request error!");
        }
    });
});

</script>
</head>
<body>
<table align="center" width="1000px">
<tr>
<td>
<input type="checkbox" class="myPostsCheckbox">내 문의글만 보기
</td>
<td colspan="4" style="text-align: right;">
<button id="inquiryButton">문의하기</button>
</td>
<input type="hidden" value="${sellerDTO.seller_number }" class="session_seller_number">
</tr>
<caption>1:1 문의</caption>
<tr>
<th>상태</th>
<th>제목</th>
<th>작성자</th>
<th>날짜</th>
<th>답변 확인</th>
</tr>
<tbody id="myTable">
<c:choose>
<c:when test="${not empty list}">
<c:forEach items="${list }" var="i">
<c:if test="${sellerDTO.seller_number == i.seller_number}">
<tr>
<input type="hidden" value="${i.seller_number }" class="seller_number">
<td>${i.inquiry_status }</td>
<td>${i.inquiry_title }</td>
<td>${i.inquiry_writer_name }</td>
<td>${i.inquiry_date }</td>
<td><button onclick="inquiry_answer(${i.inquiry_number})">답변 확인</button>
<button onclick="confirm_delete(${i.inquiry_number})">문의 삭제</button>
</td>
</tr>
</c:if>
<c:if test="${sellerDTO.seller_number != i.seller_number}">
<tr>
<input type="hidden" value="${i.seller_number }" class="seller_number">
<td>${i.inquiry_status }</td>
<td>${i.inquiry_title }</td>
<td>${i.inquiry_writer_name }</td>
<td>${i.inquiry_date }</td>
<td>본인의 문의글만 확인 가능 합니다.</td>
</tr>
</c:if>
</c:forEach>
</c:when>
<c:otherwise>
<tr>
<td colspan="5" style="text-align: center;">문의 내역이 없습니다.</td>
</tr>
</c:otherwise>
</c:choose>
</tbody>
</table>
</body>
<script>
// 문의하기 버튼 클릭 시 이동할 페이지 URL
var inquiryURL = "seller_inquiry_form"; // 원하는 페이지 URL로 설정하세요
// 문의하기 버튼 클릭 이벤트 처리
document.getElementById("inquiryButton").addEventListener("click", function() {
    window.location.href = inquiryURL;
});

function inquiry_answer(inquiryNumber) {
    // inquiry_number 값을 이용하여 URL을 동적으로 생성
    var nextPageURL = "seller_inquiry_answer?inquiry_number=" + inquiryNumber;
    
    // 페이지를 이동
    window.location.href = nextPageURL;
}

function confirm_delete(inquiry_number) {
    if (confirm("문의 글을 삭제 하시겠습니까?")) {
        window.location.href = "delete_inquiry?inquiry_number=" + inquiry_number;
    } else {
        // 사용자가 취소 버튼을 눌렀을 때 아무 작업도 하지 않음
    }
}
</script>
</html>