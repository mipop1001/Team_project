<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko-KR"><head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="/resources/functions/jquery-3.4.1.min.js"></script>
	<script src="/resources/functions/jquery-ui.min.js"></script>
	<script src="/resources/functions/swiper.min.js "></script>
	<script src="/resources/functions/imagesLoaded_v4.1.4.js "></script>
	<script src="/resources/functions/masonry.js"></script>
	<script src="/resources/functions/photoswipe.min.js"></script>
	<script src="/resources/functions/photoswipe-ui-default.min.js"></script>
	<script src="/resources/functions/snowpeak-fn.js "></script>
	<script src="/js/commonUtil.js"></script>
	<script src="/js/hashmap.js"></script>
	<script type="text/javascript" src="/js/netfunnel.js" charset="UTF-8"></script>
	<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
	<script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-Q42NPYM5X5&amp;l=dataLayer&amp;cx=c"></script>
	<script async="" src="https://rua-api.ncloud.com/api/v1/beacon/boomerang/collect/01573125-5fb7-4229-916d-e16c50c295b4"></script>

	<style type="text/css">
	
	ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
	}
	li {
    display: list-item;
    text-align: -webkit-match-parent;
	}
	body {
    line-height: 1;
        margin: 0;
	}
	.community_travel_list ul {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-top: -40px;
    margin-left: -26px;
    justify-content: center;
	align-item: center;
	}
	ol, ul {
    list-style: none;
	}
	.community_travel_list .pic img {
    vertical-align: top;
    -o-object-fit: cover;
    object-fit: cover;
    width: 100%;
    height: 100%;
    -o-object-position: center top;
    object-position: center top;
    }
    img {
    vertical-align: top;
	}
	img {
    overflow-clip-margin: content-box;
    overflow: clip;
	}
	.community_travel_list .pic {
    margin-bottom: 22px;
    overflow: hidden;
    text-align: center;
	}
    .community_travel_list .board_title {
    font-size: 16px;
    line-height: 18px;
    color: #222;
    font-weight: 700;
	}
	.community_travel_list .board_location {
    margin: 8px 0;
    font-size: 13px;
    line-height: 18px;
    color: #555;
	}
	.community_travel_list .board_date {
    font-size: 13px;
    line-height: 16px;
    color: #555;
	}
	.scroll-container {
    overflow-y: scroll; /* 세로 스크롤만 활성화 */
    height: auto; /* 스크롤 컨테이너의 높이를 조절 */
    /* 다른 스타일 속성을 추가할 수 있습니다. */
	}
	</style>
	</head>

	<body>
	<div class="scroll-container">
	<div class="body-wrapper mobile-padding">
	<div class="body page">
		<h2 class="body-title">
			캠핑경험담
		</h2>
			<div class="community_travel_list">
				<ul>
				<c:forEach items="${list }" var="community">
                   <li>
                       <a href="customer_community_detail?community_board_number=${community.community_board_number }">
                           <div class="pic"><img src="product_sum_image/${community.community_board_sum_image }"></div>
                           <strong class="board_title">${community.community_board_title }</strong>
                           <p class="board_location">${community.community_board_location } </p>
                           <span class="board_date">${community.community_board_date }</span>
                       </a>
                   </li>
				</c:forEach>
			</ul>
		</div>
			<div class="button-group paging-wrapper">
				<div class="paging">
						<a href="javascript:contents_paging(1);" class="p page-arrow" title="prev_page"></a>&nbsp;
						<a href="javascript:contents_paging(1);" class="on" title="1page">1</a>&nbsp;
						<a href="javascript:contents_paging(2);" title="2page">2</a>&nbsp;
						<a href="javascript:contents_paging(3);" title="3page">3</a>&nbsp;&nbsp;
						<a href="javascript:contents_paging(2);" class="n page-arrow" title="next_page"></a>
						<!-- 글쓰기 버튼 0930 -->
						<button class="button big red" onclick="location='customer_community_input_form'"><span>글쓰기</span></button>
						<!-- /글쓰기 버튼 0930 -->
				</div>
			</div>
		</div>
	</div>
	<!-- /body-wrapper +end+ -->

	 </div>
	 </body>
	 </html>