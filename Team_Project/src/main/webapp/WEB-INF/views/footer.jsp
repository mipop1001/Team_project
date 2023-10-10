<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.footer-wrapper {
    margin-bottom: 40px;
    overflow: hidden;
    @media screen and (max-width: 920px)
}
.brand-main .footer-wrapper .contact {
    background-color: #000;
    color: #fff;
    width: 100%;
}
.contact-box {
    max-width: 1280px;
    display: flex;
    margin: 0 auto;
    padding: 44px 0;
}
.right1 {
    width: 50%;
    padding-left: 95px;
    border-left: 1px solid #404040;
    display: flex;
    flex-direction: column;
}
.left1 {
    width: 50%;
    padding-left: 49px;
    display: flex;
}
.about {
    display: flex;
}

.contact {
    background-color: #000;
    color: #fff;
    width: 100%;
}
.sns-wrapper {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    padding: 10px 10px;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    background-color: #fff;
}
.footer-outer {
    background-color: #EFEFEF;
}
.right2 {
    display: flex;
    flex-wrap: wrap;
    width: 52%;
    position: relative;
    top: 13px;
    padding-left: 52px;
    padding-right: 62px;

}
.sev {
    padding-left: 52px;
    padding-right: 62px;
}

사용자 에이전트 스타일시트
body {
    line-height: 1;
}
:root {
    --swiper-navigation-size: 44px;
}
:root {
    --swiper-theme-color: #007aff;
}
p.tit {
    font-size: 34px;
    font-family: "cg", sans-serif;
    line-height: 43px;
    letter-spacing: 0.05em;
}
p.sub {
    font-family: "Nanum Myeongjo", sans-serif;
}

.right2 p {
    margin-right: 20px;
}
.downleft {
    width: 50%;
    padding-left: 28px;
    color: #696969;
    font-size: 14px;
    line-height: 22px;
    z-index: 10;
    border-left: 0;
}
.downright {
    width: 50%;
    padding-left: 28px;
    color: #696969;
    font-size: 14px;
    line-height: 22px;
    z-index: 10;
    border-left: 0;
    padding-left: 0;
    display: flex;
}
.footer {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    width: 100%;
    max-width: 1170px;
    margin: 0 auto;
    padding: 40px 0;
    z-index: 10;
}
.downrightleft{
    width: 50%;
    border-left: 1px solid #fff;
    padding-left: 46px;
}

.downrightright{
    width: 50%;
    border-left: 1px solid #fff;
    padding-left: 46px;
}
.about {
    display: flex;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<footer>
<div class="footer-wrapper">
			<div class="contact">
				<div class="contact-box">
					<div class="left1">
						<div class="left2">
							<p class="tit">CONTACT</p>
							<p class="sub">문의</p>
						</div>
						<div class="right sev">
							<div class="phone">
								<p class="tit">1666-6666</p>
								<p>문의시간 / 10:00 ~ 17:00</p>
							</div>
							<p>토, 일, 공휴일의 문의 및 <br class="mo_event">상품 발송은 쉬고있습니다.</p>
							<div class="num">
								<p>USER SEVICE: 02-1234-1234</p>
								<p>ONLINE STORE: 02-4321-4321</p>
							</div>
						</div>
					</div>
					<div class="right1">
						<div class="about">
							<div class="left3">
								<p class="tit">ABOUT</p>
								<p class="sub">우리에 관하여</p>
							</div>
							<div class="right2">
								<p><a href="####">회사소개</a></p>
								<p><a href="####">연혁</a></p>
								<p><a href="####">인재채용</a></p>
								<p><a href="####">제휴문의</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /contact +end+ -->

			<div class="footer-outer">
				<div class="footer">
					<div class="downleft">
						<p>Ezen Camping 대표이사: 이젠가</p>
						<p>경기도 수원시 팔달구 덕영대로 899 3F</p>
						<p>FAX: 02-1234-4321 <span class="pc_event">|</span> <br class="mo_event">E-mail: Ezencamping@Camping.co.kr</p>
						
					</div>
					<div class="downright">
						<div class="downrightleft">
							<p>통신판매번호: 2023-태초마을-0001</p>
							<p>사업자 등록번호: 131-11-12321</p>
							<p class="pc_event"><a href="###">사업자 정보 확인</a></p>
						</div>
						<div class="downrightright">
							<p class="mo_event"><a href="###">사업자 정보 확인</a></p>
							<p><a href="###">개인정보처리방침</a></p>
							<p><a href="###">이용약관</a></p>
						</div>
					</div>
				</div>
			</div>
			<div class="sns-wrapper">
				<a href="http://instagram.com/"><img src="C:\자바\ezen\project\Team_Project\Team_Project\src\main\webapp\image_etc\icon_instagram_fot_re.svg"></a>
				<a href="https://www.facebook.com/"><img src="C:\자바\ezen\project\Team_Project\Team_Project\src\main\webapp\image_etc\con_facebook_fot_re.svg"></a>
				<a href="http://www.youtube.com/"><img src="C:\자바\ezen\project\Team_Project\Team_Project\src\main\webapp\image_etc\icon_youtube_fot_re.svg"></a>
			</div>
			<div class="copyright" align="center">
				© 2023 Ezen Camping Inc.
			</div>
			<!-- /footer +end+ -->
		</div>
</footer>
</html>