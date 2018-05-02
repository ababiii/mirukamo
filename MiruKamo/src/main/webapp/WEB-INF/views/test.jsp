<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta property="og:type" content="website">
<meta property="og:url" content="http://japan.siwonschool.com/?&utm_source=naverjapan&utm_medium=cpc&utm_content=%C0%CF%B9%DD%B4%EB%C7%A5A&utm_campaign=siwonschool&NaPm=ct%3Djgc1mlbs%7Cci%3D0zu0000VEbPo%5FjM8jKNG%7Ctr%3Dsa%7Chk%3Db244bd38d400eab3a67b65e8c0f973768e0039c3">
<meta property="og:image" content="http://img.siwonschool.com/japan/200x200.png">
<meta name="twitter:image" content="http://img.siwonschool.com/japan/400x400.png">
<meta name="twitter:card" content="summary">
<meta name="twitter:url" content="http://japan.siwonschool.com/?&utm_source=naverjapan&utm_medium=cpc&utm_content=%C0%CF%B9%DD%B4%EB%C7%A5A&utm_campaign=siwonschool&NaPm=ct%3Djgc1mlbs%7Cci%3D0zu0000VEbPo%5FjM8jKNG%7Ctr%3Dsa%7Chk%3Db244bd38d400eab3a67b65e8c0f973768e0039c3">

<title>test</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport" content="width=1200">
<link rel="apple-touch-icon-precomposed"  href="http://img.siwonschool.com/japan/56x56.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://img.siwonschool.com/japan/114x114.png" />
<link type="text/css" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css?t=0" rel="stylesheet">
<link type="text/css" href="resources/css/japan_style.css?1524476367" rel="stylesheet">
<script type="text/javascript" src="resources/jQuery/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resources/jQuery/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if(${joinComplete==true}){
		alert('会員加入を完了しました。');
	}
	
	if(${result==1}){
		alert('비밀번호 변경이 완료되었습니다.');
	}
});
</script>
</head>
<body class="main">


<div class="topban closed">
    <div class="bt_topban position"><div class="w1000 position"></div></div>
</div>

<jsp:include page="menu.jsp" flush="true"/>


<!-- 레이어팝업(국가브랜드만족도1위) -->
<style type="text/css">
#award_kbsa_Layer{width:480px}
#award_kbsa_Layer .bt_close{position:absolute;right:0;top:-43px;width:34px;height:34px;text-indent:-999em;background:url(//img.siwonschool.com/comm/close_34x34_white.png) no-repeat}
</style>
<div class="wrap_layer_popup" id="award_kbsa_Layer">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<img src="//img.siwonschool.com/japan/main/pop_award_kbsa.jpg" alt="2017 대한민국 브랜드 만족도 1위" />
</div>
<!--// 레이어팝업(국가브랜드만족도1위) -->

<!-- 레이어팝업(2018국가브랜드대상) -->
<style type="text/css">
#award_nba_Layer{width:500px}
#award_nba_Layer .bt_close{position:absolute;right:0;top:-43px;width:34px;height:34px;text-indent:-999em;background:url(//img.siwonschool.com/comm/close_34x34_white.png) no-repeat}
</style>
<div class="wrap_layer_popup" id="award_nba_Layer">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<img src="//img.siwonschool.com/japan/main/pop_award_nba2018.jpg" alt="2018 국가브랜드 대상 수상!" />
</div>
<!--// 레이어팝업(2018국가브랜드대상) --><script type="text/javascript" src="/module/examplayer/js/starplayer_config.js"></script>
<script type="text/javascript" src="/module/examplayer/js/starplayer.js"></script>
<script type="text/javascript" src="/module/examplayer/js/starplayer_popup.js"></script>
<script type="text/javascript" src="/module/examplayer/js/starplayer_play.js"></script>
<script type="text/javascript" src="resources/jQuery/imgLiquid-min.js"></script>

