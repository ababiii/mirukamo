var cc=0
function showHide(id) {
    if (cc==0) {
        cc=1
        document.getElementById(id).style.display="block";
    } else {
        cc=0
        document.getElementById(id).style.display="none";
    }
}
// 우편번호 탭
$(function () {
    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
		var idx = $(this).index();

        $("ul.tabs li").removeClass("active");
		$(this).addClass("active");

		fade_fn('tab_content',idx);
    });
});

var fade_fn = function(cls,k){
	$("."+cls).hide();
	$("."+cls).eq(k).fadeIn();
}
$(document).ready(function(){
/* 로그인 체크 */
	$("input[type=checkbox].id_check").customizeCRInput();
	$("input[type=radio].id_check").customizeCRInput();
/* 아이디찾기 - 비밀번호찾기 전환 */
	$('#find_id').click(function(){
		$('#find_pw').removeClass();
		$('#find_id').addClass('on');
		$('.insert_id_box').css('display','none');
	});
	$('#find_pw').click(function(){
		$('#find_id').removeClass();
		$('#find_pw').addClass('on');
		$('.insert_id_box').css('display','block');
	});
// 회원탈퇴 이용중인 서비스
  $(".lec_ing").click(function(){
	 $(this).toggleClass("up");
  });
  $(".coupon_list").click(function(){
	 $(this).toggleClass("down");
  });
// 푸터 서비스 고객센터
  $("#btn_help").click(function(){
	 $("#help_layer").toggle();
	 $(this).toggleClass("close");
	 return false;
  });
// 패밀리 사이트
  $("#btn_family").click(function(){
	 $("#site_list").toggle();
	 $(this).toggleClass("close");
	 return false;
  });
//브라우저 체크하여 로그인 placeholder 처리
	var agt = navigator.userAgent.toLowerCase();
	if ( (agt.indexOf("chrome") != -1) || (agt.indexOf("safari") != -1) || (agt.indexOf("firefox") != -1) ) {
		$('input#input_id').attr('placeholder','ID');
		$('input#input_pw').attr('placeholder','PASSWORD').removeClass('holder');
		$('input#input_id, input#input_pw').siblings('label').css('display','none').removeClass('holder_label');
	}
	if ( $('input#id').prop('value') ) $('input#id').siblings('label').css('display','none');
//placeholder
	$('.holder').focus(function(){
		$(this).siblings('.holder_label').css('display','none');
	});
	$('.holder').focusout(function(){
		if(!$(this).prop('value')) $('.holder_label').css('display','block');
	});
// 체크박스 on/off
	$('input[type="checkbox"]').on('click',function(){
		if( $(this).prop('checked') ) $(this).siblings('label').addClass('on');
		else $(this).siblings('label').removeClass('on');
	});
// 라디오박스 on/off
//	$("label").click(function(){
//		var chkbox = $("#" + $(this).attr("for") );
//		
//		if(chkbox.attr("readonly") == 'readonly'){
//			return false;
//		}
//
//		if(chkbox.attr("type") == "radio"){
//			var nm = chkbox.attr("name");
//			var input_radio = $("input[name='"+nm+"']");
//			$.each(input_radio ,function(idx,val){
//				$("label[for='" + input_radio.eq(idx).attr("id") + "'] ").removeClass("on");
//			});
//		}
//		$(this).addClass("on");
//	});
// 인증 탭
	$('li.phone > a').click(function(){
		$('.phone_join_wrap').css('display','block');
		$(this).addClass('on');
		$('li.email > a').removeClass('on');
		$('.email_join_wrap').css('display','none');
	});
	$('li.email > a').click(function(){
		$('.email_join_wrap').css('display','block');
		$(this).addClass('on');
		$('li.phone > a').removeClass('on');
		$('.phone_join_wrap').css('display','none');
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
	/* 레이어 팝업창 닫기 */
	$('.layer_popup_close').live("click",function(){
		$('.wrap_layer_popup').fadeOut();
		$('.layer_popup_bg').fadeOut();
	});
//레이어 팝업 - 실행 함수
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

	/* 팝업창 띄우기 */
	$('<div class="layer_popup_bg"></div>').fadeIn().appendTo('body');
	$('.wrap_layer_popup:eq('+i+')').fadeIn(function(){
		$('.wrap_layer_popup:eq('+i+')').css('display','block');
	});
}
// 프로필 사진: 이미지 클릭시 레이어창 보임
	$(".profile_wrap > .avata .btn_edit").click(function() {
		$(".avataview").toggle();
	});
	// 프로필 사진: 닫기 클릭시 레이어창 숨김
	$(".avataview .btn_close").click(function() {
		$(".avataview").hide();
	});
	// 프로필 사진(레이어창): 이미지 클릭시 선택됨
	$(".viewlist .btn_edit").click(function() {
		var imgSrc = $(this).siblings("img").attr("src");
		$(".profile_wrap > .avata img").attr("src", imgSrc);
	});
});
// 메인
$(document).ready(function(){
	var i=0;
	var num = 7;
	$(".slide_service").bxSlider({
		autoHover: true,
		speed: 500,
		pause: 5000,
		pagerCustom: '#service_pager',
		auto: true,
		autoControls: true,
		oneToOneTouch: false,
		//touchEnabled: false,
		onSliderLoad: function() {
			i = 0;
			countLi = $('#service_pager li').length; //메뉴 li 개수 확인
			lasti = countLi - 1;
		}, onSlidePrev: function() {
			check = 'prev';
			if( i ==0 ?  i = lasti : i-- );
			pagerChange(check,i,num,countLi);
		}, onSlideNext: function() {
			check = 'next';
			if( i == lasti ?  i = 0 : i++ );
			pagerChange(check,i,num,countLi);
		}, onSlideBefore: function() {
		}, onSlideAfter: function() {
			$('.bx-start').trigger('click');
		}, onSliderResize: function() {
			check = 'next';
			pagerChange(check,i,num,countLi);
			$('.bx-start').trigger('click');
		}
	});
});

/* 레이어 팝업 */
//레이어 팝업창 열기
function layerPopId(layerId, boxPosition){
	if ( !boxPosition ) boxPosition = 'absolute';
	// set size of popup box
	var winHeight = $(window).height();
	var popHeight = $('.wrap_layer_popup#'+layerId).height();

	// top position of popup box
	if ( winHeight > popHeight ){ //컨텐츠 height가 window보다 작은 경우
		if (boxPosition == 'absolute') 	var positionTop = (winHeight-popHeight)/2 + $(window).scrollTop() +'px';
		else var positionTop =  (winHeight-popHeight)/2 +'px';
	} else { //컨텐츠 height가 window보다 큰 경우
		if (boxPosition == 'absolute') var positionTop = $(window).scrollTop() + 20 +'px';
		else var positionTop = 20 +'px';
	}
	// left position of popup box
	var popWidth = $('.wrap_layer_popup#'+layerId).width();
	var positionLeft = -popWidth/2+'px';
	$('.wrap_layer_popup#'+layerId).css({
		'position' : boxPosition,
		'top' : positionTop,
		'margin-left' : positionLeft
	});

	// 팝업창 띄우기
	$('<div class="layer_popup_bg"></div>').fadeIn().appendTo('body');
	$('.wrap_layer_popup#'+layerId).fadeIn(function(){
		$('.wrap_layer_popup#'+layerId).css('display','block');
	});
}
// 레이어 팝업창 닫기
function layerPopClose(){
	$('.wrap_layer_popup').fadeOut();
	$('.layer_popup_bg').fadeOut();
}

/* 화면 크기에 따라 pager 이동 길이 변경 */
function pagerChange(check,i,num,countLi){
	activeIdx = $('#service_pager li a.active').parent().index() +1;

	if( ( countLi / num ) > 1 && ( countLi / num ) < 2 ){
		// 메뉴가 2페이지가 안될 때
		if ( check == 'next' ){
			if( activeIdx  == num ){
				var posLeft = -123 * ( countLi % num );
			} else if ( activeIdx == countLi  ) {
				var posLeft = 0;
				i=0;
			}
		} else if (check == 'prev'){
			if( activeIdx == 1 ) {
				var posLeft = -123 * ( countLi % num );
			} else if ( activeIdx == ( countLi % num +1 ) ){
				var posLeft = 0;
			}
		}
	} else{
		// 메뉴가 2페이지가 넘을 때
		if ( check == 'next' ){
			if( activeIdx % num == 0 ){
				var posLeft = -123 * i;
			} else if ( activeIdx == countLi ) {
				var posLeft = 0;
				i=0;
			}
		} else if (check == 'prev'){
			if( activeIdx == 1 ) {
				i=countLi;
				var posLeft = -123 * ( ( countLi - parseInt( i%num )) ) ;
			} else if (  activeIdx == ( countLi % num +1 ) ){
				var posLeft = -123 * (i-num+1) ;
			}
		}
	}
	$( '#siwon_container #service_pager' ).animate({left: posLeft+'px'});
}

// top 버튼
	if ( $(window).scrollTop() > 100 ) $('#body_top.top').css('display','block');
	$(window).scroll(function(){
		if( $(window).scrollTop() > 100 ) $('#body_top.top').fadeIn('fast');
		else $('#body_top.top').fadeOut('fast');
	});


/* input checkbox customizing */
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
				$("input[name="+input.attr("name")+"]").each(function(idx){
					$("label[for="+$(this).attr("id")+"]").removeClass(options.checked_class);
				});
				label.addClass(options.checked_class);
			}
		});
	});
};

// 탭 이동 - 부드러운 스크롤
function scroll_to_anchor(anchor_id,speed) {
	if( !speed ) var speed = 'slow';
	var a_tag = $("#"+anchor_id);
	if(a_tag.length > 0){
		$('html, body').animate({
			scrollTop: a_tag.offset().top
		}, speed);
	}
}