<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>시원스쿨 일본어</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="apple-mobile-web-app-title" content="시원스쿨 일본어">
<meta name="viewport" content="width=1200">
<link href="http://img.siwonschool.com/japan/favicon.ico" rel="shortcut icon">
<link rel="apple-touch-icon-precomposed"  href="http://img.siwonschool.com/japan/56x56.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://img.siwonschool.com/japan/114x114.png" />
<link type="text/css" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css?t=0" rel="stylesheet">
<link type="text/css" href="../resources/css/japan_style.css?1525015568" rel="stylesheet">
<script type="text/javascript" src="../resources/js/teachers/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../resources/js/teachers/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resources/js/teachers/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="../resources/js/teachers/jquery.cookie.js"></script>
<script type="text/javascript" src="../resources/js/teachers/japan_script.js?1525015568"></script>
<script type="text/javascript" src="../resources/js/teachers/flashView.js?1525015568"></script>
<script type="text/javascript" src="../resources/js/teachers/imgLiquid-min.js"></script>
<script type="text/javascript" src="module/products/products.js?1525015568"></script>
<script language="javascript" src="https://pgweb.uplus.co.kr/WEB_SERVER/js/escrowValid.js"></script>
</head>

<body class="">
<jsp:include page="menu.jsp" flush="true" />



<!-- 레이어팝업(국가브랜드만족도1위) -->
<style type="text/css">
#award_kbsa_Layer{width:480px}
#award_kbsa_Layer .bt_close{position:absolute;right:0;top:-43px;width:34px;height:34px;text-indent:-999em;background:url(//img.siwonschool.com/comm/close_34x34_white.png) no-repeat}
</style>
<div class="wrap_layer_popup" id="award_kbsa_Layer">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<img src="//img.siwonschool.com/japan/main/pop_award_kbsa.jpg" alt="2017 대한민국 브랜드 만족도 1위" />
</div>
<script type="text/javascript" src="<c:url value = "/resources/jQuery/imgLiquid-min.js"/>"></script>
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
</div>
<style type="text/css">
	#floating_Layer{position:relative;width:650px;height:750px;background:none}
	#floating_Layer .popcls{position:absolute;top:15px;right:0;display:inline-block;width:34px;height:34px;background:url(//img.siwonschool.com/comm/close_34x34_white.png) 0 0 no-repeat;text-indent:-99999px}
	#floating_Layer .movie{position:absolute;top:274px;left:42px}
</style>
<div class="wrap_layer_popup" id="floating_Layer" style="display:none;">
	<a href="javascript:void(0)" onclick="stop_float_video(); layerPopClose();" class="popcls">닫기</a>
	<img src="//img.siwonschool.com/japan/banner/layer_shdw24.png" usemap="#layer_shdw24" alt="일본어 끝장패키지"/>
	<div class="movie" onclick="this.nextElementSibling.style.display='block';this.style.display='none'">
	   <img src="//img.siwonschool.com/japan/banner/layer_shdw24_mov.jpg" style="cursor:pointer" />
	</div>
	<div class="movie" style="display:none">
		<iframe class="float-video" src="https://www.youtube.com/embed/PszmR6Et6Mg?enablejsapi=1&playerapiid=ytplayer1" frameborder="0" width="567px" height="312px" allowfullscreen></iframe>
	</div>
	<map name="layer_shdw24">
		<area shape="rect" coords="42,274,610,585" href="/?s=event&p=endpack2018" alt="조세호 영상" />
		<area shape="rect" coords="0,665,650,750" href="/?s=community&b=event&m=view&sno=169" alt="감상평 쓰고 조세호 친필사인 도서 받기!" />
	</map>
</div>

<script type="text/javascript">
function floatban_movie(){
	$('.float-video').attr("src","https://www.youtube.com/embed/PszmR6Et6Mg?enablejsapi=1&playerapiid=ytplayer1&autoplay=1");
	layerPopId('floating_Layer');
}