<div id="siwon_container" class="main_section">
	<input type="hidden" name="mode" value=""/>
	<div class="wrap_visual">
		<div class="box_visual sl">
			<ul>
				<li class="s1" style="background:#fcfbe9"><div class="w2000"><a href="/?s=event&p=pkg_allkill" target="_blank" onClick="FnUpdateRightBanner('4179');"><img src="resources/images/teacher.png" alt="올킬 패키지"/></a></div></li><li class="s2" style="background:#eaeaec"><div class="w2000"><a href="javascript:;" target="_blank" onClick="FnUpdateRightBanner('4077');"><img src="resources/images/main2.png" alt="일본어 365 패키지"/></a></div></li><li class="s3" style="background:#1d2144"><div class="w2000"><a href="http://japan.siwonschool.com/?s=event&p=pkg_teacher" target="_blank" onClick="FnUpdateRightBanner('4078');"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/19/bimg_src_1521439607.jpg" alt="선생님 마니아패스"/></a></div></li><li class="s4" style="background:#f9f8f4"><div class="w2000"><a href="http://japan.siwonschool.com/?s=event&p=tab" target="_blank" onClick="FnUpdateRightBanner('4079');"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/19/bimg_src_1521439645.jpg" alt="일본어탭"/></a></div></li>			</ul>
		</div>

	</div>
	

	<!-- 우측 퀵배너(원형) -->
	<style type="text/css">
		#qmenu_comm{z-index:51;position:absolute;right:50%;top:414px;display:none;margin-right:-750px;width:200px}
		#qmenu_comm ul{width:198px;height:88px}
		#qmenu_comm li{position:absolute;left:0;top:0;display:none}
		#qmenu_comm li:first-child{display:block}
		#qmenu_comm li a{overflow:hidden;position:relative;display:block;}
		#qmenu_comm li img{width:100%}
		#qmenu_comm .txt_dday{position:absolute;left:0;bottom:0;display:inline-block;width:100%;height:40px;text-align:center;line-height:34px;font-size:18px;font-weight:bold;color:#fff;background:#000}		
		#qmenu_comm p.ck{padding-top:2px;text-align:center}
		#qmenu_comm p.ck label{display:inline-block;height:14px;padding-left:18px;line-height:12px;cursor:pointer;color:#000;background:url(//img.siwonschool.com/japan/comm/chbox_h14.png) no-repeat left top}
		#qmenu_comm p.ck label.checked{background-position:left bottom}
	</style>
	<script>
		$(function(){
			// 오늘 하루 열지 않기
			var qmenu1 = $('#qmenu_comm');
			if( $.cookie('ev_qmenu1') != '1'){
				qmenu1.show();
			}
			$('.bt_close', qmenu1).live('click',function(){
				qmenu1.fadeOut();
			});
			$('#floating_cls1day', qmenu1).live('click',function(){
				$.cookie('ev_qmenu1','1',{expires: 1});
				qmenu1.fadeOut();
			});
			// 퀵메뉴 고정
			//qmenuComm(10);
			//$(window).scroll(function(){ qmenuComm(10); });
			// 자동롤링
			if( $("#qmenu_comm li").length > 1 ){
				var banRol = $("#qmenu_comm li").length;
				var countRol = 0;
				setInterval(function(){
					$("#qmenu_comm li:eq("+countRol+")").fadeOut();

					if( countRol == banRol - 1 ) countRol = 0;
					else countRol++;
					$("#qmenu_comm li:eq("+countRol+")").fadeIn();
				}, 3000);
			}
		});
	</script>
	<div class="ban_quick" id="qmenu_comm"><div class="qban">
		<ul>
						<li>
					<!-- <img usemap="#float_map_4363" src="http://data.siwonschool.com/banner/img/japan/2018/04/05/bimg_src_1522907339.jpg" alt="패키지 비교하기" /> -->
					<map name="float_map_4363" id="float_map_4363">
					<area shape="rect" coords="185,0,200,15" href="javascript:;" onClick="$('#qmenu_comm').hide();">
					<!-- <area shape="rect" coords="0,0,200,92" href="http://japan.siwonschool.com/?s=event&p=comparepack" target="_blank" > -->
					</map>
			</li>
						<li>
					<!-- <img usemap="#float_map_4095" src="http://data.siwonschool.com/banner/img/japan/2018/03/20/bimg_src_1521526309.jpg" alt="일본어소식통" /> -->
					<map name="float_map_4095" id="float_map_4095">
					<area shape="rect" coords="185,0,200,15" href="javascript:;" onClick="$('#qmenu_comm').hide();">
					<!-- <area shape="rect" coords="0,0,200,92" href="http://japan.siwonschool.com/?s=community" target="_blank" > -->
					</map>
			</li>
					</ul>
	</div></div>
	<!-- 우측 퀵배너(원형) -->

</div>




</body>
</html>
