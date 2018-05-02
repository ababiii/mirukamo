$(document).ready(function(){

	$('.insert_id_box').css('display','none');

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

		if( !$("#uname").val() ){
			alert('이름을 입력해주세요.');
			$("#uname").focus();
			return false;
		}

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

		var uname = $("#uname").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();

		$.ajax({url:"/?s=find_cert",
					type:"POST",
					dataType: "json",
					data:{uname:uname, phone1:phone1, phone2:phone2, phone3:phone3},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#phone_cert_no").val(data.serial_no);
							alert('SMS 인증번호가 발송되었습니다.'); 
							$('#layer_popup_close').click();
						}else if(data.result == 2){
							alert('회원정보를 찾을 수 없습니다.');
							$('#layer_popup_close').click();
						}else{
							alert('잠시후 다시 시도해 주세요.');
						}
					}
		});
	});


	$("#phone_cert_do").on("click",function(){
		
		if( !$("#uname").val() ){
			alert('이름을 입력해주세요.');
			$("#uname").focus();
			return false;
		}

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
		var uname = $("#uname").val();  // 이름
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var cert_confirm = "Y";
		$.ajax({url:"/?s=find_cert",
					type:"POST",
					dataType: "json",
					data:{phone_cert_no:phone_cert_no, cert_num:cert_num, uname:uname, phone1:phone1, phone2:phone2, phone3:phone3, cert_confirm:cert_confirm},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#wrong_num").hide();
							alert('확인되었습니다.');
							$("#member_id").val(data.id);
							$("#phone_cert_form").submit();
						}else{
							$("#wrong_num").show();
						}
					}
		});

	});


	$("#emailcorp").on("change",function(){
		$("#email_back").val( $("#emailcorp").val() );
	});
	

	$("#email_cert_do").on("click",function(){

		if( !$("#uname2").val() ){
			alert('이름을 입력해주세요.');
			$("#uname2").focus();
			return false;
		}

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

		var email_addr = $("#email_id").val()+'@'+$("#email_back").val();
		$("#email_addr").html(email_addr);
		$("#email_name").html( $("#uname2").val() );

	});


	$("#email_send").on("click",function(){

		var uname = $("#uname2").val();
		var email_id = $("#email_id").val();
		var email_back = $("#email_back").val();
		$.ajax({url:"/?s=find_cert",
					type:"POST",
					dataType: "json",
					data:{uname:uname, email_id:email_id, email_back:email_back},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#wrong_email").hide();
							alert('발송되었습니다. 메일을 확인해 주세요.');
						}else if(data.result == 2){
							$("#wrong_email").show();
						}else if(data.result == 3){
							alert("소셜 로그인 회원입니다.\r\n아이디가 기억 안나시면 소셜(" + data.sns_sort + ")에서 계정을 찾아주세요.");
						}else{
							alert('잠시후 다시 시도해 주세요.');
						}
					}
		});

	});






	/* 비밀번호 찾기 script 영역 */
	$("#phone_pwcert_num").on("click",function(){

		if( !$("#user_id").val() ){
			alert('아이디를 입력해주세요.');
			$("#user_id").focus();
			return false;
		}

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


	$("#phone_pwcert_send").on("click",function(){

		var user_id = $("#user_id").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();

		$.ajax({url:"/?s=find_cert",
					type:"POST",
					dataType: "json",
					data:{user_id:user_id, phone1:phone1, phone2:phone2, phone3:phone3},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#phone_cert_no").val(data.serial_no);
							alert('SMS 인증번호가 발송되었습니다.'); 
							$('#layer_popup_close').click();
						}else if(data.result == 2){
							alert('회원정보를 찾을 수 없습니다.');
							$('#layer_popup_close').click();
						}else{
							alert('잠시후 다시 시도해 주세요.');
						}
					}
		});
	});


	$("#phone_pwcert_do").on("click",function(){
		
		if( !$("#user_id").val() ){
			alert('아이디를 입력해주세요.');
			$("#user_id").focus();
			return false;
		}

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
		var user_id = $("#user_id").val();  // 이름
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var cert_confirm = "Y";
		$.ajax({url:"/?s=find_cert",
					type:"POST",
					dataType: "json",
					data:{phone_cert_no:phone_cert_no, cert_num:cert_num, user_id:user_id, phone1:phone1, phone2:phone2, phone3:phone3, cert_confirm:cert_confirm},
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
		
		if( !$("#user_id2").val() ){
			alert('아이디를 입력해주세요.');
			$("#user_id2").focus();
			return false;
		}

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

		var email_addr = $("#email_id").val()+'@'+$("#email_back").val();
		$("#email_addr").html(email_addr);
		$("#email_name").html($("#user_id2").val());

	});


	$("#email_pw_send").on("click",function(){
		
		var user_id = $("#user_id2").val();
		var email_id = $("#email_id").val();
		var email_back = $("#email_back").val();
		$.ajax({url:"/?s=find_cert",
					type:"POST",
					dataType: "json",
					data:{user_id:user_id, email_id:email_id, email_back:email_back},
					error : function(request,status,error){
						//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(data){
						if(data.result == 1){
							$("#wrong_email").hide();
							$("#email_cert_no").val(data.serial_no);
							alert('발송되었습니다. 메일을 확인해 주세요.');
						}else if(data.result == 2){
							$("#wrong_email").show();
						}else{
							alert('잠시후 다시 시도해 주세요.');
						}
					}
		});
		
	});


	$("#email_pwcert_do").on("click",function(){
		
		
		if( !$("#user_id2").val() ){
			alert('아이디를 입력해주세요.');
			$("#user_id2").focus();
			return false;
		}

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
		
		if(!$("#name").val()){
			alert('이름을 입력해주세요.');
			$("#name").focus();
			return false;
		}



		var email_cert_no = $("#email_cert_no").val();  // 인증키값의 serial_no
		var user_id = $("#user_id2").val();
		var email_id = $("#email_id").val();
		var email_back = $("#email_back").val();
		var name=$("#name").val();
		var cert_num = $("#cert_num2").val();  // 인증키 6자리 값
		var cert_confirm = "Y";
		$.ajax({url:"login/reset_pw_form",
					type:"POST",
					dataType: "json",
					data:{id:user_id,email:email_id, email2:email_back, name : name},
					error : function(request,status,error){
						alert('잠시 후 다시 시도해 주세요.');
					},
					success : function(data){
						
						if(data==true){
							$('#email_cert_form').submit();
						}else{
							alert('존재하지 않는 회원정보입니다.');
						}
					}
		});
		
	});


	$("#usrpw").on("keyup",function(){
		var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,20}$/;
		if( !isPW.test($("#usrpw").val()) ){
			$("#pw_text").removeClass("ok");
			$("#pw_text").html('8~20자 영문 숫자 조합만 가능합니다.');
		}else{
			$("#pw_text").addClass("ok");
			$("#pw_text").html('적합합니다.');
		}
	});

	$("#usrpw_re").on("keyup",function(){
		if( $("#usrpw").val() != $("#usrpw_re").val()){
			$("#pw_text").removeClass("ok");
			$("#pw_text").html('비밀번호가 일치하지 않습니다.');
		}else{
			$("#pw_text").addClass("ok");
			$("#pw_text").html('확인됨');
		}
	});


	$("#pwchange_do").on("click",function(){

		var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,20}$/;
		if( !isPW.test($("#usrpw").val()) ){
			$("#pw_text").removeClass("ok");
			$("#pw_text").html('8~20자 영문 숫자 조합만 가능합니다.');
			return false;
		}

		if( !$("#usrpw").val() ){
			alert('비밀번호를 입력해주세요.');
			$("#usrpw").focus();
			return false;
		}

		if( !$("#usrpw_re").val() ){
			alert('확인 비밀번호를 입력해주세요.');
			$("#usrpw_re").focus();
			return false;
		}

		if( $("#usrpw").val() != $("#usrpw_re").val()){
			alert('비밀번호가 일치하지 않습니다.');
			$("#usrpw_re").focus();
			return false;
		}

		$("#pwchange").submit();
	});



});


window.name ="Parent_window";
