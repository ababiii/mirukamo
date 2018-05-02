function onlyNumber(event) {

    var key = window.event ? event.keyCode : event.which;    

    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
    || key  == 35 || key  == 36 || key  == 37 || key  == 39  // 방향키 좌우,home,end  
    || key  == 8  || key  == 46 ) // del, back space
    ) {
        return true;
    }else {
		alert("숫자만 입력해주세요.");
        return false;
    }    
};


function shareStory(url,text) {
  Kakao.Story.share({
	url: url,
	text: text
  });
}

function sharekakao(url,text) {
  Kakao.Link.createTalkLinkButton({
	  webButton: {
		url: url,
		text: text
	  }
  });
}

function twitterShare(url,text){
	var text = encodeURI(text);
	var url = encodeURIComponent(url);
	window.open("https://twitter.com/intent/tweet?text="+text+"&url="+url,"twitter","width=500px, height=400px, top=10px, left=10px, resizable=no, history=no, location=no, status=no");
}

function facebookShare(url,text){
	var text = encodeURI(text);
	var url = encodeURIComponent(url);
	window.open("https://www.facebook.com/sharer/sharer.php?u="+url,"twitter","width=500px, height=400px, top=10px, left=10px, resizable=no, history=no, location=no, status=no");
}

function bandShare(url,text){
	var text = encodeURI(text);
	var url = encodeURIComponent(url);
	location.href = "bandapp://create/post?text="+text+"&route="+url;
}

