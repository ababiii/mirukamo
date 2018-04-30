<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <title>합격 불변의 법칙 megastudy</title>
    <script type="text/javascript" src="../resources/js/jquery-latest_header.js"></script>
    <script type="text/javascript" src="../resources/js/kollus.videogateway-controller.min.js"></script>
    <link type="text/css" href="../resources/css/player_2011.css" rel="stylesheet" />
   
    	<style type="text/css">

		.rightArea div,.rightArea  a,.rightArea  table,.rightArea  td,.rightArea  th,.rightArea  ul,.rightArea  li,.rightArea  input{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;*behavior: url(/common/js/boxsizing.htc);margin:0;padding: 0;}
		ul{list-style: none}
		img{border: 0;}
		.rightArea{width:600px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;*behavior: url(/common/js/boxsizing.htc);font-size: 12px;line-height: 1.4;font-family: dotum,"돋움";background: #fff;border-top:10px solid #45454d}
		.rightArea2{width:416px;padding: 0 5px;background: #45454d;}
		.rightArea a{font-size: 12px;line-height: 1.3;font-family: dotum,"돋움";text-decoration: none;color: #54545a;}
		.rightArea .tab__common{width:100%;overflow: hidden;margin-bottom: 10px;height: 33px;}
		.rightArea .tab__inner{width:100%;overflow: hidden;}
		.rightArea .tab__common a{float:left;width:25%;border-right: 1px solid #2b2b2d;color: #777;background: #39393f;height: 33px;padding-top: 10px;letter-spacing: -1px;text-align: center;}
		.rightArea .tab__common .on{background: #1176ff;color:#fff;font-weight: bold;}
		.rightArea .tab__1ea a{width:100%;}
		.rightArea .tab__2ea a{width:50%;}
		.rightArea .tab__3ea a{width:50%;}
		.rightArea .tab__3ea a{width:33%;}
		.rightArea .tab__3ea a:first-child{width:34%;}
		.rightArea .list--container .btn{position: absolute;right:0;top:0;width:46px;height: 18px;border: 1px solid #1565d1;background: #1176ff;color: #fff;font-size: 11px;letter-spacing: -1px;padding: 2px 0 0 0;text-align: center;vertical-align: top;}
		.rightArea .list--container{width: 100%;padding: 0 11px;position: relative;background: #fff; overflow-y:scroll;}
		.list--container .layer_t_select{position: absolute;left:92px;top:8px;width:124px;height: 68px;background: url(/ly_selectTeacher.gif) 0 0 no-repeat;overflow: hidden;padding: 42px 0 0 0;font-size: 11px;text-align: center;}
		.list--container .layer_t_select select{font-size: 11px;width:90%;}
		.list--container .close{position: absolute;right:7px;top:6px;cursor:pointer;}
		.rightArea .table__top{position: relative;width: 232px}
		.rightArea .table__message{color: #a1a1ae;background:  url(/ic_table_message.gif) 0 6px no-repeat;padding: 4px 0 0 14px;font-size: 11px;letter-spacing: -1px;height:25px;}
		.rightArea .table__message2{background: none;padding-left: 0;}
		.rightArea .table__common{width:232px;table-layout: fixed;border-collapse: collapse;border-top: 1px solid #1176ff;}
		.rightArea .table__common th{background: #ececef;text-align: center;color: #54545a;font-weight: normal;height: 28px;vertical-align: middle;font-size:11px;}
		.rightArea .table__common td{text-align: center;color: #54545a;padding:7px 0 5px 0;vertical-align: middle;border-bottom: 1px solid #ececef;font-size:11px;}
		.rightArea .table__common a{font-size:11px;}
		.rightArea .table__common .table__subject{text-align: left}
		.rightArea .table__common .on td{background: #f2f5ff}
		.rightArea .my__info{border: 1px solid #dedede;font-size: 11px;color: #6d6d74;letter-spacing: -1px;margin-bottom: 10px;}
		.rightArea .my__info strong, .my__info a{font-weight: normal;color: #1176ff;}
		.rightArea .my__info ul{padding:10px 0 0 10px;}
		.rightArea .my__info li{width:100%;overflow: hidden;height: 19px;letter-spacing: 0;}
		.rightArea .my__info .my__title{float:left;width: 63px;color: #54545a;letter-spacing: -1px;}
		.rightArea .my__info .my__titleBar{float:left;width: 57px;background: #f0f0f0;height: 8px;margin-right: 5px;margin-top: 3px;}
		.rightArea .my__info .my__titleBar .bar{float:left;height: 8px;background: #1176ff;}
		.rightArea .my__info .my__title__txt{letter-spacing: 0;}
		.rightArea .bookmark .table__top{height: 23px}
		.rightArea .bookmark .bt_bookmark{width: 71px;border: 1px solid #1565d1;background:#1176ff url(/ic_bookmark.png) 3px 50% no-repeat;padding-left: 11px;}
		.rightArea .bookmark--list{border-top: 1px solid #1176ff;}
		.rightArea .bookmark--list li{padding: 11px 0 11px 3px;border-bottom: 1px solid #ececef;}
		.rightArea .bookmark--list input[type="text"]{border: 1px solid #dfedff;width:213px;height: 21px;font-size: 11px;padding: 0 0 0 5px;}
		.rightArea .bookmark__time{float:left;height:16px;background: url(/ic_bookmark.png) 3px 50% no-repeat;font-weight: bold;font-size: 11px;color: #1176ff;line-height: 14px;padding:2px 0 0 15px;vertical-align: middle;margin-top: 1px;width:72px;}
		.rightArea .bookmark--list img{vertical-align: middle;}
		.rightArea .bookmark__timeWrap{overflow: hidden;width:100%;height: 21px}
		.rightArea .bookmark_input{padding-left: 6px;}
		.rightArea .cast .table__top{color: #54545a;font-size: 13px;font-weight: bold;height: 21px;letter-spacing: -1px}
		.rightArea .cast--list{border-top: 1px solid #1176ff;margin-bottom: 9px}
		.rightArea .cast--list a{font-size: 11px}
		.rightArea .cast--list li{padding: 9px 0 9px 0;border-bottom: 1px solid #ececef;}
		.rightArea .cast--list a{display: block;position: relative;width: 100%;overflow: hidden;}
		.rightArea .cast--bg{position: absolute;left:0;top:0;}
		.rightArea .cast--pic{float:left;margin-right: 10px;width:121px;height: 73px}
		.rightArea .cast--txt{float:left;color: #6d6d74;width:100px;line-height: 1.4;}
		.rightArea .cast--date{color: #a9a9b9;display: block}
		.rightArea .cast--subject{color: #1176ff;display: block}
		.rightArea .hotissue--list{border-top: 1px solid #1176ff;margin-bottom: 9px;}
		.rightArea .hotissue--list a{font-size: 11px}
		.rightArea .hotissue--list li{padding: 9px 0 7px 0;border-bottom: 1px solid #ececef;}
		.rightArea .hotissue--list strong{color: #1176ff;font-weight: normal;}
		.rightArea .hotissue--list  .hostissue__title{color: #54545a;font-weight: bold;display: block;padding-bottom: 2px;}

		.rightArea .tab__ot a{width:50%;}
		.rightArea .preview, .preview a{font-size: 11px}
		.rightArea .video__go{display: block;text-align: center;border: 1px solid #dedede;background:#f0f6ff  url(/ic_preview.gif) 97% 50% no-repeat;color:#1176ff !important;height: 33px;margin-bottom: 9px;font-weight: bold;padding-top: 10px;}
		.rightArea .table__top--num{position: absolute;right:0;top:0;color: #1176ff;font-weight: normal;letter-spacing: 0 !important;}
		.rightArea .preview .table__top{color: #54545a;font-size: 13px;font-weight: bold;height: 21px;letter-spacing: -1px;}
		.rightArea .preview--list{border-top: 1px solid #1176ff;margin-bottom: 9px;}
		.rightArea .preview--list li{padding: 9px 0 7px 0;border-bottom: 1px solid #ececef;}
		.rightArea .preview--date{color: #1176ff;font-weight: normal;}

		.rightArea .select__commentary{background: #45454d;text-align: center;height: 40px}
		.rightArea .select__commentary select{width:24%;margin-top: 6px;height: 25px;font-size: 12px;font-weight: bold;}
		.rightArea .tab__commentary{margin-bottom: 0;}
		.rightArea .commentary{background: #fff;}
		.rightArea .commentary .table__top{width:366px;overflow: hidden;height: 35px;}
		.rightArea .commentary .leftArea{float:left;padding-top: 10px;width:50%;}
		.rightArea .commentary .t_rightArea{float:right;text-align: right;padding-top: 10px;width:50%;}
		.rightArea .commentary .btn{position: static;display:inline-block;border-color: #7a7a7a;background-color: #888888;color: #fff;}
		.rightArea .commentary .leftArea .btn{background-color: #fff;color: #7a7a7a;}
		.rightArea .table__commentary{width:366px;}
		.rightArea .table__commentary .ch{color: #ff3c00;}

		.rightArea .commentary_view .leftArea{width:60%;}
		.rightArea .commentary_view .leftArea .btn{background: #888;color:#fff;border-color: #7a7a7a;width: auto;padding-left:2px;padding-right: 2px;}
		.rightArea .commentary_view .t_rightArea{width:40%;}
		.rightArea .commentary_view table{width:135px;table-layout: fixed;border-collapse: collapse;letter-spacing: -1px;font-size:11px;}
		.rightArea .commentary_view table th{border: 1px solid #b0d2ff;background: #f3f8ff;color: #1176ff;font-weight: normal;padding: 4px 0 1px 0;text-align: center;line-height: 1.1;}
		.rightArea .commentary_view table td{border: 1px solid #b0d2ff;background: #fff;color: #ff3311;font-weight: normal;padding: 4px 0 1px 0;text-align: center;line-height: 1.1;}
		.rightArea .commentary--txt{border-top: 1px solid #1176ff;padding-top: 5px;padding-bottom: 10px;}
		.rightArea .commentary__btn{border-top: 1px solid #ececef;padding-top: 5px;text-align: right;}
		.rightArea .commentary__btn img{margin-right: 5px;}
		.rightArea .entinfo .table__common{width:366px;margin-bottom: 20px;}
		.rightArea .entinfo .table__common th{border: 1px solid #e0e0e0;background: #e7f1ff;color: #54545a;}
		.rightArea .entinfo .table__common td{border: 1px solid #e0e0e0;}
		.rightArea .entinfo .table__top{padding-bottom: 5px;height: auto}
		.rightArea .entinfo .leftArea{width:60%;}
		.rightArea .entinfo .t_rightArea{width:40%;}
		.rightArea .entinfo .leftArea select{width:48%;height: 25px;font-size: 12px;font-weight: bold;}
		.rightArea .bookmark__nodata{text-align: center;padding-top:50px;padding-bottom: 40px;font-size:11px;}
	</style>
	<script src="../resources/jQuery/jquery-ui.js"></script>
	
    <script type="text/javascript">
        //플레이어구분
        var pk = "P";
        var dk = "90";

        //플레이어아이디
        var pi = "play_PNH43408873431";

        //플레이어재생구분
        var pl = "H";

        //플레이어사이즈
        var popw = "1320";
        var poph = "540";

        //사용자해상도
        var uw = "1536";
        var uh = "826";

        //영상비율
        var vw = "21";
        var vh = "9";

        //자동재생여부
        var ap = "Y";
        if (ap == "") { ap = "N"; }

        //학년
        var eg = "";

        //탭영역
        var tw = 278;
        if (pk == "H" || pk == "S") {
            tw = 410;
        }

        //사용구분
        var pu = "";


        function fncPlayPositon(s) {
            var f = $(".pframe:eq(0)").attr("id");
            eval(f + ".fncSetPlayPositon(" + s + ")");
        }

        function fncCurrentPosition() {
            try {
                var f = $(".pframe:eq(0)").attr("id");
                var gp = eval(f + ".getCurrentPosition()") / 1000;
                return gp;
            } catch (e) { }
        }

        //영상사이즈
        var pw = "";
        var ph = "";
        function fncPlayerResize() {
            pw = jQuery("#player_obj").width();
            ph = parseInt((pw * (vh / vw)));
            $("#video").height($(window).height() - 40);

            if (pk == "M") {
                $("#video").height($(window).height() - 54);
            }

            if (pk == "S") {
                $("#video").height($(window).height() - 164);
            }

            if (pk == "H") {
                $("#divTabContent").css("height", $(window).height() - 85);
            } else {
                $("#divTabContent").css("height", $(window).height() - 58);
            }
        }
    </script>
    <script type="text/javascript">
        //탭오프여부
        var ptoff = "";

        function fncPlayerTab() {
            if ($("#divTabControl").attr("src").indexOf("_on.gif") > 0) {
                window.resizeBy(tw, 0);
                $("#right_section").show();
                $("#player_section").css("margin-right", (tw + 6));
                $("#divTabControl").attr("src", "http://img.megastudy.net/Player/player_2011/u_closeTab.gif");
            } else {
                try {
                    if (browser.isEdge) {
                        window.resizeTo($(window).width() - 276, $(window).height() + 45);
                    } else {
                        window.resizeBy((tw * -1), 0);
                    }
                } catch (e) {
                    window.resizeBy((tw * -1), 0);
                }
                $("#right_section").hide();
                $("#player_section").css("margin-right", 6);
                $("#divTabControl").attr("src", "http://img.megastudy.net/Player/player_2011/u_closeTab_on.gif");
            }
            fncPlayerResize();
            setTimeout("fncPlayerResize()", 1000);
        }

        $(window).resize(function () {
            fncPlayerResize();
        });

        jQuery(document).ready(function () {
            try {
            
                if (pl != "P") {
                    if (ptoff == "OFF") {
                        $("#player_section").css("padding", "0px");
                        $("#player_section").css("background", "none");
                        $("#player_section").css("margin-right", 0);
                        $("#line_btn").remove();
                        $("#right_section").remove();
                    }
                    window.resizeTo(popw, poph);
                }
				if ((pk == "F" || pk == "W") && (dk == "13" || dk == "23")) {
					$.post("/player/kollus/common/inc/eventplaycnt.asp?dng_kbn=90&CHR_CD=43408&LEC_CD=873431&PlayerKbn=P&PlayerApp=N&UseWidth=1536&UseHeight=826&PlayerLoc=H&userBrowser=Chrome&BrowserVersion=66.0");
				}
				fncPlayerResize();
			} catch (e) {
            }
        });


    </script>
	
 <script src="../resources/js/jquery.min.js"></script>
<!--<script type="text/javascript" src="../resources/playlist_css/cssplay-playlist-min.js"></script>-->
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    .innerPopup {
  	 z-index: 2222222222;
	}
  </style>
	
	<!--음성인식부분 끝 -->

<script type="text/javascript">	
		//사용자 선택에 따라 재생 동영상을 불러 옴
		function movieDialog(str) {
			//선택한 버튼의 동영상 경로를 불러옴
			$($("#movie_src")[0]).attr("src", $(str).attr("value"));
			
			//console.log($("#movie_src")[0]);
			//$("#movie_src")[0].setAttribute( 'src', $(str).attr("value") );;
			//console.log($("#movie_src")[0]);
			//동영상을 다시 load 함
			$("#movie")[0].load();
			//load한 동영상을 재생
			document.getElementById("movie").play();
		};
		</script>


</head>
<body>
<script src="../resources/jQuery/jquery-ui.js"></script>
<div id="dialog-form" title="따라해 봅시다" style="z-index: 2222222222222; visibility: hidden" >	 
	  <form>
	    <fieldset>
	      <label for="content2">내용</label>
	      <input type="text" name="content2" id="content2" value="" readonly="readonly" class="text ui-widget-content ui-corner-all">
	      <label for="result">결과</label>
	      <input type="text" name="result" id="result" value="" readonly="readonly" class="text ui-widget-content ui-corner-all">
	    </fieldset>
	  </form>
	 </div>

	<div id="container">
		<div id="player_section" >
            <!-- /control_area -->
            <div id="divControlArea" >
                <div id="player_obj" style="padding-top:38px;" >
                    <div id="video" class="cssplayPlaylist">
						<style type="text/css">
    .pframe{border:none;}
</style>
<%-- './preview?name=${file_name}' --%>

<!-- <iframe id="movie" class="pframe" width='100%' height='100%' src='../resources/videos/2.mp4' allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe> -->
					<video id="movie" class="pframe" width='100%' height='100%' controls="true" preload="true" poster="posters/despicable.jpg" controls autoplay>
	<source id="movie_src" src="../resources/videos/2.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />
</video>
					</div>
                    			<div id="divControlArea" class="control_area" style="height:31px; position:static;" >
			<div class="control_area_innerBox" style="height:28px;">

				<!-- 다른 강의로 이동 -->
				<div class="move" style="top:0px; padding:3px 14px 0 4px;" >

					<!--h2 style="left:8px;"><img src="http://img.megastudy.net/Player/player_2011/st_move.gif" alt="다른 강의로 이동" /></h2-->

						<!-- 이부분에 강의 packagename과 강의 title을 넣어 주면 된다. -->
						<div class="txt" style="width:100%;">1강. 3강 2번~11강 5번</div>
				</div>
			</div>
			</div>
                </div>
			</div>
            <div id="line_btn" class="line_btn"><img id="divTabControl" src="http://img.megastudy.net/Player/player_2011/u_closeTab.gif" alt="접기" onclick="fncPlayerTab()" /></div>
			<!-- /control_area -->
        </div>
		<div id="right_section" style="background:none;" >
            <!-- /tab_area -->
 <div id="divTabMenu" style="margin-top:30px; background-color:#45454d;" >
				<div class="rightArea">
					<div class="tab__common tab__ot tab__1ea">
						<div class="tab__inner">
							<a>이어지는 강좌 보기</a> 
						</div>
					</div>
					<div id="divTabContent" class="list--container "
						style="height: 718px;">
						<div class="cast">

							<div class="table__top">ミルカモ</div>
							<ul class="cast--list">
							
							<!-- <li><p class="playlist chosen" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/despicable.jpg"><img src="../resources/posters/despicablet.jpg" alt=""><br>Despicable Me 2</p> <img class="cast--pic"
											src="http://file.megastudy.net//fileserver/teacher_2007/tcc/tcc_tec_pic/tcc_sni_20180420180741.jpg"
											alt="">
												<div class="cast--txt">
												이부분에 다음에 볼 화면의 사진과 정보가 들어간다
													<span class="cast--subject">[학습법]</span>정식쌤이 답변합니다! [서영,
													아윤, 재희 학생에게]<span class="cast--date">2018-04-20</span>
												</div></a></li> -->
												<div class="playlistHolder">
	<!-- <p class="playlist chosen" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/despicable.jpg"><img src="../resources/posters/despicablet.jpg" alt=""><br>Despicable Me 2</p> -->
	<p class="playlist" data-id="#movie" data-video="../resources/videos/3" data-poster="../resources/posters/turbo2.jpg"><a onClick="movieDialog(this)" href="#" value="../resources/videos/2.mp4"><img src="../resources/posters/turbo2t.jpg" alt=""><br>Turbo</a></p>
	<!--  이부분 반복문 돌릴것
	<p class="playlist" data-id="#movie" data-video="파일주소띵" data-poster="썸네일">
		<a onClick="movieDialog(this)" href="#" value="파일주소띵">
			<img src="썸네일" alt="">
			<br>강의명</a>
	</p>
	-->
	
	<p class="playlist" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/smurfs.jpg"><a onClick="movieDialog(this)" href="#" value="../resources/videos/3.mp4"><img src="../resources/posters/smurfst.jpg" alt=""><br>The Smurfs 2</a></p>
	<p class="playlist" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/planes.jpg"><img src="../resources/posters/planest.jpg" alt=""><br>Planes</p>
	<p class="playlist lastchild" data-id="#movie" data-video="../resources/videos/2" data-poster="../resources/posters/monster.jpg"><img src="../resources/posters/monstert.jpg" alt=""><br>Monster University</p>
</div>

								<!-- <li><p class="playlist" data-id="#movie" data-video="../resources/videos/3" data-poster="../resources/posters/turbo2.jpg"><img src="../resources/posters/turbo2t.jpg" alt=""><br>Turbo</p> <img class="cast--bg"
										src="http://img.megastudy.net/Player/player_2016/bg_openLecture.png"
										alt=""> <img class="cast--pic"
											src="http://file.megastudy.net//fileserver/teacher_2007/tcc/tcc_tec_pic/tcc_sni_20180420180741.jpg"
											alt="">
												<div class="cast--txt">
												이부분에 다음에 볼 화면의 사진과 정보가 들어간다
													<span class="cast--subject">[학습법]</span>정식쌤이 답변합니다! [서영,
													아윤, 재희 학생에게]<span class="cast--date">2018-04-20</span>
												</div></a></li>

								<li><a href="/teacher_v2/mega_tcc/main.asp?tt_num=17623&amp;tec_cd=rimbaud666&amp;domCd=A&amp;SubMainType=A&amp;mOne=cast&amp;pTecCd=rimbaud666&amp;LeftMenuCd=8"
									target="_blank"> <img class="cast--bg"
										src="http://img.megastudy.net/Player/player_2016/bg_openLecture.png"
										alt=""> <img class="cast--pic"
											src="http://file.megastudy.net//fileserver/teacher_2007/tcc/tcc_tec_pic/tcc_sni_20180413172207.jpg"
											alt="">
												<div class="cast--txt">
													<span class="cast--subject">[학습법]</span>[절대평가 영어] 1,2등급을
													왔다~갔다 한다면?<span class="cast--date">2018-04-13</span>
												</div></a></li> -->

							</ul>
						</div>
					</div>
					<div id="divTabContent" class="list--container "
						style="height: 718px;">
						<div class="preview">
							<a
								href="/Player/kollus/player.asp?dng_kbn=72&amp;CHR_CD=43408&amp;PlayerKbn=P&amp;PlayerApp=N&amp;UseWidth=1536&amp;UseHeight=826&amp;PlayerLoc=H"
								class="video__go">OT영상</a>
							<div class="table__top">
								통강 맛보기 <span class="table__top--num">1개</span>
							</div>
							<ul class="preview--list">

								<li><a
									href="/Player/kollus/player.asp?dng_kbn=90&amp;CHR_CD=43408&amp;LEC_CD=873431&amp;PlayerKbn=P&amp;PlayerApp=N&amp;UseWidth=1536&amp;UseHeight=826&amp;PlayerLoc=H">
										1강. 3강 2번~11강 5번
										<br> 
										<strong class="preview--date">41분</strong>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div> 
			<!-- 웹켐으로 확인하는 부분 -->
			<div>
    <div id="content">
        <canvas id="originalCanvas" width=320 height=240></canvas>
        <canvas id="trackerCanvas" width=320 height=240></canvas>
        <br />
        <canvas id="eyeCanvas" width=80 height=60></canvas>
        <canvas id="bwCanvas" width=80 height=60></canvas>
        <canvas id="thCanvas" width=80 height=60></canvas>
        <br />
        <canvas id="oldCanvas" width=80 height=60></canvas>
        <canvas id="curCanvas" width=80 height=60></canvas>
        <canvas id="cCanvas" width=80 height=60></canvas>
        <br />
        <p id="correlationPercentage">
            0%
        </p>
        <p id="blinksDetected">
            0
        </p>
        <p id="countDetected">
            0
        </p>
    </div>
</div>
<!-- 
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="../resources/playlist_css/cssplay-playlist-min.js"></script> 
 -->
<script type="text/javascript">
    var pno = "0";

    function fncRightTopTab(n) {
		var ax = $(".tab__inner a").eq(n).attr("acd");
		if (ax != "") {
			$(".tab__inner a").removeClass("on");
			$(".tab__inner a").eq(n).addClass("on");
			$("#divTabContent").load("/Player/kollus/tab/tab_" + ax + "_ax.asp?dng_kbn=90&CHR_CD=43408&LEC_CD=873431&PlayerKbn=P&PlayerApp=N&UseWidth=1536&UseHeight=826&PlayerLoc=H&userBrowser=Chrome&BrowserVersion=66.0&TEC_CD=rimbaud666");
		}
	}

	var dnm = "";
	var snm = "";
	var rng = "";

	function fncIpsiTop(dnm, snm, rng) {
	    $("#divIpsiSlt").load("/Player/kollus/tab/tab_ipsitop_ax.asp?dng_kbn=90&CHR_CD=43408&LEC_CD=873431&PlayerKbn=P&PlayerApp=N&UseWidth=1536&UseHeight=826&PlayerLoc=H&userBrowser=Chrome&BrowserVersion=66.0&TEC_CD=rimbaud666", {
			"DOM_NM": escape(dnm),
			"SUB_NM": escape(snm),
			"RANGE": escape(rng)
		});
	}

	function fncIpsiPlay(idx) {
	    location.href = "/Player/kollus/player.asp?seq=&stm=&idx=" + idx + "&dng_num=1&dng_free_flg=N&PlayerKbn=P&PlayerApp=N&UseWidth=1536&UseHeight=826&PlayerLoc=H";
	}

	$(document).ready(function () {
		$(".tab__inner a").bind({
			click: function () { fncRightTopTab($(".tab__inner a").index(this)); }
		});

		if (pk == "H") {
			fncIpsiTop(dnm, snm, rng);
		}
		
		fncRightTopTab(pno);
	});
</script>

		    <!-- /tab_area -->
            
        </div>
    </div>
    
    <video id="video2" autoplay style="visibility: hidden;"></video>
    
    
      </style>
   
</body>
<script src="../resources/js/utils.js"></script>
		<script src="../resources/js/clmtrackr1.js"></script>
		<!-- <script src="../resources/js/d3.min.js"></script> -->
		<script src="../resources/js/webcam.js"></script>
		<script src="../resources/js/canvasfilters.js"></script>
	
		<script type="text/javascript">
//properties
var content, webcam, tracker, raf, eyeRect, interval, oldData, curData, cData, currentCorrelation, blinks;

// canvas and contexts
var originalCanvas, originalContext, trackerCanvas, trackerContext, eyeCanvas, eyeContext, bwCanvas, bwContext, thCanvas, thContext, oldCanvas, oldContext, curCanvas, curContext, cCanvas, cContext;

// dom elements
var correlationPercentage, blinksDetected;

var settings = {
    contrast: 3,
    brightness: 0.5,
    threshold: 80,
    minCorrelation: 0.17,
};

var lasttime=0;
function init() {
    content = document.getElementById('content');

    // adds listeners to activate and deactivate on iframe focus
    window.addEventListener('load', start, false);
   /*  window.addEventListener('abort', stop, false);  */

    // instanciate our Webcam class
    webcam = new Webcam();

    // tracker
    tracker = new clm.tracker();
    tracker.init(window.pModel);

    // eye rect
    eyeRect = {
        x: 0,
        y: 0,
        w: 0,
        h: 0,
    };

    // original canvas and context
    originalCanvas = document.getElementById('originalCanvas');
    originalContext = originalCanvas.getContext('2d');

    // tracker canvas and context
    trackerCanvas = document.getElementById('trackerCanvas');
    trackerContext = trackerCanvas.getContext('2d');

    // eye canvas and context
    eyeCanvas = document.getElementById('eyeCanvas');
    eyeContext = eyeCanvas.getContext('2d');

    // black & white canvas and context
    bwCanvas = document.getElementById('bwCanvas');
    bwContext = bwCanvas.getContext('2d');

    // threshold canvas and context
    thCanvas = document.getElementById('thCanvas');
    thContext = thCanvas.getContext('2d');

    // old canvas and context
    oldCanvas = document.getElementById('oldCanvas');
    oldContext = oldCanvas.getContext('2d');

    // cur canvas and context
    curCanvas = document.getElementById('curCanvas');
    curContext = curCanvas.getContext('2d');

    // correlation canvas and context
    cCanvas = document.getElementById('cCanvas');
    cContext = cCanvas.getContext('2d');

    // correlation percentage dom
    correlationPercentage = document.getElementById('correlationPercentage');

    // blinks detected dom
    blinksDetected = document.getElementById('blinksDetected');
}

function start(e) {
    e.preventDefault();
    document.body.className = 'active';

    webcam.start()
    tracker.start(webcam.domElement);

    raf = requestAnimationFrame(update);
    interval = setInterval(correlation, 100);
    
    blinks = 0;
}

function stop(e) {
    e.preventDefault();
    document.body.className = '';

    webcam.stop();
    tracker.stop();

    cancelAnimationFrame(raf);
    clearInterval(interval);

    blinks = 0;
}

function update() {
    raf = requestAnimationFrame(update);
    originalContext.clearRect(0, 0, originalContext.canvas.width, originalContext.canvas.height);
    trackerContext.clearRect(0, 0, trackerContext.canvas.width, trackerContext.canvas.height);
    bwContext.clearRect(0, 0, bwContext.canvas.width, bwContext.canvas.height);
    thContext.clearRect(0, 0, thContext.canvas.width, thContext.canvas.height);
    oldContext.clearRect(0, 0, oldContext.canvas.width, oldContext.canvas.height);
    curContext.clearRect(0, 0, curContext.canvas.width, curContext.canvas.height);
    cContext.clearRect(0, 0, cContext.canvas.width, cContext.canvas.height);

    // draw video element to canvas
    originalContext.drawImage(webcam.domElement, 0, 0, originalContext.canvas.width, originalContext.canvas.height);

    // draw tracker to canvas
    trackerContext.drawImage(webcam.domElement, 0, 0, trackerContext.canvas.width, trackerContext.canvas.height);
    tracker.draw(trackerCanvas);

    // extract right eye data
    var pos = tracker.getCurrentPosition();
    if (pos) {
        eyeRect.x = pos[23][0];
        eyeRect.y = pos[24][1];
        eyeRect.w = pos[25][0] - pos[23][0];
        eyeRect.h = pos[26][1] - pos[24][1];

        // draw eye
        eyeContext.drawImage(originalCanvas, eyeRect.x, eyeRect.y, eyeRect.w, eyeRect.h, 0, 0, eyeContext.canvas.width, eyeContext.canvas.height);

        // black and white
        var data = CanvasFilters.getPixels(eyeCanvas);
        var grayscale = CanvasFilters.grayscale(data, settings.contrast, settings.brightness);

        bwContext.putImageData(grayscale, 0, 0);

        // threshold
        var data = CanvasFilters.getPixels(eyeCanvas);
        var grayscale = CanvasFilters.grayscale(data, settings.contrast, settings.brightness);
        var threshold = CanvasFilters.threshold(grayscale, settings.threshold);

        thContext.putImageData(threshold, 0, 0);

        // draw old data set
        if (oldData) {
            oldContext.putImageData(oldData, 0, 0);
        }

        // draw cur data set
        if (curData) {
            curContext.putImageData(curData, 0, 0);
        }

        // draw correlation
        if (cData) {
            cContext.putImageData(cData, 0, 0);
        }
    }
}
 
function correlation() {
    if (curData) {
        oldData = curData;
    }

    curData = thContext.getImageData(0, 0, thContext.canvas.width, thContext.canvas.height);

    // correlation data
    cData = cContext.createImageData(cContext.canvas.width, cContext.canvas.height);

    var count = 0;
    if (oldData && curData) {
        var total = curData.data.length;
        for (var i = 0; i < total; i += 4) {
            cData.data[i + 3] = 255;
            if (curData.data[i] !== oldData.data[i]) {
                cData.data[i] = 255;
                count++;
                countDetected.innerHTML = count + ' count detected';
            }
        }
    }
    console.log(lasttime);
    //엄정환 만약 얼굴이 프레임안에 들어있는 것이 확인되고 있던 중 사용자가 눈을 감았다고 인식이 된다면
     document.addEventListener("clmtrackrConverged", function() {
    	 if (count<100) {
    		
    			var d = new Date();
    			
    			if(lasttime<1){
    			lasttime=d.getTime();
    			
    			}
    			var n;
    			n = d.getTime();
    			
    		    	if(n>lasttime+3000){
    		    		console.log(n);
    		        	 pauseVid();
    		        	  n=0;
    		        	  lasttime=0;
    		    	}	
    	 }else{
    		n=0;		
    		 return false;
    	 }
    	 });	
   

    currentCorrelation = count / (cContext.canvas.width * cContext.canvas.height);

    correlationPercentage.innerHTML = parseFloat(currentCorrelation).toFixed(2) + '%';

    if (currentCorrelation > settings.minCorrelation) {
        blinks++;
    }

    blinksDetected.innerHTML = blinks + ' blinks detected';
}

//영상 play 그리고 일시정지하는 부분
var myvid = document.getElementById("movie"); 
function playVid() { 
    myvid.play(); 
}

function pauseVid() { 
    myvid.pause(); 
}

//얼굴이 없으면 영상이 멈추기 **완료
document.addEventListener("clmtrackrLost", pauseVid);
init();
</script>




	<!--음성인식부분 시작 -->
	<script src="../resources/jQuery/jquery-ui.js"></script>
	<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<script src="<c:url value="/resources/recognition.js"/>"></script>
<script type="text/javascript">
recstart();
</script>
<script src="<c:url value="/resources/audio.js"/>"></script>


	
<style>
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    .innerPopup {
  	 z-index: 2222222222;
	}

</html>
