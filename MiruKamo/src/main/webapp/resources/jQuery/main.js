$(document).ready(function() {
	/* �묐같�� */
	var topban = $('.topban');
	var topbanTit = $('.bt_topban');
	var topbanCon = $('.topban .cont');
	var fixarea = $('.wrap_fixarea');
	var login = $('.sec_login');
	var qmenu = $('.wrap_quick');
	var qmenuOffset = qmenu.offset();
	var topbanConH_origin = topbanCon.height();
	var fixareaH = fixarea.height();
	var docuH = $(document).height();
	var coord_topbanTit = topbanTit.offset().top + topbanTit.height();
	if($('.topban .cont').length){
		// �⑤�由ы꺆 諛곕꼫 �곷떒 �몄텧 �묒뾽�쇰줈 �명븳 �꾩떆 if臾� 異붽� 161230
		var coord_topbanCon = topbanCon.offset().top + topbanCon.height();
	}
	var coord_login = login.offset().top + login.height();
	var coord_fixarea = fixarea.offset().top + fixarea.height();
	var scrTop = $(window).scrollTop();

	// �묐같�� �ロ옒
	$('.topban .bt_topban').click(function(){
		if( topban.hasClass('opened') ){ 
			topbanClose(); 
			if( scrTop > 0 ){
				$('.wrap_fixarea').addClass('fix_top'); // 怨듯넻
				$('.ico_menuall').css({'margin-top' : '8px'});
			}
		}
		else if( topban.hasClass('closed') ){ topbanOpen();topbanSl.reloadSlider(); }
	});

	$(window).scroll(function(){
		// �묐같�� �ロ옒,�대┝
		scrTopCurrent = $(window).scrollTop();
		changeH =+ scrTopCurrent - scrTop;
		hideH = topbanCon.height() - changeH;
		
		var ifTopbanClosed = false;
		if( scrTopCurrent > coord_topbanTit ){
			topbanCon.height(hideH);
			if( topbanCon.height() == 0 ){ ifTopbanClosed = true; }
		}else{ topbanCon.height(topbanConH_origin); }
		scrTop = scrTopCurrent;

		// �듬찓�� 怨좎젙
		/*if( scrTop > qmenuOffset.top ){
			qmenu.addClass( 'fixed' );
		}else{
			qmenu.removeClass( 'fixed' );
		}*/
	});
	// �щ씪�대뜑(�묐같��)
	if( $('.topban_sl').length ){
		var topbanSl = $('.topban_sl .sl').bxSlider({
			mode: 'fade',
			auto: ($('.topban_sl .sl > li').length > 1) ? true: false,
			autoControls: true,
			autoHover: true,
			onSlideAfter: function() {
				$('.topban_sl .bx-start').trigger('click');
			}
		});
	}

	// �곸긽 蹂댁씪�뚮쭔 �ъ깮
	$(window).scroll(function(){
		var vdoTop = $('.wrap_cont3').offset().top;
		var vdoBtm = vdoTop+$('.wrap_cont3').height();
		var winH = $(window).height();
		scrTop >= vdoBtm-fixareaH-100 || scrTop <= vdoTop-winH+100 ? $('video')[0].pause() : $('video')[0].play();
	});
	// �щ씪�대뜑(硫붿씤)
	$(window).resize(function() {
		winW = $(window).width();
		$(".box_visual li").width() == winW;
	});
	$(".box_visual ul").bxSlider({
		mode: 'vertical',
		auto: ($('.box_visual ul > li').length > 1) ? true: false,
		controls: false,
		pager: ($('.box_visual ul > li').length > 1) ? true: false,
		autoControls: ($('.box_visual ul > li').length > 1) ? true: false,
		pause: 5000, 	
		onSlideAfter: function() {
			$('.box_visual .bx-start').trigger('click');
		}
	});
	// �먮룞濡ㅻ쭅(異붿쿇媛뺤쥖 TOP5)
	setTimeout(function(){
		bestTopauto();
	}, 500);

	// 諛곕꼫 �쒕뜡 �몄텧
	var num_random = parseInt(Math.random()*$('.random_show a').length);
	$('.random_show a').eq(num_random).toggle();

	// �щ씪�대뜑(�곗륫諛곕꼫)
	$('.quick .sl').bxSlider({
		auto: ($(".quick .sl li").length > 1) ? true: false,
		autoControls: false,
		controls: false,
		pager: false,
		pause: 2000, 
		infiniteLoop: true,
		autoHover: false,
		onSlideAfter: function() {
			$(".quick .bx-start").trigger("click");
		}
	});

	// �щ씪�대뜑(臾대즺媛뺤쓽)
	$('.wrap_cont4 .sl ul').bxSlider({
		auto: true,
		pager: false,
		autoControls: true,
		pause: 6000,
		minSlides: 3,
		maxSlides: 3,
		moveSlides: 1,
		slideMargin: 20,
		autoHover: true,
		onSlideAfter: function() {
			$(".wrap_cont4 .bx-start").trigger("click");
		}
	});
	// �щ씪�대뜑(媛뺤궗�뚭컻)
	$(".wrap_cont1 .sl ul").bxSlider({
		auto: true,
		pager: false,
		autoControls: true,
		pause: 4000,
		autoHover: true,
		touchEnabled: false, 
		onSlideAfter: function() {
			$(".wrap_cont1 .bx-start").trigger("click");
		}
	});
	// �щ씪�대뜑(諛곕꼫)
	$(".wrap_cont2a .sl ul").bxSlider({
		auto: ($(".wrap_cont2a .sl li").length > 1) ? true: false,
		autoControls: true,
		controls: false,
		pager: ($(".wrap_cont2a .sl li").length > 1) ? true: false,
		pause: 3000, 
		autoHover: true,
		onSlideAfter: function() {
			$(".wrap_cont2a .bx-start").trigger("click");
		}
	});
	// �щ씪�대뜑(�ㅼ씠�대━)
	$(".wrap_cont2c .sl ul").bxSlider({
		mode: 'vertical',
		auto: false,
		pager: false,
		startSlide: 0,
		minSlides: 2,
		maxSlides: 2,
		moveSlides: 1,
		slideMargin: 10, 
		onSlideAfter: function() {
			$(".wrap_cont2c .bx-start").trigger("click");
		}
	});
	// �щ씪�대뜑(�섍컯�꾧린)
	$(".wrap_cont5 .review_txt .sl ul").bxSlider({
		mode: 'vertical',
		auto: true,
		pager: false,
		autoControls: true,
		pause: 4000,
		autoHover: true,
		onSlideAfter: function() {
			$(".wrap_cont5 .bx-start").trigger("click");
		}
	});
	// ��찓��(寃뚯떆��)
	$(".wrap_cont6a .tabmenu li").click(function() {
		var idx = $(this).index();
		$(".wrap_cont6a .tabmenu li").removeClass("on");
		$(this).addClass("on");
		$(".wrap_cont6a li.tabcon_list").hide();
		$(".wrap_cont6a li.tabcon_list").eq(idx).show();
	});
	// �щ씪�대뜑(援먯옱)
	$(".wrap_cont6b .sl ul").bxSlider({
		auto: true,
		pager: false,
		autoControls: true,
		pause: 4000,
		autoHover: true,
		onSlideAfter: function() {
			$(".wrap_cont6b .bx-start").trigger("click");
		}
	});
	// �щ씪�대뜑(�곗륫 �듬같��)
	$(".wrap_quick .test > ul").each(function(){
		$(this).bxSlider({
			mode: 'fade',
			auto: ($('.wrap_quick .test > ul > li').length > 1) ? true: false,
			speed: 200,
			pause: 3000,
			controls: false,
			autoControls: false,
			autoHover: false,
			pager: false,
			infiniteLoop: true,
			onSlideAfter: function() {
				$('.wrap_quick .test .bx-start').trigger('click');
			}
		});
	});

	// 紐⑤컮�쇱씪 寃쎌슦 �곸긽 �④�
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ){
		$('video').hide();
	}

	// �щ씪�대뜑(鍮낇뙘��)
	$('.big_151230 .slide_why').bxSlider({
		mode: 'fade',
		auto: true,
		pager: false,
		pause: 4000,
		autoControls: true,
		speed: 200,
		onSlideAfter: function() {
			$(".slide_why .bx-start").trigger("click");
		}
	});
});

