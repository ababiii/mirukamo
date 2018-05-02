//비밀번호 형식 체크 영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
function chkPwd(str){

 var pw = str;

 var num = pw.search(/[0-9]/g);

 var eng = pw.search(/[a-z]/ig);

 var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);

 

 if(pw.length < 8 || pw.length > 20){
  return false;
 }

 if(pw.search(/\s/) != -1){
  return false;

 } if(num < 0 || eng < 0 || spe < 0 ){
  return false;
 }

 

 return true;

}

$(document).ready(function(){
	
	$('#repassword_bt').on('click',function(){
		$('#repassword_form').submit();
	});

	$("#usrid").val('');
	/*$("#usrpw").val('');	
	$("#usrpw_re").val('');*/	
	
	$("#agree").on("click",function(){
		if( $(".step_overflow .input_check_label").eq(0).hasClass("on") && $(".step_overflow .input_check_label").eq(1).hasClass("on") && $(".step_overflow .input_check_label").eq(2).hasClass("on")){
			$("#joinform").submit();
		}else{
			if(!$(".step_overflow .input_check_label").eq(0).hasClass("on")){
				alert("利用約款に同意してください。");
				return;
			}
			if(!$(".step_overflow .input_check_label").eq(1).hasClass("on")){
				alert("有料サービスの利用約款に同意してください。");
				return;
			}
			if(!$(".step_overflow .input_check_label").eq(2).hasClass("on")){
				alert("個人情報の収集と利用することに同意してください。");
				return;
			}
		}
	});

	$("label").on("click",function(){
		//var typ = $( "#"+$(this).attr("for")   );
		var chkbox = $("#" + $(this).attr("for") );

		if(chkbox.attr("type") == 'radio' ){
			var nm = chkbox.attr("name");
			
			var input_radio = $("input[name='"+nm+"']");
			$.each(input_radio ,function(idx,val){
				$("label[for='" + input_radio.eq(idx).attr("id") + "'] ").removeClass("on");
			});
			$(this).addClass("on");

			//$(this).parents("ul").children().children("label").removeClass("on");
			//$(this).addClass("on");
		}else{
			if( $(this).attr("for") == 'ck_all'){
				if( $(this).hasClass("on") ){
					$(".input_check_label").removeClass("on");
					$("#ck_agree").prop("checked",false);
					$("#ck_agree_charge").prop("checked",false);
					$("#ck_poliy").prop("checked",false);
					$("#ck_third").prop("checked",false);
				}else{
					$(".input_check_label").addClass("on");
					$("#ck_agree").prop("checked",true);
					$("#ck_agree_charge").prop("checked",true);
					$("#ck_poliy").prop("checked",true);
					$("#ck_third").prop("checked",true);
				}
			}else{
				if( $(this).hasClass("on") ){
					$(this).removeClass("on");
				}else{
					$(this).addClass("on");
				}
			}
		}
	});


	$("#repetition").on("click",function(){
		
		var usrid = $("#usrid").val();
		var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;

		if( !isID.test(usrid) ){
			$("#id_text").removeClass("ok");
			$("#id_text").show();
			$("#id_text").html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
			return;
		}

		$.ajax({url:"/?s=joinproc",
					type:"POST",
					dataType: "json",
					data:{usrid:usrid},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#id_text").html(data.msg);
							$("#id_text").addClass("ok");
							$("#id_text").show();
							$("#usridcon").val(usrid);
						}else{
							$("#id_text").html(data.msg);
							$("#id_text").removeClass("ok");
							$("#id_text").show();
							$("#usridcon").val('');							
						}
					}
		});
	});

