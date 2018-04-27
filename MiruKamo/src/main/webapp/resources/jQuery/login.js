
var recaptchayn = false;

function chk_pass_chg_data(){
	var ret = false;
	$.ajax({
		url:"/?s=pass_chk",
		type:"POST",
		dataType: "json",
		async:false,
		data: {chk_m:"chk_pass_date"},
		error : function(request,status,error){
		},
		success : function(data){
			if(data.flag == "ok"){
				ret = true;
			}else{
				console.log(data);
			}
		}
	});

	return ret;
}

function login_secure(){
		if(typeof(grecaptcha)!="undefined" && recaptchayn){
			if (grecaptcha.getResponse() == ""){ alert("정보보호를 위해 아래 확인 시스템을 체크해주세요."); return false; }
		}

		if( !$("#input_id").val() ){
			alert('아이디를 입력해주세요.');
			$("#input_id").focus();
			return false;
		}
		if( !$("#input_pw").val() ){
			alert('비밀번호를 입력해주세요.');
			$("#input_pw").focus();
			return false;
		}	

		var param = $("#loginform").serialize();

		$.ajax({
			url:"/?s=loginproc",
			type:"POST",
			dataType: "json",
			async:false,
			data: param,
			error : function(request,status,error){
			},
			success : function(data){
				if(data.result=="FAIL"){
					$("#login_status").hide;
					$("#login_status").text(data.status);
					$("#login_status").fadeIn("fast");

					if(data.flag=="recaptcha"){		
						recaptchayn = true;
						$("#recaptcha_area").show();
					}else{
						$("#recaptcha_area").hide();
					}
				}else{
					var returl = $("input[name=returl]").val();
					var chk = chk_pass_chg_data();
					if(chk){
						location.href = returl;
					}else{
						var f = $("form[name=pass_chgF]");
						$("input[name=ret_url]",f).val(returl);
						f.submit();
					}
				}
			}
		});
}

$(document).ready(function(){
	
	$("#bt_login").on("click",function(){
		login_secure();
	});


	/* 로그인페이지 이벤트 슬라이더 */
	$(".slider_ad").bxSlider({
		slideWidth: 414,
		minSlides: 1,
		maxSlides: 1,
		auto: true,
		autoControls: true,
		onSlideAfter: function() {
			$(".bx-start").trigger("click");
		}
	});

	$("#input_pw").on("keyup",function(e){
		if( $("#login_status").length && e.keyCode != 13 ){
			$("#login_status").text("");
		}
	});

});

