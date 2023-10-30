<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.buy_btn{
   margin-top: 50px;
   margin-bottom: 50px;
   height: 52px;
    width: 100px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 16px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}   
.page_name {
   color: #777;
   align-content: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   function pointupdate() {
      $.ajax({
         type : "post",
         url : "customer_point_update",
         async : true,
         success : function(data) {
         },
         error : function(xhr, textStatus, errorThrown) {
            alert("오류 발생");
         }
      });
   }
</script>
<!-- jQuery 추가 -->
</head>
<body>
   <hr>
   <table align="center" width="700px">
      <div class="page_name">
         <H2>상품정보수정</H2>
      </div>
      <c:forEach items="${mlist}" var="member">
         <tr>
            <th>이름</th>
            <td><hr>${member.member_name}<hr></td>
         </tr>
         <tr>
            <th>주소</th>
            <td><hr>${member.member_address}<hr></td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td><hr>${member.member_phone_number}<hr></td>
         </tr>
         <tr>
            <th>현재포인트</th>
            <td><hr>${member.member_point}<hr></td>
         </tr>
         <c:forEach items="${plist}" var="product">
            <tr>
               <th>상품명</th>
               <td><hr>${product.product_name}<hr></td>
               <td><img alt=""
                  src="./product_sum_image/${product.product_sum_image}"
                  width="100px" height="100px"></td>
            </tr>
            <tr>
               <th>상품가격</th>
               <td><hr>${product.product_price}<hr></td>
            </tr>
            <tr>
               <th>잔여재고</th>
               <td><hr>${product.product_sell_amount}<hr></td>
            </tr>
            <tr>
               <th>결제 후 남는 <br> point 잔액
               </th>
               <td><input type="hidden" readonly="readonly"
                  name="final_credit" class="final_credit"
                  value="${member.member_point - product.product_price}">
                  ${member.member_point - product.product_price}</td>
               <td><c:choose>
                     <c:when test="${member.member_point - product.product_price<= 0}">
                        <span style="color: red;">충전이 필요합니다.</span>
                        <br>
                        <a href='customer_point_management'>충전하기</a>
                     </c:when>
                     <c:otherwise>
                        <span style="color: green;">결제 가능합니다.</span>
                     </c:otherwise>
                  </c:choose></td>
            </tr>
            <tr>
               <td colspan="2" align="right"><input type="button" value="결재" class="buy_btn"
                  onclick="pointupdate(); location.href='order_buy_final?member_point=${member.member_point - product.product_price}&member_number=${member.member_number}&seller_id=${product.seller_id}&product_number=${product.product_number}&product_price=${product.product_price}'">
               </td>
            </tr>

         </c:forEach>
      </c:forEach>
   </table>
</body>
</html>