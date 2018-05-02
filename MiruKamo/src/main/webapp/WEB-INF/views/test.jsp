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

<div id="siwon_header">
	<div id="header_top" class="sec_login">
		<h1 class="logo">
			<a href="./"><img src="./resources/images/mirukamo3.jpg" alt="mirukamo" width="200px" /></a>
		</h1>
		<div class="random_ban">
			<a href="http://www.rankey.com/rank/cert/cert_pop.php?mark_no=20180402-B001" target="_blank"><!-- <img src="http://data.siwonschool.com/banner/img/japan/2018/04/05/bimg_src_1522901610.png" alt="2017년 9월 기준 랭키닷컴" /> --></a>		</div>
		<div class="util_box">
			<ul class="util1">
									<c:if test="${userId==null}"><li><a href="login">ログイン</a></li>
					<li><a href="appointment">会員加入</a></li></c:if>	
					<c:if test="${userId!=null}"><li>${userId}さん、こんにちは。</li>
					<li><a href="login/logout">ログアウト</a></li></c:if>				
					<li><a href="appointment">お問い合わせ</a></li>
			</ul>
			<ul class="util2">
									<!-- <li><a href="javascript:;" onClick="loginChk();"><span class="alarm">알림</span></a></li> -->
					<li><a href="javascript:;"><span class="my">마이페이지</span></a></li>
					<!-- <li><a href="javascript:;" onClick="loginChk();"><span class="coupon">쿠폰</span></a></li>
					<li><a href="javascript:;" onClick="loginChk();"><span class="cart">장바구니</span></a></li> -->
							</ul>
			
						<!-- 마이페이지 레이어 -->
			<div class="mypage_layer">
				<ul>
											<li><a href="javascript:;" onClick="loginChk();">マイページ</a></li>
						<li><a href="myCourseView" onClick="loginChk();">受講内訳</a></li>
						<!-- <li><a href="javascript:;" onClick="loginChk();">주문/배송 조회</a></li> -->
						<!-- <li><a href="javascript:;" onClick="loginChk();">내 글 관리</a></li> -->
						<!-- <li><a href="javascript:;" onClick="loginChk();">SJ멤버십</a></li>
						<li><a href="javascript:;" onClick="loginChk();">내 정보 관리</a></li> -->
									</ul>
			</div>
			<!-- //마이페이지 레이어 -->


		</div>
	</div>

	<div class="wrap_fixarea">
		<div id="wrap_gnb">
			<ul class="tb_cell">
				<li class="gnb_item circle all">
					<a href="javascript:void(0)" class="tit ir2"><span>전체메뉴</span></a>
				</li>
				<li class="gnb_item">
					<!-- <a href="/?s=info&info_1" class="tit"><span>시원스쿨 일본어</span></a> -->
					<!-- <div class="wrap_snb wr1">
						<dl>
							<dd><a href="/?s=info&info_1">시원스쿨 일본어</a></dd>
							<dd><a href="/?s=info&p=info_2">일본어 연구소</a></dd>
							<dd><a href="/?s=info&p=info_3">학습프로그램</a></dd>
							<dd><a href="/?s=info&p=share">사회공헌</a></dd>
							<dd><a href="/?s=info&p=alliance">제휴안내</a></dd>
						</dl>
						<div class="box_r">
							<div class="wr1_sub1 on"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/19/bimg_src_1521421915.jpg" alt="시원스쿨 일본어"></div>
							<div class="wr1_sub2"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/19/bimg_src_1521421997.jpg" alt="일본어 연구소"></div>
							<div class="wr1_sub3"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/19/bimg_src_1521422051.jpg" alt="학습 프로그램"></div>
							<div class="wr1_sub4"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/19/bimg_src_1521422316.jpg" alt="사회공헌"></div>
							<div class="banner_wrap" id="gnbBanner1">
								<ul class="wr1_sl">
									<li><a href="http://japan.siwonschool.com/?s=community&b=event&m=view&sno=173" target="_blank" onClick="FnUpdateRightBanner('4418');"><img src="http://data.siwonschool.com/banner/img/japan/2018/04/11/bimg_src_1523411694.jpg" alt="여행인증이벤트" /></a></li><li><a href="http://japan.siwonschool.com/?s=community&b=event&m=view&sno=174" target="_blank" onClick="FnUpdateRightBanner('4369');"><img src="http://data.siwonschool.com/banner/img/japan/2018/04/06/bimg_src_1523003186.jpg" alt="4월 수강신청 이벤트" /></a></li><li><a href="http://japan.siwonschool.com/?s=event&p=ev_present" target="_blank" onClick="FnUpdateRightBanner('4370');"><img src="http://data.siwonschool.com/banner/img/japan/2018/04/06/bimg_src_1523003195.jpg" alt="출첵이벤트" /></a></li><li><a href="http://japan.siwonschool.com/?s=event&p=prod201804" target="_blank" onClick="FnUpdateRightBanner('4371');"><img src="http://data.siwonschool.com/banner/img/japan/2018/04/06/bimg_src_1523003143.jpg" alt="4월 수강신청 이벤트" /></a></li>								</ul>
							</div>
						</div>
						<span class="decoline" style="width:94px;left:26px;"></span>
					</div> -->
				</li>
				<li class="gnb_item">
					<a class="tit"><!-- <span>선생님소개</span> --></a>
				<!-- 	<div class="wrap_snb wr2">
						<dl>
							<dd><strong>왕초보</strong></dd>
							<dd><strong>문법 | 어휘</strong></dd>
							<dd><strong>회화</strong></dd>
							<dd><strong>작문 | 표현</strong></dd>
							<dd><strong>JPT</strong></dd>
							<dd><strong>JLPT</strong></dd>
						</dl>
						<div class="box_teachers">
							<dl>
								<dd><a href="/?s=teacher&p=cyr" class="cyr on">최유리</a></dd>
								<dd><a href="/?s=teacher&p=kks" class="kks">강기석</a> | <a href="/?s=teacher&p=khj" class="khj">권현정</a></dd>
								<dd><a href="/?s=teacher&p=ksk" class="ksk">김수경</a> | <a href="/?s=teacher&p=ayaka" class="ayk">아야카</a></dd>
								<dd><a href="/?s=teacher&p=ksm" class="ksm">고수민</a> | <a href="/?s=teacher&p=hsa" class="hsa">황선아</a></dd>
								<dd><a href="/?s=teacher&p=skw" class="skw">서경원</a></dd>
								<dd><a href="/?s=teacher&p=narumi" class="nrm">나루미</a></dd>
							</dl>
						</div>
						<div class="teachers_img">
							<div class="t_cyr on"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_cyr.png" alt="최유리 선생님 - 기초일본어 NO.1" /></div>
							<div class="t_kks"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_kks.png" alt="강기석 선생님 - 왕초보문법 NO.1" /></div>
							<div class="t_ksk"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_ksk.png" alt="김수경 선생님 - 일본어회화 NO.1" /></div>
							<div class="t_ksm"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_ksm.png" alt="고수민 선생님 - 이야기작문 NO.1" /></div>
							<div class="t_skw"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_skw.png" alt="서경원 선생님 - 대한민국JPT NO.1" /></div>
							<div class="t_nrm"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_nrm.png" alt="나루미 선생님 - JLPT NO.1" /></div>
							<div class="t_khj"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_khj.png" alt="권현정 선생님 - 속성문법 NO.1" /></div>
							<div class="t_ayk"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_ayk.png" alt="아야카 선생님 - 리얼일본어 NO.1" /></div>
							<div class="t_hsa"><img src="//img.siwonschool.com/japan/comm/gnb_teacher_hsa.png" alt="황선아 선생님 - 이야기일본어 NO.1" /></div>
						</div>
						<span class="decoline" style="width:70px;left:26px;"></span>
					</div> -->
				</li>
				<li class="gnb_item add_ico">
					<a href="courseView" class="tit"><span>受講申請</span></a>
				<!-- 	<div class="wrap_snb wr3">
						<dl>
							<dd><a href="/?s=products#anchor_pack">패키지</a></dd>
							<dd><a href="/?s=products#tpl_free_title">프리패스</a></dd>
							<dd><a href="/?s=products#tpl_tab_title">일본어탭</a></dd>
							<dd><a href="/?s=products#tpl_refund_title">환급반</a></dd>
							<dd><a href="/?s=products#anchor_single">단과</a></dd>
							<dd><a href="/?s=products&p=book">교재/MP3</a></dd>
						</dl>
						<div class="box_r">
							 <div class="banner_wrap" id="gnbBanner3">
								<ul class="wr3_sl">
									<li><a href="/?s=event&p=pkg_allkill" target="_blank" onClick="FnUpdateRightBanner('4383');"><img src="http://data.siwonschool.com/banner/img/japan/2018/04/10/bimg_src_1523324690.jpg" alt="올킬패키지" /></a></li>								</ul>
							 </div>
						</div>
						<span class="decoline" style="width:55px;left:26px;"></span>
					</div> -->
				</li>
				<li class="gnb_item">
					<a href="/?s=community&b=review" class="tit"><span>講座評価</span></a>
				</li>
				<li class="gnb_item">
					<a href="mirukamoDrill" class="tit grey bgnone"><span>今日の問題</span></a>
					<!-- <div class="wrap_snb wr5">
						<dl>
							<dd><a href="/?s=free&p=freemovie">무료강의</a></dd>
							<dd><a href="/?s=free&p=leveltest">레벨테스트</a></dd>
							<dd><a href="/?s=free&p=request_mail">학습메일</a></dd>
							<dd><a href="/?s=free&p=jpt">JPT 집중탐구</a></dd>
						</dl>
						<div class="box_r">
							<dl>
								<dd><a href="/?s=free&p=todayword">오늘의 단어</a></dd>
								<dd><a href="/?s=free&p=one_minute">하루 1분 일본어</a></dd>
								<dd><a href="/?s=free&p=writing">작문연습</a></dd>
								<dd><a href="/?s=free&p=nowjapan">지금 일본은..</a></dd>
							</dl>
						</div>
						<span class="decoline" style="width:55px;left:26px;"></span>
					</div> -->
				</li>
				<li class="gnb_item">
					<a href="/?s=community" class="tit grey"><span>公知事項</span></a>
					<div class="wrap_snb wr6">
						<dl>
							<dd><a href="/?s=community&b=news">公知事項</a></dd>
							<dd><a href="/?s=community&b=teacher_diary">よく聞く質問</a></dd>
							<!-- <dd><a href="/?s=community&b=today_ready">오늘의 각오</a></dd>
							<dd><a href="/?s=community&b=study_qna">공부 질문하기</a></dd>
							<dd><a href="/?s=community&b=study_file">공부 자료실</a></dd>
							<dd><a href="/?s=community&b=free">자유게시판</a></dd> -->
						</dl>
						<span class="decoline" style="width:55px;left:26px;"></span>
					</div>
				</li>
				<li class="gnb_item">
					<a class="tit grey"><!-- <span>이벤트</span> --> <!-- <i class="evt_cnt evt_num">0</i> --></a>
				</li>		
			</ul><!--// #wrap_gnb -->
						<a href="myCourseView" onClick="loginChk();" class="bt_myclass"><img src="resources/images/mycourse.png" alt="내 강의실"></a>
					</div><!--// wrap_gnb -->
	</div><!--// wrap_fixarea -->
	
		<!-- 패밀리배너 : 유럽어, 아시아어 공통 -->
		
	<!-- <div class="ban_family">
		<div class="fam_opened">
			<div class="fam_tit">
				<h4 class="hide">소비자가 뽑은 브랜드대상 1위 시원스쿨 일본어</h4>
				<a href="javascript:;" class="bt_close_fam ir2"><span>접기</span></a>
				<a href="javascript:bookmark_site('대한민국 왕초보탈출 시원스쿨', 'http://japan.siwonschool.com/index.php?');" class="bt_add ir2"><span>즐겨찾기 추가</span></a>
			</div>
			<div class="fam_cont">
				[D] BEST i 태그를 띄워야 할 때는 class 'best' 추가
				<ul class="fam_dep1">
					<li>
												<a href="/?s=event&p=161025" target="_blank">시원스쿨 일본어탭<i class="best"><img src="//img.siwonschool.com/www/v2/comm/ico_best.gif" alt="BEST"></i></a>
					</li>
					<li class=""><a href="javascript:;">기초영어/회화<i class="ico_handle">&nbsp;</i></a><ul class="fam_dep2" style=""><li class=""><a href="http://www.siwonschool.com/" target="_blank">기초영어</a></li><li class=""><a href="http://familytab.siwonschool.com/" target="_blank">시원스쿨 패밀리탭</a></li><li class=""><a href="http://tab.siwonschool.com/" target="_blank">시원스쿨 탭</a></li><li class=""><a href="http://welearn.siwonschool.com/" target="_blank">시원스쿨 위런영어</a></li><li class=""><a href="http://max.siwonschool.com/" target="_blank">시원스쿨 맥스</a></li></ul></li><li class=""><a href="javascript:;">시원스쿨 LAB<i class="ico_handle">&nbsp;</i></a><ul class="fam_dep2" style=""><li><a href="http://lab.siwonschool.com/" target="_blank">토익</a></li><li><a href="http://lab.siwonschool.com/?p=tos" target="_blank">토스</a></li><li><a href="http://lab.siwonschool.com/?p=opic" target="_blank">오픽</a></li><li><a href="http://lab.siwonschool.com/?p=gramm" target="_blank">영문법</a></li><li><a href="http://lab.siwonschool.com/?p=ielts" target="_blank">아이엘츠</a></li><li><a href="http://lab.siwonschool.com/?s=event&t=vicgtelp" target="_blank">지텔프</a></li></ul></li><li class="on"><a href="javascript:;">제 2외국어<i class="ico_handle">&nbsp;</i></a><ul class="fam_dep2" style="display:block;"><li class="on"><a href="http://japan.siwonschool.com/" target="_blank">일본어</a></li><li class=""><a href="http://china.siwonschool.com/" target="_blank">중국어</a></li><li class=""><a href="http://spain.siwonschool.com/" target="_blank">스페인어</a></li><li class=""><a href="http://france.siwonschool.com/" target="_blank">프랑스어</a></li><li class=""><a href="http://germany.siwonschool.com/" target="_blank">독일어</a></li><li class=""><a href="http://russia.siwonschool.com/" target="_blank">러시아어</a></li><li class=""><a href="http://vietnam.siwonschool.com/" target="_blank">베트남어</a></li><li class=""><a href="http://indonesia.siwonschool.com/" target="_blank">인도네시아어</a></li></ul></li><li><a href="javascript:;">기업/채용<i class="ico_handle">&nbsp;</i></a><ul class="fam_dep2"><li><a href="http://b2b.siwonschool.com/" target="_blank">기업교육</a></li><li><a href="http://corp.siwonschool.com/" target="_blank">인재채용</a></li></ul></li>				</ul>

								</ul>
				<ul class="sns_list">
					<li><a href="https://www.facebook.com/japan.siwonschool" target="_blank" class="sns_fb ir2"><span>페이스북</span></a></li>
					<li><a href="https://story.kakao.com/ch/siwonjapanese" target="_blank" class="sns_ks ir2"><span>카카오스토리</span></a></li>
					<li><a href="http://blog.naver.com/siwonjapan" target="_blank" class="sns_nb ir2"><span>네이버블로그</span></a></li>
					<li><a href="https://www.instagram.com/siwonjapanese/" target="_blank" class="sns_is ir2"><span>인스타그램</span></a></li>
					<li><a href="http://tv.naver.com/siwonjapanese" target="_blank" class="sns_nc ir2"><span>네이버캐스트</span></a></li>
					<li><a href="https://www.youtube.com/c/시원스쿨일본어" target="_blank" class="sns_ut ir2"><span>유튜브</span></a></li>
				</ul>
				<ul class="ban_list"><li class="cheater"><a href="http://www.siwonschool.com/?s=cheater" target="_blank"><img src="//img.siwonschool.com/comm/ban_cheater.jpg" alt="지식재산권"></a></li><li class="mt5 tc"><a href="https://www.siwonschool.com/?s=event&t=kids" target="_blank"><img src="//img.siwonschool.com/comm/ban_storybook.jpg" alt="시원스쿨 스토리북 자세히 보기"></a></li></ul>			</div>
		</div>// fam_opened
		<div class="fam_closed on">
			<a href="javascript:;" class="bt_open_fam"><img src="//img.siwonschool.com/japan/comm/family_txt.png" alt="FAMILY SITE"></a>
			<ul class="sns_list">
				<li><a href="https://www.facebook.com/japan.siwonschool" target="_blank" class="sns_fb ir2"><span>페이스북</span></a></li>
				<li><a href="https://story.kakao.com/ch/siwonjapanese" target="_blank" class="sns_ks ir2"><span>카카오스토리</span></a></li>
				<li><a href="http://blog.naver.com/siwonjapan" target="_blank" class="sns_nb ir2"><span>네이버블로그</span></a></li>
				<li><a href="https://www.instagram.com/siwonjapanese/" target="_blank" class="sns_is ir2"><span>인스타그램</span></a></li>
				<li><a href="http://tv.naver.com/siwonjapanese" target="_blank" class="sns_nc ir2"><span>네이버캐스트</span></a></li>
				<li><a href="https://www.youtube.com/c/시원스쿨일본어" target="_blank" class="sns_ut ir2"><span>유튜브</span></a></li>
			</ul>
		</div>// fam_closed
	</div>// ban_family	 -->	
	</div><!--// siwon_header -->

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

