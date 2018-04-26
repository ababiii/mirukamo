function onlyNumber(event) {

    var key = window.event ? event.keyCode : event.which;    

    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
    || key  == 35 || key  == 36 || key  == 37 || key  == 39  // 諛⑺뼢�� 醫뚯슦,home,end  
    || key  == 8  || key  == 46 ) // del, back space
    ) {
        return true;
    }else {
		alert("�レ옄留� �낅젰�댁＜�몄슂.");
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
		alert("�� 湲��� 二쇱냼媛�  �대┰蹂대뱶�� 蹂듭궗�섏뿀�듬땲��.");
		window.clipboardData.setData("Text", url);
	} else {
		var temp = prompt("�� 湲��� 二쇱냼�낅땲��. Ctrl+C瑜� �뚮윭 �대┰蹂대뱶濡� 蹂듭궗�섏꽭��", url);
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
					alert("醫뗭븘��!");
					var cnt = $("#like"+sno).html();
					cnt = parseInt(cnt);
					cnt++;
					$("#like"+sno).html(cnt);
				}else if(data.result == '5'){
					alert('�대� 李몄뿬�섏뀲�듬땲��.');
				}else if(data.result == '8'){
					loginChk();
				}else{
					alert('�섏씠吏�瑜� �덈줈怨좎묠�� 吏꾪뻾�댁＜�몄슂.');
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
					alert("醫뗭븘��!");
					var cnt = $("#like"+sno).html();
					cnt = parseInt(cnt);
					cnt++;
					$("#like"+sno).html(cnt);
				}else if(data.result == '5'){
					alert('�대� 李몄뿬�섏뀲�듬땲��.');
				}else if(data.result == '8'){
					loginChk();
				}else{
					alert('�섏씠吏�瑜� �덈줈怨좎묠�� 吏꾪뻾�댁＜�몄슂.');
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
					alert("醫뗭븘��!");
					var cnt = $("#like"+sno).html();
					cnt = parseInt(cnt);
					cnt++;
					$("#like"+sno).html(cnt);
					$("#like"+sno).addClass("on");
				}else if(data.result == '5'){
					alert('�대� 李몄뿬�섏뀲�듬땲��.');
				}else if(data.result == '8'){
					loginChk();
				}else{
					alert('�섏씠吏�瑜� �덈줈怨좎묠�� 吏꾪뻾�댁＜�몄슂.');
				}
			}
	});
}

//�섍툒諛� �섍툒議곌굔 �곸꽭議고쉶
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

//�섍툒諛� �섍툒議곌굔 �곸꽭議고쉶
function setRefund_ex(tcode,tno){
	if(confirm('吏�湲� �섍컯 �곗옣�� �좎껌�섏떆硫�, �댄썑 �섍툒 �좎껌�� 遺덇��� �⑸땲��. \n洹몃옒�� �섍컯 �곗옣�� �좎껌�섏떆寃좎뒿�덇퉴?')) {
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
					alert('�섍컯 �곗옣�� �꾨즺�섏뿀�듬땲��.');
					location.reload();
				}
				else if(data.code == 2) {
					alert('�대� �좎껌�섏뀲�듬땲��. �섍컯 �곗옣�좎껌�� �쒕쾲留� 媛��ν빀�덈떎.');
				}
				else if(data.code == 3) {
					alert('�섍컯�� �쒖옉�댁＜�몄슂.');
				}
				else {
					alert('�ㅼ떆 �쒕룄�댁＜�몄슂.');
				}
			}
		});
	}
}

function goRefundTest(tcode,tno){
	if(confirm("�뚯뒪�몃뒗 1�뚮쭔 李몄뿬媛��ν빀�덈떎.\n�뚯뒪�몃� 吏꾪뻾�섏떆寃좎뒿�덇퉴?")){
		$(".wrap_layer_popup").hide();

		$('input[name=tno]').val(tno);
		$('input[name=tcode]').val(tcode);

		if(tcode == '00001875') {
			$('#score').text('珥� 20臾몄젣 以� 90�먯씠�� �⑷꺽!');
		}
		else {
			$('#score').text('珥� 20臾몄젣 以� 80�먯씠�� �⑷꺽!');
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
					alert('�대� �뚯뒪�몄뿉 李몄뿬�섏뀲�듬땲��. �뚯뒪�몃뒗 1踰덈쭔 吏꾪뻾媛��ν빀�덈떎.');
				}
			}
		});

		$("a.hidden_layer_popup").attr("id","pop_refund_test");
		// getRefundQuestions(tcode,tno);
		$("a.hidden_layer_popup").trigger("click");
	}
}

//�섍툒諛� �뚯뒪�� �댁꽕蹂닿린
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

//�섍툒諛� �섍툒�꾨즺�댁뿭蹂닿린
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

