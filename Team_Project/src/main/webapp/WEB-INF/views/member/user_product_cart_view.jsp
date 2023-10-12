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
        
        .product-info {
        text-align:left;
        margin-left: 20px;
        }
        .buy-amount-container {
            display: flex;
            align-items: center;
        }

        .increment, .decrement {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            border: 1px solid #ccc;
            border-radius: 50%;
            cursor: pointer;
            margin: 0 5px; /* + 버튼과 - 버튼 사이의 간격 조절 */
            display: flex;
            justify-content: center;
        }
        
        .buy_amount {
            background-color: white; /* 배경 색상 */
            color: black; /* 글자 색상 */
            padding: 5px 10px; /* 내부 여백 */
            border-radius: 5px; /* 테두리 모서리 둥글게 만듦 */
        }
        
            /* 스타일 추가 */
    .product-info-item {
        display: flex;
        align-items: center;
    }

    .product-info-image {
        flex: 1; /* 이미지가 더 큰 영역을 차지하도록 설정 */
    }

    .product-info-details {
        flex: 2; /* 상세 정보가 더 큰 영역을 차지하도록 설정 */
    }
    </style>
    <script type="text/javascript">
    function updateTotal() {
        var totalProducts = 0;
        var totalPrice = 0;
        var productInfoContainer = document.querySelector('.product-info'); // 상품 정보가 나타날 요소

        var checkboxes = document.querySelectorAll('.buy_check');
        var selectedProducts = [];

        checkboxes.forEach(function (checkbox) {
            if (checkbox.checked) {
                var row = checkbox.closest('tr');
                var price = parseFloat(row.querySelector('.product_price').textContent);
                var productImage = row.querySelector('.product_sum_image').innerHTML; // 상품 이미지 HTML
                var productName = row.querySelector('.product_name').textContent;

                totalProducts++;
                totalPrice += price;

                selectedProducts.push({
                    productImage: productImage,
                    productName: productName,
                });
            }
        });

        // 총 개수와 총 가격을 HTML로 업데이트
        var formattedTotalPrice = totalPrice.toLocaleString(); // 쉼표 추가
        var totalInfo = '총 ' + totalProducts + '개의 상품<br>가격 : ' + formattedTotalPrice + '원';
        document.querySelector('.right-align').innerHTML = totalInfo;

        // 선택된 상품 정보를 출력
        var productInfoHTML = '';
        selectedProducts.forEach(function (product, index) {
            productInfoHTML += '<hr><div>' + product.productImage +
                '<span style="margin-right: 10px;">' + product.productName + '</span>' +
                '<div class="buy-amount-container">' +
                '<div class="buy_amount" id="buy_amount_' + index + '">0</div>' +
                '<button class="increment" onclick="changeAmount(\'increment\', this, ' + index + ')">▲</button>' +
                '<button class="decrement" onclick="changeAmount(\'decrement\', this, ' + index + ')">▼</button>' +
                '</div></div>';
        });
        productInfoContainer.innerHTML = productInfoHTML;
    }

    function changeAmount(action, element, index) {
        const buyAmountElement = document.getElementById('buy_amount_' + index);
        let currentAmount = parseInt(buyAmountElement.textContent, 10);
        
        // 이전에 선택한 상품의 판매 수량을 가져오기
        var sellAmount = parseFloat(document.querySelector('.product_sell_amount_' + index).textContent);

        if (action === 'increment' && currentAmount < sellAmount) {
            currentAmount++;
        } else if (action === 'decrement' && currentAmount > 0) {
            currentAmount--;
        }
        
        buyAmountElement.textContent = currentAmount;
    }
    </script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <table align="center" width="50%">
        <tr>
            <td>리스트에 추가</td>
            <td>썸네일</td>
            <td>상품명</td>
            <td>원산지</td>
            <td>메이커</td>
            <td>가격</td>
            <td>상품등록 날짜</td>
            <td>남은재고</td>
            <td>판매자 아이디</td>
            
        </tr>
        <hr>
        <c:forEach items="${list2 }" var="i" varStatus="loop">
        
            <tr>
                <td><input type="checkbox" class="buy_check" class="buy_check"  onchange="updateTotal()"></td>

                <td class="product_sum_image"><img src="product_sum_image/${i.product_sum_image }" width="50px" height="30px"></td>
                <td class="product_name">${i.product_name }</td>
                <td>${i.product_country }</td>
                <td>${i.product_maker}</td>
                <td><fmt:formatNumber value="${i.product_price }" pattern="#,###"/></td>
                <td class="product_price" style="display: none;">${i.product_price }</td>
                <td>${i.product_date}</td>
                <td class="product_sell_amount_${loop.index}">${i.product_sell_amount}</td>
                <td>${i.seller_id }</td>
                
            </tr>
        </c:forEach>
    </table>
    <table align="center"style='margin-top:20px;border:1px solid #000' width="50%" height="150px">
        <tr>
            <td colspan="2">
                <div class="product-info">
                    <!-- 여기에 상품 정보가 나타납니다. -->
                </div>
                    <hr>
            </td>
            <td colspan="1" class="right-align">
                총 0개의 상품<br>
                가격 : 0원
            </td>
        </tr>
    </table>
</body>
</html>