//	$("#usrid").on("keyup",function(){
//		if( $("#usrid").val() != $("#usridcon").val() ){
//			$("#id_text").html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
//			$("#id_text").css("color","#f54e4e");
//		}
//	});
	
	$("#usrpw , #newpw").on("keyup",function(){
	
		var str = $(this).val();		
		var isPW = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
//고도화	 if( !chkPwd(str) ){

		 if( !isPW.test(str) ){
			$("#pw_text").removeClass("ok");
			$("#pw_text").show();
			$("#pw_text").html('8~20字で英文、数字を配合してください。');
//고도화		$("#pw_text").html('8~20자리의 영문, 숫자, 특수문자를 포함해야 합니다.');
		 }else{
			$("#pw_text").addClass("ok");
			$("#pw_text").show();
			$("#pw_text").html('使用できます。');
		 }
		 
		 if($("#usrpw_re").val()!=''){
		 if( $("#usrpw").val() != $("#usrpw_re").val()){
				$("#pwre_text").removeClass("ok");
				$("#pwre_text").show();
				$("#pwre_text").html('パスワードが上と合いません。');
			}else{
				$("#pwre_text").addClass("ok");
				$("#pwre_text").show();
				$("#pwre_text").html('上と合います。');
			}
		 }
	});

	$("#usrpw_re").on("keyup",function(){

		if( $("#usrpw").val() != $("#usrpw_re").val()){
			$("#pwre_text").removeClass("ok");
			$("#pwre_text").show();
			$("#pwre_text").html('パスワードが上と合いません。');
		}else{
			$("#pwre_text").addClass("ok");
			$("#pwre_text").show();
			$("#pwre_text").html('上と合います。');
		}
	});

	$("#emailcorp").on("change",function(){
		$("#email_back").val( $("#emailcorp").val() );
	});
	
//	김지혜 추가
	$("#emailCheck").on("click",function(){
		var userEmail = $('#email_id').val();
 		var userEmail2 = $('#email_back').val();
 		if(userEmail==null||userEmail==''){
 			alert('イーメールを入力してください。');
 			$('#email_id').focus();
 			return;
 		}else if(userEmail2==null||userEmail2==''){
 			alert('イーメールを入力してください。');
 			$('#email_back').focus();
 			return;
 		}
 		
 		$.ajax({
 			type:'POST',
 			url:'userRegisterEmailCheck',
 			data: {email:userEmail,email2:userEmail2},
 			dataType : 'text',
 			success: function(result){
 				if(result==0){
 				
 					$("#checkEmailMessage").removeClass("ok");
					$("#checkEmailMessage").show();
 					$('#checkEmailMessage').text('すでに使われているイーメールです。');
 				}else{
 					$("#checkEmailMessage").addClass("ok");
					$("#checkEmailMessage").show();
 					$('#checkEmailMessage').text('使用できます。');
 				}
 			},
 			error : function(e){
 				alert('エラー');
 			}
 		});
	
	});
	
