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
<td><button class="delivery-status-update" data-sell-list-number="${i.sell_list_number}">배송 정보 변경</button></td>
</tr>
</c:forEach>
</table>
</body>
</html>