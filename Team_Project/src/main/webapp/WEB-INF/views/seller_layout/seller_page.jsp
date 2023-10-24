<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wall_main {
	padding-top: 0;
	min-height: 10vh;
}

.body_wall {
	overflow: hidden;
}

.body {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	box-sizing: border-box;
	font-family: "malgun gothic", sans-serif;
	line-height: 1;
}

/* 상품 판매량 수량 부분 스타일 */
.card.bg-info {
	background-color: #007BFF; /* 원하는 색상으로 변경 */
}

.cardTitle {
	font-size: 24px; /* 원하는 글자 크기로 변경 */
}

.big.text-white {
	font-size: 36px; /* 원하는 글자 크기로 변경 */
}

/* 상품 환불 수량 부분 스타일 */
.card.bg-primary {
	background-color: #28A745; /* 원하는 색상으로 변경 */
}

/* 상품 환불 수량 부분 글자 색상 변경 (백그라운드와 대비를 높이기 위해) */
.card.bg-primary .cardTitle {
	color: #FFF;
}

/* 나머지 스타일은 그대로 두거나 필요에 따라 조절합니다. */
.container-fluid {
	padding-left: 300px;
	padding-right: 100px;
	margin-right: auto;
	margin-left: auto;
}

.breadcrumb {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 1rem;
	list-style: none;
}

.bg-info { -
	-bs-bg-opacity: 1;
	background-color: rgba(var(- -bs-info-rgb), var(- -bs-bg-opacity))
		!important;
}

.text-white { -
	-bs-text-opacity: 1;
	color: rgba(var(- -bs-white-rgb), var(- -bs-text-opacity)) !important;
}

.mb-4 {
	margin-bottom: 1.5rem !important;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
}

.card-body {
	flex: 1 1 auto;
	padding: 1rem 1rem;
}

.chartjs-size-monitor, .chartjs-size-monitor-expand,
	.chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1;
}

.chartjs-render-monitor {
	animation: chartjs-render-animation 1ms;
}

.row {
	margin-right: -15px;
	margin-left: -15px;
	margin-bottom: 30px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// AJAX 요청을 통해 데이터 가져오기
		$.ajax({
			url : 'seller_product_out1',
			method : 'GET',
			success : function(data) {
				// 가져온 데이터를 HTML 요소에 업데이트
				$('#producttotal1').text(data.producttotal1);
				$('#producttotal2').text(data.producttotal2);
			},
			error : function() {
				console.log('데이터를 가져오는 중 오류가 발생했습니다.');
			}
		});
	});
</script>
<body>
	<div class="wall_main">
		<div class="body_wall">
			<div class="body">
				<main>
					<div class="container-fluid px-4">
						<h1 class="mt-4">통계창</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item active">판매자 메인</li>
						</ol>
						<div class="row">
							<div class="col-xl-3 col-md-6">
								<div class="card bg-info text-white mb-4">
									<div class="card-body cardTitle">
										전체 등록된 상품 수량
										<div id="producttotal1"></div>
									</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
									</div>
								</div>
							</div>
							<div class="col-xl-3 col-md-6">
								<div class="card bg-primary text-white mb-4">
									<div class="card-body cardTitle">
										전체 판매된 상품 수량
										<div id="producttotal2"></div>
									</div>
									<div
										class="card-footer d-flex align-items-center justify-content-between">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-6">
								<div class="card-header">
									<h3>판매상품 제품목록</h3>
								</div>
								<div class="card mb-4">
									<div class="card-body">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="chatView" width="520" height="208"
											style="display: block; width: 520px; height: 208px;"
											class="chartjs-render-monitor"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-6">
								<div class="card-header">
									<h3>인기상품</h3>
								</div>
								<div class="card mb-4">
									<div class="card-body">
										<div class="chartjs-size-monitor">
											<div class="chartjs-size-monitor-expand">
												<div class=""></div>
											</div>
											<div class="chartjs-size-monitor-shrink">
												<div class=""></div>
											</div>
										</div>
										<canvas id="chatView" width="520" height="208"
											style="display: block; width: 520px; height: 208px;"
											class="chartjs-render-monitor"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</div>
</body>
</html>