<<<<<<< HEAD
<script type="text/javascript">
function floatban_movie(){
	$('.float-video').attr("src","https://www.youtube.com/embed/PszmR6Et6Mg?enablejsapi=1&playerapiid=ytplayer1&autoplay=1");
	layerPopId('floating_Layer');
}

function stop_float_video(){
	$('.float-video')[0].contentWindow.postMessage('{"event":"command","func":"' + 'stopVideo' + '","args":""}', '*');
}
</script><!----------------------------------------------------------- 안 씀 --------------------------------------------------------------------------->
<script>
	$( document ).ready(function() {
		var mode = $('input[name=mode]').val();

		// 로그인 모드일 경우 모든 팝업을 닫고 로그인 팝업을 띄운다
		if(mode == 'login') {
			layerPopClose();
			loginChk();
		}
	});
</script><!----><div class="bg_layerpop"></div>
<div class="sitemap_pop">
	<a href="javascript:void(0)" class="bt_cls ir2"><span>닫기</span></a>
	<div class="menu_con">
		<table>
			<colgroup>
				<col width="160px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>시원스쿨 일본어</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=info&info_1">시원스쿨 일본어</a></li>
							<li><a href="/?s=info&p=info_2">일본어 연구소</a></li>
							<li><a href="/?s=info&p=info_3">학습프로그램</a></li>
							<li><a href="/?s=info&p=share">사회공헌</a></li>
							<li><a href="/?s=info&p=alliance">제휴안내</a></li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<th>수강신청</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=products#anchor_pack">패키지</a></li>
							<li><a href="/?s=products#tpl_free_title">프리패스</a></li>
							<li><a href="/?s=products#tpl_tab_title">일본어탭</a></li>
							<li><a href="/?s=products#tpl_refund_title">환급반</a></li>
							<li><a href="/?s=products#anchor_single">단과</a></li>
							<li><a href="/?s=products&p=book">교재/MP3</a></li>
							<li><a href="/?s=products"><strong>전체강좌보기 &gt;</strong></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>수강후기</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=community&b=review">베스트 수강후기</a></li>
							<li><a href="/?s=community&b=review">100% 리얼 수강후기</a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>무료학습</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=free&p=freemovie">무료강의</a></li>
							<li><a href="/?s=free&p=leveltest">레벨테스트</a></li>
							<li><a href="/?s=free&p=request_mail">학습메일</a></li>
							<li><a href="/?s=free&p=jpt">JPT 집중탐구</a></li>
							<li><a href="/?s=free&p=todayword">오늘의 단어</a></li>
							<li><a href="/?s=free&p=one_minute">하루 1분 일본어</a></li>
							<li><a href="/?s=free&p=writing">작문연습</a></li>
							<li><a href="/?s=free&p=nowjapan">지금 일본은</a></li>
						</ul>
					</td>
				</tr>
				
				<tr>
					<th>고객센터</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=customer&t=notice">공지사항</a></li>
							<li><a href="/?s=customer&t=faq">FAQ</a></li>
							<li><a href="/?s=customer&t=one">1:1 문의</a></li>
							<li><a href="/?s=customer">PC 원격지원</a></li>
							<li class="position"><a href="/?s=myclass" class="go_myclass"><img src="//img.siwonschool.com/japan/comm/bt_myclass_layer.png" alt="내 강의실 입장"></a></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div></div>
	<br>
	<br>
	
	<div id="siwon_footer">
	<div class="bg_footer_link">
		<div class="footer_link">
			<ul>
				
			</ul>
		</div>
	</div>
	</div>
	

<input type="hidden" name="uno" value="">



	<script type="text/javascript">
			</script>
	

<!--  메인 페이지 트래커 ---->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    window.criteo_q.push(
        { event: "setAccount", account: 31099 },
        { event: "setHashedEmail", email: "d41d8cd98f00b204e9800998ecf8427e" },
        { event: "setSiteType", type: "d" },
        { event: "viewHome" }
    );
</script>



</body>
</html>
