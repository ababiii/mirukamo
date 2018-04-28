
function flashView(_url, wsize, hsize, wmode) {
	var browser = browser_check();

	if(browser.indexOf("ie") != -1) {
		document.write();
		document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="'+window.location.protocol+'//fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width='+wsize+' height='+hsize+' VIEWASTEXT ID="Object1">');
		document.write('<param name="movie" value='+_url+' />');
		document.write('<param name="quality" value="high">');
		document.write('<param name="menu" value="false">');
		document.write('<param name="wmode" value='+wmode+'>');
		document.write('<embed src='+_url+' quality="high" pluginspage="'+window.location.protocol+'//www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width='+wsize+' height='+hsize+'></embed>');
		document.write('</object>');
		document.write();
	} else {
		document.write();
		document.write('<embed src='+_url+' quality="high" pluginspage="'+window.location.protocol+'//www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width='+wsize+' height='+hsize+' wmode='+wmode+'></embed>');
		document.write();
	}
}


function flv_player(file, width, height) {
		document.write();
		document.write('<embed'+
				'	type="application/x-shockwave-flash"'+
				'	id="player2"'+
				'	name="player2"'+
				'	src="/common/flv/player.swf"'+ //src 二쇱냼 蹂�寃쏀븿 (媛쒕컻 吏꾪뻾 �� 蹂�寃� �꾩슂)
				'	width="'+width+'"'+
				'	height="'+height+'"'+
				'	wmode="Opaque"'+
				'	allowfullscreen="true"'+
				'    allowscriptaccess="always"'+
				'    stretching="exactfit"'+
				'	flashvars="'+file+'" />');
		document.write();
}


function flv_player2(file, width, height) {
		file = file.replace("file=", "file="+window.location.protocol+"//siwon-sample.gscdn.com/");
		file = file.replace("image=", "image="+window.location.protocol+"//siwon-sample.gscdn.com/");

		document.write();
		document.write('<embed'+
				'	type="application/x-shockwave-flash"'+
				'	id="player2"'+
				'	name="player2"'+
				'	src="/common/flv/player.swf"'+ //src 二쇱냼 蹂�寃쏀븿 (媛쒕컻 吏꾪뻾 �� 蹂�寃� �꾩슂)
				'	width="'+width+'"'+
				'	height="'+height+'"'+
				'	allowfullscreen="true"'+
				'    allowscriptaccess="always"'+
				'    stretching="exactfit"'+
				'	flashvars="'+file+'" />');
		document.write();
}


function browser_check() {
	var chk = navigator.userAgent.toLowerCase();
	var browser = "";

	if(chk.indexOf("chrome") > 0) browser = "chrome";
	else if(chk.indexOf("msie 7") > 0) browser = "ie7";
	else if(chk.indexOf("msie 8") > 0) browser = "ie8";
	else if(chk.indexOf("msie 9") > 0) browser = "ie9";
	else if(chk.indexOf("msie 10") > 0) browser = "ie10";
	else if(chk.indexOf("msie") > 0) browser = "ie";
	else if(chk.indexOf("trident") > 0) browser = "ie";
	else if(chk.indexOf("firefox") > 0) browser = "firefox";
	else browser = "other";

	return browser;
}

/*Movie Layer Popup */
// �곸긽�앹뾽(+寃���諛곌꼍)�� �곗씠怨� �덈뒗 �ㅽ겕由쏀듃
;(function($){
	var videoSrc;
	var imageSrc;
	var videoWidth;
	var videoHeight;
	var movBanner;
});
var movieshow = function(videoSrc,imageSrc,videoWidth,videoHeight,movBanner){
	videoWidth = parseInt(videoWidth);
	videoHeight = parseInt(videoHeight);
	if(imageSrc){
		imageSrc = "http://siwon-sample.gscdn.com"+imageSrc;
	}
	var file = '<embed'+
		' type="application/x-shockwave-flash"'+
		' id="player2"'+
		' name="player2"'+
		' src="/common/flv/player.swf"'+
		' width="'+videoWidth+'"'+
		' height="'+videoHeight+'"'+
		' wmode="Opaque"'+
		' allowfullscreen="true"'+
		' allowscriptaccess="always"'+
		' stretching="exactfit"'+
		' flashvars="file=http://siwon-sample.gscdn.com'+videoSrc+'&image='+imageSrc+'&autostart=true" />';

		/*draw popup layer*/
		if(movBanner){
			var title = movBanner;
			/* text title + �곸긽 */
			$('<div class="layerpop_bg"><div class="layerpop_box"><div class="layerpop_head"><div class="layerpop_close">�リ린</div><div class="layerpop_tit"><span>'+title+'</span></div></div><div class="layerpop_video">'+file+'</div></div></div>').fadeIn().appendTo('body');
		} else {
			/* �곸긽 */
			$('<div class="layerpop_bg"><div class="layerpop_box"><div class="layerpop_close"></div><div class="layerpop_video">'+file+'</div></div></div>').fadeIn().appendTo('body');
		}
		/***outbox***/
			/*set size of video outbox*/
			$('.layerpop_box').css('width',videoWidth).css('height',videoHeight+38);

			/*top position of video outbox*/
			var getWindowHeight = $(window).height();
			if(getWindowHeight > (videoHeight+38) )	var positionTop = getWindowHeight/(videoHeight+38)*10+'%';
			else var positionTop = 5+'px';
			/*left position of video outbox*/
			var positionLeft = -videoWidth/2+'px';

			$('.layerpop_box').css('top',positionTop).css('margin-left',positionLeft);


			/*set video frame size*/
			$('.layerpop_video').css('width',videoWidth).css('height',videoHeight);

			/*set iframe size*/
			$('#inc_mov').css('width',videoWidth).css('height',videoHeight);
}

$('.layerpop_close').live("click",function(){
	$('.layerpop_bg').fadeOut(function(){
		if( $('.layerpop_video video').length ){
			var video = document.getElementById("v");
			video.pause();
		}
		$(this).remove();
		movBanner = false;
	});
});
