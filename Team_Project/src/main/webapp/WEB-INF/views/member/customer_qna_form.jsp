<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.container {
    font-family: 'KOTRA_BOLD-Bold';
}

@font-face {
    font-family: 'KOTRA_BOLD-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h1>Q&A</h1>
  <p> <strong>사용자가 자주 하는 질문 TOP 5</strong> </p>
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"> <strong>Q </strong>아이디와 패스워드를 분실했어요 </a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse">
        <div class="panel-body">사이트 왼쪽 상단에 있는 "Menu" 클릭 후 "사용자 로그인" 클릭하시면 "아이디 찾기/비밀번호 찾기"를 이용해주시기 바랍니다. <br>
		"마이페이지" > "패스워드 수정" 에서 원하시는 비밀번호로 수정하실 수 있습니다.
		<br> 아이디, 비밀번호 찾기가 원활하지 않을 경우 온라인몰 대표번호()에 문의 부탁드립니다. </div>
      	</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"> <strong>Q </strong>회원 탈퇴를 하고 싶어요 </a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">쇼핑몰 로그인 후 홈페이지 오른쪽 상단의 "마이페이지" > "회원탈퇴" 메뉴를 이용하시면 됩니다. <br>
		회원탈퇴를 하신 경우에는 구매내역 및 보유하고 계신 포인트는 자동 소멸되며 회원제 서비스에 대한 모든 혜택은 더이상 이용하실 수 없으니 유의바랍니다. <br>
		쇼핑몰 고객센터내에서 탈퇴 신청 또는 온라인몰 대표번호 () 으로 전화주셔서 요청해 주시면 됩니다  </div>
     	</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"> <strong>Q </strong>회원 정보를 변경하고 싶어요 </a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">변경하실 정보는 상단 "마이페이지" > "마이페이지" > "회원정보수정" 에서 수정이 가능합니다. <br>
		아이디는 변경하실 수 없으며, 부득이하게 변경을 원하실 경우는 탈퇴 후 재가입 하셔야 하고 탈퇴 시에는 포인트 등 <br> 기존 회원등급과 관련한 정보가 자동소멸 되는점 유의 부탁드립니다.  </div>
      	</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4"><strong>Q </strong>회원탈퇴 후 재가입시 포인트를 옮겨주나요? </a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse">
        <div class="panel-body">
		회원탈퇴와 동시에 포인트는 자동소멸되기 때문에 재가입하더라도 이동/복구되지 않습니다.  </div>
     	</div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5"><strong>Q </strong>포인트 적립은 어떻게 하나요? </a>
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body">공식몰 회원 구매 시에만 결제금액의 5%를 포인트로 적립해드리고 있습니다. (비회원 구매 시 적립 불가 / 구매확정 후 적립) <br>
		구매확정 후 리뷰 작성 시 포토 후기 5,000원, 설문조사 완료하면 3,000원 포인트가 적립됩니다. <br> </div>
      	</div>
    </div>
  </div> 
</div>

</body>
</html>