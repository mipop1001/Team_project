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
          	padding-right: 50px;
        }
        
                .right-align2 {
            text-align: right;
            margin-top: 70px;
          	padding-right: 50px;
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
        // 상품 수량을 저장하는 객체
        var cartItems = {};

        // 체크 박스 변경 이벤트 핸들러
        $('.buy_check').on('change', function () {
            var productNumber = $(this).data('product-number');

            if ($(this).prop('checked')) {
                // 선택된 상품 정보를 서버에서 가져오는 Ajax 요청
                $.ajax({
                    type: 'post',
                    url: 'get_product_info',
                    data: { "productNumber": productNumber },
                    dataType: 'json',
                    success: function (productInfo) {
                        // 상품 정보를 배열에 추가
                        selectedProducts.push(productInfo);
						console.log(productInfo);
                        // 배열에 저장된 선택된 상품 정보를 HTML로 변환하여 product-info에 넣어 렌더링
                        renderSelectedProducts();
                    },
                    error: function () {
                        alert('상품 정보를 가져오지 못했습니다.');
                    }
                });
            } else {
                // 체크 박스가 체크 해제되었을 때 해당 상품 정보를 배열에서 제거
                selectedProducts = selectedProducts.filter(function (info) {
                    return info.product_number !== productNumber;
                });

                // 배열에 저장된 선택된 상품 정보를 HTML로 변환하여 product-info에 넣어 렌더링
                renderSelectedProducts();
            }
        });

        // 상품 정보를 HTML로 변환하여 product-info에 넣어 렌더링하는 함수
        function renderSelectedProducts() {
            $('.product-info').html(selectedProducts.map(function (info) {
                var productNumber = info.product_number;
                console.log(productNumber);
                var maxQuantity = info.product_sell_amount; // 최댓값
                var currentQuantity = cartItems[productNumber] || 1; // 현재 수량

                return '<div class="product-info-item" data-product-number="' + productNumber + '">' +
                    '<div class="product-info-image">' +
                    '<img src="product_sum_image/' + info.product_sum_image + '" width="50px" height="30px"></div>' +
                    '<div class="product-info-details">' +
                    '<div>상품명: ' + info.product_name + '</div>' +
                    '<div>가격: ' + info.product_price.toLocaleString() + '원</div>' +
                    '<div>수량: <button class="upItems" data-product-number="' + productNumber + '">▲</button> ' +
                    '<span class="item-quantity">' + currentQuantity + '</span> ' +
                    '<button class="downItems" data-product-number="' + productNumber + '">▼</button></div>' +
                    '</div>' +
                    '</div><hr>';

            }).join(''));
            // 체크된 상품의 개수와 총 가격 업데이트
            var selectedProductCount = selectedProducts.length;
            var totalProductPrice = selectedProducts.reduce(function (total, info) {
                return total + info.product_price * (cartItems[info.product_number] || 1);
            }, 0);

            $('.right-align').html('총 ' + selectedProductCount + '개의 상품<br>가격 : ' + totalProductPrice.toLocaleString() + '원');
            console.log(totalProductPrice);
        }

        // 상품 수량 증가 버튼 클릭 이벤트
       // 상품 수량 증가 버튼 클릭 이벤트
$(document).on('click', '.upItems', function () {
    var productNumber = $(this).data('product-number');
    var maxQuantity = selectedProducts.find(function (info) {
        return info.product_number === productNumber;
    }).product_sell_amount; // 최댓값
    var currentQuantity = cartItems[productNumber] || 1; // 현재 수량

    if (currentQuantity < maxQuantity) {
        currentQuantity++;
        cartItems[productNumber] = currentQuantity;
        updateCartItems();
        updateTotalPrice(); // 총 가격 업데이트
    }
});

// 상품 수량 감소 버튼 클릭 이벤트
$(document).on('click', '.downItems', function () {
    var productNumber = $(this).data('product-number');
    var currentQuantity = cartItems[productNumber] || 1; // 현재 수량

    if (currentQuantity > 1) {
        currentQuantity--;
        cartItems[productNumber] = currentQuantity;
        updateCartItems();
        updateTotalPrice(); // 총 가격 업데이트
    }
});

        // 상품 수량 업데이트
        function updateCartItems() {
            $('.item-quantity').each(function () {
                var productNumber = $(this).siblings('.upItems').data('product-number');
                $(this).text(cartItems[productNumber]);
            });
        }
        
     // 총 가격 업데이트
        function updateTotalPrice() {
            var totalProductPrice = selectedProducts.reduce(function (total, info) {
                return total + info.product_price * (cartItems[info.product_number] || 1);
            }, 0);

            $('.right-align').html('총 ' + selectedProducts.length + '개의 상품<br>가격 : ' + totalProductPrice.toLocaleString() + '원');
        }
     
        $(document).ready(function () {
            $('.purchase_button').on('click', function () {
                var productNumbers = [];
                var memberNumber = ${member_number}; // JSP 변수를 가져와서 사용
                var totalProductPrice = 0; // 총 가격 초기화
                var selectedProductCount = 0; // 선택된 상품의 개수 초기화
                var updatedQuantities = {}; // 각 상품의 업데이트된 수량을 저장할 객체
                // 선택된 상품 정보를 반복하여 배열에 추가
                
    				
                selectedProducts.forEach(function (productInfo) {
                    productNumbers.push(productInfo.product_number);
                    totalProductPrice += productInfo.product_price * (cartItems[productInfo.product_number] || 1);
                    updatedQuantities[productInfo.product_number] = cartItems[productInfo.product_number] || 1;
                    if (cartItems[productInfo.product_number] > 1) {
                        selectedProductCount++;
                    }
                });
                // 데이터를 서버로 보내는 AJAX 요청
                $.ajax({
                    type: 'POST',
                    url: 'purchase_items', // 컨트롤러 엔드포인트에 맞게 업데이트
                    data: {
                        "productNumbers": productNumbers,
                        "memberNumber": memberNumber,
                        "totalProductPrice": totalProductPrice,
                        "updatedQuantities": JSON.stringify(updatedQuantities)
                    },
                    dataType : "text",
                    success: function (response) {
                        // 성공 처리
                        var result = JSON.parse(response);
                        if(result.result == "ok"){
                        alert('구매가 완료되었습니다.');
                        	window.location.href = "member_buy_items?member_number="+memberNumber+"&totalProductPrice="+totalProductPrice+"&product_number="+productNumbers;
                        }
                        else if(result.result == "no")
                        	{
                        	alert('포인트를 확인 해 주세요.');  
                        	}
                    },
                    error: function (xhr, status, error) {
                        console.log("XHR status: " + status);
                        console.log("Error: " + error);
                        // 그 외 디버깅 정보 출력
                        console.log(xhr);
                        alert('구매 중 오류가 발생했습니다.');
                    }
                });
            });
        });
    });

    
    $(document).ready(function(){
        $('.amount_null').on('click', function(){
            // 품절된 상품의 체크 박스를 클릭할 때, 체크 박스를 해제(disabled)합니다.
            $(this).prop('checked', false);
            alert("품절된 상품입니다.");
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
            	<c:choose>
            	<c:when test="${product.product_sell_amount == 0  }">
            	<td><input type="checkbox" class="amount_null"></td>
            	</c:when>
            	<c:otherwise>
                <td><input type="checkbox" class="buy_check" data-product-number="${product.product_number}"></td>
                </c:otherwise>
				</c:choose>
                <td><img src="product_sum_image/${product.product_sum_image}" width="50px" height="30px"></td>
                <td class="proimg_${product.product_number}" style="display:none;">${product.product_sum_image}</td>
                <td class="product_name_${product.product_number}">${product.product_name}</td>

                <td>${product.product_country}</td>

                <td>${product.product_maker}</td>

                <td><fmt:formatNumber value="${product.product_price}" pattern="#,###"/></td>

                <td class="product_price_${product.product_number}" style="display: none;">${product.product_price}</td>

                <td>${product.product_date}</td>
				<c:choose>
				<c:when test="${product.product_sell_amount == 0 }">
				<td class="product_sell_amount_${product.product_number}">품절</td>
				</c:when>
				<c:otherwise>
                <td class="product_sell_amount_${product.product_number}">${product.product_sell_amount}</td>
                </c:otherwise>
				</c:choose>
                <td>${product.seller_id}</td>

                <td><button><a href="cart_delete_item?product_number=${product.product_number }&member_number=${member_number}">x</a></button></td>
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
        <tr>
        <td colspan="3" class="right-align2"><button class="purchase_button">구매</button>&emsp;<button>초기화</button> </td>
        </tr>
    </table>
</body>
</html>