$(window).load(function(){
	$('.ban_family .fam_opened').addClass('on');
	$('.ban_family .fam_closed').removeClass('on');
	var checkFam = true;

	$(window).scroll(function(){
		if(checkFam){
			$('.fam_opened').removeClass('on',300);
			$('.fam_closed').addClass('on',300);
			checkFam = false;
		}
	});
});

function bestTopauto(){
	var num = 0;
	setInterval(function(){
		$('.box_top5 .list li').removeClass('on');
		$('.box_top5 .list li').eq(num).addClass('on');
		num++;
		if(num==5){
			num = 0;
		}		
	}, 2000);
}
function topbanClose(){
	$('.topban .cont').stop(true,true).slideUp(500);
	$('.topban').removeClass('opened').addClass('closed');
	//$('.bt_topban span').stop(true,true).addClass('opened',300);
}
function topbanOpen(){
	$('.topban .cont').stop(true,true).slideDown(500);
	$('.topban').removeClass('closed').addClass('opened');
	//$('.bt_topban span').stop(true,true).removeClass('opened',300);
}

function evt_act(){

	$.ajax({
		url : "/module/community/event/inc/151230.php",
		dataType:"JSON",
		type : "POST",
		     error:function(request,status,error){
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       },
		success:function(ret){

			if(ret.ret == '1'){
				alert('24�쒓컙 臾대즺 �섍컯沅뚯씠 諛쒓툒�섏뿀�듬땲��. 吏�湲� �� 媛뺤쓽�ㅼ뿉�� �� 媛뺤쓽瑜� �섍컯�섏떎 �� �덉뒿�덈떎. ');
			}else if(ret.ret == '2'){
				alert('�대� �대깽�� 媛뺤쓽瑜� 吏�湲됰컺�쇱뀲�듬땲��.');
			}else if(ret.ret == '3'){
				alert('濡쒓렇�� �� �댁슜�� 二쇱떆湲� 諛붾엻�덈떎.');
				//location.href='https://member.siwonschool.com/?s=login';
				loginChk();
			}else if(ret.ret == '4'){
				alert('�꾩옱�� �대떦 �대깽�� 湲곌컙�� �꾨떃�덈떎.');
			}else{
				alert('�곗씠�� 泥섎━�꾩쨷 �ㅻ쪟媛� 諛쒖깮�덉뒿�덈떎. �좎떆�꾩뿉 �ㅼ떆 �댁슜�� 蹂댁떆湲� 諛붾엻�덈떎.');
			}
		}
	});
}