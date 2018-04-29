<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>

<meta name="apple-mobile-web-app-title" content="시원스쿨">
<meta property="keywords"
	content="시원, 시원스쿨, 영어교육, 영어, 잉글리쉬, 영어학습, 기초영어, 시원영어, 이시원">
<meta property="description"
	content="왕초보 영어회화, 비즈니스, 면접, 모바일 강의, 온라인 기초영어 1년 무제한 수강 월 19,800원">
<meta property="og:type" content="website">
<meta property="og:url" content="https://member.siwonschool.com">
<meta property="og:site_name" content="시원스쿨">
<meta property="og:title" content="대한민국 왕초보탈출 시원스쿨">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<title>ミルカモ会員加入</title>
<link type="text/css"
	href="//fonts.googleapis.com/earlyaccess/nanumgothic.css?t=0&date=1524905017"
	rel="stylesheet">
<link type="text/css"
	href="../resources/css/login/member.css?date=1524905017" rel="stylesheet">
<!-- 회원 탈퇴일때는 media.css 호출하지 않습니다. -->
<link type="text/css"
	href="../resources/css/login/media.css?date=1524905017" rel="stylesheet"
	media="screen">
<link href="//img.siwonschool.com/member/favicon.ico"
	rel="shortcut icon">
<script type="text/javascript"
	src="../resources/jQuery/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="../resources/jQuery/member_script.js?date=1524905017"></script>
<script type="text/javascript"
	src="../resources/jQuery/jquery.bxslider.min.js?date=1524905017"></script>
<script type="text/javascript"
	src="../resources/jQuery/join.js?date=1524905017"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js">
	
</script>
<script type="text/javascript">

$(document).ready(function(){
	$('#usrid').on('keyup',registerCheckFunction);
});

function registerCheckFunction() {
	var userId = $('#usrid').val();
	
	$.ajax({
		type:'POST',
		url:'userRegisterCheck',
		data: {userId:userId},
		success: function(result){
			if(result==1){
				$("#id_text").addClass("ok");
				$("#id_text").show();
				$('#id_text').text('使用できます。');
			}else if(result==0){
				$("#id_text").removeClass("ok");
				$("#id_text").show();
				$('#id_text').text('すでに使われている文字列です。');
			}else if(result==2){
				$("#id_text").removeClass("ok");
				$("#id_text").show();
				$('#id_text').text('6字以上を入力してください。');
			}else if(result==3){
				$("#id_text").removeClass("ok");
				$("#id_text").show();
				$('#id_text').text('12字以下で入力してください。');
			}
		},
		error: function(e){
			alert('エラー');
		}
	});
}
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
					<a href="/ai"><img src="../resources/images/mirukamo3.jpg"
						alt="" width="200px" /></a>
				</h1>
				<ul class="login_info">
					<!-- 로그인 전 -->
					<li class="ico1 fst"><a href="../login">ログイン</a></li>
					<li class="ico2"><a href="../appointment" class="bar">会員加入</a></li>
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
					<h2 class="tit_comm">会員加入</h2>
					<a href="javascript:history.back()" class="bt_prev ir2"><span>이전</span></a>
				</div>
				<!--// top_area -->
				<div class="contents sub">
					<ul class="tab_subject w4">
						<li><h3>約款同意</h3></li>
						<!-- <li><h3>본인인증</h3></li> -->
						<li class="on"><h3>情報入れ</h3></li>
						<li class="lst"><h3>加入完了</h3></li>
					</ul>
					<div class="sub_con">
						<form action="join" method="POST" name="joinform"
							id="joinform">
							<input type="hidden" id="third" name="third" value="Y">
							<fieldset>
								<legend>회원정보 입력</legend>
								<div class="step3_area">
									<div class="info_wrap ess">
										<h4>必修入力</h4>
										<table class="join_table2">
											<caption>회원정보 폼- 필수입력</caption>
											<tbody>
												<tr>
													<th>ID</th>
													<td><span class="input_ps"> <input type="text"
															id="usrid" name="usrid" class="input w1 holder"
															maxlength="12"> <label for="usrid"
															class="holder_label">6~12字の英文、数字</label>

													</span> <input type="hidden" id="usridcon" name="usridcon">
														<span class="mg2"><!--  <a href="javascript:void(0);"
															class="bt_st4" id="repetition"> <span>중복확인</span></a> -->
													</span> <span class="noti mg2" id="id_text" style="display: none;">ID</span>
													</td>
												</tr>
												<tr>
													<th>パスワード</th>
													<td><span class="input_ps"><input
															type="password" id="usrpw" name="usrpw"
															class="input w1 holder" maxlength="20"> <label
															for="usrpw" class="holder_label">8~20字の英文、数字</label> </span> <span
														class="noti mg2" id="pw_text" style="display: none;">8~20字の英文、数字</span>
													</td>
												</tr>
												<tr>
													<th class="bd_line">パスワード再入力</th>
													<td class="bd_line"><span class="input_ps"> <input
															type="password" id="usrpw_re" name="usrpw_re"
															class="input w1 holder" maxlength="20"> <label
															for="usrpw_re" class="holder_label">上のパスワードをもう一度入力。</label>
													</span> <span class="noti mg2" id="pwre_text"
														style="display: none;">パスワードが一致しません。</span></td>
												</tr>
												<tr>
													<th class="pd">名前</th>
													<td class="pd"><span class="input_ps"> <input
															type="text" id="uname" name="uname"
															class="input w3" value="">
													</span></td>
												</tr>
												<tr>
													<th class="vt"><span class="mt">携帯電話</span></th>
													<td class="select_td"><select name="phone1"
														id="phone1" class="select w2">
															<option value="010">010</option>
															<option value="080">080</option>
															<option value="090">090</option>
													</select>- <input type="tel" name="phone2" id="phone2" value=""
														class="input w2">- <input
														type="tel" name="phone3" id="phone3" value=""
														class="input w2"></td>
												</tr>
												<tr>
													<th class="vt"><span class="mt">E-MAIL</span></th>
													<td class="select_td"><input type="text"
														name="email_id" id="email_id" class="input w4">@ <input
														type="text" name="email_back" id="email_back"
														class="input w4"> <select name="emailcorp"
														id="emailcorp" class="select w4">
															<option value="">直接入力</option>
															<option value="naver.com">ネイバー</option>
															<option value="gmail.com">グーグル</option>
															<option value="nate.com">ネイト</option>
													</select>
													<a href="javascript:void(0);"
															class="bt_st4" id="emailCheck"> <span>チェック</span></a>
													</td>
												</tr>
												<tr>
													<th>
													</th>
													<td>
														<span class="noti mg2" id="checkEmailMessage"
														style="display: none;"></span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="bt_group">
										<a href="javascript:void(0)" id="join_do" class="bt_st2 btn">
											<span>加入</span>
										</a>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
					<!--// sub_con-->
				</div>
				<!--// contents -->
			</div>
			<!--// inner_container -->
		</div>
		<!--// siwon_container -->
</body>
</html>