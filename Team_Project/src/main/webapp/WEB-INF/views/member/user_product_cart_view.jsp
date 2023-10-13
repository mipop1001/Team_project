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
            text-align: left;
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
            margin: 0 5px;
            display: flex;
            justify-content: center;
        }

        .buy_amount {
            background-color: white;
            color: black;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .product-info-item {
            display: flex;
            align-items: center;
        }

        .product-info-image {
            flex: 1;
        }

        .product-info-details {
            flex: 2;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
        // 초기화: 선택된 상품 정보를 저장할 배열
        var selectedProducts = [];

        // 체크 박스 변경 이벤트 핸들러
        $('.buy_check').on('change', function () {
            // 해당 체크 박스에 연결된 순서 정보를 가져옴
            var productNumber = $(this).data('product-number');
            var productName = $('.product_name_' + productNumber).text();
            var productPrice = parseFloat($('.product_price_' + productNumber).text().replace(',', '')); // 가격을 수치로 변환

            // 체크 박스가 체크되었을 때
            if ($(this).prop('checked')) {
                var proimg = $('.proimg_' + productNumber).text();

                // 선택된 상품 정보를 HTML로 구성
                var productInfoHTML = '<div class="product-info-item" data-product-number="' + productNumber + '">' +
                    '<div class="product-info-image">' +
                    '<img src="product_sum_image/' + proimg + '" width="50px" height="30px"></div>' +
                    '<div class="product-info-details">' +
                    '<div>상품명: ' + productName + '</div>' +
                    '<div>가격: ' + productPrice.toLocaleString() + '원</div>' +
                    '</div>' +
                    '</div';

                // 배열에 선택된 상품 정보 추가
                selectedProducts.push({ productNumber: productNumber, productPrice: productPrice });
            } else {
                // 체크 박스가 체크 해제되었을 때 해당 상품 정보를 배열에서 제거
                selectedProducts = selectedProducts.filter(function (info) {
                    return info.productNumber !== productNumber;
                });
            }

            // 배열에 저장된 선택된 상품 정보를 HTML로 변환하여 product-info에 넣어 렌더링
            $('.product-info').html(selectedProducts.map(function (info) {
                var productNumber = info.productNumber;
                var productName = $('.product_name_' + productNumber).text();
                var proimg = $('.proimg_' + productNumber).text();
                return '<div class="product-info-item" data-product-number="' + productNumber + '">' +
                    '<div class="product-info-image">' +
                    '<img src="product_sum_image/' + proimg + '" width="50px" height="30px"></div>' +
                    '<div class="product-info-details">' +
                    '<div>상품명: ' + productName + '</div>' +
                    '<div>가격: ' + info.productPrice.toLocaleString() + '원</div>' +
                    '</div>' +
                    '</div><hr>';
            }).join(''));

            // 체크된 상품의 개수와 총 가격 업데이트
            var selectedProductCount = selectedProducts.length;
            var totalProductPrice = selectedProducts.reduce(function (total, info) {
                return total + info.productPrice;
            }, 0);

            $('.right-align').html('총 ' + selectedProductCount + '개의 상품<br>가격 : ' + totalProductPrice.toLocaleString() + '원');
        });
    });
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
            <td>항목 제거</td>
        </tr>
        <hr>
        <c:forEach items="${list2}" var="product">
            <tr>
                <td><input type="checkbox" class="buy_check" data-product-number="${product.product_number}"></td>

                <td><img src="product_sum_image/${product.product_sum_image}" width="50px" height="30px"></td>
                <td class="proimg_${product.product_number}" style="display:none;">${product.product_sum_image}</td>
                <td class="product_name_${product.product_number}">${product.product_name}</td>

                <td>${product.product_country}</td>

                <td>${product.product_maker}</td>

                <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/></td>

                <td class="product_price_${product.product_number}" style="display: none;">${product.product_price}</td>

                <td>${product.product_date}</td>

                <td class="product_sell_amount_${product.product_number}">${product.product_sell_amount}</td>

                <td>${product.seller_id}</td>

                <td><button>x</button></td>
            </tr>
        </c:forEach>
    </table>
    <table align="center" style='margin-top:20px;border:1px solid #000' width="50%" height="150px">
        <tr>
            <td colspan="2">
            <hr>
                <div class="product-info">
                    <!-- 여기에 상품 정보가 나타납니다. -->
                </div>
                
            </td>
            <td colspan="1" class="right-align">
                총 0개의 상품<br>
                가격 : 0원
            </td>
        </tr>
    </table>
</body>
</html>