function copy_link(url) {
	var IE=(document.all)?true:false;
	if (IE) {
		alert("이 글의 주소가  클립보드에 복사되었습니다.");
		window.clipboardData.setData("Text", url);
	} else {
		var temp = prompt("이 글의 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
	}
}

var pagelike = function(sno){	
	$.ajax({url:"/?s=common&a=pagelike",
			type:"POST",
			dataType: "json",
			async:true,
			data:{ptype:'P',sno:sno},
			error : function(request,status,error){
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success : function(data){
				if(data.result == '1'){
					alert("좋아욧!");
					var cnt = $("#like"+sno).html();
					cnt = parseInt(cnt);
					cnt++;
					$("#like"+sno).html(cnt);
				}else if(data.result == '5'){
					alert('이미 참여하셨습니다.');
				}else if(data.result == '8'){
					loginChk();
				}else{
					alert('페이지를 새로고침후 진행해주세요.');
				}
			}
	});
}

var bbslike = function(sno,bbs){	
	$.ajax({url:"/?s=common&a=pagelike",
			type:"POST",
			dataType: "json",
			async:true,
			data:{ptype:'U',sno:sno,bbs:bbs,url:bbs},
			error : function(request,status,error){
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success : function(data){
				if(data.result == '1'){
					alert("좋아욧!");
					var cnt = $("#like"+sno).html();
					cnt = parseInt(cnt);
					cnt++;
					$("#like"+sno).html(cnt);
				}else if(data.result == '5'){
					alert('이미 참여하셨습니다.');
				}else if(data.result == '8'){
					loginChk();
				}else{
					alert('페이지를 새로고침후 진행해주세요.');
				}
			}
	});
}


var contentlike = function(sno){	
	$.ajax({url:"/?s=common&a=pagelike",
			type:"POST",
			dataType: "json",
			async:true,
			data:{ptype:'C',sno:sno},
			error : function(request,status,error){
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success : function(data){
				if(data.result == '1'){
					alert("좋아욧!");
					var cnt = $("#like"+sno).html();
					cnt = parseInt(cnt);
					cnt++;
					$("#like"+sno).html(cnt);
					$("#like"+sno).addClass("on");
				}else if(data.result == '5'){
					alert('이미 참여하셨습니다.');
				}else if(data.result == '8'){
					loginChk();
				}else{
					alert('페이지를 새로고침후 진행해주세요.');
				}
			}
	});
}

//환급반 환급조건 상세조회
function getRefund_detail(tcode,tno){
	$("#lret_list").val(tno+"|"+tcode).attr('selected', 'true');

	$.ajax({url:"/?s=myclass&a=refund_detail",
					type:"POST",
					dataType: "json",
					data:{tcode:tcode,tno:tno,data_type:"detail"},
					async : false,
					error : function(request,status,error){
						//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						//console.log(request.responseText);
					},
					success : function(data){
						$("#refund_detail_area").html(data.detail_cont);
					}
		});
}

//환급반 환급조건 상세조회
function setRefund_ex(tcode,tno){
	if(confirm('지금 수강 연장을 신청하시면, 이후 환급 신청이 불가능 합니다. \n그래도 수강 연장을 신청하시겠습니까?')) {
		$.ajax({url:"/?s=myclass&a=refund_detail",
			type:"POST",
			dataType: "json",
			data:{tcode:tcode,tno:tno,data_type:"ex"},
			async : false,
			error : function(request,status,error){
				//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				//console.log(request.responseText);
			},
			success : function(data){
				if(data.code == 1) {
					alert('수강 연장이 완료되었습니다.');
					location.reload();
				}
				else if(data.code == 2) {
					alert('이미 신청하셨습니다. 수강 연장신청은 한번만 가능합니다.');
				}
				else if(data.code == 3) {
					alert('수강을 시작해주세요.');
				}
				else {
					alert('다시 시도해주세요.');
				}
			}
		});
	}
}

function goRefundTest(tcode,tno){
	if(confirm("테스트는 1회만 참여가능합니다.\n테스트를 진행하시겠습니까?")){
		$(".wrap_layer_popup").hide();

		$('input[name=tno]').val(tno);
		$('input[name=tcode]').val(tcode);

		if(tcode == '00001875') {
			$('#score').text('총 20문제 중 90점이상 합격!');
		}
		else {
			$('#score').text('총 20문제 중 80점이상 합격!');
		}

		$.ajax({url:"/?s=myclass&a=refund_detail",
			type:"POST",
			dataType: "json",
			data:{tcode:tcode,tno:tno,data_type:"question"},
			async : false,
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				//console.log(request.responseText);
			},
			success : function(data){
				if(data.code == 1) {
					$("#test_question_qrea").html(data.question);
					$("#caution_text").html(data.caution_txt);
				}
				else {
					alert('이미 테스트에 참여하셨습니다. 테스트는 1번만 진행가능합니다.');
				}
			}
		});

		$("a.hidden_layer_popup").attr("id","pop_refund_test");
		// getRefundQuestions(tcode,tno);
		$("a.hidden_layer_popup").trigger("click");
	}
}

//환급반 테스트 해설보기
function goRefundTestExplain(tcode,tno){
		$.ajax({url:"/?s=myclass&a=refund_detail",
					type:"POST",
					dataType: "json",
					data:{tcode:tcode,tno:tno,data_type:"explainquestion"},
					async : false,
					error : function(request,status,error){
						//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						//console.log(request.responseText);
					},
					success : function(data){
						$("#test_explain_area").html(data.test_explain_area);
						$("#o_cnt").html(data.o_cnt);
						$("#x_cnt").html(data.x_cnt);
						$("a.hidden_layer_popup").attr("id","pop_refund_aw");
						$("a.hidden_layer_popup").trigger("click");
					}
		});
}

function getRefundQuestions(tcode,tno){
	$.ajax({url:"/?s=myclass&a=refund_detail",
				type:"POST",
				dataType: "json",
				data:{tcode:tcode,tno:tno,data_type:"testquestion"},
				async : false,
				error : function(request,status,error){
					//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					//console.log(request.responseText);
				},
				success : function(data){
					$("#testquestion").html(data.testquestion);	
				}
	});
}

//환급반 환급완료내역보기
function getRefund_done(tcode,tno){
	$.ajax({url:"/?s=myclass&a=refund_detail",
					type:"POST",
					dataType: "json",
					data:{tcode:tcode,tno:tno,data_type:"done"},
					async : false,
					error : function(request,status,error){
						//console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						//console.log(request.responseText);
					},
					success : function(data){
						$("#refund_done_area").html(data.detail_cont);
						$(".wrap_layer_popup").hide();
						$("a#pop_refund_done").trigger("click");
					}
		});
}

function goRefund(tcode,tno){
	$("form[name=pop_refund_applyF] input[name=refund_tcode]").val(tcode);
	$("form[name=pop_refund_applyF] input[name=refund_tno]").val(tno);
	$(".wrap_layer_popup").hide();
	$("a#pop_refund_apply").trigger("click");
}

// 설맞이 이벤트(1/26 ~ 2/28) 이벤트 메뉴
function evtqmenuComm(fixTop){
	if( $('.evtmenuPos#qmenu_comm').length ){
		headerH = $('#siwon_header').height();
		fixareaH = $('.wrap_fixarea.sub').height();
		scrTop = $(window).scrollTop();
		qmenuTop = $('.evtmenuPos#qmenu_comm').offset().top - fixareaH;

		if(scrTop>qmenuTop){ $('.evtmenuPos#qmenu_comm').children().css({'position':'fixed','top':fixTop+fixareaH}); }
		else{ $('.evtmenuPos#qmenu_comm').children().css({'position':'absolute','top':'0'}); }
	}
}

function member_detail(){
	$.ajax({
		url:"/?s=main&a=inc_act",
		dataType:"JSON",
		type : "POST",	
		data : {a:"member_detail"},
		error:function(request,status,error){
		},
		success:function(ret){
			$("#member_detail").html(ret.list);
		}
	});
}

function alarm_read(bbs,bbs_sno){
	$.ajax({
		url:"/?s=main&a=inc_act",
		dataType:"JSON",
		type : "POST",	
		data : {a:"alarm_read",bbs:bbs,bbs_sno:bbs_sno},
		error:function(request,status,error){
		},
		success:function(ret){
			return true;
		}
	});	
}

function alarm_del(key){
	var alarm_list = $("#alarm_list");
	var alarm_sno = new Array();
	if(key=="all"){
		if($("input[name='alarm_sno[]']",alarm_list).length){
			$("input[name='alarm_sno[]']",alarm_list).each(function(i){
				alarm_sno[i] = $(this).val();
			});
		}
	}else if(key=="read"){
		if($("input[name='read_alarm[]']",alarm_list).length){
			$("input[name='read_alarm[]']",alarm_list).each(function(i){
				alarm_sno[i] = $(this).val();
			});
		}
	}

	if(!alarm_sno[0]){
		alert('삭제할 수 있는 알람이 없습니다.');
	}else{
		$.ajax({
			url:"/?s=main&a=inc_act",
			dataType:"JSON",
			type : "POST",	
			data : {a:"alarm_del",alarm_sno:alarm_sno,key:key},
			error:function(request,status,error){
			},
			success:function(ret){
				alert(ret.msg);
				location.reload();
			}
		});
	}
}

$(document).ready(function(){

	//기수 호출
	if($(".member_flag").length){
		var uno = $("input[name=uno]").val();
		if(uno){

			var member_flag	= $.cookie(uno+"member_flag");
			if(!member_flag){
				$.ajax({
					url:"/?s=main&a=inc_act",
					dataType:"JSON",
					type : "POST",	
					data : {a:"member_flag"},
					error:function(request,status,error){
					},
					success:function(ret){
						$(".member_flag").text(ret.member_flag);
						$.cookie(uno+"member_flag",ret.member_flag);
					}
				});
			}
		}
	}

	if($(".coupon_num").length){
		//GNB내 다양한 카운팅 취합
		$.ajax({
			url:"/?s=main&a=inc_act",
			dataType:"JSON",
			type : "POST",	
			data : {a:"util_nums"},
			error:function(request,status,error){
			},
			success:function(ret){
				$(".alarm_num").append(ret.alarm_num);
				$("#alarm_list").html(ret.alarm_list);
				$(".coupon_num").append(ret.coupon_num);
				$(".cart_num").append(ret.cart_num);
			}
		});
	}

	//GNB내 다양한 카운팅 취합
	$.ajax({
		url:"/?s=main&a=inc_act",
		dataType:"JSON",
		type : "POST",	
		data : {a:"evt_num"},
		error:function(request,status,error){
		},
		success:function(ret){
			$(".evt_num").html(ret.evt_num);
			$(".evt_list").html(ret.list);
		}
	});

// 로그인 체크
	$("input[type=checkbox].id_check").customizeCRInput();
	$("input[type=radio].id_check").customizeCRInput();
// 썸네일 이미지 비율
	if( $('.imgLiquidFill').length ) $(".imgLiquidFill").imgLiquid({fill:true});
// 영상 페이지내 재생
	$('.movShow').click(function(){
		movShow( $('.movShow').index( $(this) ), $(this).attr('id') );
	});

// 슬라이더(탑배너)
	if( $('.topban2 .sl li').length > 1 ){
		$('.topban2 .sl ul').bxSlider({
			mode:'fade', 
			auto: true, 
			autoControls: true,
			controls: false,
			pager: false,
			autoHover: true,
			onSlideAfter: function() {
				$('.topban2 .bx-start').trigger('click');
			}
		});
	}

// 탭메뉴
	if( $('div[id^="tmenu_comm"]').length ){
		$('.tmenu li:first-child', this).addClass('on');
		$('.tcon> li', this).not('li:first-child').css({ 'display': 'none' });
	}
	$('div[id^="tmenu_comm"] .tmenu li').not('li.off').click(function(){
		thisWraptmenu = $(this).parent().parent();
		idx = $(this).index();
		if( !$(this).hasClass('on') ){
			$('.tmenu li', thisWraptmenu).removeClass('on');
			$(this).addClass('on');
			$('.tcon> li', thisWraptmenu).hide();
			$('.tcon> li', thisWraptmenu).eq(idx).show();
		}
	});

	$("#lret_list").change(function(){
		var ref = $("option:selected",this).val().split('|');
		getRefund_detail(ref[1],ref[0]);		
	});

	/* 설맞이 이벤트(1/26 ~ 2/28) 170124 */
	if($('.evtmenuPos').length){
		// 이벤트 메뉴
		evtqmenuComm(10);
		$(window).scroll(function(){
			evtqmenuComm(10);
		});
		// 이벤트 메뉴 닫기
		$('.evtmenu_cls').click(function(){
			$('.evtmenu').fadeOut();
		});
	}
	// 타 사이트 보기
	$('.fam_dep1 > li').click(function(){
		if( !$(this).hasClass('on') ){
			$('.fam_dep1 > li.on').children('.fam_dep2').slideUp();
			$('.fam_dep1 > li.on').removeClass('on');
			$(this).addClass('on');
			$(this).children('.fam_dep2').slideDown();
			console.log($(this));
		}else{
			$(this).children('.fam_dep2').slideUp();
			$('.fam_dep1 > li.on').removeClass('on');
		}
	});

	var topbanCon = $('.topban .cont');
	var scrTop = $(window).scrollTop();

// gnb
	$('.gnb_item, .wrap_snb').hover(function(){
		$(this).children('.wrap_snb').addClass('on');

		if( $(this).find('.banner_wrap').length){
			gnbBanner3.redrawSlider();
		}

	},function(){
		$(this).children('.wrap_snb').removeClass('on');
	});

	$('.wrap_snb.wr1 dl dd a').hover(function(){
		var idx = $(this).parents('dd').index();
		$('.wrap_snb.wr1 .box_r div').eq(idx).addClass('on');
		$('.wrap_snb.wr1 .box_r div').eq(idx).siblings('div').removeClass('on');
		if(idx == 4){gnbBanner1.redrawSlider();}
	});
// gnb(전체메뉴)
	$('.gnb_item.all .tit').hover(function() {
		if( $('.sitemap_pop').css('display')=='none' ){
			var bubble = $('.bubble_allmenu');
			bubble.show().delay(1500).fadeOut();
			$('.wrap_fixarea').hasClass('fix_top') ? $('.ico_menuall').css({'margin-top' : '8px'}) : $('.ico_menuall').css({'margin-top' : '0'});
		}
	});

// gnb banner
	var gnbBanner1 = $('.wr1_sl').bxSlider({
			auto: true, 
			controls: false,
			pager: ($('.wr1_sl > li').length > 1) ? true: false,
			autoHover: true,
			onSlideAfter: function() {
				$('.wr1_sl .bx-start').trigger('click');
			}
		});
	var gnbBanner3 = $('.wr3_sl').bxSlider({
			auto: ($('.wr3_sl > li').length > 1) ? true: false, 
			controls: false,
			pager: ($('.wr3_sl > li').length > 1) ? true: false,
			autoHover: true,
			onSlideAfter: function() {
				$('.wr3_sl .bx-start').trigger('click');
			}
		});
//gnb teachers
	$('.box_teachers a').mouseenter(function() {
		
		var tname = $(this).attr('class');

		$('.box_teachers a').removeClass('on');
		$(this).addClass('on');

		$('.teachers_img').find('.t_'+tname).addClass('on');
		$('.teachers_img').find('.t_'+tname).siblings('div').removeClass('on');
	});
// gnb myinfo, alarm layer
	$('.open_myinfo').click(function(){
		$("#siwon_header .mypage_layer, #siwon_header .alarms").hide();
		$('#siwon_header .myinfo').slideToggle(100);
	});
	$('#siwon_header .myinfo').mouseleave(function(){
		$('#siwon_header .myinfo').slideToggle(100);
	});
	$('.util2 .my').click(function(){
		$("#siwon_header .myinfo, #siwon_header .alarms").hide();
		$('.mypage_layer').slideToggle(100);
	});
	$('.mypage_layer').mouseleave(function(){
		$('.mypage_layer').slideToggle(100);
	});
	
	$('.util2 .alarm, .alarms_close').click(function(){
		$("#siwon_header .myinfo, #siwon_header .mypage_layer").hide();
		$('.alarms').slideToggle(100);
	});


// gnb random banner
	function randomRange(n1, n2) {
		return Math.floor( (Math.random() * (n2 - n1 + 1)) + n1 );
	}
	var maxBanCnt = $('.random_ban>a').length;
	var bannerShowCnt = randomRange(1,maxBanCnt);
	$('.random_ban>a').eq(bannerShowCnt-1).show();

// header shortcut
	$('.bt_scutlyr').click(function(){
		$('.scut_lyr').fadeIn();
	});

	// 사이트맵 첫 위치 설정
	if( $('sitemap_pop').length ) var sitemapTop = $('#siwon_header').offset().top + $('#siwon_header').height();
	$('.sitemap_pop').css('top',sitemapTop);

	$('.gnb_item.all').click(function() {

		sitemapTop = $('#siwon_header').offset().top + $('#siwon_header').height();
		//사이트맵 위치
		if( $('.wrap_fixarea').hasClass('fix_top') ) {
			gnbH = $('#siwon_header .fix_top #wrap_gnb').height();
			$('.sitemap_pop').css({'position' : 'fixed', 'top' : '0px'});
			$('.ico_menuall').css({'margin-top' : '8px'});
		}
		else{
			$('.sitemap_pop').css('position','absolute').css('top',sitemapTop);
			$('.ico_menuall').css({'margin-top' : '0'});
		}

		$('.sitemap_pop').toggle();
		$('.bg_layerpop').fadeToggle();
	});
	$('.sitemap_pop a, .sitemap_pop .bt_cls, .ico_menuall, .bg_layerpop').click(function() {
		allHide();
	});

// 서브 네비게이션
	$('.sec_navi_comm .navi_list > li').click(function(){
		$(this).toggleClass('on');
	});
	$('.sec_navi_comm .wrap_sub').mouseleave(function(){
		$('.sec_navi_comm .navi_list > li').removeClass('on');
	});

// 풋터 서비스 고객센터
	$("#btn_help").click(function(){
		$("#help_layer").toggle();
		$(this).toggleClass("close");
		return false;
	});

// 패밀리배너
	$("#btn_family").click(function(){
		$("#site_list").toggle();
		$(this).toggleClass("close");
		return false;
	});

//브라우저 체크하여 로그인 placeholder 처리
	var agt = navigator.userAgent.toLowerCase();
	if ( (agt.indexOf("chrome") != -1) || (agt.indexOf("safari") != -1) || (agt.indexOf("firefox") != -1) ) {
		$('input#id').attr('placeholder','ID');
		$('input#password').attr('placeholder','PASSWORD').removeClass('holder');
		$('input#id, input#password').siblings('label').css('display','none').removeClass('holder_label');
	}
	if ( $('input#id').prop('value') ) $('input#id').siblings('label').css('display','none');

//placeholder
	$('.holder').focus(function(){
		$(this).siblings('.holder_label').css('display','none');
	});
	$('.holder').focusout(function(){
		if(!$(this).prop('value')) $('.holder_label').css('display','block');
	});

// nav_list_comm
	$(".nav .drop > a").click(function(){
		var $navWidth = $(this).parent().width();
		var $navSub = $(this).parent().find(".sub_nav");
		$navSub.width($navWidth);
		$navSub.toggle();
		$(this).parent().toggleClass("on");
		return false;
	});
	$('body').click(function(){
		if( $('.sub_nav').css('display') == 'block' ) {
			$('.sub_nav').css('display','none');
			$('.sub_nav').parent('.drop').removeClass('on');
		}
	});

// 레이어팝업
	$('.layer_popup').live("click",function(){
		if ( !$(this).prop('id')) var i = 0
		else {
			var selId = $(this).attr('id');
			var count = $('.wrap_layer_popup').length;
			for( var i = 0 ; i < count ; i++ ){
				if ( $('.wrap_layer_popup:eq('+i+')').hasClass(selId) ) break;
			}
		}

		layerPop(i,'');
	});

	$('.layer_popup2').live("click",function(){
		if ( !$(this).prop('id')) var i = 0
		else {
			var selId = $(this).attr('id');
			var count = $('.wrap_layer_popup2').length;
			for( var i = 0 ; i < count ; i++ ){
				if ( $('.wrap_layer_popup2:eq('+i+')').hasClass(selId) ) break;
			}
		}

		layerPop(i,'');
	});

// 레이어팝업 닫기
	$('.layer_popup_close').live("click",function(){
		layerPopClose();
	});

// 스크롤 상단 고정형 퀵메뉴
	var sF_locTop; //스크롤 이동시 윈도우 최상단 부터의 거리 (해당 페이지에서 설정)
	$('#scrollFixedMenu').css({'position':'absolute','top':'0'});
// 공통 Top 버튼
	$("#body_top").hide();
		// fade in #top_up
		$(function () {
			$(window).scroll(function () {
				if ($(this).scrollTop() > 300) {
					$('#body_top').fadeIn();
				} else {
					$('#body_top').fadeOut();
				}
			});

			// scroll body to 0px on click
			$('#body_top').click(function () {
				$('body,html').animate({
					scrollTop: 0
				}, 200);
				return false;
			});
		});

	/* 패밀리배너 */
	// 높이 설정
	var winHeight = $(window).height();
	$('.wrap_family').css('height',winHeight);
	// 창 크기 변환 시
	$(window).resize(function(){
		winHeight = $(window).height();
		$('.wrap_family').css('height',winHeight);
	});
	$('.bg_family').css('display','block');
	// main setting
	var yChk = false;
	if ( location.search == '' && location.pathname == '/'){
		$('#siwon_header').addClass('header_main');
		$('.bg_family').css({'position': 'absolute'}).addClass('open').removeClass('close');
		$('.wrap_family .handle span').text('닫기');
		if ( $(window).scrollTop() > 0 ) {
			$('.bg_family').css('position', 'fixed');
			clear = setTimeout(function(){
				familyClose(yChk);
			},2000);
			yChk = true;
		}
	}
	// 스크롤 시 닫힘
	$(window).scroll(function(){
		if( $('#siwon_header').hasClass('header_main') ){
			if ( $('#siwon_header').offset().top < $(window).scrollTop() ) {
				$('.bg_family').css('position', 'fixed');
				if( !yChk  && $('.bg_family').hasClass('open') ) familyClose(yChk);
			} else if ( $('#siwon_header').offset().top >= $(window).scrollTop() ) {
				$('.bg_family').css('position', 'absolute');
			}
		}
	});
	// 클릭시 열기,닫기
	$('.bg_family .handle').click(function(){
		if( $('.bg_family').hasClass('open') ){
			familyClose(yChk);
		} else {
			familyOpen();
		}
	});
	$('.wrap_family').click(function(){
		if( $(this).parents().hasClass('close') ){
			familyOpen();
		}
	});

	/* 토스트 배너(공통) */
	if($('.toast_comm').length){
		if($('.toast_comm').hasClass('toastpop')){
			toastPop();
			var toastTimer = setTimeout(function(){
				toastRvs();
			},10000);
			// 토스트 배너 hover		
			$('.toast_comm').mouseenter(function(){
				$('.toast_comm').removeClass('toastpop',800);
				clearTimeout(toastTimer);
			});
			$('.toast_comm').mouseleave(function(){
				$('.toast_comm').addClass('toastpop',800);
			});
		}
	}
	
	/* 파일 첨부 _게시판 */
	$(".upload_input").change(function(){
		var nm = $(this).attr("name");
		$("input[name=" + nm + "_txt]").val($(this).val());
	});
});

$(window).load(function(){
	
	/* gnb */
	// #no_gnbFix 있을 시 gnb 고정 기능 작동 안되도록 
	if( !$('#no_gnbFix').length ){
		var gnbTop = $('.wrap_fixarea').offset().top;
		var gnbH = $('.wrap_fixarea').height();
		var secLoginH = $('.sec_login').height();
		// gnb고정 (첫 접속시 스크롤이 최상단이 아닌 경우)
		if( $(window).scrollTop() > gnbTop ){
			$('.wrap_fixarea').addClass('fix_top'); // 공통
			$('.ico_menuall').css({'margin-top' : '8px'});
		}
		$(window).scroll(function() {
			if ( $(window).scrollTop() > gnbTop ){
				$('.wrap_fixarea').addClass('fix_top');
				$('.wrap_fixarea .add_ico').find('i.ico_event').detach();
			}else{
				if($('.wrap_fixarea i.ico_event[name=products]').length == 0) {
					$('.wrap_fixarea .add_ico').append('<i class="ico_event" name="products">이벤트 진행중!</i>');				
				}
				$('.wrap_fixarea').removeClass('fix_top');
			}
		});
	}

	/* 패밀리배너 */
	// 높이 설정
	var topbanHeight = 0;
	var famPos = 0;
	var famHeight = $(window).height();
	var headHeight = $('#header_top').height();
	
	$(".ban_family").css("height",famHeight);
	$(".ban_family").css("top", headHeight+gnbH);
	//스크롤 시 고정
	if( $('.ban_family').length ) famPos = $('.ban_family').offset().top;
	$(window).scroll(function(){
		if( $('.ban_family').length ){
			var winPos = $(window).scrollTop();
			if( winPos > famPos ) $('.ban_family').addClass('fixed').css("top", 0);
			else $('.ban_family').removeClass('fixed').css("top", headHeight+gnbH);
		}
	});	
	$('.bt_open_fam, .ban_family .fam_closed .sns_list').css('display','block');
	// 열기
	$('.bt_open_fam').click(function(){
		$('.fam_closed').removeClass('on',300);
			$('.fam_opened').addClass('on',300);
	});
	// 닫기
	$('.bt_close_fam').click(function(){
		$('.fam_opened').removeClass('on',300);
			$('.fam_closed').addClass('on',300);
	});

	// 앵커값이동시 상단고정영역만큼 위치조정
	function gotoAnchor(){
		if(window.location.hash){
			var anchor = location.hash;
			//해당 앵커값을 가진 오브젝트가 존재할때만
			if($(anchor).length){
				$('html, body').animate({
					scrollTop: $(anchor).offset().top-$('.wrap_fixarea').height()
				}, "fast");
			}
		}
	}
	gotoAnchor();
	$(window).on('hashchange',function(){
		gotoAnchor();
	});	

	// 고정배너(하단) v2
	var banBtm = $('[id^="banBtmComm"]');
	if( banBtm.length ){
		var banBtmH = banBtm.height();
		$('#siwon_footer').css('padding-bottom',banBtmH);
		$('#body_top').css('bottom',10+banBtmH);
	}
	if( $('#banBtmComm .bt_close').length ){
		$('#banBtmComm .bt_close').click(function(){
			$('#banBtmComm').animate({ 'height': 0 }, 'fast');
			$('#siwon_footer').animate({ 'padding-bottom': 0 }, 'fast');
		});
	}
	// 고정배너(상단)
	var banTop = $('[id^="banTopComm"]');
	var banTopCon = $('[id^="banTopComm"]').children();

	if( banTop.length ){
		var topbanPos = banTop.offset().top;
		var banTopH = banTopCon.height();
		var winPos = $(window).scrollTop();
		if( topbanPos < winPos ) banTopCon.addClass('fixed');
		else banTopCon.removeClass('fixed');
		$(window).scroll(function(){
			var winPos = $(window).scrollTop();
			if( topbanPos < winPos ) banTopCon.addClass('fixed');
			else banTopCon.removeClass('fixed');
		});
		banTop.css({ 'padding-top':banTopH });
	}


	// 고정배너(하단) v1
	var banBtm = $('.wrap_banbtm');
	if(banBtm.css('display') == 'block'){
		$('body').css('padding-bottom',banBtm.height()-40);
		$('.wrap_banbtm .bt_close').click(function(){
			$('body').animate({'padding-bottom':0},'fast','swing');
		});
	}
	$(window).scroll(function(){
		if(banBtm.css('display') == 'block'){
			$('body').css('padding-bottom',banBtm.height()-40);
			$('.bt_close', banBtm).click(function(){
				$('body').animate({'padding-bottom':0},'fast','swing');
			});
		}
	});
});

// 토스트 배너 함수
function toastPop(){
	setTimeout(function(){
		$('.toast_comm').removeClass('toastpop',800);
	},2000);
}
function toastRvs(){
	/*
	if($.cookie("nobnr")=="Y"){
		$.cookie("toastview","N")
	}
	*/
	$.cookie("toastview","N",{expires:1});
	$('.toast_comm').addClass('toastpop',800);
}

//패밀리배너 열기
function familyOpen(){
	$('.bg_family').addClass('open').removeClass('close').animate({left: 0}, 200);
	$('.wrap_family').animate({'padding-right': 0 });
	$('.wrap_family .handle span').text('닫기');
}
//패밀리배너 닫기
function familyClose(yChk){
	if( yChk ) clearTimeout(clear);
	$('.bg_family').removeClass('open').addClass('close').animate({left: '-150px'}, 200);
	$('.wrap_family .handle span').text('열기');
	setTimeout(function(){
		$('.wrap_family').animate({'padding-right': '10px'});
	}, 100);
}
// 전체 메뉴 닫기
function allHide() {
	$('.bg_layerpop').fadeOut();
	$('.sitemap_pop').hide();
}

// input checkbox customizing
$.fn.customizeCRInput = function(options) {
	var options = $.extend({
		checked_class : "checked"
	}, options);

	return this.each(function(){
		var input = $(this);
		input.on("change",function(){
			
			var is_checked = input.is(":checked");
			var type = input.attr("type");
			var id = input.attr("id");
			var label = $("label[for="+id+"]");
			if (type == "checkbox") {
				if (input.is(":checked")) {
					label.addClass(options.checked_class);
				} else {
					label.removeClass(options.checked_class);
				}
			} else if (type == "radio") {
				$("input[name=\""+input.attr("name")+"\"]").each(function(idx){
					$("label[for="+$(this).attr("id")+"]").removeClass(options.checked_class);
				});
				label.addClass(options.checked_class);
			}
		});
	});
};

//레이어팝업 실행함수 v3 (사용권장)
function layerPopId(layerId, boxPosition){
	if ( !boxPosition ) boxPosition = 'absolute';
	// set size of popup box
	var winHeight = $(window).height();
	var popHeight = $('[class^="wrap_layer_popup"]#'+layerId).height() + parseInt( $('[class^="wrap_layer_popup"]#'+layerId).css('padding-top') );
	// top position of popup box
	if ( winHeight > popHeight ){ //컨텐츠 height가 window보다 작은 경우
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //컨텐츠 height가 window보다 큰 경우
		if (boxPosition == 'absolute') var positionTop = $(window).scrollTop() + 20 +'px';
		else var positionTop = 20 +'px';
	}
	// left position of popup box
	var popWidth = $('[class^="wrap_layer_popup"]#'+layerId).width();
	var positionLeft = -popWidth/2+'px';
	$('[class^="wrap_layer_popup"]#'+layerId).css({
		'position' : boxPosition,
		'top' : positionTop,
		'margin-left' : positionLeft
	});

	// 팝업창 띄우기
	if($('.layer_popup_bg').length){
		$('.layer_popup_bg').fadeIn();
	}else{
		$('<div class="layer_popup_bg"></div>').fadeIn().appendTo('body');
	}
	$('[class^="wrap_layer_popup"]#'+layerId).fadeIn(function(){
		$('[class^="wrap_layer_popup"]#'+layerId).css('display','block');
	});	
}

//레이어팝업 실행함수 v2 (사용지양)
var winHeight = $(window).height();
function layerPopOpen( id ,boxPosition){

	if(id=="login"){
		loginChk();
		return false;
	}

	var LayerBox = $("#"+id+"_Layer");

	if ( !boxPosition ) boxPosition = 'absolute';
	/* set size of popup box */
	var popHeight = LayerBox.height();

	/* top position of popup box */
	if ( winHeight > popHeight ){ //컨텐츠 height가 window보다 작은 경우
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //컨텐츠 height가 window보다 큰 경우
		if (boxPosition == 'absolute') var positionTop = $(window).scrollTop() + 20 +'px';
		else var positionTop = 20 +'px';
	}
	/* left position of popup box */
	var popWidth = LayerBox.width();
	var positionLeft = -popWidth/2+'px';
	LayerBox.css({
		'position' : boxPosition,
		'top' : positionTop,
		'margin-left' : positionLeft
	});

	/* 레이어팝업 띄우기 */
	$('<div class="layer_popup_bg"></div>').fadeIn().appendTo('body');
	LayerBox.fadeIn(function(){
		LayerBox.css('display','block');
	});
}

//레이어팝업 실행함수 v1 (사용지양)
function layerPop(i, boxPosition){
	if ( !boxPosition ) boxPosition = 'absolute';
	/* set size of popup box */
	var winHeight = $(window).height();
	var popHeight = $('.wrap_layer_popup:eq('+i+')').height();

	/* top position of popup box */
	if ( winHeight > popHeight ){ //컨텐츠 height가 window보다 작은 경우
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //컨텐츠 height가 window보다 큰 경우
		if (boxPosition == 'absolute') var positionTop = $(window).scrollTop() + 20 +'px';
		else var positionTop = 20 +'px';
	}
	/* left position of popup box */
	var popWidth = $('.wrap_layer_popup:eq('+i+')').width();
	var positionLeft = -popWidth/2+'px';
	$('.wrap_layer_popup:eq('+i+')').css({
		'position' : boxPosition,
		'top' : positionTop,
		'margin-left' : positionLeft
	});

	/* 레이어팝업 띄우기 */
	$('<div class="layer_popup_bg"></div>').appendTo('body');
	$('div.layer_popup_bg').fadeIn();
	$('.wrap_layer_popup:eq('+i+')').fadeIn(function(){
		$('.wrap_layer_popup:eq('+i+')').css('display','block');
	});
}
/* 레이어팝업 닫기 */
function layerPopClose(){
	$("[class^='wrap_layer_popup']").fadeOut();
	$('.layer_popup_bg').fadeOut(function(){
		$(this).remove();
	});
}

// bxslider 포함된 레이어 팝업창 열기
function layerPopSl(layerId, slideId, boxPosition){ //페이지에서 bxslider 선언된 함수를 변수화 하여 slideId 로 전달
	layerPopOpen(layerId, boxPosition);
	slideId.reloadSlider();
}
// bxslider 포함된 레이어 팝업창 닫기
function layerSlClose(slideId){
	$('.wrap_layer_popup').fadeOut();
	$('.layer_popup_bg').fadeOut(function(){
		$(this).remove();
	});
	slideId.destroySlider();
}

// 스크롤 상단 고정형 퀵메뉴 - 실행 함수
function scrollFixed(sF_locTop){
	if( $('.wrap_quick_menu').length ){
		scrollLength = $(window).scrollTop() + 50;
		fixedLength = $('.wrap_quick_menu').offset().top;

		if(scrollLength>fixedLength){
			$('#scrollFixedMenu').css({'position':'fixed','top':sF_locTop+'px'});
		} else {
			$('#scrollFixedMenu').css({'position':'absolute','top':'0'});
		}
	}
}

// 퀵메뉴2
function qmenuComm(fixTop){
	$('[id^="qmenu_comm"]').each(function(){
		headerH = $('#siwon_header').height();
		fixareaH = $('.wrap_fixarea').height();
		scrTop = $(window).scrollTop();
		qmenuTop = $(this).offset().top - fixareaH - fixTop;

		if(scrTop>qmenuTop){ $(this).children().css({'position':'fixed','top':fixTop+fixareaH}); }
		else{ $(this).children().css({'position':'absolute','top':'0'}); }
	});
}

// 탭 이동 - 부드러운 스크롤
function scroll_to_anchor(anchor_id) {
	var a_tag = $("#"+anchor_id);
	if(a_tag.length && !$('#no_gnbFix').length){
		$('html, body').animate({
			scrollTop: a_tag.offset().top - $('.wrap_fixarea').height()
		}, "slow");
	}else if(a_tag.length){
		$('html, body').animate({
			scrollTop: a_tag.offset().top
		}, "slow");
	}
}

var sitehost = $(location).attr('host');

var membersite = "member.siwonschool.com";
if(sitehost=="djapan.siwonschool.com"){
	membersite = "dmember.siwonschool.com";
}else if(sitehost=="tjapan.siwonschool.com"){
	membersite = "tmember.siwonschool.com";
}

//로그인 체크 함수
function loginChk(id,link){
	var returl = "";
	if(!link) link= '';
	if(!id || $.trim(id) == ''){
		if(link!=""){
			var returl = "&returl="+encodeURIComponent(link);
		}

		location.href = "https://"+membersite+"/?s=login"+returl;
		//layerPopOpen('login');
		
		//alert('로그인이 필요한 서비스 입니다.');
		//location.href='https://member.siwonschool.com/?s=login';
	}else{
		return true;
	}
}

//오늘의 각오 입력 함수 ㅎ
var today_submit = function(){

	var subject = $("#today_subject").val();

	if(!subject){
		alert('오늘의 각오를 입력해 주세요.');
		return false;
	}

	if(subject.length>25){
		alert('최대 25자 까지 입력이 가능합니다.');
		return false;
	}

	if(subject.length<5){
		alert('5자 이상 입력이 가능합니다.');
		return false;
	}

	$.ajax({
		url : "/?s=community&a=inc_act",
		data : {mode:"today_ready",m:"insert",subject:subject},
		dataType:"JSON",
		type :"POST",
		success:function(data){
			if(data.msg=="ok"){
				alert("등록되었습니다.");
				location.reload();
			}else{
				alert(data.msg);
			}
			
		}

	});
}

// 즐겨찾기 추가 함수
function bookmark_site(title, url) { // Internet Explorer
	if(window.chrome) { // Google Chrome
		alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
	} else if (window.sidebar) { // Firefox
		window.sidebar.addPanel(title, url, "");
	} else if(window.opera && window.print) { // Opera
		var elem = document.createElement('a');
		elem.setAttribute('href', url);
		elem.setAttribute('title', title);
		elem.setAttribute('rel', 'sidebar');
		elem.click();
	} else {
		window.external.AddFavorite(url, title);
	}
}

// 영상관련 공통함수
function movIdSwitch(videoId){
	imageSrc = '';
	switch (videoId){
		/* etc */
		case 'intro_japan' : // 일본어 소개
			videoSrc = '/japan/main/japan_main.flv';
			break;
		case 'levtest_ayaka' : // 레벨테스트(아야카)
			videoSrc = '/japan/Ayaka_LEVELTEST.flv';
			break;
		case 'secret_ayaka' : // 마스터 비법(아야카)
			videoSrc = '/japan/landing/J_MASTER.flv';
			break;
		case 'cf_jsh' : // 광고(정성호)
			videoSrc = '/japan/cf/japan_02_edit_30sec-MPEG-4.flv';
			break;
		case 'cf_jsh2' : // 광고(정성호)
			videoSrc = '/japan/cf/japan_01_edit_Last-MPEG-4.flv';
			break;
		case 'goself_jsh' : // 독학일본어(정성호)
			videoSrc = '/japan/sample/japan_f.flv';
			break;
		case 'cf_moeka' : // 광고(모에카)
			videoSrc = '/japan/interview/flv/moeka_intro.flv';
			break;
		case 'cf_joseho' : // 광고(조세호)
			videoSrc = '/japan/cf/joseho_flv.flv';
			break;
		case 'cf_joseho2' : // 광고(조세호 인터뷰)
			videoSrc = '/japan/cf/joseho_int_short.flv';
			break;

		/* 선생님 소개 */
		case 'intro_cyr' : // 최유리 선생님
			videoSrc = '/production/teacher/japan/flv/japan_20180105_cyr.flv';
			break;
		case 'intro_kks' : // 강기석 선생님
			videoSrc = '/japan/landing/151222_kangks_info.flv';
			break;
		case 'intro_ksk' : // 김수경 선생님
			videoSrc = '/japan/landing/151222_kimsk_info.flv';
			break;
		case 'intro_khj' : // 권현정 선생님
			videoSrc = '/japan/landing/151228_gurnhj_info.flv';
			break;
		case 'intro_skw' : // 서경원 선생님
			videoSrc = '/japan/landing/160113_serkw_info.flv';
			break;
		case 'intro_ayk' : // 아야카 선생님
			videoSrc = '/japan/landing/160921_ayaka_info.flv';
			break;
		case 'intro_nrm' : // 나루미 선생님
			videoSrc = '/japan/landing/nrm_japan.flv';
			break;
		case 'intro_hsa' : // 황선아 선생님
			videoSrc = '/japan/interview/flv/interview_hsh.flv';
			break;
		case 'intro_ksm' : // 고수민 선생님
			videoSrc = '/japan/interview/flv/interview_gsm.flv';
			break;

		/* 회원 인터뷰 */
		case 'review01' : // 박지현회원
			videoSrc = '/japan/main/japan_student_interview_park.flv';
			break;
		case 'review02' : // 정명자회원
			videoSrc = '/japan/main/japan_student_interview_jeong.flv';
			break;
		case 'review03' : // 신미연회원
			videoSrc = '/japan/main/japan_student_interview_sin.flv';
			break;
		case 'review04' : // 한지원회원
			videoSrc = '/japan/main/japan_student_interview_han.flv';
			break;
		case 'review05' : // 박지유회원
			videoSrc = '/japan/interview/flv/interview_pjy.flv';
			break;
		case 'review06' : // 김광조회원
			videoSrc = '/japan/interview/flv/interview_kkj.flv';
			break;
		case 'review07' : // 박가영회원
			videoSrc = '/japan/interview/flv/interviw_pky.flv';
			break;
		case 'review08' : // 고범준회원
			videoSrc = '/japan/interview/flv/interview_kbj.flv';
			break;
		case 'review09' : // 성민지회원
			videoSrc = '/japan/interview/flv/interviw_smj.flv';
			break;
		case 'review10' : // 이용민회원
			videoSrc = '/japan/interview/flv/interview_lym.flv';
			break;

		/* 샘플강의(최유리) */
		case 'step01_00' : // 왕초보탈출1탄 ot
			videoSrc = '/japan/ot/000074_00.flv';
			break;
		case 'step01_01' : // 왕초보탈출1탄 1강
			videoSrc = '/japan/main/000074_05.flv';
			break;
		case 'step01_07' : // 왕초보탈출1탄 11강
			videoSrc = '/japan/main/000074_11.flv';
			break;
		case 'step01new_00' : // NEW왕초보탈출1탄 ot
			videoSrc = '/japan/sample/001497_00.flv';
			break;
		case 'step01new_05' : // NEW왕초보탈출1탄 5강
			videoSrc = '/japan/sample/001497_05.flv';
			break;
		case 'step02_14' : // 왕초보탈출2탄 14강
			videoSrc = '/japan/main/000075_14.flv';
			break;
		case 'step03_09' : // 왕초보탈출3탄 9강
			videoSrc = '/japan/main/000076_09.flv';
			break;
		case 'speak1_01' : // 기초말하기 1강
			videoSrc = '/japan/sample/000086_01.flv';
			break;
		case 'speak1_04' : // 기초말하기 4강
			videoSrc = '/japan/sample/000086_04.flv';
			break;
		case 'speak2_01' : // 실전말하기 1강
			videoSrc = '/japan/sample/000087_01.flv';
			break;
		case 'speak2_02' : // 실전말하기 2강
			videoSrc = '/japan/sample/000087_02.flv';
			break;
			
		/* 샘플강의(김수경) */
		case 'talk1_00' : // 초급회화 ot
			videoSrc = '/japan/ot/000077_00.flv';
			break;
		case 'talk1_01' : // 초급회화 1강
			videoSrc = '/japan/main/000077_01.flv';
			break;
		case 'talk1_04' : // 초급회화 4강
			videoSrc = '/japan/main/000077_04.flv';
			break;
		case 'talk1_07' : // 초급회화 7강
			videoSrc = '/japan/main/000077_07.flv';
			break;
		case 'talk2_02' : // 중급회화 2강
			videoSrc = '/japan/main/000078_02.flv';
			break;
		case 'talk3_00' : // 고급회화 OT
			videoSrc = '/japan/sample/000236_0.flv';
			break;
		case 'talk3_03' : // 고급회화 3강
			videoSrc = '/japan/sample/000236_3.flv';
			break;
		case 'talk3_16' : // 고급회화 16강
			videoSrc = '/japan/sample/000236_16.flv';
			break;
		case 'talk3_19' : // 고급회화 19강
			videoSrc = '/japan/sample/000236_19.flv';
			break;
		case 'business1_00' : // 비즈니스회화1 OT
			videoSrc = '/japan/sample/000237_0.flv';
			break;
		case 'business1_05' : // 비즈니스회화1 10강
			videoSrc = '/japan/sample/000237_10.flv';
			break;
		case 'business1_14' : // 비즈니스회화1 19강
			videoSrc = '/japan/sample/000237_19.flv';
			break;
		case 'business2_02' : // 비즈니스회화2 2강
			videoSrc = '/japan/sample/000384_02.flv';
			break;
		case 'business2_10' : // 비즈니스회화2 10강
			videoSrc = '/japan/sample/000384_10.flv';
			break;
		case 'business2_14' : // 비즈니스회화2
			videoSrc = '/japan/sample/000384_sample.flv';
			break;
		case 'business3_01' : // 비즈니스회화3 1강
			videoSrc = '/japan/sample/000411_01.flv';
			break;
		case 'business3_04' : // 비즈니스회화3 4강
			videoSrc = '/japan/sample/000411_04.flv';
			break;

		/* 샘플강의(강기석) */
		case 'sptr_03' : // 왕초보 말하기 트레이닝 3강
			videoSrc = '/japan/main/000080_03.flv';
			break;
		case 'grmm1_00' : // 왕초보 일본어 문법 ot
			videoSrc = '/japan/ot/000079_00.flv';
			break;
		case 'grmm1_04' : // 왕초보 일본어 문법 4강
			videoSrc = '/japan/main/000079_04.flv';
			break;
		case 'midgr_01' : // 중급문법 1강
			videoSrc = '/japan/sample/000535_01.flv';
			break;
		case 'midgr_10' : // 중급문법 10강
			videoSrc = '/japan/sample/000535_10.flv';
			break;
		case 'highgr_05' : // 고급문법 5강
			videoSrc = '/japan/sample/000605_05.flv';
			break;
		case 'highgr_20' : // 고급문법 20강
			videoSrc = '/japan/sample/000605_20.flv';
			break;

		/* 샘플강의(권현정) */
		case 'grmm2_03' : // 속성문법 4강
			videoSrc = '/japan/main/000081_04.flv';
			break;
		case 'grmm2_07' : // 속성문법 8강
			videoSrc = '/japan/main/000081_08.flv';
			break;
		case 'word1_01' : // 필수어휘1 1강
			videoSrc = '/japan/main/000082_01.flv';
			break;
		case 'word2_04' : // 필수어휘2 4강
			videoSrc = '/japan/main/000083_04.flv';
			break;
		case 'word3_04' : // 필수어휘3 4강
			videoSrc = '/japan/sample/000084_4.flv';
			break;
		case 'word4_08' : // 필수어휘4 8강
			videoSrc = '/japan/sample/000085_08.flv';
			break;
		case 'jpchr_00' : // 일본어 한자 ot
			videoSrc = '/japan/sample/000534_00.flv';
			break;
		case 'jpchr_17' : // 일본어 한자 17강
			videoSrc = '/japan/sample/000534_17.flv';
			break;
		case 'jpchr2_09' : // 테마 한자 9강
			videoSrc = '/japan/sample/000850_09.flv';
			break;
		case 'jpchr2_12' : // 테마 한자 12강
			videoSrc = '/japan/sample/000850_04.flv';
			break;

		/* 샘플강의(아야카) */
		case 'travel_ot' : // 여행일본어회화
			videoSrc = '/japan/sample/000970_00.flv';
			break;
		case 'japan_master' : // 일본어 마스터비법
			videoSrc = '/japan/landing/J_MASTER.flv';
			break;
		case 'hiragana' : //히라가나1
			videoSrc = '/japan/site/Japanese_Ayaka_Hiragana_1.flv';
			break;
		case 'hiragana2' : // 히라가나2
			videoSrc = '/japan/site/Japanese_Ayaka_Hiragana_2.flv';
			break;
		case 'real_ot' : // 리얼 일본어 OT
			videoSrc = '/japan/sample/000414_00.flv';
			break;
		case 'drama1_03' : //드라마 일본어1 3강
			videoSrc = '/japan/sample/000414_03.flv';
			break;
		case 'drama2_05' : //드라마 일본어2 5강
			videoSrc = '/japan/sample/000533_05.flv';
			break;	
		case 'screen1_01' : //스크린 일본어1 1강
			videoSrc = '/japan/sample/001092_01.flv';
			break;	
		case 'screen2_01' : //스크린 일본어2 1강
			videoSrc = '/japan/sample/001262_01.flv';
			break;	

		/* 샘플강의(황선아) */
		case 'story_00' : //이야기 일본어 ot
			videoSrc = '/japan/sample/001101_00.flv';
			break;	
		case 'story_01' : //이야기 일본어 1강
			videoSrc = '/japan/sample/001101_01.flv';
			break;	
		case 'story_15' : //이야기 일본어 15강
			videoSrc = '/japan/sample/001101_15.flv';
			break;	

		/* 샘플강의(고수민) */
		case 'write_00' : //일본어 작문 ot
			videoSrc = '/japan/sample/001098_00.flv';
			break;	
		case 'write_01' : //일본어 작문 1강
			videoSrc = '/japan/sample/001098_01.flv';
			break;	
		case 'write_14' : //일본어 작문 14강
			videoSrc = '/japan/sample/001098_14.flv';
			break;	

		/* 샘플강의(서경원) */
		case 'jpt550r_01' : // jpt550독해 1강
			videoSrc = '/japan/main/000088_01.flv';
			break;
		case 'jpt650r_00' : // jpt650독해 OT
			videoSrc = '/japan/sample/000090_00.flv';
			break;
		case 'jpt650r_01' : // jpt650독해 1강
			videoSrc = '/japan/sample/000090_01.flv';
			break;
		case 'jpt650r_02' : // jpt650독해 2강
			videoSrc = '/japan/sample/000090_02.flv';
			break;

		/* 샘플강의(나루미) */
		case 'jlpt3word_03' : // jlpt n3문자어휘 3강
			videoSrc = '/japan/sample/000608_03.flv';
			break;
		case 'jlpt3word_15' : // jlpt n3문자어휘 15강
			videoSrc = '/japan/sample/000608_15.flv';
			break;

		/* 도서 */
		case 'sptr2_book' : // [도서] 중고급 말하기트레이닝
			videoSrc = '/japan/sample/000838_04.flv';
			break;
		case 'midgr_book' : // [도서] 중급문법
			videoSrc = '/japan/sample/000535_01.flv';
			break;
		case 'highgr_book' : // [도서] 고급문법
			videoSrc = '/japan/sample/000605_01.flv';
			break;
		case 'goselfstudy_book' : // [도서] GO독학일본어 첫걸음
			videoSrc = '/japan/sample/000969_00.flv';
			break;

		/* 이벤트 */
		case 'ev_recruit_bloger' : // 왕초보탈출1탄 1강
			videoSrc = '/japan/sample/report_promote_20170628.flv';
			break;
		default : 
			videoSrc = '';
			break;
	}
}
// 영상 팝업 ID로 바로 재생
var getWindowHeight = $(window).height();
function movieshowAuto(videoId,videoWidth,videoHeight){
	(videoWidth)? videoWidth = parseInt(videoWidth) : videoWidth = 680;
	(videoHeight)? videoHeight = parseInt(videoHeight) : videoHeight = 403;
	
	if( videoId.indexOf('.flv') > 0 ){ videoSrc = videoId; }
	else{ movIdSwitch(videoId); }

	var file = '<embed'+
		' type="application/x-shockwave-flash"'+
		' id="player2"'+
		' name="player2"'+
		' src="http://japan.siwonschool.com/common/flv/player.swf"'+
		' width="'+videoWidth+'"'+
		' height="'+videoHeight+'"'+
		' wmode="Opaque"'+
		' allowfullscreen="true"'+
		' allowscriptaccess="always"'+
		' stretching="exactfit"'+
		' flashvars="file=http://siwon-sample.gscdn.com'+videoSrc+'&image=&autostart=true" />';

		/*draw popup layer*/
		$('<div class="layerpop_bg"><div class="layerpop_box"><div class="layerpop_close"></div><div class="layerpop_video">'+file+'</div></div></div>').fadeIn().appendTo('body');

		/***outbox***/
		//set size of video outbox
		$('.layerpop_box').css('width',videoWidth).css('height',videoHeight+38);
		//top position of video outbox
		if(getWindowHeight > (videoHeight+38) )	var positionTop = getWindowHeight/(videoHeight+38)*10+'%';
		else var positionTop = 5+'px';
		//left position of video outbox
		var positionLeft = -videoWidth/2+'px';
		$('.layerpop_box').css('top',positionTop).css('margin-left',positionLeft);
		//set video frame size
		$('.layerpop_video').css('width',videoWidth).css('height',videoHeight);
		//set iframe size
		$('#inc_mov').css('width',videoWidth).css('height',videoHeight);
}
// 영상 팝업  재생(mp4)
var getWindowHeight = $(window).height();
function playVideo(sno,videoWidth,videoHeight){
	(videoWidth)? videoWidth = parseInt(videoWidth) : videoWidth = 680;
	(videoHeight)? videoHeight = parseInt(videoHeight) : videoHeight = 403;

	var videoSrc = '';
	
	$.ajax({url:"/m/?p=free_act",
			type:"POST",
			dataType: "json",
			data:{sno:sno,m:"getVodurl"},
			async:false,
			success : function(data){
				videoSrc = data.src;
			}
	});

	var file = '<video'+
		' id="myvideo"'+
		' class="video-js vjs-default-skin vjs-big-play-centered"'+
		' controls=""'+
		' autoplay=""'+
		' controlsList="nodownload"'+
		' preload="auto"'+
		' width="'+videoWidth+'"'+
		' height="'+videoHeight+'"'+
		' data-setup="{}">'+
		'<source'+
		' src="'+videoSrc+'" type="video/mp4">'+
		'<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that<a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>'+
		'</video>'

		/*draw popup layer*/
		$('<div class="layerpop_bg"><div class="layerpop_box"><div class="layerpop_close"></div><div class="layerpop_video">'+file+'</div></div></div>').fadeIn().appendTo('body');

		/***outbox***/
		//set size of video outbox
		$('.layerpop_box').css('width',videoWidth).css('height',videoHeight+38);
		//top position of video outbox
		if(getWindowHeight > (videoHeight+38) )	var positionTop = getWindowHeight/(videoHeight+38)*10+'%';
		else var positionTop = 5+'px';
		//left position of video outbox
		var positionLeft = -videoWidth/2+'px';
		$('.layerpop_box').css('top',positionTop).css('margin-left',positionLeft);
		//set video frame size
		$('.layerpop_video').css('width',videoWidth).css('height',videoHeight);
		//set iframe size
		$('#inc_mov').css('width',videoWidth).css('height',videoHeight);
		
//		video = document.getElementById("v");
//		video.load();
//		$('video')[0].play();
}

// 영상 페이지내 재생
function movShow(i, videoId){
	movBox = $('.movShow').eq(i);
	videoWidth = parseInt( movBox.width() );
	videoHeight = parseInt( movBox.height() + 20 );

	if( videoId ){
		movIdSwitch(videoId);
	}else{
		// id로 영상 불러올수없어 주소를 박아넣어야하는 경우
		imageSrc = '';
		videoSrc;	
	}

	var file = '<embed'+
		' type="application/x-shockwave-flash"'+
		' id="player2"'+
		' name="player2"'+
		' src="http://toeic.siwonschool.com/common/flv/player.swf"'+
		' width="'+videoWidth+'"'+
		' height="'+videoHeight+'"'+
		' wmode="Opaque"'+
		' allowfullscreen="true"'+
		' allowscriptaccess="always"'+
		' stretching="exactfit"'+
		' flashvars="file=http://siwon-sample.gscdn.com'+videoSrc+'&image=http://siwon-sample.gscdn.com'+imageSrc+'&autostart=true" />';

		if( $('embed', movBox).length ){ $('embed', movBox).remove() }
		movBox.children().hide();
		$(file).appendTo( movBox );
}


function naver_login_check() {
	window.open("/?s=naver_login_pop&a=naver_login_pop","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
}

function nvr_check_form(flag) {
	if( flag == 'privacy' && !$(':input:checkbox[name=privacy]:checked').val() ) {
		alert("이용약관과 개인정보처리방침 동의에 체크해 주세요.");
		$("#privacy").focus();
		return false;
	}
	document.frm_join.submit();
}

function add_favorite() {
	var url		= "http://www.11st.co.kr/connect/Gateway.tmall?method=Xsite&tid=1000013091";
	var title	=  "11번가 - 고객감동 No.1, 11번가";
	var bookmarkURL = window.location.href;
	var bookmarkTitle = document.title;
	var triggerDefault = false;
	if (window.sidebar && window.sidebar.addPanel) {
		// Firefox version < 23
		window.sidebar.addPanel(bookmarkTitle, bookmarkURL, '');
	} else if ((window.sidebar && (navigator.userAgent.toLowerCase().indexOf('firefox') > -1)) || (window.opera && window.print)) {
		// Firefox version >= 23 and Opera Hotlist
		var $this = $(this);
		$this.attr('href', bookmarkURL);
		$this.attr('title', bookmarkTitle);
		$this.attr('rel', 'sidebar');
		$this.off(e); triggerDefault = true;
	} else if (window.external && ('AddFavorite' in window.external)) {
		// IE Favorite
		window.external.AddFavorite(bookmarkURL, bookmarkTitle);
	} else {
		// WebKit - Safari/Chrome
		alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
	}
}

function download_shortcut() {
	alert('바로가기 파일을 설치하시면 바탕화면 바로가기 추가가 완료 됩니다.');
	if($(location).attr('hostname') == 'djapan.siwonschool.com') {
		location.href='http://djapan.siwonschool.com/?s=common&a=file_down&f=1337';
	}
	else if($(location).attr('hostname') == 'tjapan.siwonschool.com') {
		location.href='http://tjapan.siwonschool.com/?s=common&a=file_down&f=1337';
	}
	else {
		location.href='http://japan.siwonschool.com/?s=common&a=file_down&f=1336';
	}
	//location.href='http://djapan.siwonschool.com/?s=common&a=file_down&f=1336';
}


function sns_login(str){
	var url = $(location).attr('host');
	if(str == "k"){
		var kakao_url ="https://kauth.kakao.com/oauth/authorize?client_id=1aac81a2988cb55edd547f999d8c47f4&redirect_uri=http://"+url+"/?s=kakao_login&response_type=code";
		if($(location).attr('hostname') == 'myjapan.siwonschool.com') {
			kakao_url ="https://kauth.kakao.com/oauth/authorize?client_id=71c104d4d5f7f42777be13ced3ee212d&redirect_uri=http://"+url+"/?s=kakao_login&response_type=code";
		}

		window.open(kakao_url,"popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}else if(str == "f"){
		fbLogin();		
	}else if(str == "n"){
		window.open("http://"+$(location).attr('host')+"/?s=naver_login_pop&a=naver_login_pop","popup_login","width=476,height=534,toolbar=0, menubar=0, location=0, directories=0, status=0, scrollbars=0, resizable=0,left=150,top=150");
	}
	$("#sns_sort").val(str);
}

function sns_check_form(flag) {
	var member = "member.siwonschool.com";
	var host =$(location).attr('host').substring(0,1); 
	if(host == "d" || host == "t"){
		var url = host + member;
	}else{
		var url = member;
	}

	if( flag == 'privacy' && !$(':input:checkbox[name=privacy]:checked').val() ) {
		alert("이용약관과 개인정보처리방침 동의에 체크해 주세요.");
		$("#privacy").focus();
		return false;
	}
	
	document.frm_join.submit();
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
		var appId = '950375075041902';
		if($(location).attr('hostname') == 'myjapan.siwonschool.com') {
			appId = '270980393351101';
		}
		FB.init({
		appId      : appId,
		cookie     : true,  // enable cookies to allow the server to access 
							// the session
		xfbml      : true,  // parse social plugins on this page
		version    : 'v2.8' // use graph api version 2.8
		});
		
		if ($(location).attr('href').indexOf('p=grade') != -1) {
			// SW membership
			FB.Event.subscribe("edge.create", function(response) {
				$.ajax({url:"/?s=common&a=fblike",
					type:"POST",
					dataType: "json",
					data:{mode:'y'},
					success : function(data){
						$("#sns_point").html("100점");
						$("#total_point").html(data.point);
					}
				});
			});
			FB.Event.subscribe("edge.remove", function(response) {
				$.ajax({url:"/?s=common&a=fblike",
					type:"POST",
					dataType: "json",
					data:{mode:'n'},
					success : function(data){
						$("#sns_point").html("0점");
						$("#total_point").html(data.point);
					}
				});
			});
		}else if($(location).attr('href').indexOf('p=culture201708') != -1){
			FB.Event.subscribe("edge.create", function(response) {
				alert("1");
			});
			FB.Event.subscribe("edge.remove", function(response) {
				alert("2");			
			});
		}
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
				alert("페이스북 간편로그인이 불가능한 계정입니다.");
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
							layerPopOpen('joinSns1'); 
						}else if(data.result == "2"){
							document.location.reload();
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
							layerPopOpen('joinSns2'); 
						}else if(data.result == "5") {
							document.location.href = '/';
						}
						else{
							alert("다시 시도해주세요");
						}
					}
			});
		});
	}
	
	function setPrecode(code){
		var pre_code = code+","+$.cookie("pre_code");
		var temp = pre_code.split(",");
		var new_code = "";
		var i = 0;
		while(i<15){
			new_code += temp[i]+",";
			i++;
		}
		$.cookie("pre_code",new_code,{ expires: 30});
	}

	// 2017-03-20 hwlee : 우측배너 클릭수 집계
	function FnUpdateRightBanner(sno){
		$.ajax({
			url : "/?a=clickBanner",
			type:"POST",
			dataType: "json",
			async:true,
			data:{sno:sno},
			error : function(request,status,error){
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			},
			success : function(data){
				//console.log(data);
				/*if (target=="_blank"){
					var newWindow = window.open("about:blank");
					newWindow.location.href = link;
				}else{
					location.href = link;
				}*/
			},
			fail : function(){

			}
		});
	}
