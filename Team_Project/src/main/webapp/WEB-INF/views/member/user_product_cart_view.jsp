<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.delete_btn {
	height: 30px;
	color: #ffffff;
	margin-bottom: 5px;
	margin-top: 5px;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 50px; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}
.list_title{
padding-top: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // 초기화: 선택된 상품 정보를 저장할 배열
        var selectedProducts = [];
    	//폼으로 전달할 데이터를 저장할 배열
    	
    	// 구매 버튼 엘리먼트
	    var purchaseButton = $('.purchase_button');
	
	    // 처음에는 구매 버튼을 숨김
	    purchaseButton.hide();
    	
    	var selectedProducts2 = []; 
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
        	
        // 체크된 상품의 개수에 따라 구매 버튼을 보이거나 숨김
        togglePurchaseButton();	
        	
    	var productInfoHtml = selectedProducts.map(function (info) {
        var productNumber = info.product_number;
        var maxQuantity = info.product_sell_amount; // 최댓값
        var currentQuantity = cartItems[productNumber] || 1; // 현재 수량
		
        return '<div class="product-info-item" data-product-number="' + productNumber + '">' +
            '<div class="product-info-image">' +
            '<img src="product_sum_image/' + info.product_sum_image + '" width="50px" height="30px"></div>' +
            '<div class="product-info-details">' +
            '<div>상품명: ' + info.product_name + '</div>' +
            '<div>가격: ' + info.product_price.toLocaleString() + '원</div>' +
            '<div>수량: ' +
            '<button class="upItems" data-product-number="' + productNumber + '">▲</button> ' +
            '<span class="item-quantity">' + currentQuantity + '</span> ' + 
            '<button class="downItems" data-product-number="' + productNumber + '">▼</button>' +
            '</div>' +
            '</div>' +
            '</div><hr>';
    }).join('');
    
    $('.product-info').html(productInfoHtml);

    // 체크된 상품의 개수에 따라 구매 버튼을 보이거나 숨김
    function togglePurchaseButton() {
        var selectedProductCount = selectedProducts.length;
        if (selectedProductCount > 0) {
            // 선택된 상품이 하나 이상 있을 때 구매 버튼을 보이게 함
            purchaseButton.show();
        } else {
            // 선택된 상품이 없을 때 구매 버튼을 숨김
            purchaseButton.hide();
        }
    }
    
    
    
    // 체크된 상품의 개수와 총 가격 업데이트
    var selectedProductCount = selectedProducts.length;
    var totalProductPrice = selectedProducts.reduce(function (total, info) {
        return total + info.product_price * (cartItems[info.product_number] || 1);
    }, 0);

    $('.right-align').html('총 ' + selectedProductCount + '개의 상품<br>가격 : ' + totalProductPrice.toLocaleString() + '원');
    $('.totalprice').html('<input type="hidden" name="productPrices" value="'+totalProductPrice+'">');
}

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
        updateTotalPrice(); 
//         updateInputValues(productNumber, currentQuantity);
        // 총 가격 업데이트
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
        updateTotalPrice();
//         updateInputValues(productNumber, currentQuantity);// 총 가격 업데이트
    }
});

