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
	const itemList = document.getElementById("item-list");
	.paging {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    margin-top: 40px;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
	}
	.paging-wrapper .paging {
    width: 100%;
    margin-left: auto;
    margin-right: auto;
	}

	@media screen and (max-width: 1280px)
	.breadcrumb {
    padding: 0 15px;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-top: 20px;
    margin-bottom: 60px;
	}
	.breadcrumb {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    max-width: 1170px;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    margin: 40px auto 56px;
    font-size: 12px;
	}
	.breadcrumb a + a {
    position: relative;
	}
	@media screen and (max-width: 1280px)
	.breadcrumb a {
    margin-bottom: 10px;
	}
	@media screen and (max-width: 1280px)
	.contact .button-group.paging-wrapper .button {
    position: static;
    width: 100%;
    margin-top: 30px;
	}
	.body .body-title {
    margin: 0 0 62px;
    text-align: center;
    font-size: 30px;
    font-family: "rb","Roboto",sans-serif;
    font-weight: 700;
	}
	.button.black, .button.red, .button.gray {
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    min-width: 80px;
    height: 40px;
    padding: 0 10px;
    color: #fff;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    background-color: #4b4b4b;
	}
	.button.red {
    background-color: #a40000;
	}
	select, input, button {
    margin: 0;
    padding: 0;
    border: none;
    outline: none;
    background: none;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    text-align: center;
    font-family: inherit;
    font-size: 100%;
    -webkit-appearance: none;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    -webkit-box-shadow: none;
    box-shadow: none;
	}
	@media screen and (max-width: 724px)
	.button.big {
    min-width: 0;
    padding-left: 10px;
    padding-right: 10px;
	}
	
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
	}

	.content-item-list ul {
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
	.content-item-list .pic img {
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
	.content-item-list .pic {
    margin-bottom: 22px;
    overflow: hidden;
    text-align: center;
	}
    .content-item-list .item-tit {
    font-size: 16px;
    line-height: 18px;
    color: #222;
    font-weight: 700;
	}
	.content-item-list .item-txt {
    margin: 8px 0;
    font-size: 13px;
    line-height: 18px;
    color: #555;
	}
	.content-item-list .item-date {
    font-size: 13px;
    line-height: 16px;
    color: #555;
	}
	.scroll-container {
    overflow-y: scroll; /* 세로 스크롤만 활성화 */
    height: 400px; /* 스크롤 컨테이너의 높이를 조절 */
    /* 다른 스타일 속성을 추가할 수 있습니다. */
}
	</style>
	
	<!-- NCP Real User Analytics (RUA) -->
	<script>
	  (function() {
		var s = document.getElementsByTagName('script')[0]
		  , p = document.createElement('script');
		p.async = 'async';
		p.src = 'https://rua-api.ncloud.com/api/v1/beacon/boomerang/collect/'+
		  '01573125-5fb7-4229-916d-e16c50c295b4';
		s.parentNode.insertBefore(p, s);
	  })();
	</script>
	<!-- websIdid 세션 값 05/11 신태일 -->
	<script>const sysId = 'null';</script>
	<!-- 05/11 신태일 포인트 약관 동의 체크 스크립트  -->
	<script src="/js/terms/index.js"></script>
	</head>

	<body>
	<div class="scroll-container">
	<div class="body-wrapper mobile-padding">
	<div class="body page brand contact">
		<div class="breadcrumb">
			<a href="/#">추천캠핑장</a>
			<a href="/#">캠핑경험담</a>
		</div>
		<h2 class="body-title">
			캠핑경험담
		</h2>
			<div class="content-item-list brand-contents">
				<ul>
				<c:forEach items="${list }" var="community">
                   <li>
                       <a href="#">
                           <div class="pic"><img src="product_sum_image/${community.community_board_sum_image }"></div>
                           <strong class="item-tit">${community.community_board_title }</strong>
                           <p class="item-txt">${community.community_board_location } </p>
                           <span class="item-date">${community.community_board_date }</span>
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

	 </div></body></html>