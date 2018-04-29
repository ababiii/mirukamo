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

		.rightArea div,.rightArea  a,.rightArea  table,.rightArea  td,.rightArea  th,.rightArea  ul,.rightArea  li,.rightArea  span,.rightArea  input{-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;*behavior: url(/common/js/boxsizing.htc);margin:0;padding: 0;}
		ul{list-style: none}
		img{border: 0;}
		.rightArea{width:271px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;*behavior: url(/common/js/boxsizing.htc);font-size: 12px;line-height: 1.4;font-family: dotum,"돋움";background: #fff;border-top:10px solid #45454d}
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



</head>
<body>
	<div id="container" >
		<div id="player_section" >
            <!-- /control_area -->
            <div id="divControlArea" >
                <div id="player_obj" style="padding-top:38px;" >
                    <div id="video">
						<style type="text/css">
    .pframe{border:none;}
</style>
<iframe id="play_PNH43408873431" class="pframe" width='100%' height='100%' src='./preview?name=${file_name}' allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>

					</div>
                    			<div id="divControlArea" class="control_area" style="height:31px; position:static;" >
			<div class="control_area_innerBox" style="height:28px;">

				<!-- 다른 강의로 이동 -->
				<div class="move" style="top:0px; padding:3px 14px 0 4px;" >

					<!--h2 style="left:8px;"><img src="http://img.megastudy.net/Player/player_2011/st_move.gif" alt="다른 강의로 이동" /></h2-->

					
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
					<!--div class="tab__common tab__ot tab__1ea"-->
					<!-- 1개일 경우 -->
					<!--div class="tab__common tab__ot tab__2ea"-->
					<!-- 2개일 경우 -->
					<!--div class="tab__common tab__ot tab__3ea"-->
					<!-- 3개일 경우 -->
					<div class="tab__common tab__ot tab__1ea">
						<!-- 4개일 경우 -->
						<div class="tab__inner">
							<a href="#_blank" acd="preview" onmousedown="try{logerClickTrace('EVT','/플레이어/OT맛보기/강좌맛보기');}catch(e){}" class="">강좌 맛보기</a> 
								class="on">선생님 소식</a>
						</div>
					</div>
					<div id="divTabContent" class="list--container "
						style="height: 718px;">
						<!-- 메가 캐스트, 메가 핫이슈, 선생님 새소식 -->
						<div class="cast">

							<div class="table__top">메가 캐스트</div>
							<ul class="cast--list">

								<li><a
									href="../resources/videos/3.mp4"
									target="_blank"> <img class="cast--bg"
										src="http://img.megastudy.net/Player/player_2016/bg_openLecture.png"
										alt=""> <img class="cast--pic"
											src="http://file.megastudy.net//fileserver/teacher_2007/tcc/tcc_tec_pic/tcc_sni_20180420180741.jpg"
											alt="">
												<div class="cast--txt">
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
												</div></a></li>

							</ul>

							<div class="table__top">선생님 새소식</div>
							<ul class="hotissue--list">

								<li><a
									href="/teacher_v2/notice/notice_list.asp?idx=28628&amp;tec_cd=rimbaud666"
									target="_blank">▷교재 입고 완료◁ 오를거야! EBS로 점수를 올려줄게 [수특 영어편]</a></li>

								<li><a
									href="/teacher_v2/notice/notice_list.asp?idx=28515&amp;tec_cd=rimbaud666"
									target="_blank">내신 휴강? 내가 뭘 쉬겠니 ㅋㅋㅋ</a></li>
							</ul>
						</div>
					</div>
					<div id="divTabContent" class="list--container "
						style="height: 718px;">
						<!-- 플레이어 공통 인클루드 페이지 시작 -->

						<!-- 플레이어 공통 인클루드 페이지 종료 -->

						<!-- 강좌맛보기 -->
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
</body>

</html>