//	김지혜 추가 끝
	
	$("#join_do").on("click",function(){
		
		
		if( !$("#usrid").val() ){
			alert('IDを入力してください。');
			$("#usrid").focus();
			return false;
		}
		
		if($("#id_text").text()!='使用できます。'){
			alert('IDをチェックしてください。');
			return false;
		}

		if($("input[name=usrid]").val().length > 12){
			alert("아이디는 최대 12자까지 입력해주세요.");
			$("input[name=usrid]").focus();
			return;
		}

		if( !$("#usrpw").val() ){
			alert('パスワードを入力してください。');
			$("#usrpw").focus();
			return false;
		}

		if( !$("#usrpw_re").val() ){
			alert('パスワードをもう一度入力してください。');
			$("#usrpw_re").focus();
			return false;
		}
		
//		if( $("#usrid").val() != $("#usridcon").val() ){
//			alert('아이디 중복확인을 해주세요.');
//			$("#usrid").focus();
//			return false;
//		}

		var isPW = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		 if( !isPW.test($("#usrpw").val()) ){
			alert('8~20자 영문 숫자 조합이 아닙니다.');
			$("#usrpw").focus();
			return false;
		 }

		if(  $("#usrpw").val() != $("#usrpw_re").val()){
			alert('パスワードが一致しません。');
			$("#usrpw_re").focus();
			return false;
		}

		if($("input[name=usrpw]").val().length > 20){
			alert("비밀번호는 최대 20자까지 입력해주세요.");
			$("input[name=usrpw]").focus();
			return;
		}

		if($("input[name=usrpw_re]").val().length > 20){
			alert("비밀번호 확인은 최대 20자까지 입력해주세요.");
			$("input[name=usrpw_re]").focus();
			return;
		}
		
		if(!$("#uname").val()){
			alert('名前を入力してください。');
			$("#uname").focus();
			return false;
		}
		
		
		if($("#checkEmailMessage").text()!='使用できます。'){
			alert('イーメールをチェックしてください。');
			return false;
		}


		if( !$("#phone2").val() ){
			alert('電話番号を入力してください。');
			$("#phone2").focus();
			return false;
		}

		var num_patt = /[^0-9]/gi;
		if( num_patt.test($("#phone2").val()) ){
			alert('숫자만 사용 가능합니다.');
			$("#phone2").focus();
			return false;
		}

		if( !$("#phone3").val() ){
			alert('휴대전화번호를 입력해주세요.');
			$("#phone3").focus();
			return false;
		}

		if( num_patt.test($("#phone3").val()) ){
			alert('숫자만 사용 가능합니다.');
			$("#phone3").focus();
			return false;
		}

		if( !$("#email_id").val() ){
			alert('이메일주소를 입력해주세요.');
			$("#email_id").focus();
			return false;
		}

		if( !$("#email_back").val() ){
			alert('이메일주소를 입력해주세요.');
			$("#email_back").focus();
			return false;
		}

		var fullemail = $("#email_id").val()+'@'+$("#email_back").val();
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(!reg_email.test( fullemail )) {
			alert("이메일 형식이 잘못되었습니다.");
			$("#email_id").focus();
			return false;
		}
		
//		if( !$("#area").val() ){
//			alert('지역을 선택해주세요.');
//			$("#area").focus();
//			return false;
//		}

		
//		$.ajax({url:"/?s=duple_chk",
//		type:"POST",
//			dataType: "json",
//			data:{chk:"Y",phone1:$("#phone1").val(), phone2:$("#phone2").val(), phone3:$("#phone3").val(),email_id:$("#email_id").val(), email_back:$("#email_back").val() },
//			error : function(request,status,error){
//				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//			},
//			success : function(data){
//				if(data.result == "N"){
//					$("#avata").val($("#avata_selected").prop("src"));
//
//					if ($("#mobile_YN").val() == 'Y' && $("#site").val() == 'lab') {
//						 lab_tracking();
//					}
//					$("#joinform").submit();
//
//				}else if(data.result == "Y"){
//					if(data.rsort=="P"){
//						alert("이미 등록된 전화번호 입니다.");
//						$("#phone1").focus();
//						return false;
//					}else if(data.rsort=="E"){
//						alert("이미 등록된 이메일 입니다.");
//						$("#email_id").focus();
//						return false;
//					}
//				}else{
//					alert('잠시후 다시 시도해 주세요.');
//					return false;
//				}
//			}
//		});
		
	
		$("#joinform").submit();

		
	});
//회원가입 입력 확인 끝