function stop_float_video(){
	$('.float-video')[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
}
</script>


	
		<!-- 패밀리배너 : 유럽어, 아시아어 공통 -->
<script type="text/javascript">
$(function(){
	// 탭 메뉴 상단 고정
	var tmenuTop = $('.wrap_navi').offset().top;
	$(window).scroll(function(){
		var scrTop = $(window).scrollTop();
		if( scrTop>tmenuTop ) $('.wrap_navi').addClass('fixed');
		else $('.wrap_navi').removeClass('fixed');
	});

	// 위치에 따라 탭 활성화(탭 구역 별 위치)
	count = $('.tab_cate').length;
	posiBoxTop = new Array();
	var fixTop = $('.wrap_navi').height();
	$(window).scroll(function(){ // 스크롤 시 $(window).scrollTop() 위치에 따라 탭 변경
		for( var i = 0; i < count; i++ ){
			posiBoxTop[i] = $('.tab_cate:eq('+i+')').offset().top - fixTop;
			if( $(window).scrollTop()>posiBoxTop[i] ){
				$('.wrap_navi li').removeClass('on');
				$('.wrap_navi li').eq(i).addClass('on');
			}
		}
	});

	//체크박스 체크에 다른 총액 변화
	$(".apply_area_comm1 input:checkbox").click(function(){
		var total = 0;
		$(".ck_list input:checked").each(function(){
			if($(this).prop("checked")){
				total += parseInt($(this).attr("data-price"));
				console.log(total);
			}
		});

		if(total<=0){//체크된 항목이 없는경우, 기본상품(.basic_ck)의 가격으로 표기
			total = $("input.basic_ck").attr("data-price");
		}

		$(".final_price strong").html(addcomma(total));
	});

});
</script>
<div id="siwon_container" class="prod_sec detail">
	<div class="sec_main"><div class="inner_container2"><div class="inner">
		<span class="img_t"><img src="http://data.siwonschool.com/products/detail_thumb/1515742366811080.png" alt="" /></span>
		<h3>New 일본어 왕초보 탈출 1탄<span>최유리 선생님</span><em><font color="#ff6d6d"><b> · New 일본어 왕초보 탈출 1탄 구입 시 Original 강의도 함께 제공</font></b><br>
일본어의 기본뼈대를 탄탄하게 잡아라! <br>
히라가나를 몰라도 일본어로 말문이 트이는 왕초보를 위한 일본어 말하기  강의
</em></h3>
		<div class="wrap_info1" id="products_list_tpl">
							<div class="fl"><a href="javascript: void(0);" onclick="movieshow('/japan/sample/001497_00.flv','','680','403',false)"><span class="th"><img src="http://data.siwonschool.com/products/movie_thumb/1517289209952649.jpg" alt="영상 썸네일" /></span></a></div>
						<div class="apply_area_comm1 fr" id="area00003834">
					<div class="bt_area_comm">
											<a href="javascript:void(0);" onClick="loginChk();" class="bt_pay">수강신청</a>
										</div>
			</div>
		</div><!--// wrap_info1 -->
		<div class="wrap_info2">
			<ul><li class="l1"><span>강좌구성 : <em class="fc_red">71강</em></span></li><li class="l2"><span>수강기간 : <em class="fc_red">2개월</em></span></li><li class="l3"><span>대상자 : <em class="fc_red">왕초보</em></span></li></ul>
		</div><!--// wrap_info2 -->
		<div class="wrap_review"><div class="inner">
			<ul>
				<li><dl><dd><a href="javascript: void(0);" onclick="scroll_to_anchor('anchor_review')" class="ellipsis con">알기 쉽게 수강생 눈높이에 맞춘 촌철살인의 강의로 많은 실력 향상이 있었습니다. 더 빨리 최유리 선생님을 만나지 못한 것이 아쉬울 정도였습니다. 감사합니다. </a></dd><dd class="sati"><img src="//img.siwonschool.com/japan/community/review_star5.png" alt="★★★★★" /></dd><dd>우재*</dd></dl></li><li><dl><dd><a href="javascript: void(0);" onclick="scroll_to_anchor('anchor_review')" class="ellipsis con">일본출장이 잦아 영어만으로는 늘 부족함을 느끼던 차에 유리센세의 수업을 듣게 되었습니다. 꼭 필요한 일본에 대한 상식과 비즈니스 매너에 대한 수업도 함께 진행해주셔서 좋았습니다. 또한 이제는 일본거래처 직원과도 일본어로 간단한 의사소통이 가능하게 되어 일본출장이 기다려 지기도 합니다. これからも　よろしくお願いします!</a></dd><dd class="sati"><img src="//img.siwonschool.com/japan/community/review_star5.png" alt="★★★★★" /></dd><dd>이**</dd></dl></li><li><dl><dd><a href="javascript: void(0);" onclick="scroll_to_anchor('anchor_review')" class="ellipsis con">독학으로만 일본어를 공부하다가, 최유리선생님을 만나게 되면서 새로운 일본어 세상을 알게 되었습니다. 독학하던 시간에 선생님과 공부했다면 지금쯤 일본어의 달인이 되어 있지 않을까 싶습니다. 앞으로도 선생님의 강의를 응원하겠습니다! 감사합니다!</a></dd><dd class="sati"><img src="//img.siwonschool.com/japan/community/review_star5.png" alt="★★★★★" /></dd><dd>최우*</dd></dl></li>			</ul>
		</div></div><!--// wrap_review -->
	</div></div></div><!--// sec_main -->

		<div class="inner_container2">

		

					<div class="sec_comp tab_cate" id="anchor_comp">
				<h3>강좌구성 - New 일본어 왕초보 탈출 1탄</h3>
				<div class="wrap_tmenu" id="tmenu_comm">
					<ul class="tcon">
						<li style="display:list-item">
							<table class="table2_st2">
								<colgroup><col style="width:90px"/><col style="width:175px"/><col /><col style="width:215px"/></colgroup>
								<thead>
									<tr><th>차시</th><th>강의명</th><th>학습목표</th><th>강의시간</th></tr>
								</thead>
								<tbody>
									<tr><td>OT</td><td>Orientation</td><td class="tl">강좌 소개 및 강좌 커리큘럼 안내</td><td>02:42</td></tr><tr><td>사전1</td><td>히라가나 part1</td><td class="tl">히라가나 50음도를 알고 말할 수 있다</td><td>24:55</td></tr><tr><td>사전2</td><td>히라가나 part2</td><td class="tl">히라가나 탁음과 반탁음을 구분하고 소리내서 말할 수 있다</td><td>22:55</td></tr><tr><td>사전3</td><td>인사하기</td><td class="tl">8가지 상황에서의 기본 일본어 인사말을 말할 수 있다</td><td>14:14</td></tr><tr><td>사전4</td><td>지시어</td><td class="tl">이, 그, 저, 어느에 해당하는 지시어를 알고 말할 수 있다</td><td>11:27</td></tr><tr><td>1강</td><td>만능재주꾼 </td><td class="tl">일본어 명사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>31:24</td></tr><tr><td>2강</td><td>모두가 '예'할 때 </td><td class="tl">일본어 명사의 현재와 과거의 부정문을 말할 수 있다</td><td>28:10</td></tr><tr><td>3강</td><td>내가 바라는 그것 </td><td class="tl">사물을 달라고 부탁하는 표현을 말할 수 있다</td><td>26:30</td></tr><tr><td>4강</td><td>궁금한 건 못참아!</td><td class="tl">우리말 은/는에 해당하는 주격조사를 넣은 문장을 말할 수 있다</td><td>27:17</td></tr><tr><td>5강</td><td>한번 맞춰볼게요!  </td><td class="tl">3가지 의문사를 이용하여 장소와 정보를 묻는 의문문을 말할 수 있다</td><td>21:34</td></tr><tr><td>6강</td><td>만능 재주꾼2 </td><td class="tl">나형용사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>29:32</td></tr><tr><td>7강</td><td>그렇지 않더라구요  </td><td class="tl">나형용사의 현재와 과거의 부정문을 말할 수 있다</td><td>26:47</td></tr><tr><td>8강</td><td>'나'만 믿어 </td><td class="tl">나형용사를 사용하여 명사를 꾸며주는 방법을 알고 문장을 말할 수 있다</td><td>22:51</td></tr><tr><td>9강</td><td>'이'형용사라고 해  </td><td class="tl">이형용사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>31:41</td></tr><tr><td>10강</td><td>조금 특별한 너  </td><td class="tl">이형용사의 현재와 과거의 부정문을 말할 수 있다</td><td>27:07</td></tr><tr><td>11강</td><td>한결같은 너 </td><td class="tl">이형용사를 사용하여 명사를 꾸며주는 방법을 알고 문장을 말할 수 있다</td><td>26:18</td></tr><tr><td>12강</td><td>도와줘! 의문사 어벤져스 </td><td class="tl">4가지 의문사를 사용하여 특정인물을 묻는 의문문을 말할 수 있다</td><td>21:33</td></tr><tr><td>13강</td><td>'가'는 투잡 중 </td><td class="tl">두 가지 문장을 이어주는 역접의 조사를 알고 문장을 말할 수 있다</td><td>24:10</td></tr><tr><td>14강</td><td>한 놈만 판다 </td><td class="tl">특정 조사만을 사용하는 형용사를 알고 문장을 말할 수 있다</td><td>24:18</td></tr><tr><td>15강</td><td>저에겐 없네요 </td><td class="tl">존재동사를 알고 현재와 과거의 부정문을 말할 수 있다</td><td>21:34</td></tr><tr><td>16강</td><td>찾으니까 있었네 </td><td class="tl">존재동사의 현재와 과거의 긍정문을 말할 수 있다</td><td>27:09</td></tr><tr><td>17강</td><td>나 여기 있어요</td><td class="tl">생명체에 사용하는 존재동사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>23:13</td></tr><tr><td>18강</td><td>왜 나만 없어 </td><td class="tl">생명체에 사용하는 존재동사의 현재와 과거의 부정문을 말할 수 있다</td><td>25:56</td></tr><tr><td>19강</td><td>한번 골라봐요 </td><td class="tl">생명체와 무생명체의 존재동사를 구별하여 문장을 말할 수 있다</td><td>28:13</td></tr><tr><td>20강</td><td>어서와,동사는 처음이지? </td><td class="tl">동사의 현재와 과거의 긍정문을 말할 수 있다</td><td>23:56</td></tr><tr><td>21강</td><td>굳은 의지를 보여주지 </td><td class="tl">동사의 현재와 과거의 부정문을 말할 수 있다</td><td>22:02</td></tr><tr><td>22강</td><td>혼자는 외로워</td><td class="tl">동사를 사용하여 권유하는 표현을 알고 문장을 말할 수 있다</td><td>28:10</td></tr><tr><td>23강</td><td>동시에 두 가지를! </td><td class="tl">동시동작에 해당하는 표현을 알고 문장으로 말할 수 있다</td><td>23:42</td></tr><tr><td>24강</td><td>뭐든 이유가 있지</td><td class="tl">목적을 말하는 표현을 알고 문장으로 말할 수 있다</td><td>21:24</td></tr><tr><td>25강</td><td>내 한가지 소원은</td><td class="tl">희망을 말하는 표현을 알고 문장으로 말할 수 있다</td><td>30:07</td></tr><tr><td>26강</td><td>누워서 떡 먹기</td><td class="tl">동작의 편리성을 나타내는 표현을 알고 문장으로 말할 수 있다</td><td>19:48</td></tr><tr><td>27강</td><td>만만한 상대가 아냐</td><td class="tl">동작의 불편함을 나타내는 표현을 알고 문장으로 말할 수 있다</td><td>22:48</td></tr><tr><td>28강</td><td>그것이 알고 싶다</td><td class="tl">육하원칙에 해당하는 6가지 의문사를 알고 의문문으로 말할 수 있다</td><td>28:18</td></tr><tr><td>29강</td><td>너무하네</td><td class="tl">행동의 과함을 나타내는 표현을 알고 문장으로 말할 수 있다</td><td>24:38</td></tr><tr><td>30강</td><td>적당한 게 최고</td><td class="tl">상태의 과함을 나타내는 표현을 알고 문장으로 말할 수 있다</td><td>26:12</td></tr><tr><td>31강</td><td>[복습]만능재주꾼</td><td class="tl">명사의 긍정문을 5분으로 정리하는 핵심 스피드 체크</td><td>02:37</td></tr><tr><td>32강</td><td>[복습]모두가 '예'할 때</td><td class="tl">명사의 부정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:12</td></tr><tr><td>33강</td><td>[복습]내가 바라는 그것</td><td class="tl">요구 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:03</td></tr><tr><td>34강</td><td>[복습]궁금한 건 못참아!</td><td class="tl">주격조사 は를 5분으로 정리하는 핵심 스피드 체크</td><td>03:20</td></tr><tr><td>35강</td><td>[복습]한번 맞춰볼게요!</td><td class="tl">3가지 의문사를 5분으로 정리하는 핵심 스피드 체크</td><td>02:42</td></tr><tr><td>36강</td><td>[복습]만능 재주꾼2</td><td class="tl">나형용사의 긍정문을 5분으로 정리하는 핵심 스피드 체크</td><td>02:31</td></tr><tr><td>37강</td><td>[복습]그렇지 않더라구요</td><td class="tl">나형용사의 부정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:12</td></tr><tr><td>38강</td><td>[복습]'나'만 믿어</td><td class="tl">나형용사의 명사 수식을 5분으로 정리하는 핵심 스피드 체크</td><td>02:37</td></tr><tr><td>39강</td><td>[복습]'이'형용사라고 해</td><td class="tl">이형용사의 긍정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:15</td></tr><tr><td>40강</td><td>[복습]조금 특별한 너</td><td class="tl">이형용사의 부정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:01</td></tr><tr><td>41강</td><td>[복습]한결같은 너</td><td class="tl">이형용사의 명사 수식을 5분으로 정리하는 핵심 스피드 체크</td><td>02:24</td></tr><tr><td>42강</td><td>[복습]도와줘! 의문사 어벤져스</td><td class="tl">4가지 의문사를 5분으로 정리하는 핵심 스피드 체크</td><td>03:04</td></tr><tr><td>43강</td><td>[복습]'가'는 투잡 중</td><td class="tl">역접의 조사를 5분으로 정리하는 핵심 스피드 체크</td><td>02:53</td></tr><tr><td>44강</td><td>[복습]한 놈만 판다</td><td class="tl">특정 조사를 사용하는 형용사를 5분으로 정리하는 핵심 스피드 체크</td><td>02:41</td></tr><tr><td>45강</td><td>[복습]저에겐 없네요</td><td class="tl">존재동사의 부정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:02</td></tr><tr><td>46강</td><td>[복습]찾으니까 있었네</td><td class="tl">존재동사의 긍정문을 5분으로 정리하는 핵심 스피드 체크</td><td>02:57</td></tr><tr><td>47강</td><td>[복습]나 여기 있어요</td><td class="tl">생명체의 존재동사 긍정문을 5분으로 정리하는 핵심 스피드 체크</td><td>02:51</td></tr><tr><td>48강</td><td>[복습]왜 나만 없어</td><td class="tl">생명체의 존재동사 부정문을 5분으로 정리하는 핵심 스피드 체크</td><td>02:55</td></tr><tr><td>49강</td><td>[복습]한번 골라봐요</td><td class="tl">생명체와 무생명체의 존재동사를 5분으로 정리하는 핵심 스피드 체크</td><td>03:08</td></tr><tr><td>50강</td><td>[복습]어서와,동사는 처음이지?</td><td class="tl">동사의 긍정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:21</td></tr><tr><td>51강</td><td>[복습]굳은 의지를 보여주지</td><td class="tl">동사의 부정문을 5분으로 정리하는 핵심 스피드 체크</td><td>03:00</td></tr><tr><td>52강</td><td>[복습]혼자는 외로워</td><td class="tl">권유 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>02:51</td></tr><tr><td>53강</td><td>[복습]동시에 두 가지를!</td><td class="tl">동시동작 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:00</td></tr><tr><td>54강</td><td>[복습]뭐든 이유가 있지</td><td class="tl">목적을 말하는 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:15</td></tr><tr><td>55강</td><td>[복습]내 한가지 소원은</td><td class="tl">희망을 말하는 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:18</td></tr><tr><td>56강</td><td>[복습]누워서 떡 먹기</td><td class="tl">동작의 편리성 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>02:59</td></tr><tr><td>57강</td><td>[복습]만만한 상대가 아냐</td><td class="tl">동작의 불편함 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:12</td></tr><tr><td>58강</td><td>[복습]그것이 알고 싶다</td><td class="tl">육하원칙 의문사를 5분으로 정리하는 핵심 스피드 체크</td><td>03:19</td></tr><tr><td>59강</td><td>[복습]너무하네</td><td class="tl">행동의 과함을 나타내는 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:08</td></tr><tr><td>60강</td><td>[복습]적당한 게 최고</td><td class="tl">상태의 과함을 나타내는 표현을 5분으로 정리하는 핵심 스피드 체크</td><td>03:01</td></tr><tr><td>61강</td><td>도전! 단어 레벨 업 1-5강</td><td class="tl">원어민 음성을 들으며 단어를 익히고 패턴 연습을 하는 단어 강의</td><td>13:07</td></tr><tr><td>62강</td><td>도전! 단어 레벨 업 6-10강</td><td class="tl">원어민 음성을 들으며 단어를 익히고 패턴 연습을 하는 단어 강의</td><td>17:21</td></tr><tr><td>63강</td><td>도전! 단어 레벨 업 11-15강</td><td class="tl">원어민 음성을 들으며 단어를 익히고 패턴 연습을 하는 단어 강의</td><td>16:22</td></tr><tr><td>64강</td><td>도전! 단어 레벨 업 16-20강</td><td class="tl">원어민 음성을 들으며 단어를 익히고 패턴 연습을 하는 단어 강의</td><td>15:08</td></tr><tr><td>65강</td><td>도전! 단어 레벨 업 21-25강</td><td class="tl">원어민 음성을 들으며 단어를 익히고 패턴 연습을 하는 단어 강의</td><td>12:34</td></tr><tr><td>66강</td><td>도전! 단어 레벨 업 26-30강</td><td class="tl">원어민 음성을 들으며 단어를 익히고 패턴 연습을 하는 단어 강의</td><td>12:50</td></tr>								</tbody>
							</table>
						</li>
					</ul>
				</div>
			</div><!--// sec_comp -->
						<div class="inner_container2">
		
		</div><!--// inner_container2 -->
</div><!--// siwon_container -->
<!--// 레이어팝업(수강신청) -->
<input type="hidden" name="tcode" value="00003834">
<script type="text/javascript">
setPrecode($("input[name=tcode]").val());
</script><!----><div class="bg_layerpop"></div>
<a href="#siwon_header" id="body_top" class="top" style="display: block;"><img src="//img.siwonschool.com/japan/comm/bt_top_comm.png" alt="맨위로"></a>

<input type="hidden" name="uno" value="">

	<script type="text/javascript">
			</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/857045604/?value=1.00&amp;currency_code=KRW&amp;label=ncrvCNCZ2G8Q5PTVmAM&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>
<script async="true" src="https://cdn.megadata.co.kr/js/enliple_min2.js" onload="mobRf()"></script>

</body>
</html>