// �ㅻ쭪�� �대깽��(1/26 ~ 2/28) �대깽�� 硫붾돱
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
		alert('��젣�� �� �덈뒗 �뚮엺�� �놁뒿�덈떎.');
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

	//湲곗닔 �몄텧
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
		//GNB�� �ㅼ뼇�� 移댁슫�� 痍⑦빀
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

	//GNB�� �ㅼ뼇�� 移댁슫�� 痍⑦빀
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

// 濡쒓렇�� 泥댄겕
	$("input[type=checkbox].id_check").customizeCRInput();
	$("input[type=radio].id_check").customizeCRInput();
// �몃꽕�� �대�吏� 鍮꾩쑉
	if( $('.imgLiquidFill').length ) $(".imgLiquidFill").imgLiquid({fill:true});
// �곸긽 �섏씠吏��� �ъ깮
	$('.movShow').click(function(){
		movShow( $('.movShow').index( $(this) ), $(this).attr('id') );
	});

// �щ씪�대뜑(�묐같��)
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

// ��찓��
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

	/* �ㅻ쭪�� �대깽��(1/26 ~ 2/28) 170124 */
	if($('.evtmenuPos').length){
		// �대깽�� 硫붾돱
		evtqmenuComm(10);
		$(window).scroll(function(){
			evtqmenuComm(10);
		});
		// �대깽�� 硫붾돱 �リ린
		$('.evtmenu_cls').click(function(){
			$('.evtmenu').fadeOut();
		});
	}
	// �� �ъ씠�� 蹂닿린
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
// gnb(�꾩껜硫붾돱)
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

	// �ъ씠�몃㏊ 泥� �꾩튂 �ㅼ젙
	if( $('sitemap_pop').length ) var sitemapTop = $('#siwon_header').offset().top + $('#siwon_header').height();
	$('.sitemap_pop').css('top',sitemapTop);

	$('.gnb_item.all').click(function() {

		sitemapTop = $('#siwon_header').offset().top + $('#siwon_header').height();
		//�ъ씠�몃㏊ �꾩튂
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

// �쒕툕 �ㅻ퉬寃뚯씠��
	$('.sec_navi_comm .navi_list > li').click(function(){
		$(this).toggleClass('on');
	});
	$('.sec_navi_comm .wrap_sub').mouseleave(function(){
		$('.sec_navi_comm .navi_list > li').removeClass('on');
	});

// �뗮꽣 �쒕퉬�� 怨좉컼�쇳꽣
	$("#btn_help").click(function(){
		$("#help_layer").toggle();
		$(this).toggleClass("close");
		return false;
	});

// �⑤�由щ같��
	$("#btn_family").click(function(){
		$("#site_list").toggle();
		$(this).toggleClass("close");
		return false;
	});

//釉뚮씪�곗� 泥댄겕�섏뿬 濡쒓렇�� placeholder 泥섎━
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

// �덉씠�댄뙘��
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

// �덉씠�댄뙘�� �リ린
	$('.layer_popup_close').live("click",function(){
		layerPopClose();
	});

// �ㅽ겕濡� �곷떒 怨좎젙�� �듬찓��
	var sF_locTop; //�ㅽ겕濡� �대룞�� �덈룄�� 理쒖긽�� 遺��곗쓽 嫄곕━ (�대떦 �섏씠吏��먯꽌 �ㅼ젙)
	$('#scrollFixedMenu').css({'position':'absolute','top':'0'});
// 怨듯넻 Top 踰꾪듉
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

	/* �⑤�由щ같�� */
	// �믪씠 �ㅼ젙
	var winHeight = $(window).height();
	$('.wrap_family').css('height',winHeight);
	// 李� �ш린 蹂��� ��
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
		$('.wrap_family .handle span').text('�リ린');
		if ( $(window).scrollTop() > 0 ) {
			$('.bg_family').css('position', 'fixed');
			clear = setTimeout(function(){
				familyClose(yChk);
			},2000);
			yChk = true;
		}
	}
	// �ㅽ겕濡� �� �ロ옒
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
	// �대┃�� �닿린,�リ린
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

	/* �좎뒪�� 諛곕꼫(怨듯넻) */
	if($('.toast_comm').length){
		if($('.toast_comm').hasClass('toastpop')){
			toastPop();
			var toastTimer = setTimeout(function(){
				toastRvs();
			},10000);
			// �좎뒪�� 諛곕꼫 hover		
			$('.toast_comm').mouseenter(function(){
				$('.toast_comm').removeClass('toastpop',800);
				clearTimeout(toastTimer);
			});
			$('.toast_comm').mouseleave(function(){
				$('.toast_comm').addClass('toastpop',800);
			});
		}
	}
	
	/* �뚯씪 泥⑤� _寃뚯떆�� */
	$(".upload_input").change(function(){
		var nm = $(this).attr("name");
		$("input[name=" + nm + "_txt]").val($(this).val());
	});
});

