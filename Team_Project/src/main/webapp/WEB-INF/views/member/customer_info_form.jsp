<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.save_btn{
	height: 35px;
    width: 75px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 16px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    margin-left: 20px;
    margin-top: 10px;
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}
.modify_btn{
	height: 35px;
    width: 120px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 14px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    margin-left: -20px;
    margin-top: 10px;
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}
.point_btn{
	height: 35px;
    width: 120px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 16px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    margin-left: -20px;
    margin-top: 10px;
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}
.member_out_btn{
height: 52px;
    width: 75px;
    padding: 0 10px 0 10px;
    color: #ffffff;
    font-size: 16px;
    border: 1px solid #323437;
    background: #323437;
    text-align: center;
    font-weight: bold;
    line-height: 1.5;
    margin-left: 20px;
    margin-top: 10px;
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
	var PasswordInputVisible = false;
	
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
        // 입력란이 비어있는지 확인
        if (newAddress) {
            $.ajax({
                type: "post",
                url: "customer_address_modify",
                async: true,
                data: {"newAddress": newAddress},
                success: function (data) {
                    if (data === "ok") {
                        alert("주소 수정 완료");
                        window.location.href = "customer_info";
                        // 수정 입력란을 숨김
                        document.getElementById('address_row').style.display = 'none';                        
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

    function modifypassword() {
        if (!PasswordInputVisible) {
            document.getElementById('password_row').style.display = 'table-row';
            document.getElementById('password_input').value = '${dto.member_password}';
        } else {
            document.getElementById('password_row').style.display = 'none';
        }
        PasswordInputVisible = !PasswordInputVisible;
    }

    function savepassword() {
        var newPassword = document.getElementById('password_input').value;
        // 입력란이 비어있는지 확인
        if (newPassword) {
            $.ajax({
                type: "post",
                url: "customer_password_modify",
                async: true,
                data: {"newPassword": newPassword},
                success: function (data) {
                    if (data === "ok") {
                        alert("패스워드 수정 완료");
                        window.location.href = "customer_info";
                        // 수정 입력란을 숨김
                        document.getElementById('password_row').style.display = 'none';                        
                    } else if (data === "no") {
                        alert("수정 실패");
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    alert("오류 발생");
                }
            });
        } else {
            alert("패스워드를 입력해 주세요");
        }

    }  
    
    function updatePoint() {
		$.ajax({
			type: "post",
			url: "customer_point_update",
			async: true,
            success: function (data) {
                if (data === "ok") {
                    alert("포인트 업데이트 완료");
                    window.location.href = "customer_info";
                } else if (data === "no") {
                    alert("포인트 업데이트 실패");
                }
            },
            error: function (xhr, textStatus, errorThrown) {
                alert("오류 발생");
            }
		});
	}
</script>
</head>
<body>
<hr>
	<table align="center" width="600px">
		<div class="page_name">
			<H2>마이페이지</H2>
		</div>
		<tr>
			<th>아이디</th>
			<td><hr>${dto.member_id }</td>
		</tr>			
		<tr>
			<th>패스워드</th>
			<td><hr>${dto.member_password }</td>
			<td><input type="button" onclick="modifypassword()" class="modify_btn" value="패스워드 수정"></td>
		</tr>
		<tr id="password_row" style="display: none;">
		    <td colspan="3" align="center">
		        <input type="text" id="password_input" style="width: 300px;">
		        <input type="button" onclick="savepassword()" class="save_btn" value="저장">
		    </td>
		</tr>			
		<tr>
			<th>이름</th>
			<td><hr>${dto.member_name }</td>
		</tr>			
		<tr>
		    <th>전화번호</th>
		    <td><hr>${dto.member_phone_number }</td>
		    <td><input type="button" onclick="modifyPhoneNumber()" class="modify_btn" value="전화번호 수정"></td>
		</tr>
		<tr id="phone_number_row" style="display: none;">
		    <td colspan="3" align="center">
		        <input type="text" id="phone_number_input" style="width: 300px;">
		        <input type="button" onclick="savePhoneNumber()" class="save_btn" value="저장">
		    </td>
		</tr>					
		<tr>
		    <th>주소</th>
		    <td><hr>${dto.member_address }</td>
		    <td><input type="button" onclick="modifyAddress()" class="modify_btn" value="주소 수정"> </td>
		</tr>
		<tr id="address_row" style="display: none;">
		    <td colspan="3" align="center">
		        <input type="text" id="address_input" style="width: 300px;">
		        <input type="button" onclick="saveAddress()" class="save_btn" value="저장">
		    </td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><hr>${dto.member_birthday }</td>
		</tr>			
		<tr>
			<th>포인트</th>
			<td><hr>${dto.member_point }</td>
			<td><input type="button" onclick="updatePoint()" class="point_btn" value="포인트 업데이트"></td>
		</tr>			
		<tr>
			<th>구입금액</th>
			<td><hr>${dto.member_buy}</td>
		</tr>
		<tr>
			<td colspan="3" align="right"><hr><input type="button" onclick="exitcheck()" class="member_out_btn" value="회원탈퇴">  </td>
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