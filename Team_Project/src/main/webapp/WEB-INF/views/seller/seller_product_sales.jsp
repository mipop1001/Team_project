<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('.delivery-status-update').on('click', function () {
        var sellListNumber = $(this).data('sell-list-number');
        var $deliveryStatus = $(this).closest('tr').find('.delivery-status');
        var $select = $(this).closest('tr').find('select[name="delivery-status-select"]');

        // Show the select element and hide the delivery status span
        $deliveryStatus.addClass('hidden');
        $select.removeClass('hidden');
    });

    $('select[name="delivery-status-select"]').change(function () {
        var $deliveryStatus = $(this).closest('tr').find('.delivery-status');
        $deliveryStatus.text($(this).val());

        // Hide the select element and show the delivery status span
        $(this).addClass('hidden');
        $deliveryStatus.removeClass('hidden');

        // Get the updated delivery status
        var newDeliveryStatus = $(this).val();
        var sellListNumber = $(this).closest('tr').find('.delivery-status-update').data('sell-list-number');

        // Send an AJAX request to update the delivery status
        $.ajax({
            type: 'POST',
            url: 'delivery_status_update',
            data: {
                "sellListNumber": sellListNumber,
                "newDeliveryStatus": newDeliveryStatus
            },
            success: function (response) {
                // Handle success response
                alert('배송 정보가 업데이트되었습니다.');
            },
            error: function () {
                // Handle error response
                alert('배송 정보 업데이트에 실패했습니다.');
            }
        });
    });
});



$(document).ready(function () {
    // 환불 요청 수락 버튼 클릭 시
    $('.accept-refund-button').on('click', function () {
        var sellListNumber = $(this).data('sell-list-number');
        var userConfirmed = confirm('환불 요청을 수락하시겠습니까?');
        // AJAX 요청 보내기
        if(userConfirmed)
        	{
        $.ajax({
            type: 'POST',
            url: 'accept_refund',
            data: { "sell_list_number": sellListNumber },
            success: function (response) {
                // 처리 성공 시 실행할 코드
                alert('환불 요청이 수락되었습니다.');
                // 여기에서 필요한 업데이트 작업을 수행할 수 있습니다.
            },
            error: function () {
                // 처리 실패 시 실행할 코드
                alert('환불 요청 수락에 실패했습니다.');
            }
        });
        	}
    });
    
    // 환불 요청 거절 버튼 클릭 시
    $('.reject-refund-button').on('click', function () {
        var sellListNumber = $(this).data('sell-list-number');
        var userConfirmed = confirm('환불 요청을 거절하시겠습니까?');
        // AJAX 요청 보내기
        if(userConfirmed)
        	{
        $.ajax({
            type: 'POST',
            url: 'reject_refund',
            data: { "sell_list_number": sellListNumber },
            success: function (response) {
                // 처리 성공 시 실행할 코드
                alert('환불 요청이 거절되었습니다.');
                // 여기에서 필요한 업데이트 작업을 수행할 수 있습니다.
            },
            error: function () {
                // 처리
            }
        });
            }
    });
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="700px">
<tr>
<th>주문번호</th>
<th>상품 명</th>
<th>구매자 명</th>
<th>구매자 주소</th>
<th>수량</th>
<th>가격</th>
<th>총가격</th>
<th>주문 날짜</th>
<th>배송 정보</th>
<th>비고</th>
</tr>
<hr>
<c:forEach items="${list }" var="i">
<tr>
<td>${i.sell_list_number }</td>
<td>${i.product_name }</td>
<td>${i.member_name }</td>
<td>${i.member_address }</td>
<td>${i.product_sell_amount }</td>
<td>
<fmt:formatNumber value="${i.product_price }" pattern="#,###" />
</td>
<td>
<fmt:formatNumber value="${i.product_total_price }" pattern="#,###" />
</td>
<td>${i.product_sell_date }</td>
<td>
<c:choose>
<c:when test="${i.delivery_status == '주문 접수 중' }">
    <span class="delivery-status">${i.delivery_status}</span>
<select name="delivery-status-select" class="hidden" id="delivery-status-select-${i.sell_list_number}">
    <option value="${i.delivery_status}">${i.delivery_status}</option>
    <option value="상품 준비 중">상품 준비 중</option>
    <option value="배송 중">배송 중</option>
    <option value="배송 완료">배송 완료</option>
</select>
</c:when>

<c:when test="${i.delivery_status == '상품 준비 중' }">
    <span class="delivery-status">${i.delivery_status}</span>
<select name="delivery-status-select" class="hidden" id="delivery-status-select-${i.sell_list_number}">
    <option value="${i.delivery_status}">${i.delivery_status}</option>
    <option value="주문 접수 중">주문 접수 중</option>
    <option value="배송 중">배송 중</option>
    <option value="배송 완료">배송 완료</option>
</select>
</c:when>

<c:when test="${i.delivery_status == '배송 중' }">
    <span class="delivery-status">${i.delivery_status}</span>
<select name="delivery-status-select" class="hidden" id="delivery-status-select-${i.sell_list_number}">
    <option value="${i.delivery_status}">${i.delivery_status}</option>
    <option value="주문 접수 중">주문 접수 중</option>
    <option value="상품 준비 중">상품 준비 중</option>
    <option value="배송 완료">배송 완료</option>
</select>
</c:when>

<c:when test="${i.delivery_status == '환불 요청 중' }">
    <span class="delivery-status">${i.delivery_status}</span>
</c:when>
<c:otherwise>
    <span class="delivery-status">${i.delivery_status}</span>
<select name="delivery-status-select" class="hidden" id="delivery-status-select-${i.sell_list_number}">
    <option value="${i.delivery_status}">${i.delivery_status}</option>
    <option value="주문 접수 중">주문 접수 중</option>
    <option value="상품 준비 중">상품 준비 중</option>
    <option value="배송 중">배송 중</option>
</select>

</c:otherwise>
</c:choose>
</td>
<c:choose>
<c:when test="${i.delivery_status == '환불 요청 중' }">
<td><button class="accept-refund-button">수락</button> <button class="reject-refund-button">거절</button> </td>
</c:when>
<c:otherwise>
<td><button class="delivery-status-update" data-sell-list-number="${i.sell_list_number}">배송 정보 변경</button></td>
</c:otherwise>
</c:choose>
</tr>
</c:forEach>
</table>
</body>
</html>