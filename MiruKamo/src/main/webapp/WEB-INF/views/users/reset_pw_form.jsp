<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<meta property="og:type" content="website">


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<title>ミルカモID探し</title>
<link type="text/css"
	href="//fonts.googleapis.com/earlyaccess/nanumgothic.css?t=0&date=1524905017"
	rel="stylesheet">
<link type="text/css"
	href="resources/css/login/member.css?date=1524905017" rel="stylesheet">
<!-- 회원 탈퇴일때는 media.css 호출하지 않습니다. -->
<link type="text/css"
	href="resources/css/login/media.css?date=1524905017" rel="stylesheet"
	media="screen">

<script type="text/javascript"
	src="resources/jQuery/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="resources/jQuery/member_script.js?date=1524905017"></script>
<script type="text/javascript"
	src="resources/jQuery/jquery.bxslider.min.js?date=1524905017"></script>
<script type="text/javascript"
	src="resources/jQuery/join.js?date=1524905017"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js">
</script>

<script type="text/javascript">





	//AccoutId 적용
	if (!wcs_add)
		var wcs_add = {};
	wcs_add["wa"] = "s_15f4ba48667f";

	// 유입추적함수(최상위 도메인을 인자로 삽입)
	if (!_nasa)
		var _nasa = {};
	wcs.inflow("siwonschool.com");

	// 로그 수집 함수 호출
	wcs_do(_nasa);
</script>
<!-- 네이버 프리미엄로그분석 End -->


<!-- GA 추적코드 업데이트 버전 Start -->
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-67302237-1');
	ga('require', 'linkid', 'linkid.js');
	ga('require', 'displayfeatures');
	ga('send', 'pageview');
</script>
<!-- GA 추적코드 업데이트 버전 End -->


<!-- LiveLog TrackingCheck Script Start -->
<script>
	var LLscriptPlugIn = new function() {
		this.load = function(eSRC, fnc) {
			var script = document.createElement('script');
			script.type = 'text/javascript';
			script.charset = 'utf-8';
			script.onreadystatechange = function() {
				if ((!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')
						&& fnc != undefined && fnc != '') {
					eval(fnc);
				}
				;
			};
			script.onload = function() {
				if (fnc != undefined && fnc != '') {
					eval(fnc);
				}
				;
			};
			script.src = eSRC;
			document.getElementsByTagName('head')[0].appendChild(script);
		};
	};
	LoadURL = "MAgyCDI2CDI4CDUIMAgyMgg2CDE1CDIyCDI1CDMwCA";
	LLscriptPlugIn.load('//livelog.co.kr/js/plugShow.php?' + LoadURL,
			'sg_check.playstart()');
</script>
<!-- LiveLog TrackingCheck Script End -->


<!-- 기초영어 랜딩 내 스크립트 추가 요청의 건(https://intra.sjwcorp.kr/?c=168&uid=150332) -->
<script type="text/javascript" charset="UTF-8"
	src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
	kakaoPixel('1291054235488043797').pageView();
	kakaoPixel('1291054235488043797').completeRegistration();
</script>
<!-- //기초영어 랜딩 내 스크립트 추가 요청의 건(https://intra.sjwcorp.kr/?c=168&uid=150332) -->

</head>
<body>
	
	<div id="siwon_wrap">
		<div id="siwon_header">
			<div class="inner_header">
				<h1 class="logo">
					<a href="/ai"><img src="resources/images/mirukamo3.jpg"
						alt="" width="200px" /></a>
				</h1>
				<ul class="login_info">
					<!-- 로그인 전 -->
					<li class="ico1 fst"><a href="./login/logout">ログアウト</a></li>
					<li class="ico2"><a href="./myUpdate" class="bar">マイページ</a></li>
					<!--// 로그인 전 -->
				</ul>
			</div>
			<!--// inner_header -->
		</div>
		<!--// siwon_header -->
		<div id="siwon_container" class="sub_section">
			<script type="text/javascript">
				$(document).ready(
						function() {
							$('.step1_agree .main_box').not('.ck_box').click(
									function() {
										$(this).toggleClass('on');
										$(this).siblings('.sub_box')
												.slideToggle();
									});
						});
			</script>

			<div class="inner_container">
			<div class="top_area">
				<h2 class="tit_comm">ID/PASSWORD探し</h2>
				<a href="javascript:history.back()" class="bt_prev ir2"><span>이전</span></a>
			</div><!--// top_area -->
			<div class="contents sub">
				<ul class="tab_subject w2">
					<li><h3><a href="mirukamo_find">ID探し</a></h3></li>
					<li class="on"><h3><a href="mirukamo_pw_find">PASSWORD探し</a></h3></li>
				</ul>
				<div class="sub_con">
					<div class="find_area">
						<div class="find_notice">
							<h4 class="em">パスワード再設定<span class="br"></span></h4>
							
						</div>
						<div class="find_con1">
							

							<!-- 이메일 인증 -->
							<form method="POST" name="email_cert_form" id="repassword_form" action="login/reset_pw">
							<input type="hidden" id="based" name="id" value="${based.id}" />
							<input type="hidden" id="member_id" name="member_id" value="" />
							<div class="email_join_wrap" style="display:block;">
								<div class="join_cert">
									<table class="join_table2">
											<caption>비밀번호 재설정</caption>
											
												<tr>
													<th>パスワード</th>
													<td><span class="input_ps"><input
															type="password" id="usrpw" name="userPassword"
															class="input w1 holder" maxlength="20"> <label
															for="usrpw" class="holder_label">8~20字の英文、数字</label> </span> 
															</td>
															<td>
															<span
														class="noti mg2" id="pw_text" style="display: none;">8~20字の英文、数字</span>
													</td>
												</tr>
												<tr>
													<th class="bd_line">パスワード再入力</th>
													<td class="bd_line"><span class="input_ps"> <input
															type="password" id="usrpw_re" name="usrpw_re"
															class="input w1 holder" maxlength="20"> <label
															for="usrpw_re" class="holder_label">上のパスワードをもう一度入力。</label>
													</span> </td><td width="300px"><span class="noti mg2" id="pwre_text"
														style="display: none;">パスワードが一致しません。</span></td>
												</tr>
												
										</table>
								</div><!--// join_cert -->
								<div class="bt_group">
									<a href="javascript:;" class="bt_st2" id="repassword_bt"><span>확인</span></a>
								</div>
							</div>

							</form>
							<!--// 이메일 인증 -->

						</div>
					</div><!--// find_area -->
				</div><!--// sub_con -->
				
			</div><!--// contents -->
		</div><!--// inner_container -->

		</div>
		<!--// siwon_container -->
</body>
</html>