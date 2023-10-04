<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko-KR"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EZEN CAMPING</title>
    <script type="text/javascript" src="/js/netfunnel.js" charset="UTF-8"></script>
</head>

<body>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 상단 문자 -->
    <title>EZEN CAMPING</title>
    <style>
        *{ padding:0; margin:0;}
        @font-face {
            font-family: 'agPro';
            font-style: normal;
            font-weight: 300;
            src: local('AGaramondPro-Regular'), url(/resources/fonts/AGaramondPro-Regular.woff2) format('woff2'), url(/resources/fonts/AGaramondPro-Regular.woff) format('woff')
        }
        html ,body {
            height:100%;
            font-family: 'agPro', sans-serif;
        }
        ul,ol,li {
            list-style: none;
        }
        .intro-wrap .logo{
            position: absolute;
            z-index: 99;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            -webkit-transform: translateX(-50%);
        }
        .intro-wrap .logo img{
            height: 50px;
        }
        .thumbnail-wrap{
            position: relative;
        }
        .thumbnail {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
        }
        .thumbnail li{
            width: 50%;
            position: relative;
            height: 100vh;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 50%;
            cursor: pointer;
        }
        .thumbnail li.click{
            width: 100%;
            position: absolute;
            z-index: 100;
            transition: width 1s;
        }
        .thumbnail li.brand{
            float: left;
            /* 왼쪽 이미지 */
            background-image: url(https://www.snowpeak.co.kr/updata/image_main/snowpeak_left.jpg);
        }
        .thumbnail li.store{
            float: right;
            /* 우측이미지 이미지 */
            background-image: url(https://www.snowpeak.co.kr/updata/image_main/snowpeak_right.jpg);
        }
        .thumbnail li.no .blur, .thumbnail li.click .blur{
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }
        .thumbnail li .blur{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(0px);
            -webkit-backdrop-filter: blur(0px);
            transition: all 0.5s;
        }
        .thumbnail li .cont{
            position: absolute;
            top: 37%;
            width: 100%;
            max-width: 585px;
            text-align: center;
            opacity: 1;
        }
        .thumbnail li.click .cont{
            opacity: 0;
        }
        .thumbnail li.brand .cont{
            right: 0;
        }
        .thumbnail li.store .cont{
            left: 0;
        }
        .thumbnail li .title{
            color: #fff;
            font-size: 44px;
            line-height: 60px;
            letter-spacing: 0.06em;
            text-shadow: 0px 3px 20px rgba(0,0,0,0.4);
            font-family: 'agPro', sans-serif;
            margin-bottom: 56px;
            opacity: 1;
            transition: opacity 0.5s;
        }
        .thumbnail li.no .title{
            opacity: 0;
        }
        .thumbnail li .cont p.more{
            font-size: 15px;
            display: block;
            font-family: 'pretendard Variable', sans-serif;
            color: #eee;
            padding: 17px 32px;
            border: 1px solid #ccc;
            margin: auto;
            width: 100%;
            max-width: 340px;
            text-align: left;
            background: url(/resources/images/main/icn_arrow.svg) no-repeat center right 32px;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.5s;
        }
        .thumbnail li.store .cont p.more{
            border-color: #eee;
            color: #fff;
        }
        .thumbnail li.act .cont p.more{
            opacity: 1;
            pointer-events: auto;
        }
        .copy_wrap{
            position: absolute;
            bottom: 58px;
            text-align: center;
            width: 100%;
        }
        .copy{
            color: #ddd;
            font-size: 16px;
            font-family: 'agPro', sans-serif;
            letter-spacing: 0.06em;
        }
        .copy_g{
            display: none;
        }
        @media screen and (max-width: 920px){
            .intro-wrap .logo{
                top: 32px;
            }
            .intro-wrap .logo img{
                height: 30px;
            }
            .thumbnail li{
                width: 100%;
                height: 580px;
            }
            .thumbnail li.click{
                transition: height 1s;
            }
            .thumbnail li .cont{
                bottom: 0;
                top: unset;
                z-index: 1;
                text-align: left;
                padding: 0 25px;
            }
            .thumbnail li.store .cont{
                bottom: 38px;
            }
            .thumbnail li.brand .cont{
                left: 0;
            }
            .thumbnail li .title{
                font-size: 26px;
                line-height: 36px;
                margin-bottom: 38px;
            }
            .thumbnail li .cont p.more{
                display: none;
            }
            .copy_wrap{
                bottom: 0;
            }
            .copy{
                border-top: 1px solid #555;
                padding: 11px 0;
                margin: 0 25px;
                text-align: center;
                position: relative;
                z-index: 1;
                font-size: 12px;
                letter-spacing: 0.032em;
                color: #bbb;
            }
            .copy_g{
                display: block;
                position: absolute;
                bottom: 0;
                width: 100%;
                background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(0,0,0,1) 30%, rgba(255,255,255,0) 100%);
                height: 108px;
            }
        }
        @media screen and (max-width: 447px){
            .thumbnail li.brand{
                background-image: url(https://www.snowpeak.co.kr/updata/image_main/snowpeak_left_m.jpg);
            }
            .thumbnail li.store{
                background-image: url(https://www.snowpeak.co.kr/updata/image_main/snowpeak_right_m.jpg);
            }
        }
        
    </style>


    <div class="intro-wrap">
        <h1 class="logo">
        <!-- 상단 logo -->
            <img src="/view1002/pokeimage/피카츄.png" alt="EZEN CAMPING">
        </h1>
        <div class="thumbnail-wrap">
            <ul class="thumbnail">
                <li class="brand">
                    <div class="blur"></div>
                    <div class="cont">
                    <!-- 좌측 글자 -->
                        <p class="title">Outdoor Life Value<br>Apparel &amp; Camp</p>
                        <p class="more">자세히 보기</p>
                    </div>
                </li> 
                <li class="store">
                    <div class="blur"></div>
                    <div class="cont">
                    <!-- 우측 글자 -->
                        <p class="title">Outdoor Life Active<br>Apparel</p>
                        <p class="more">자세히 보기</p>
                    </div>
                </li>
            </ul>
            <div class="copy_wrap">
                <div class="copy_g"></div>
                <!-- 하단글자 -->
                <div class="copy">EZEN CAMPING Inc.</div>
            </div>
        </div>
    </div>

<script>
    $(document).ready(function(){
            $('.thumbnail li').on({
                mouseenter: function(){
                    if($(window).width() > 920){
                        if(!$(this).hasClass('click')){
                            $(this).addClass('act');
                            $(this).siblings().addClass('no')
                        }
                    }
                },
                mouseleave: function(){
                    if($(window).width() > 920){
                        $(this).removeClass('act');
                        $(this).siblings().removeClass('no');
                    }
                },
                click: function(){
                    $(this).addClass('click')
                    if($(window).width() > 920){
                        $(this).removeClass('act')
                        if($(this).hasClass('brand')){
                            $(this).css('left','0');
                            $(this).siblings().css('right','0');
                            $('.thumbnail').css('justify-content','flex-end')
                            setTimeout(function(){
                                location.href = '/##';
                            }, 1000)
                        }
                        else{
                            $(this).css('right','0');
                            $(this).siblings().css('left','0');
                            setTimeout(function(){
                                location.href = '##';
                            }, 1000)
                        }
                    }
                    else{
                        $('.thumbnail').css({'height':'100vh'})
                        if($(this).hasClass('brand')){
                            $(this).siblings().css({'bottom':'0', 'position':'absolute'})
                            $(this).css('height','100vh')
                            setTimeout(function(){
                                location.href = '/##';
                            }, 1000)
                        }
                        else{
                            $(this).css({'height':'100vh', 'bottom':'0'})
                            setTimeout(function(){
                                location.href = '##';
                            }, 1000)
                        }
                    }
                }
            })
    })
</script>

</body></html>