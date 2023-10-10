<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
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
	
	.ul {
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
    padding-top: 40px;
	}
	.bodypage{
    line-height: 1;
     /*    margin: 0; */
        max-width: 1500px;
    margin: 0 auto;
    padding-bottom: 100px;
	}
	.community_travel_list ul {
    display: flex;
    margin-top: 0;
    margin-left: 155px;
    justify-content: flex-start;
    flex-wrap: wrap;
    align-content: center;
    align-items: center;
	}
	.community_travel_list {
	
	}
	ol, ul {
    list-style: none;
	}
	.pic img {
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
    overflow-clip-margin: content-box;
    overflow: clip;
	}
	.pic {
    margin-bottom: 22px;
    overflow: hidden;
    text-align: center;
	}
    user_product_title {
    font-size: 16px;
    line-height: 18px;
    color: #222;
    font-weight: 700;
	}
	.user_product_location {
    margin: 8px 0;
    font-size: 13px;
    line-height: 18px;
    color: #555;
	}
	.user_product_date {
    font-size: 13px;
    line-height: 16px;
    color: #555;
	}
	.user_product_title {
    margin-bottom: 40px;
    font-size: 22px;
    line-height: 24px;
    
	}
	
	.paging {
    width: 100%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 0;  
    display: flex;
    margin-top: 40px;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    padding-right: 10px;
	}
	
	.buttonbigred{
    padding: 0 30px;
	background-color: #a40000;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    min-width: 80px;
    height: 40px;
    color: #fff;
    -webkit-box-pack: center;
    justify-content: center;
	}
	button {
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
	}
	</style>
	</head>

	<body>
	<div class="scroll-container">
	<div class="body-wrapper mobile-padding">
	<div class="bodypage">
		<h2 class="body-title" style="padding-top: 90px;">
			제푸무무무뭄
		</h2>
			<div class="community_travel_list" align="center">
				<ul>
				<c:forEach items="${list }" var="user_product">
                   <li>
                           <strong class="user_product_title">${user_product.product_name }</strong>
                       <a href="user_product_out_detail?product_number=${user_product.product_number }">
                           <div class="pic"><img src="product_sum_image/${user_product.product_sum_image }"></div>
                           <p class="user_product_location">${user_product.product_maker } </p>
                           <p class="user_product_location">${user_product.product_price } </p>
                       </a>
                   </li>
				</c:forEach>
			</ul>
		</div>
		
		
		<div class="paging">
		<tr style="border-left: none;border-right: none;border-bottom: none">
		   <td colspan="5" style="text-align: center;"> 
		   <c:if test="${paging.startPage!=1 }">
		      <a href="userproductnotice?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>
		      <!-- 1page 가 아니면 보여라  -->
		   	</c:if>   
		   	   <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
		        	 <c:choose>
		          	  <c:when test="${p == paging.nowPage }">
		         	      <b><span style="color: red;">${p}</span></b>
		         	   </c:when>   
		         	   <c:when test="${p != paging.nowPage }">
		         	      <a href="userproductnotice?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		        	    </c:when>   
		      	   </c:choose>
		     	 </c:forEach>
		    	  <c:if test="${paging.endPage != paging.lastPage}">
		      <a href="userproductnotice?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">▶</a>
		  	 </c:if>
		   </td>
		</tr>
		</div>
		
		
		</div>
	</div>
	<!-- /body-wrapper +end+ -->

	 </div>
	 </body>
	 </html>