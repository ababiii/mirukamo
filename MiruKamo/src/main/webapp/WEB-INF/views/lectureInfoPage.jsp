<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.open-popup').click(function(e) {
		
	    e.preventDefault();
	    var win = window.open(this.href, 'newwindow', 'width=300,height=200');
	    win.focus();
	    
	});
	$('#aaa').click(function(e) {
		alert('a');
		/*
	    e.preventDefault();
	    var win = window.open("http://naver.com", 'newwindow', 'width=300,height=200');
	    win.focus();
	    */
	});
	
	
 });
 
function watching_class(num) {
	$.ajax({
		url : 'lecture_page',
		type : 'POST',
		dataType : "int",
		data : {
			num : num
		},
		success : function(e) {
			if (e == 0) {
				alert("존재하는 강의가 없습니다.");
			}
			else if (e == 1) {
				alert("수강 성공");
				location.reload();
			}
		},
		error : function(e) {
			alert("신청 오류");
		}
	});
}



</script>
</head>
<body>
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
<script type="text/javascript">
function floatban_movie(){
	$('.float-video').attr("src","https://www.youtube.com/embed/PszmR6Et6Mg?enablejsapi=1&playerapiid=ytplayer1&autoplay=1");
	layerPopId('floating_Layer');
}

function stop_float_video(){
	$('.float-video')[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
}
</script>
<div id="siwon_container" class="prod_sec detail">
	<div class="sec_main"><div class="inner_container2"><div class="inner">
		<span class="img_t">
		<c:if test="${name eq '요시코'}"><img src="../resources/images/yosiko2.jpg" alt=""   height="400" width="350" ></c:if>
		<c:if test="${name eq '박수진'}"><img src="../resources/images/sujin2.png" alt=""   height="400" width="350" ></c:if>
		</span>
		
											<a href="javascript:void(0);" onClick="loginChk();" class="bt_pay">수강신청</a>
	</div></div></div><!--// sec_main -->

		<div class="inner_container2">
		
		
		<c:forEach var="i" items="${list}">
		
					<div class="sec_comp tab_cate" id="anchor_comp">
				<h3>${i[0].packagename}</h3>
				<div class="wrap_info2">
			<ul><li class="l1"><span>강좌구성 : <em class="fc_red">${fn:length(i)} 강</em></span></li><li class="l2"></li></ul>
		</div>
				<div class="wrap_tmenu" id="tmenu_comm">
					<ul class="tcon">
						<li style="display:list-item">
							<table class="table2_st2">
								<colgroup><col style="width:90px"/><col style="width:175px"/><col /><col style="width:215px"/></colgroup>
								<thead>
									<tr><th>차시</th><th>강의명</th><th>강의사진</th><th>강의수강</th></tr>
								</thead>
								<tbody>
								
								<c:forEach var="j" items="${i}" varStatus="status">
								<tr><td>${status.count}</td><td><a class="open-popup" target="_blank" href="./lecture_page?num=${j.num}">${j.title}</a></td>
									<td><img src="./preview?name=${j.thumnail}" alt="" style="width: 260px;height: 140px;"></td>
								</c:forEach>
									<!-- </tr><tr><td>사전1</td><td>히라가나 part1</td>
									<td class="tl">히라가나 50음도를 알고 말할 수 있다</td><td>24:55</td></tr><tr><td>사전2</td><td>히라가나 part2</td><td class="tl">히라가나 탁음과 반탁음을 구분하고 소리내서 말할 수 있다</td><td>22:55</td></tr><tr><td>사전3</td><td>인사하기</td><td class="tl">8가지 상황에서의 기본 일본어 인사말을 말할 수 있다</td><td>14:14</td></tr><tr><td>사전4</td><td>지시어</td><td class="tl">이, 그, 저, 어느에 해당하는 지시어를 알고 말할 수 있다</td><td>11:27</td></tr><tr><td>1강</td><td>만능재주꾼 </td><td class="tl">일본어 명사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>31:24</td></tr><tr><td>2강</td><td>모두가 '예'할 때 </td><td class="tl">일본어 명사의 현재와 과거의 부정문을 말할 수 있다</td><td>28:10</td></tr><tr><td>3강</td><td>내가 바라는 그것 </td><td class="tl">사물을 달라고 부탁하는 표현을 말할 수 있다</td><td>26:30</td></tr><tr><td>4강</td><td>궁금한 건 못참아!</td><td class="tl">우리말 은/는에 해당하는 주격조사를 넣은 문장을 말할 수 있다</td><td>27:17</td></tr><tr><td>5강</td><td>한번 맞춰볼게요!  </td><td class="tl">3가지 의문사를 이용하여 장소와 정보를 묻는 의문문을 말할 수 있다</td><td>21:34</td></tr><tr><td>6강</td><td>만능 재주꾼2 </td><td class="tl">나형용사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>29:32</td></tr><tr><td>7강</td><td>그렇지 않더라구요  </td><td class="tl">나형용사의 현재와 과거의 부정문을 말할 수 있다</td><td>26:47</td></tr><tr><td>8강</td><td>'나'만 믿어 </td><td class="tl">나형용사를 사용하여 명사를 꾸며주는 방법을 알고 문장을 말할 수 있다</td><td>22:51</td></tr><tr><td>9강</td><td>'이'형용사라고 해  </td><td class="tl">이형용사를 알고 현재와 과거의 긍정문을 말할 수 있다</td><td>31:41</td></tr><tr><td>10강</td><td>조금 특별한 너  </td><td class="tl">이형용사의 현재와 과거의 부정문을 말할 수 있다</td><td>27:07</td></tr><tr><td>11강</td><td>한결같은 너 </td><td class="tl">이형용사를 사용하여 명사를 꾸며주는 방법을 알고 문장을 말할 수 있다</td><td>26:18</td></tr><tr><td>12강</td><td>도와줘! 의문사 어벤져스 </td><td class="tl">4가지 의문사를 사용하여 특정인물을 묻는 의문문을 말할 수 있다</td><td>21:33</td></tr><tr><td>13강</td><td>'가'는 투잡 중 </td><td class="tl">두 가지 문장을 이어주는 역접의 조사를 알고 문장을 말할 수 있다</td><td>24:10</td></tr><tr><td>14강</td><td>한 놈만 판다 </td><td class="tl">특정 조사만을 사용하는 형용사를 알고 문장을 말할 수 있다</td><td>24:18</td></tr><tr><td>15강</td><td>저에겐 없네요 </td><td class="tl">존재동사를 알고 현재와 과거의 부정문을 말할 수 있다</td><td>21:34</td></tr> -->
							</table>
						</li>
					</ul>
				</div>
			</div><!--// sec_comp -->
			
			</c:forEach>
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
<br>
<br>
<div id="siwon_footer">
	<div class="bg_footer_link">
		<div class="footer_link">
			<ul>
				<li class="fst"><a href="http://www.siwonschool.com/?s=intro" target="_blank">회사소개</a></li>
				<li><a href="http://corp.siwonschool.com/group.php" target="_blank">단체수강</a></li>
				<li><a href="/?s=community&p=alliance" target="_blank">제휴안내</a></li>
				<li><a href="http://corp.siwonschool.com/recruit/notice.php" target="_blank">채용정보</a></li>
				<li><a href="http://corp.siwonschool.com/recruit/audition.php#japan" target="_blank">강사채용</a></li>
				<li><a href="http://corp.siwonschool.com/map.php" target="_blank">찾아오시는 길</a></li>
				<li><a href="#none" class="sitemap" onclick="$('#siwon_footer .menu_all').slideToggle('fast');">사이트맵</a></li>
			</ul>
		</div>
	</div>



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