//	$("#phone2").on("keyup",function(){
//		if(event.keyCode<48||event.keyCode>57){
//			$("#phone2").val('');
//		}
//	});
//	$("#phone3").on("keyup",function(){
//		if(event.keyCode<48||event.keyCode>57){
//			$("#phone3").val('');
//		}
//	});


	$("#phone_cert_num").on("click",function(){
		
		if( !$("#phone2").val() ){
			alert('휴대전화번호를 입력해주세요.');
			$("#phone2").focus();
			return false;
		}

		if( !$("#phone3").val() ){
			alert('휴대전화번호를 입력해주세요.');
			$("#phone3").focus();
			return false;
		}

		var phone_num = $("#phone1").val()+'-'+$("#phone2").val()+'-'+$("#phone3").val();
		$("#phone_num").html(phone_num);

	});


	$("#phone_cert_send").on("click",function(){

		if( $("#phone_send_check").val() ){
			alert('이미 발송되었습니다. 재발송하시려면 페이지를 새로고침 후 시도해 주세요.');
			$('#layer_popup_close').click();
			return false;
		}
		$("#phone_send_check").val('Y');

		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();

		$.ajax({url:"/?s=join_cert",
					type:"POST",
					dataType: "json",
					data:{phone1:phone1, phone2:phone2, phone3:phone3},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#phone_cert_no").val(data.serial_no);
							alert('SMS 인증번호가 발송되었습니다.'); 
							$('#layer_popup_close').click();
						}else if(data.result == 2){
							alert('이미 등록된 번호 입니다.');
							$('#layer_popup_close').click();
						}else{
							alert('잠시후 다시 시도해 주세요.');
						}
					}
		});
	});


	$("#phone_cert_do").on("click",function(){
		
		var usrid = $("#uname").val();
		var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=0-9]/gi;
		var rtjoin = $(this).data("rtjoin");

		if( !usrid ){
			alert('이름을 입력해주세요.');
			$("#uname").focus();
			return false;
		}

		if (RegExp.test(usrid)) {
			alert('이름에 특수문자, 숫자는 입력하실 수 없습니다.');
			$("#uname").focus();
			return false;
		}

//		if (rtjoin!='Y'){
//
//			if( !$("#born_year").val() ){
//				alert('생년월일을 입력해주세요.');
//				$("#born_year").focus();
//				return false;
//			}
//
//			if( !$("#born_month").val() ){
//				alert('생년월일을 입력해주세요.');
//				$("#born_month").focus();
//				return false;
//			}
//
//			if( !$("#born_day").val() ){
//				alert('생년월일을 입력해주세요.');
//				$("#born_day").focus();
//				return false;
//			}
//		}

		if( !$("#phone2").val() ){
			alert('휴대전화번호를 입력해주세요.');
			$("#phone2").focus();
			return false;
		}

		if( !$("#phone3").val() ){
			alert('휴대전화번호를 입력해주세요.');
			$("#phone3").focus();
			return false;
		}

		if( !$("#cert_num").val() ){
			alert('휴대폰으로 발송된 인증번호를 입력해주세요.');
			$("#cert_num").focus();
			return false;
		}

		var phone_cert_no = $("#phone_cert_no").val();  // 인증키값의 serial_no
		var cert_num = $("#cert_num").val();  // 인증키 6자리 값
		var cert_confirm = "Y";
		$.ajax({url:"/?s=join_cert",
					type:"POST",
					dataType: "json",
					data:{phone_cert_no:phone_cert_no, cert_num:cert_num, cert_confirm:cert_confirm},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#wrong_num").hide();
							alert('확인되었습니다.');
							$("#phone_cert_form").submit();
						}else{
							$("#wrong_num").show();
						}
					}
		});
		
	});





	$("#email_cert_num").on("click",function(){
		
		if( !$("#email_id").val() ){
			alert('이메일 앞부분을 입력해주세요.');
			$("#email_id").focus();
			return false;
		}

		if( !$("#email_back").val() ){
			alert('이메일 뒷부분을 입력해주세요.');
			$("#email_back").focus();
			return false;
		}

		if($("#email_back").val() == "daum.net" || $("#email_back").val() == "hanmail.net")
		{
			alert('한메일 및 다음은 메일전송이 원할하지 않을수 있습니다.\n다른 이메일 계정을 권장합니다.');
		}

		var email_addr = $("#email_id").val()+'@'+$("#email_back").val();
		$("#email_addr").html(email_addr);

	});


	$("#email_cert_send").on("click",function(){

		if( $("#email_send_check").val() ){
			alert('이미 발송되었습니다. 재발송하시려면 페이지를 새로고침 후 시도해 주세요.');
			$('#layer_popup_close').click();
			return false;
		}
		$("#email_send_check").val('Y');

		var email_id = $("#email_id").val();
		var email_back = $("#email_back").val();
		$.ajax({url:"/?s=join_cert",
					type:"POST",
					dataType: "json",
					data:{email_id:email_id, email_back:email_back},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#email_cert_no").val(data.serial_no);
							alert('인증번호가 발송되었습니다.'); 
							$('#layer_popup_close').click();
						}else if(data.result == 2){
							$("#wrong_email").show(); // 이미 등록된 이메일 주소
							$('#layer_popup_close').click();
						}else{
							alert('잠시후 다시 시도해 주세요.');
						}
					}
		});
	});


	$("#email_cert_do").on("click",function(){
		
		var usrid = $("#uname2").val();
		var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=0-9]/gi;
		//var rtjoin = $(this).data("rtjoin");

		if( !usrid ){
			alert('이름을 입력해주세요.');
			$("#uname2").focus();
			return false;
		}

		if (RegExp.test(usrid)) {
			alert('이름에 특수문자, 숫자는 입력하실 수 없습니다.');
			$("#uname2").focus();
			return false;
		}

//		if (rtjoin != 'Y'){
//			if( !$("#born_year2").val() ){
//				alert('생년월일을 입력해주세요.');
//				$("#born_year2").focus();
//				return false;
//			}
//
//			if( !$("#born_month2").val() ){
//				alert('생년월일을 입력해주세요.');
//				$("#born_month2").focus();
//				return false;
//			}
//
//			if( !$("#born_day2").val() ){
//				alert('생년월일을 입력해주세요.');
//				$("#born_day2").focus();
//				return false;
//			}
//		}

		if( !$("#email_id").val() ){
			alert('이메일 앞부분을 입력해주세요.');
			$("#email_id").focus();
			return false;
		}

		if( !$("#email_back").val() ){
			alert('이메일 뒷부분을 입력해주세요.');
			$("#email_back").focus();
			return false;
		}

		/*if( !$("#cert_num2").val() ){
			alert('메일로 발송된 인증번호를 입력해주세요.');
			$("#cert_num2").focus();
			return false;
		}*/

		var email_cert_no = $("#email_cert_no").val();  // 인증키값의 serial_no
		var cert_num = $("#cert_num2").val();  // 인증키 6자리 값
		var cert_confirm = "Y";
		
		
		var email=$('#email_id').val();
		var email2=$('#email_back').val();
		var name=$('#uname2').val();
		
		$.ajax({
			url : 'findMyID',
			type : 'post',
			data : {email : email , email2 : email2, name : name},
			dataType : 'text',
			success : function(str){
				$('.layer_popup_bg').css('display','block');
				alert(str);
				$('.layer_popup_bg').css('display','none');
			},
			error : function(e){
				alert('오류가 발생했습니다.');
			}
		});
		
	});

	$("input[name='attention[]']").click(function(){
		var cnt = $("input[name='attention[]']:checked").length;

		if(cnt > 6){
			alert("관심 과목은 최대 6개 선택할 수 있습니다.");
			$(this).prop("checked", false);
			$("label[for="+$(this).attr("id")+"]").removeClass("on");
		}
	});


});

var addr_post_input = function(p1,p2,addr){
	$("#postnum1").val(p1);
	$("#postnum2").val(p2);
	$("#address").val(addr);
}

window.name ="Parent_window";

function fnPopup(type){
	if(type == 'ipin'){
		window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_ipin.target = "popupIPIN2";
		document.form_ipin.action = "https://cert.vno.co.kr/ipin.cb";
		document.form_ipin.submit();
	}else{
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();
	}
}

function insured(){
	alert("이미 가입된 정보입니다.");
}