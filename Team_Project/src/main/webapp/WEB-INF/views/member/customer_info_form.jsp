<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    function exitcheck() {
        // 사용자로부터 비밀번호 입력 받기
        var password = prompt("회원 탈퇴를 진행하려면 비밀번호를 입력하세요.");
        
        // 사용자가 취소 버튼을 누른 경우 또는 입력란이 비어있는 경우
        if (password === null || password.trim() === "") {
            return;
        } else {
            // TODO: 실제로 서버로 비밀번호를 보내고 탈퇴 로직을 구현해야 합니다.
            $.ajax({
                type: "post",
                url: "customer_info_exit",
                async: true,
                data: {"password" : password},
                success: function(data) {
                    if (data === "ok") {
                        alert("회원 탈퇴 완료");
                        window.location.href = "user_page";
                    } else if (data === "no") {
                        alert("비밀번호를 다시 입력해주세요.");
                    }
                },
                error: function(xhr, textStatus, errorThrown) {
                    alert("오류 발생");
                }
            });
        }
    }
    
    var phoneNumberInputVisible = false;
    var addressInputVisible = false;

    function modifyPhoneNumber() {
        if (!phoneNumberInputVisible) {
            document.getElementById('phone_number_row').style.display = 'table-row';
            document.getElementById('phone_number_input').value = '${dto.member_phone_number}';
        } else {
            document.getElementById('phone_number_row').style.display = 'none';
        }
        phoneNumberInputVisible = !phoneNumberInputVisible;
    }

    function savePhoneNumber() {
        var newPhoneNumber = document.getElementById('phone_number_input').value;

        // 입력란이 비어있는지 확인
        if (newPhoneNumber) {
            $.ajax({
                type: "post",
                url: "customer_phone_number_modify",
                async: true,
                data: {"newPhoneNumber": newPhoneNumber},
                success: function (data) {
                    if (data === "ok") {
                        alert("전화번호 수정 완료");
                        window.location.href = "customer_info";
                    	// 수정된 전화번호를 화면에 표시
                        document.querySelector('td:nth-of-type(2) > hr:nth-of-type(3)').textContent = newPhoneNumber;
                        // 수정 입력란을 숨김
                        document.getElementById('phone_number_row').style.display = 'none';                        
                    } else if (data === "no") {
                        alert("수정 실패");
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    alert("오류 발생");
                }
            });
        } else {
            alert("전화번호를 입력해 주세요");
        }
    }


    function modifyAddress() {
        if (!addressInputVisible) {
            document.getElementById('address_row').style.display = 'table-row';
            document.getElementById('address_input').value = '${dto.member_address}';
        } else {
            document.getElementById('address_row').style.display = 'none';
        }
        addressInputVisible = !addressInputVisible;
    }

    function saveAddress() {
        var newAddress = document.getElementById('address_input').value;
        // TODO: 수정된 주소를 서버로 전송하여 DB에 업데이트합니다.
        // AJAX를 사용하여 서버에 업데이트 요청을 보내고 응답을 처리하는 코드를 작성하세요.
            $.ajax({
                type: "post",
                url: "",
                async: true,
                data: {"newAddress" : newAddress},
                success: function(data) {
                    if (data === "ok") {
                        alert("주소 수정 완료");
                        window.location.href = "customer_info";
                    } else if (data === "no") {
                        alert("수정 실패");
                    }
                },
                error: function(xhr, textStatus, errorThrown) {
                    alert("오류 발생");
                }
            });         
    }

    
</script>
</head>
<body>
<hr>
	<table align="center" width="600px">
	<caption>마이페이지</caption>
		<tr>
			<th>아이디</th>
			<td><hr>${dto.member_id }</td>
		</tr>			
		<tr>
			<th>이름</th>
			<td><hr>${dto.member_name }</td>
		</tr>			
		<tr>
		    <th>전화번호</th>
		    <td id="newPhoneNumber"><hr>${dto.member_phone_number }</td>
		    <td><hr> <a href="#" onclick="modifyPhoneNumber()">전화번호 수정</a> </td>
		</tr>
		<tr id="phone_number_row" style="display: none;">
		    <td colspan="3" align="center">
		        <input type="text" id="phone_number_input" style="width: 300px;">
		        <button onclick="savePhoneNumber()">저장</button>
		    </td>
		</tr>					
		<tr>
		    <th>주소</th>
		    <td><hr>${dto.member_address }</td>
		    <td><hr> <a href="#" onclick="modifyAddress()">주소 수정</a> </td>
		</tr>
		<tr id="address_row" style="display: none;">
		    <td colspan="3" align="center">
		        <input type="text" id="address_input" style="width: 300px;">
		        <button onclick="saveAddress()">저장</button>
		    </td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><hr>${dto.member_birthday }</td>
		</tr>			
		<tr>
			<th>포인트</th>
			<td><hr>${dto.member_point }</td>
		</tr>			
		<tr>
			<th>구입금액</th>
			<td><hr>${dto.member_buy}</td>
		</tr>
		<tr>
			<td colspan="3" align="right"><hr> <a href="#" onclick="exitcheck()">회원탈퇴</a> </td>
		</tr>			
	</table>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		window.onload = function(){
		    document.getElementById("address_input").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("address_input").value = data.address; // 주소 넣기
		            }
		        }).open();
		    });
		}
	</script>
</body>
</html>