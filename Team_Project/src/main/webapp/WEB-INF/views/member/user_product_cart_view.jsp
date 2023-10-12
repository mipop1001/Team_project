<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .right-align {
            text-align: right;
            margin-top: 30px;
        }
    </style>
<script type="text/javascript">
function updateTotal() {
    var totalProducts = 0;
    var totalShipping = 0;
    var totalPrice = 0;

    var checkboxes = document.querySelectorAll('.buy_check');
    checkboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            var row = checkbox.closest('tr');
            var price = parseFloat(row.querySelector('.product_price').textContent);
            
            totalProducts++;
            totalPrice += price;
            // 아래의 오타를 수정해야 합니다.
            // totalShipping += totalProducts*totlaPrice;를
//             totalShipping += totalPrice;
        }
    });

    // 총 개수와 총 가격을 HTML로 업데이트
    var formattedTotalPrice = totalPrice.toLocaleString(); // 쉼표 추가
    var totalInfo = '총 ' + totalProducts + '개의 상품<br>가격 : ' + formattedTotalPrice + '원';
    document.querySelector('.right-align').innerHTML = totalInfo;
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="50%">
<tr>
<td>구매 리스트에 추가</td>
<td>썸네일</td>
<td>상품명</td>
<td>원산지</td>
<td>메이커</td>
<td>가격</td>
<td>상품등록 날짜</td>
<td>남은재고</td>
<td>판매자 아이디</td>
</tr>
<c:forEach items="${list2 }" var="i">
<tr>
<td><input type="checkbox" class="buy_check" class="buy_check"  onchange="updateTotal()"></td>
<td><img src="product_sum_image/${i.product_sum_image }" width="50px" height="30px"></td>
<td>${i.product_name }</td>
<td>${i.product_country }</td>
<td>${i.product_maker}</td>
<td><fmt:formatNumber value="${i.product_price }" pattern="#,###"/></td>
<td class="product_price" style="display: none;">${i.product_price }</td>
<td>${i.product_date}</td>
<td class="product_sell_amount">${i.product_sell_amount }</td>
<td>${i.seller_id }</td>
</tr>
</c:forEach>
</table>
<table align="center" border="1" width="50%" height="150px">
<tr>
<td colspan="1" class="right-align">
총 0개의 상품<br>
가격 : 0원</td>
</tr>
</table>
</body>
</html>