$(window).load(function(){
	
	/* gnb */
	// #no_gnbFix �덉쓣 �� gnb 怨좎젙 湲곕뒫 �묐룞 �덈릺�꾨줉 
	if( !$('#no_gnbFix').length ){
		var gnbTop = $('.wrap_fixarea').offset().top;
		var gnbH = $('.wrap_fixarea').height();
		var secLoginH = $('.sec_login').height();
		// gnb怨좎젙 (泥� �묒냽�� �ㅽ겕濡ㅼ씠 理쒖긽�⑥씠 �꾨땶 寃쎌슦)
		if( $(window).scrollTop() > gnbTop ){
			$('.wrap_fixarea').addClass('fix_top'); // 怨듯넻
			$('.ico_menuall').css({'margin-top' : '8px'});
		}
		$(window).scroll(function() {
			if ( $(window).scrollTop() > gnbTop ){
				$('.wrap_fixarea').addClass('fix_top');
				$('.wrap_fixarea .add_ico').find('i.ico_event').detach();
			}else{
				if($('.wrap_fixarea i.ico_event[name=products]').length == 0) {
					$('.wrap_fixarea .add_ico').append('<i class="ico_event" name="products">�대깽�� 吏꾪뻾以�!</i>');				
				}
				$('.wrap_fixarea').removeClass('fix_top');
			}
		});
	}

	/* �⑤�由щ같�� */
	// �믪씠 �ㅼ젙
	var topbanHeight = 0;
	var famPos = 0;
	var famHeight = $(window).height();
	var headHeight = $('#header_top').height();
	
	$(".ban_family").css("height",famHeight);
	$(".ban_family").css("top", headHeight+gnbH);
	//�ㅽ겕濡� �� 怨좎젙
	if( $('.ban_family').length ) famPos = $('.ban_family').offset().top;
	$(window).scroll(function(){
		if( $('.ban_family').length ){
			var winPos = $(window).scrollTop();
			if( winPos > famPos ) $('.ban_family').addClass('fixed').css("top", 0);
			else $('.ban_family').removeClass('fixed').css("top", headHeight+gnbH);
		}
	});	
	$('.bt_open_fam, .ban_family .fam_closed .sns_list').css('display','block');
	// �닿린
	$('.bt_open_fam').click(function(){
		$('.fam_closed').removeClass('on',300);
			$('.fam_opened').addClass('on',300);
	});
	// �リ린
	$('.bt_close_fam').click(function(){
		$('.fam_opened').removeClass('on',300);
			$('.fam_closed').addClass('on',300);
	});

	// �듭빱媛믪씠�숈떆 �곷떒怨좎젙�곸뿭留뚰겮 �꾩튂議곗젙
	function gotoAnchor(){
		if(window.location.hash){
			var anchor = location.hash;
			//�대떦 �듭빱媛믪쓣 媛�吏� �ㅻ툕�앺듃媛� 議댁옱�좊븣留�
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

	// 怨좎젙諛곕꼫(�섎떒) v2
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
	// 怨좎젙諛곕꼫(�곷떒)
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


	// 怨좎젙諛곕꼫(�섎떒) v1
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

// �좎뒪�� 諛곕꼫 �⑥닔
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

//�⑤�由щ같�� �닿린
function familyOpen(){
	$('.bg_family').addClass('open').removeClass('close').animate({left: 0}, 200);
	$('.wrap_family').animate({'padding-right': 0 });
	$('.wrap_family .handle span').text('�リ린');
}
//�⑤�由щ같�� �リ린
function familyClose(yChk){
	if( yChk ) clearTimeout(clear);
	$('.bg_family').removeClass('open').addClass('close').animate({left: '-150px'}, 200);
	$('.wrap_family .handle span').text('�닿린');
	setTimeout(function(){
		$('.wrap_family').animate({'padding-right': '10px'});
	}, 100);
}
// �꾩껜 硫붾돱 �リ린
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

//�덉씠�댄뙘�� �ㅽ뻾�⑥닔 v3 (�ъ슜沅뚯옣)
function layerPopId(layerId, boxPosition){
	if ( !boxPosition ) boxPosition = 'absolute';
	// set size of popup box
	var winHeight = $(window).height();
	var popHeight = $('[class^="wrap_layer_popup"]#'+layerId).height() + parseInt( $('[class^="wrap_layer_popup"]#'+layerId).css('padding-top') );
	// top position of popup box
	if ( winHeight > popHeight ){ //而⑦뀗痢� height媛� window蹂대떎 �묒� 寃쎌슦
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //而⑦뀗痢� height媛� window蹂대떎 �� 寃쎌슦
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

	// �앹뾽李� �꾩슦湲�
	if($('.layer_popup_bg').length){
		$('.layer_popup_bg').fadeIn();
	}else{
		$('<div class="layer_popup_bg"></div>').fadeIn().appendTo('body');
	}
	$('[class^="wrap_layer_popup"]#'+layerId).fadeIn(function(){
		$('[class^="wrap_layer_popup"]#'+layerId).css('display','block');
	});	
}

//�덉씠�댄뙘�� �ㅽ뻾�⑥닔 v2 (�ъ슜吏���)
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
	if ( winHeight > popHeight ){ //而⑦뀗痢� height媛� window蹂대떎 �묒� 寃쎌슦
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //而⑦뀗痢� height媛� window蹂대떎 �� 寃쎌슦
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

	/* �덉씠�댄뙘�� �꾩슦湲� */
	$('<div class="layer_popup_bg"></div>').fadeIn().appendTo('body');
	LayerBox.fadeIn(function(){
		LayerBox.css('display','block');
	});
}

//�덉씠�댄뙘�� �ㅽ뻾�⑥닔 v1 (�ъ슜吏���)
function layerPop(i, boxPosition){
	if ( !boxPosition ) boxPosition = 'absolute';
	/* set size of popup box */
	var winHeight = $(window).height();
	var popHeight = $('.wrap_layer_popup:eq('+i+')').height();

	/* top position of popup box */
	if ( winHeight > popHeight ){ //而⑦뀗痢� height媛� window蹂대떎 �묒� 寃쎌슦
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //而⑦뀗痢� height媛� window蹂대떎 �� 寃쎌슦
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

	/* �덉씠�댄뙘�� �꾩슦湲� */
	$('<div class="layer_popup_bg"></div>').appendTo('body');
	$('div.layer_popup_bg').fadeIn();
	$('.wrap_layer_popup:eq('+i+')').fadeIn(function(){
		$('.wrap_layer_popup:eq('+i+')').css('display','block');
	});
}
/* �덉씠�댄뙘�� �リ린 */
function layerPopClose(){
	$("[class^='wrap_layer_popup']").fadeOut();
	$('.layer_popup_bg').fadeOut(function(){
		$(this).remove();
	});
}

// bxslider �ы븿�� �덉씠�� �앹뾽李� �닿린
function layerPopSl(layerId, slideId, boxPosition){ //�섏씠吏��먯꽌 bxslider �좎뼵�� �⑥닔瑜� 蹂��섑솕 �섏뿬 slideId 濡� �꾨떖
	layerPopOpen(layerId, boxPosition);
	slideId.reloadSlider();
}
// bxslider �ы븿�� �덉씠�� �앹뾽李� �リ린
function layerSlClose(slideId){
	$('.wrap_layer_popup').fadeOut();
	$('.layer_popup_bg').fadeOut(function(){
		$(this).remove();
	});
	slideId.destroySlider();
}

// �ㅽ겕濡� �곷떒 怨좎젙�� �듬찓�� - �ㅽ뻾 �⑥닔
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

// �듬찓��2
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

// �� �대룞 - 遺��쒕윭�� �ㅽ겕濡�
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

//濡쒓렇�� 泥댄겕 �⑥닔
function loginChk(id,link){
	var returl = "";
	if(!link) link= '';
	if(!id || $.trim(id) == ''){
		if(link!=""){
			var returl = "&returl="+encodeURIComponent(link);
		}

		location.href = "https://"+membersite+"/?s=login"+returl;
		//layerPopOpen('login');
		
		//alert('濡쒓렇�몄씠 �꾩슂�� �쒕퉬�� �낅땲��.');
		//location.href='https://member.siwonschool.com/?s=login';
	}else{
		return true;
	}
}

//�ㅻ뒛�� 媛곸삤 �낅젰 �⑥닔 ��
var today_submit = function(){

	var subject = $("#today_subject").val();

	if(!subject){
		alert('�ㅻ뒛�� 媛곸삤瑜� �낅젰�� 二쇱꽭��.');
		return false;
	}

	if(subject.length>25){
		alert('理쒕� 25�� 源뚯� �낅젰�� 媛��ν빀�덈떎.');
		return false;
	}

	if(subject.length<5){
		alert('5�� �댁긽 �낅젰�� 媛��ν빀�덈떎.');
		return false;
	}

	$.ajax({
		url : "/?s=community&a=inc_act",
		data : {mode:"today_ready",m:"insert",subject:subject},
		dataType:"JSON",
		type :"POST",
		success:function(data){
			if(data.msg=="ok"){
				alert("�깅줉�섏뿀�듬땲��.");
				location.reload();
			}else{
				alert(data.msg);
			}
			
		}

	});
}

// 利먭꺼李얘린 異붽� �⑥닔
function bookmark_site(title, url) { // Internet Explorer
	if(window.chrome) { // Google Chrome
		alert("Ctrl+D�ㅻ� �꾨Ⅴ�쒕㈃ 利먭꺼李얘린�� 異붽��섏떎 �� �덉뒿�덈떎.");
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

// �곸긽愿��� 怨듯넻�⑥닔
function movIdSwitch(videoId){
	imageSrc = '';
	switch (videoId){
		/* etc */
		case 'intro_japan' : // �쇰낯�� �뚭컻
			videoSrc = '/japan/main/japan_main.flv';
			break;
		case 'levtest_ayaka' : // �덈꺼�뚯뒪��(�꾩빞移�)
			videoSrc = '/japan/Ayaka_LEVELTEST.flv';
			break;
		case 'secret_ayaka' : // 留덉뒪�� 鍮꾨쾿(�꾩빞移�)
			videoSrc = '/japan/landing/J_MASTER.flv';
			break;
		case 'cf_jsh' : // 愿묎퀬(�뺤꽦��)
			videoSrc = '/japan/cf/japan_02_edit_30sec-MPEG-4.flv';
			break;
		case 'cf_jsh2' : // 愿묎퀬(�뺤꽦��)
			videoSrc = '/japan/cf/japan_01_edit_Last-MPEG-4.flv';
			break;
		case 'goself_jsh' : // �낇븰�쇰낯��(�뺤꽦��)
			videoSrc = '/japan/sample/japan_f.flv';
			break;
		case 'cf_moeka' : // 愿묎퀬(紐⑥뿉移�)
			videoSrc = '/japan/interview/flv/moeka_intro.flv';
			break;
		case 'cf_joseho' : // 愿묎퀬(議곗꽭��)
			videoSrc = '/japan/cf/joseho_flv.flv';
			break;
		case 'cf_joseho2' : // 愿묎퀬(議곗꽭�� �명꽣酉�)
			videoSrc = '/japan/cf/joseho_int_short.flv';
			break;

		/* �좎깮�� �뚭컻 */
		case 'intro_cyr' : // 理쒖쑀由� �좎깮��
			videoSrc = '/production/teacher/japan/flv/japan_20180105_cyr.flv';
			break;
		case 'intro_kks' : // 媛뺢린�� �좎깮��
			videoSrc = '/japan/landing/151222_kangks_info.flv';
			break;
		case 'intro_ksk' : // 源��섍꼍 �좎깮��
			videoSrc = '/japan/landing/151222_kimsk_info.flv';
			break;
		case 'intro_khj' : // 沅뚰쁽�� �좎깮��
			videoSrc = '/japan/landing/151228_gurnhj_info.flv';
			break;
		case 'intro_skw' : // �쒓꼍�� �좎깮��
			videoSrc = '/japan/landing/160113_serkw_info.flv';
			break;
		case 'intro_ayk' : // �꾩빞移� �좎깮��
			videoSrc = '/japan/landing/160921_ayaka_info.flv';
			break;
		case 'intro_nrm' : // �섎（誘� �좎깮��
			videoSrc = '/japan/landing/nrm_japan.flv';
			break;
		case 'intro_hsa' : // �⑹꽑�� �좎깮��
			videoSrc = '/japan/interview/flv/interview_hsh.flv';
			break;
		case 'intro_ksm' : // 怨좎닔誘� �좎깮��
			videoSrc = '/japan/interview/flv/interview_gsm.flv';
			break;

		/* �뚯썝 �명꽣酉� */
		case 'review01' : // 諛뺤��꾪쉶��
			videoSrc = '/japan/main/japan_student_interview_park.flv';
			break;
		case 'review02' : // �뺣챸�먰쉶��
			videoSrc = '/japan/main/japan_student_interview_jeong.flv';
			break;
		case 'review03' : // �좊��고쉶��
			videoSrc = '/japan/main/japan_student_interview_sin.flv';
			break;
		case 'review04' : // �쒖��먰쉶��
			videoSrc = '/japan/main/japan_student_interview_han.flv';
			break;
		case 'review05' : // 諛뺤��좏쉶��
			videoSrc = '/japan/interview/flv/interview_pjy.flv';
			break;
		case 'review06' : // 源�愿묒“�뚯썝
			videoSrc = '/japan/interview/flv/interview_kkj.flv';
			break;
		case 'review07' : // 諛뺢��곹쉶��
			videoSrc = '/japan/interview/flv/interviw_pky.flv';
			break;
		case 'review08' : // 怨좊쾾以��뚯썝
			videoSrc = '/japan/interview/flv/interview_kbj.flv';
			break;

		/* �섑뵆媛뺤쓽(理쒖쑀由�) */
		case 'step01_00' : // �뺤큹蹂댄깉異�1�� ot
			videoSrc = '/japan/ot/000074_00.flv';
			break;
		case 'step01_01' : // �뺤큹蹂댄깉異�1�� 1媛�
			videoSrc = '/japan/main/000074_05.flv';
			break;
		case 'step01_07' : // �뺤큹蹂댄깉異�1�� 11媛�
			videoSrc = '/japan/main/000074_11.flv';
			break;
		case 'step01new_00' : // NEW�뺤큹蹂댄깉異�1�� ot
			videoSrc = '/japan/sample/001497_00.flv';
			break;
		case 'step01new_05' : // NEW�뺤큹蹂댄깉異�1�� 5媛�
			videoSrc = '/japan/sample/001497_05.flv';
			break;
		case 'step02_14' : // �뺤큹蹂댄깉異�2�� 14媛�
			videoSrc = '/japan/main/000075_14.flv';
			break;
		case 'step03_09' : // �뺤큹蹂댄깉異�3�� 9媛�
			videoSrc = '/japan/main/000076_09.flv';
			break;
		case 'speak1_01' : // 湲곗큹留먰븯湲� 1媛�
			videoSrc = '/japan/sample/000086_01.flv';
			break;
		case 'speak1_04' : // 湲곗큹留먰븯湲� 4媛�
			videoSrc = '/japan/sample/000086_04.flv';
			break;
		case 'speak2_01' : // �ㅼ쟾留먰븯湲� 1媛�
			videoSrc = '/japan/sample/000087_01.flv';
			break;
		case 'speak2_02' : // �ㅼ쟾留먰븯湲� 2媛�
			videoSrc = '/japan/sample/000087_02.flv';
			break;
			
		/* �섑뵆媛뺤쓽(源��섍꼍) */
		case 'talk1_00' : // 珥덇툒�뚰솕 ot
			videoSrc = '/japan/ot/000077_00.flv';
			break;
		case 'talk1_01' : // 珥덇툒�뚰솕 1媛�
			videoSrc = '/japan/main/000077_01.flv';
			break;
		case 'talk1_04' : // 珥덇툒�뚰솕 4媛�
			videoSrc = '/japan/main/000077_04.flv';
			break;
		case 'talk1_07' : // 珥덇툒�뚰솕 7媛�
			videoSrc = '/japan/main/000077_07.flv';
			break;
		case 'talk2_02' : // 以묎툒�뚰솕 2媛�
			videoSrc = '/japan/main/000078_02.flv';
			break;
		case 'talk3_00' : // 怨좉툒�뚰솕 OT
			videoSrc = '/japan/sample/000236_0.flv';
			break;
		case 'talk3_03' : // 怨좉툒�뚰솕 3媛�
			videoSrc = '/japan/sample/000236_3.flv';
			break;
		case 'talk3_16' : // 怨좉툒�뚰솕 16媛�
			videoSrc = '/japan/sample/000236_16.flv';
			break;
		case 'talk3_19' : // 怨좉툒�뚰솕 19媛�
			videoSrc = '/japan/sample/000236_19.flv';
			break;
		case 'business1_00' : // 鍮꾩쫰�덉뒪�뚰솕1 OT
			videoSrc = '/japan/sample/000237_0.flv';
			break;
		case 'business1_05' : // 鍮꾩쫰�덉뒪�뚰솕1 10媛�
			videoSrc = '/japan/sample/000237_10.flv';
			break;
		case 'business1_14' : // 鍮꾩쫰�덉뒪�뚰솕1 19媛�
			videoSrc = '/japan/sample/000237_19.flv';
			break;
		case 'business2_02' : // 鍮꾩쫰�덉뒪�뚰솕2 2媛�
			videoSrc = '/japan/sample/000384_02.flv';
			break;
		case 'business2_10' : // 鍮꾩쫰�덉뒪�뚰솕2 10媛�
			videoSrc = '/japan/sample/000384_10.flv';
			break;
		case 'business2_14' : // 鍮꾩쫰�덉뒪�뚰솕2
			videoSrc = '/japan/sample/000384_sample.flv';
			break;
		case 'business3_01' : // 鍮꾩쫰�덉뒪�뚰솕3 1媛�
			videoSrc = '/japan/sample/000411_01.flv';
			break;
		case 'business3_04' : // 鍮꾩쫰�덉뒪�뚰솕3 4媛�
			videoSrc = '/japan/sample/000411_04.flv';
			break;

		/* �섑뵆媛뺤쓽(媛뺢린��) */
		case 'sptr_03' : // �뺤큹蹂� 留먰븯湲� �몃젅�대떇 3媛�
			videoSrc = '/japan/main/000080_03.flv';
			break;
		case 'grmm1_00' : // �뺤큹蹂� �쇰낯�� 臾몃쾿 ot
			videoSrc = '/japan/ot/000079_00.flv';
			break;
		case 'grmm1_04' : // �뺤큹蹂� �쇰낯�� 臾몃쾿 4媛�
			videoSrc = '/japan/main/000079_04.flv';
			break;
		case 'midgr_01' : // 以묎툒臾몃쾿 1媛�
			videoSrc = '/japan/sample/000535_01.flv';
			break;
		case 'midgr_10' : // 以묎툒臾몃쾿 10媛�
			videoSrc = '/japan/sample/000535_10.flv';
			break;			
		case 'highgr_20' : // 怨좉툒臾몃쾿 20媛�
			videoSrc = '/japan/sample/000605_20.flv';
			break;

		/* �섑뵆媛뺤쓽(沅뚰쁽��) */
		case 'grmm2_03' : // �띿꽦臾몃쾿 4媛�
			videoSrc = '/japan/main/000081_04.flv';
			break;
		case 'grmm2_07' : // �띿꽦臾몃쾿 8媛�
			videoSrc = '/japan/main/000081_08.flv';
			break;
		case 'word1_01' : // �꾩닔�댄쐶1 1媛�
			videoSrc = '/japan/main/000082_01.flv';
			break;
		case 'word2_04' : // �꾩닔�댄쐶2 4媛�
			videoSrc = '/japan/main/000083_04.flv';
			break;
		case 'word3_04' : // �꾩닔�댄쐶3 4媛�
			videoSrc = '/japan/sample/000084_4.flv';
			break;
		case 'word4_08' : // �꾩닔�댄쐶4 8媛�
			videoSrc = '/japan/sample/000085_08.flv';
			break;
		case 'jpchr_00' : // �쇰낯�� �쒖옄 ot
			videoSrc = '/japan/sample/000534_00.flv';
			break;
		case 'jpchr_17' : // �쇰낯�� �쒖옄 17媛�
			videoSrc = '/japan/sample/000534_17.flv';
			break;
		case 'jpchr2_09' : // �뚮쭏 �쒖옄 9媛�
			videoSrc = '/japan/sample/000850_09.flv';
			break;
		case 'jpchr2_12' : // �뚮쭏 �쒖옄 12媛�
			videoSrc = '/japan/sample/000850_04.flv';
			break;

		/* �섑뵆媛뺤쓽(�꾩빞移�) */
		case 'travel_ot' : // �ы뻾�쇰낯�댄쉶��
			videoSrc = '/japan/sample/000970_00.flv';
			break;
		case 'japan_master' : // �쇰낯�� 留덉뒪�곕퉬踰�
			videoSrc = '/japan/landing/J_MASTER.flv';
			break;
		case 'hiragana' : //�덈씪媛���1
			videoSrc = '/japan/site/Japanese_Ayaka_Hiragana_1.flv';
			break;
		case 'hiragana2' : // �덈씪媛���2
			videoSrc = '/japan/site/Japanese_Ayaka_Hiragana_2.flv';
			break;
		case 'real_ot' : // 由ъ뼹 �쇰낯�� OT
			videoSrc = '/japan/sample/000414_00.flv';
			break;
		case 'drama1_03' : //�쒕씪留� �쇰낯��1 3媛�
			videoSrc = '/japan/sample/000414_03.flv';
			break;
		case 'drama2_05' : //�쒕씪留� �쇰낯��2 5媛�
			videoSrc = '/japan/sample/000533_05.flv';
			break;	
		case 'screen1_01' : //�ㅽ겕由� �쇰낯��1 1媛�
			videoSrc = '/japan/sample/001092_01.flv';
			break;	
		case 'screen2_01' : //�ㅽ겕由� �쇰낯��2 1媛�
			videoSrc = '/japan/sample/001262_01.flv';
			break;	

		/* �섑뵆媛뺤쓽(�⑹꽑��) */
		case 'story_00' : //�댁빞湲� �쇰낯�� ot
			videoSrc = '/japan/sample/001101_00.flv';
			break;	
		case 'story_01' : //�댁빞湲� �쇰낯�� 1媛�
			videoSrc = '/japan/sample/001101_01.flv';
			break;	
		case 'story_15' : //�댁빞湲� �쇰낯�� 15媛�
			videoSrc = '/japan/sample/001101_15.flv';
			break;	

		/* �섑뵆媛뺤쓽(怨좎닔誘�) */
		case 'write_00' : //�쇰낯�� �묐Ц ot
			videoSrc = '/japan/sample/001098_00.flv';
			break;	
		case 'write_01' : //�쇰낯�� �묐Ц 1媛�
			videoSrc = '/japan/sample/001098_01.flv';
			break;	
		case 'write_14' : //�쇰낯�� �묐Ц 14媛�
			videoSrc = '/japan/sample/001098_14.flv';
			break;	

		/* �섑뵆媛뺤쓽(�쒓꼍��) */
		case 'jpt550r_01' : // jpt550�낇빐 1媛�
			videoSrc = '/japan/main/000088_01.flv';
			break;
		case 'jpt650r_00' : // jpt650�낇빐 OT
			videoSrc = '/japan/sample/000090_00.flv';
			break;
		case 'jpt650r_01' : // jpt650�낇빐 1媛�
			videoSrc = '/japan/sample/000090_01.flv';
			break;
		case 'jpt650r_02' : // jpt650�낇빐 2媛�
			videoSrc = '/japan/sample/000090_02.flv';
			break;

		/* �섑뵆媛뺤쓽(�섎（誘�) */
		case 'jlpt3word_03' : // jlpt n3臾몄옄�댄쐶 3媛�
			videoSrc = '/japan/sample/000608_03.flv';
			break;
		case 'jlpt3word_15' : // jlpt n3臾몄옄�댄쐶 15媛�
			videoSrc = '/japan/sample/000608_15.flv';
			break;

		/* �꾩꽌 */
		case 'sptr2_book' : // [�꾩꽌] 以묎퀬湲� 留먰븯湲고듃�덉씠��
			videoSrc = '/japan/sample/000838_04.flv';
			break;
		case 'midgr_book' : // [�꾩꽌] 以묎툒臾몃쾿
			videoSrc = '/japan/sample/000535_01.flv';
			break;
		case 'highgr_book' : // [�꾩꽌] 怨좉툒臾몃쾿
			videoSrc = '/japan/sample/000605_01.flv';
			break;
		case 'goselfstudy_book' : // [�꾩꽌] GO�낇븰�쇰낯�� 泥リ구��
			videoSrc = '/japan/sample/000969_00.flv';
			break;

		/* �대깽�� */
		case 'ev_recruit_bloger' : // �뺤큹蹂댄깉異�1�� 1媛�
			videoSrc = '/japan/sample/report_promote_20170628.flv';
			break;
		default : 
			videoSrc = '';
			break;
	}
}
// �곸긽 �앹뾽 ID濡� 諛붾줈 �ъ깮
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
// �곸긽 �앹뾽  �ъ깮(mp4)
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

// �곸긽 �섏씠吏��� �ъ깮
function movShow(i, videoId){
	movBox = $('.movShow').eq(i);
	videoWidth = parseInt( movBox.width() );
	videoHeight = parseInt( movBox.height() + 20 );

	if( videoId ){
		movIdSwitch(videoId);
	}else{
		// id濡� �곸긽 遺덈윭�ъ닔�놁뼱 二쇱냼瑜� 諛뺤븘�ｌ뼱�쇳븯�� 寃쎌슦
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
		alert("�댁슜�쎄�怨� 媛쒖씤�뺣낫泥섎━諛⑹묠 �숈쓽�� 泥댄겕�� 二쇱꽭��.");
		$("#privacy").focus();
		return false;
	}
	document.frm_join.submit();
}

function add_favorite() {
	var url		= "http://www.11st.co.kr/connect/Gateway.tmall?method=Xsite&tid=1000013091";
	var title	=  "11踰덇� - 怨좉컼媛먮룞 No.1, 11踰덇�";
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
		alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') + '+D �ㅻ� �뚮윭 利먭꺼李얘린�� �깅줉�섏떎 �� �덉뒿�덈떎.');
	}
}

function download_shortcut() {
	alert('諛붾줈媛�湲� �뚯씪�� �ㅼ튂�섏떆硫� 諛뷀깢�붾㈃ 諛붾줈媛�湲� 異붽�媛� �꾨즺 �⑸땲��.');
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
		alert("�댁슜�쎄�怨� 媛쒖씤�뺣낫泥섎━諛⑹묠 �숈쓽�� 泥댄겕�� 二쇱꽭��.");
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
						$("#sns_point").html("100��");
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
						$("#sns_point").html("0��");
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
		} , {scope: "email,public_profile"} ); //�섎뒗 �좎��� �꾩씠��(�대찓��)怨� 湲곕낯�뺣낫瑜� �살뼱�ㅺ퀬 �띕떎.
	}

	function getMyProfile() {
		FB.api('/me', {fields: 'name,email,gender,age_range'}, function(response) {
			var idx = response.id;
			var name = response.name;
			var email = response.email;

			if(email == undefined){
				alert("�섏씠�ㅻ턿 媛꾪렪濡쒓렇�몄씠 遺덇��ν븳 怨꾩젙�낅땲��.");
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
							document.getElementById('sns_login_sort').innerHTML='�섏씠�ㅻ턿'; 
							
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
							alert("�ㅼ떆 �쒕룄�댁＜�몄슂");
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

	// 2017-03-20 hwlee : �곗륫諛곕꼫 �대┃�� 吏묎퀎
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