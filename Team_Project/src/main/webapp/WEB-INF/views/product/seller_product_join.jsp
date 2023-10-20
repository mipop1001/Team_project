<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
	margin-top: -1px;
	border-top: 1px solid #cccccc;
}

.content {
	padding: 0 0 100px !important;
	min-height: 800px;
	margin: 0;
}

.sub_content {
	padding-top: 0;
	padding: 45px 0 0 0;
	position: relative;
	width: 1200px;
	margin: 0 auto;
}

.content_box {
	float: left;
	width: 100%;
	margin: 0;
	padding: 0;
	display: block;
}

a {
	text-decoration: none !important;
	color: black;
}

a:hover {
	color: black;
}

.page_name {
	overflow: hidden;
	border-bottom: 1px solid #dbdbdb;
	margin: 0;
	padding: 0;
}

  /* 나열되는 이미지 컨테이너의 스타일 */
  #image_container {
    display: flex; /* 이미지 컨테이너를 가로로 나열하는 flex 레이아웃 사용 */
  }
  #image_container img {
    max-width: 100px; /* 이미지의 최대 너비 지정 (원하는 크기로 조정) */
    height: auto;
    margin-right: 20px; /* 이미지 간격 조정 (원하는 간격으로 조정) */
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function check(){
	var sellerproductform = document.getElementById("seller_product_form");
	
	// 체크해야 하는 질문 목록
	var requiredQuestions = [
		"seller_id",
		"product_name",
		"product_country",
		"product_maker",
		"product_price",
		"product_sell_amount",
		"product_sum_image",
		"product_detail_image1",
		"product_detail_image2",
		"product_detail_image3",
	]
	
	  // 각 질문을 순회하면서 체크
    for (var i = 0; i < requiredQuestions.length; i++) {
        var question = requiredQuestions[i];
        var inputElement = sellerproductform.elements[question];
        var inputValue = inputElement.value.trim(); // 입력값 공백 제거

        if (inputValue === "") {
            alert("필수 입력란이 비어 있습니다");
            // 필수 입력란이 비어 있을 때 작업을 중지하거나 추가 조치를 취할 수 있습니다.
            return;
        }
    }
    // 모든 필수 입력란이 값이 채워져 있을 때 가입 프로세스를 진행
    sellerproductform.submit(); // 또는 원하는 작업 수행
}

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
</script>
	<hr>
	<form action="seller_product_join_save" id="seller_product_form" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<div class="content">
				<div class="sub_content">
					<div class="content_box">
						<div class="page_name">
							<H2>상품입력</H2>
						</div>
						<table align="center" width="600px">

							<input type="hidden" value="${seller_id }" name="seller_id">

							<tr>
								<th>상품명</th>
								<td><hr> <input type="text" name="product_name" id="product_name"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>원산지</th>
								<td><hr> <input type="text" name="product_country" id="product_country"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>메이커</th>
								<td><hr> <input type="text" name="product_maker" id="product_maker"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>가격</th>
								<td><hr> <input type="text" name="product_price" id="product_price"
									style="width: 300px;"></td>
							</tr>

							<tr>
								<th>상품재고</th>
								<td><hr> <input type="number" id="product_sell_amount"
									name="product_sell_amount" style="width: 300px;"></td>
							</tr>
							<tr>
								<th>이미지 미리보기</th>
								<td><hr><div id="image_container" width="50px" height="50px"></div><hr></td>
							</tr>
							<tr>
								<th>썸네일이미지</th>
								<td><hr> <input type="file" name="product_sum_image" id="product_sum_image" onchange="setThumbnail(event);"></td>
							</tr>
							<tr>
								<th>상세이미지1</th>
								<td><hr> <input type="file"
									name="product_detail_image1" id="product_detail_image1" onchange="setThumbnail(event);"></td>
							</tr>
							<tr>
								<th>상세이미지2</th>
								<td><hr> <input type="file"
									name="product_detail_image2" id="product_detail_image2" onchange="setThumbnail(event);"></td>
							</tr>
							<tr>
								<th>상세이미지3</th>
								<td><hr> <input type="file"
									name="product_detail_image3" id="product_detail_image3" onchange="setThumbnail(event);"></td>
							</tr>


							<tr>
								<td colspan="2"><hr> 
									<input type="button" value="등록" onclick="check()">
									<input type="button" value="취소" onclick="location.href='seller_page'">
									<hr></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>