//input 값을 업데이트하는 함수
// function updateInputValues(productNumber, currentQuantity) {
//     // 연동하고 싶은 다른 위치의 input 태그의 값을 업데이트
//     $('.item-quantity2[data-product-number="' + productNumber + '"]').val(currentQuantity);
// }

        // 상품 수량 업데이트
        function updateCartItems() {
            $('.item-quantity').each(function () {
                var productNumber = $(this).siblings('.upItems').data('product-number');
                $(this).text(cartItems[productNumber]);
            });
            $('.item_quantity2').each(function () {
                var productNumber = $(this).siblings('.upItems').data('product-number');
                
                $(this).val(cartItems[productNumber]);
            });
        }
        
     // 총 가격 업데이트
        function updateTotalPrice() {
            var totalProductPrice = selectedProducts.reduce(function (total, info) {
                return total + info.product_price * (cartItems[info.product_number] || 1);
            }, 0);

            $('.right-align').html('총 ' + selectedProducts.length + '개의 상품<br>가격 : ' + totalProductPrice.toLocaleString() + '원');
            $('.totalprice').html('<input type="hidden" name="totalProductPrice" value="'+totalProductPrice+'">');
        }
     
        $(document).ready(function () {
            // 구매 버튼 클릭 이벤트 핸들러
            $('.purchase_button').on('click', function (event) {
                event.preventDefault(); // 기본 폼 제출 방지

                // 선택한 상품 정보를 서버로 전송
                console.log("버튼 누름");

                var productNumbers = selectedProducts.map(function (info) {
                    return info.product_number;
                });
                var productPrices = selectedProducts.map(function (info) {
                    return info.product_price;
                });
                var productQuantities = selectedProducts.map(function (info) {
                    return cartItems[info.product_number] || 1;
                });

                var $form = $('#purchaseForm');

                // 각 상품 번호, 가격 및 수량을 form에 추가
                productNumbers.forEach(function (productNumber, index) {
                    // 상품 번호
                    $form.append('<input type="hidden" name="productNumber" value="' + productNumber + '">');
                    // 상품 가격
                    $form.append('<input type="hidden" name="productPrices" value="' + productPrices[index] + '">');
                    // 상품 수량
                    $form.append('<input type="hidden" name="currentQuantity" value="' + productQuantities[index] + '">');
                });

                // form을 body에 추가
                console.log($form[0]); // 폼 엘리먼트 로깅

                // form을 body에 추가하고 자동으로 제출
                $form.appendTo('body');
                console.log("폼이 추가되었습니다.");

                // 폼을 제출
                $form.submit();
                console.log("폼이 제출되었습니다.");
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
	<table align="center" width="60%">
		<tr class="list_title">
		<hr>
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
		<c:forEach items="${list2}" var="product">
			<tr>
				<c:choose>
					<c:when test="${product.product_sell_amount == 0  }">
						<td><input type="checkbox" class="amount_null"></td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox" class="buy_check"
							data-product-number="${product.product_number}"></td>
					</c:otherwise>
				</c:choose>
				<td><img src="product_sum_image/${product.product_sum_image}"
					width="50px" height="30px"></td>
				<td class="proimg_${product.product_number}" style="display: none;">${product.product_sum_image}</td>
				<td class="product_name_${product.product_number}">${product.product_name}</td>

				<td>${product.product_country}</td>

				<td>${product.product_maker}</td>

				<td><fmt:formatNumber value="${product.product_price}"
						pattern="#,###" /></td>

				<td class="product_price_${product.product_number}"
					style="display: none;">${product.product_price}</td>

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

				<td><button
						onclick="location.href='cart_delete_item?product_number=${product.product_number }&member_number=${member_number}'" class="delete_btn">삭제</button></td>
			</tr>

		</c:forEach>

	</table>

	<table align="center" style='margin-top: 20px; border: 1px solid #000'
		width="60%" height="150px">
		<tr>
			<td colspan="2">
				<hr>
				<div class="product-info">
					<!-- 여기에 상품 정보가 나타납니다. -->
				</div>

			</td>
			<td colspan="1" class="right-align">총 0개의 상품<br> 가격 : 0원
			</td>
		</tr>
	</table>
	<div class="proinfo">
		<!-- 선택한 상품 번호 -->
	</div>
	<div class="totalprice">
		<!-- 선택한 상품 가격 -->
	</div>
	<form id="purchaseForm" action="user_product_order_cart" method="post">
		<!-- 폼 내부의 데이터는 JavaScript로 자동으로 생성됩니다. -->
		<table align="center" width="60%">
			<tr>

			</tr>
			<tr>
				<input type="hidden" name="member_number" value="${member_number}">
				<td>
					<hr>
					<button class="purchase_button">구매</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