//2017-02-23 hwlee : 리얼트레이닝 앱로그인 ref 변수 추가
function naver_login_check(str) {
	if(str=="d"){
		//window.open("https://member.siwonschool.com/module/login/naver_login_pop.php","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
		window.open("https://dmember.siwonschool.com?s=login&p=naver_login_pop","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}else if(str=="t"){
		//window.open("https://member.siwonschool.com/module/login/naver_login_pop.php","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
		window.open("https://tmember.siwonschool.com?s=login&p=naver_login_pop","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}else{
		window.open("https://member.siwonschool.com/module/login/naver_login_pop.php","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}
}

//2017-04-24 hwlee : 리얼트레이닝 앱로그인 전용함수로 분리
function naver_login_check_app(str, param) {
	if(str=="d"){
		//window.open("https://member.siwonschool.com/module/login/naver_login_pop.php","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
		var url = "https://dmember.siwonschool.com/module/login/naver_login_pop.php"+param;
		location.href=url;
	}else if(str=="t"){
		//window.open("https://member.siwonschool.com/module/login/naver_login_pop.php","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
		location.href="https://tmember.siwonschool.com?s=login&p=naver_login_pop"+param;
	}else{
		//var url="https://member.siwonschool.com/module/login/naver_login_pop.php?"+param;
		//var url="https://member.siwonschool.com/module/login/naver_login_pop.php"+param;
		var url="https://"+$(location).attr('host')+"/?s=naver_login"+param;
		location.href=url;
	}
}

function nvr_check_form(flag) {
	if( flag == 'privacy' && !$(':input:checkbox[name=privacy]:checked').val() ) {
		alert("이용약관과 개인정보처리방침 동의에 체크해 주세요.");
		$("#privacy").focus();
		return false;
	}
	document.frm_join.submit();
}

function sns_login_chk(str){
	var url = $(location).attr('host');
	if(str == "k"){
		var kakao_url ="https://kauth.kakao.com/oauth/authorize?client_id=13f3ce92b338b64f7e78699c1a1fb5ed&redirect_uri=https://"+url+"/?s=kakao_login&response_type=code";
		window.open(kakao_url,"popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}else if(str == "f"){
		fbLogin();
	}else if(str == "n"){
		window.open("https://"+url+"/?s=naver_login","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}
	$("#sns_sort").val(str);
}

function sns_check_form(flag) {
	if( flag == 'privacy' && !$(':input:checkbox[name=privacy]:checked').val() ) {
		alert("이용약관과 개인정보처리방침 동의에 체크해 주세요.");
		$("#privacy").focus();
		return false;
	}
	document.frm_join.submit();
}

function sns_check_form_evt(flag) {
	if(flag == 'privacy'){
		if( !$(':input:checkbox[name=privacy]:checked').val() ) {
			alert("이용약관과 개인정보처리방침 동의에 체크해 주세요.");
			$("#privacy").focus();
			return;
		}
		
		layerPopClose(); 
		layerPopId('layer_joinSns3'); 
		$("input[name='sns3_name']").focus();
	}else{

		var ename = $("input[name='sns3_name']");
		var sex = $(":radio[name=sns3_sex]:checked");
		var year = $("input[name='sns3_year']");
		var month = $("input[name='sns3_month']");
		var day = $("input[name='sns3_day']");
		var phone1 = $("input[name='sns3_num1']");
		var phone2 = $("input[name='sns3_num2']");
		var phone3 = $("input[name='sns3_num3']");
		var sns3_cert_num = $("input[name='sns3_cert_num']");
		var event_input_cert = $("#event_input_cert");
		

		if(ename.val()== ""){
			alert("이름을 입력해주세요.");
			ename.focus();
			return;
		}
//		if(sex.val()=="" || sex.val()==undefined){
//			alert("성별을 선택해주세요.");
//			sex.focus();
//			return;
//		}
//		if(year.val()== ""){
//			alert("생년을 입력해주세요.");
//			year.focus();
//			return;
//		}
//		if(month.val()== ""){
//			alert("생월을 입력해주세요.");
//			month.focus();
//			return;
//		}
//		if(day.val()== ""){
//			alert("생일을 입력해주세요.");
//			day.focus();
//			return;
//		}
		if(phone1.val()== ""){
			alert("휴대폰번호를 입력해주세요.");
			phone1.focus();
			return;
		}
		if(phone2.val()== ""){
			alert("휴대폰번호를 입력해주세요.");
			phone2.focus();
			return;
		}
		if(phone3.val()== ""){
			alert("휴대폰번호를 입력해주세요.");
			phone3.focus();
			return;
		}
		if(sns3_cert_num.val()==""){
			alert("인증번호를 입력해주세요.");
			sns3_cert_num.focus();
			return;
		}
		if(event_input_cert.val() == "" || event_input_cert.val() == undefined){
			alert("휴대폰 인증이 필요합니다.");
			sns3_cert_num.focus();
			return;
		}
		document.frm_join.submit();
	}
}


function event_cert_step1(){
	var ename = $("input[name='sns3_name']");
	var sex = $(":radio[name=sns3_sex]:checked");
	var year = $("input[name='sns3_year']");
	var month = $("input[name='sns3_month']");
	var day = $("input[name='sns3_day']");
	var phone1 = $("input[name='sns3_num1']");
	var phone2 = $("input[name='sns3_num2']");
	var phone3 = $("input[name='sns3_num3']");
	var sns3_cert_num = $("input[name='sns3_cert_num']");

	if(ename.val()== ""){
		alert("이름을 입력해주세요.");
		ename.focus();
		return false;
	}
//	if(sex.val()=="" || sex.val()==undefined){
//		alert("성별을 선택해주세요.");
//		sex.focus();
//		return false;
//	}
//	if(year.val()== ""){
//		alert("생년을 입력해주세요.");
//		year.focus();
//		return false;
//	}
//	if(month.val()== ""){
//		alert("생월을 입력해주세요.");
//		month.focus();
//		return false;
//	}
//	if(day.val()== ""){
//		alert("생일을 입력해주세요.");
//		day.focus();
//		return false;
//	}
	if(phone1.val()== ""){
		alert("휴대폰번호를 입력해주세요.");
		phone1.focus();
		return false;
	}
	if(phone2.val()== ""){
		alert("휴대폰번호를 입력해주세요.");
		phone2.focus();
		return false;
	}
	if(phone3.val()== ""){
		alert("휴대폰번호를 입력해주세요.");
		phone3.focus();
		return false;
	}

	$("#event_input_name").val(ename.val());
	$("#event_input_sex").val(sex.val());
	$("#event_input_year").val(year.val());
	$("#event_input_month").val(month.val());
	$("#event_input_day").val(day.val());
	$("#event_input_phone1").val(phone1.val());
	$("#event_input_phone2").val(phone2.val());
	$("#event_input_phone3").val(phone3.val());
	
	
	$.ajax({url:"/?s=cert_send",
		type:"POST",
		dataType: "json",
		async:true,
		data:{mode:"cert", phone1:phone1.val(), phone2:phone2.val(), phone3:phone3.val() },
		error : function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(data){
			if(data.result == "1"){
				alert("입력하신 휴대폰번호로 인증번호가 발송되었습니다.");
				phone1.attr("readonly","readonly");
				phone2.attr("readonly","readonly");
				phone3.attr("readonly","readonly");
				$('#layer_joinSns3 .phone .input_num').show();
				$(".send_bt").html("인증하기");
				sns3_cert_num.focus();
				$(".send_bt").attr("onclick", "").click(function(){
					event_cert_chk();
				});
			}else if(data.result == "2"){
				alert("이미 등록된 번호입니다.");
			}else if(data.result == "3"){
				alert("번호가 잘못입력되었습니다.");
			}
		}
	});
}

function event_cert_chk(){
	var phone1 = $("input[name='sns3_num1']").val();
	var phone2 = $("input[name='sns3_num2']").val();
	var phone3 = $("input[name='sns3_num3']").val();
	var sns3_cert_num = $("input[name='sns3_cert_num']");

	if(sns3_cert_num.val()==""){
		alert("인증번호를 입력해주세요.");
		sns3_cert_num.focus();
		return false;
	}

	$.ajax({url:"/?s=cert_send",
		type:"POST",
		dataType: "json",
		async:true,
		data:{mode:"cert_confirm", cert_num:sns3_cert_num.val(), phone1:phone1, phone2:phone2, phone3:phone3},
		error : function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		},
		success : function(data){
			if(data.result == "1"){
				alert("인증이 완료되었습니다.");
				$('#layer_joinSns3 .phone .input_num').hide();
				$(".send_bt").html("인증완료");
				$("#event_input_cert").val(sns3_cert_num.val());
				$(".send_bt").attr("onclick", "");
			}else{
				alert("인증번호를 확인해주세요.");
				sns3_cert_num.focus();
			}
		}
	});
}



// Load the SDK asynchronously
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function() {
	FB.init({
	appId      : '1126010097519602',
	cookie     : true,  // enable cookies to allow the server to access 
						// the session
	xfbml      : true,  // parse social plugins on this page
	version    : 'v2.8' // use graph api version 2.8
	});
}

// This is called with the results from from FB.getLoginStatus().
function fbLogin() {
	FB.login(function(response) {
		if (response.status === 'connected') {
			// Logged into your app and Facebook.
			getMyProfile();
		} else {
			// The person is not logged into your app or we are unable to tell.
			//document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
		}
	} , {scope: "email,public_profile"} ); //나는 유저의 아이디(이메일)과 기본정보를 얻어오고 싶다.
}

function getMyProfile() {
	FB.api('/me', {fields: 'name,email,gender,age_range'}, function(response) {
		var idx = response.id;
		var name = response.name;
		var email = response.email;

		if(email == undefined){
			alert("이메일 인증이 필요한 계정입니다.\r\n페이스북에서 이메일을 인증해주세요.");
			return false;
		}

		var gender = response.gender;
		var age_range = response.age_range['min'];

		$.ajax({url:"/?s=fb_login",
				type:"POST",
				dataType: "json",
				async:true,
				data:{mode: "fb_login",idx:idx, name:name, email:email, gender:gender, age_range:age_range},
				error : function(request,status,error){
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success : function(data){
					if(data.result == "1"){
						document.getElementById('sns_email').value = email;
						document.getElementById('sns_id').value = "fb_"+idx;
						document.getElementById('sns_name').value = name;
						document.getElementById('sns_gender').value = gender;
						document.getElementById('sns_enc_id').value = idx;
						document.getElementById('sns_age').value = age_range;
						layerPopClose(); 
						layerPopId('layer_joinSns1'); 
					}else if(data.result == "2"){
						document.location.href=$('#returl').val();
					}else if(data.result == "4"){
						document.location.href='http://dsmart.siwonschool.com';
					}else if(data.result == "3"){
						document.getElementById('exist_email').innerHTML = data.exist_email;
						document.getElementById('exist_id').innerHTML = data.exist_id;
						document.getElementById('exist_rdate').innerHTML = data.exist_rdate;
						document.getElementById('sns_login_sort').innerHTML='페이스북'; 
						
						document.getElementById('sns_email').value = email;
						document.getElementById('sns_id').value = "fb_"+idx;
						document.getElementById('sns_name').value = name;
						document.getElementById('sns_gender').value = gender;
						document.getElementById('sns_age').value = age_range;
						document.getElementById('sns_enc_id').value = idx;
						layerPopClose(); 
						layerPopId('layer_joinSns2'); 
					}else{
						alert("다시 시도해주세요");
					}
				}
		});
	});
}