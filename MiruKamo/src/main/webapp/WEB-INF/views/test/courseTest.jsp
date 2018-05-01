<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<script type="text/javascript"
	src="<c:url value = "/resources/jQuery/jquery-1.8.3.min.js"/>"></script>
<title>ミルカモCourse</title>
<script type="text/javascript">
$(document).ready(function(){
	$('#insertCourseBt1').on('click',insertCourse);
	$('#insertCourseBt2').on('click',insertCourse);
	
	if(${fail=='already'}){
		alert('すでに受講している講義です。');
	}else if(${fail=='notCourse'}){
		alert('講義が削除されて申請することができません。');
	}
	
	
});

function insertCourse(){ 
	
	var packageName=$(this).attr('package');
	/* alert($(this).attr('package')); */
	$('#insertCourseForm').html('<input type="hidden" name="packageName" value='+packageName+'>');
	$('#insertCourseForm').submit();
}
</script>
</head>
<body class="">

	<jsp:include page="../menu.jsp" flush="true" />

	<form action="course/insertCourse" id="insertCourseForm" method="post">
	
	</form>


	<div id="siwon_container" class="prod_sec main">
		<input type="hidden" name="is_over_smart" value="1" /> <input
			type="hidden" name="over_text"
			value="재고가 모두 소진되었습니다. LG G패드 2 8.0 상품을 이용해주세요." /> <input
			type="hidden" name="smart_is_over" value="1">
		<div class="sec_navi_comm">
			<ul class="navi_list">
				<li><a href="./">홈</a></li>
				<li><a href="courseView">受講申請</a></li>
			</ul>
		</div>
		<div class="inner_container2" id="products_list_tpl">



			<div class="sec_uni" id="anchor_single">
				<h3 class="tit_comm">単科</h3>

				<div id="single_cyr_title">
					<h4 class="cyr">
						<strong>黒島・佳子</strong>先生<em> 初級</em>
					</h4>
					<ul class="prod_list" id="single_cyr">
						<li style="height: 206px;">
							<div class="tit_area">
								<dl>
									<dd class="label_comm">
										<span class="blue">単科</span>
									</dd>
									<dt>
										<a href="">New日本語の初級を脱出する</a>
									</dt>
									<dd class="desc">
										<ul>
											<font color="#ff6d6d"> <b>日本語を始めましょう。</b>
											</font>
											<br>

										</ul>
									</dd>
									<dd class="info">
										<ul class="txt2">
											<li>9講</li>
											<!-- <li>60일</li>
											<li>교재별도구매</li> -->
										</ul>
									</dd>
									<dd class="book">
										<span class="thimgLiquidFill"></span>
									</dd>
								</dl>
							</div>
							<div class="apply_area_comm1" id="area00003834">
								<div class="inner" style="height: 57px;">
									<ul class="ck_list">
										<li><input type="checkbox" id="prod00003834"
											class="id_check basic_ck" value="00003834"> <!-- <label
											for="prod00003834" class="basic chbox_h20_red basic">

										</label> --></li>
										<li>
										<input type="checkbox" id="bk0000383400003995"
											class="id_check" name="00003995">
									<!-- 	<label for="bk0000383400003995" class="chbox_h20_red">
											<span class="tit"> 교재<i class="book_more">
													<div class="layer">
														<div class="inner" style="height: 165px;">
															<dl>
																<dd class="th">
																	<span class="imgLiquidFill"> </span>
																</dd>
															</dl>
														</div>
													</div>
											</i>
										</span>
										</label> -->
						</li>
					</ul>
					<div class="wrap_btm">
						<p class="final_price sale">
							<span> <strong id="sum_price"></strong>
							</span>
						</p>
						<div class="bt_area_comm">
							<a href="javascript:void(0);" id="insertCourseBt1" class="bt_pay" package="New日本語の初級を脱出する">受講申請</a>
							<a href="course/lectureInfoPage?teacher=요시코" class="bt_more">詳細ページ</a>
						</div>
					</div>
				</div>
			</div>
			</li>
			</ul>
		</div>
		
		<div id="single_ksk_title">
			<h4 class="ksk">
				<strong>キム・スジン</strong>先生<em>中級</em>
			</h4>
			<ul class="prod_list" id="single_ksk"><li style="height: 206px;">
							<div class="tit_area">
								<dl>
									<dd class="label_comm">
										<span class="blue">단과</span>
									</dd>
									<dt>
										<a href="">New日本語を話す方法</a>
									</dt>
									<dd class="desc">
										<ul>
											<font color="#ff6d6d"> <b>簡単で速く日本語を話せるように。 <br>
											日本語の初級の方でも2ヶ月勉強したら日本の旅行ができます。</b>
											</font>
											

										</ul>
									</dd>
									<dd class="info">
										<ul class="txt2">
											<li>10講</li>
											<!-- <li>60일</li>
											<li>교재별도구매</li> -->
										</ul>
									</dd>
									<dd class="book">
										<span class="thimgLiquidFill"></span>
									</dd>
								</dl>
							</div>
							<div class="apply_area_comm1" id="area00003834">
								<div class="inner" style="height: 57px;">
									<ul class="ck_list">
										<li><input type="checkbox" id="prod00003834"
											class="id_check basic_ck" value="00003834"> <!-- <label
											for="prod00003834" class="basic chbox_h20_red basic">

										</label> --></li>
										<li>
										<input type="checkbox" id="bk0000383400003995"
											class="id_check" name="00003995">
									<!-- 	<label for="bk0000383400003995" class="chbox_h20_red">
											<span class="tit"> 교재<i class="book_more">
													<div class="layer">
														<div class="inner" style="height: 165px;">
															<dl>
																<dd class="th">
																	<span class="imgLiquidFill"> </span>
																</dd>
															</dl>
														</div>
													</div>
											</i>
										</span>
										</label> -->
						</li>
					</ul>
					<div class="wrap_btm">
						<p class="final_price sale">
							<span> <strong id="sum_price"></strong>
							</span>
						</p>
						<div class="bt_area_comm">
							<a href="javascript:void(0);" id="insertCourseBt2" class="bt_pay" package="New日本語を話す方法">受講申請</a>
							<a href="course/lectureInfoPage" class="bt_more">詳細ページ</a>
						</div>
					</div>
				</div>
			</div>
			</li>
			</ul>
			
		</div>
	</div>
	</div>
	</div>
	<!--// sec_uni -->




	<!-- 레이어팝업(교재소개) -->
	<!-- <div class="wrap_layer_popup2" id="book_Layer">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3>교재소개</h3>
	<div class="wrap_info" id="bookdetail">
		<div class="sl"><ul>
			<li><span class="th imgLiquidFill"><img src="//img.siwonschool.com/japan/application/tmp_th200x280.jpg" alt="교재썸네일" /></span></li>
		</ul></div>
		<div class="th_box"><span class="imgLiquidFill"><img src="//img.siwonschool.com/japan/application/tmp_th200x280.jpg" alt="교재썸네일" /></span></div>
		<dl>
			<dt>시원스쿨 왕초보 일본어<em>급할 때 바로 찾아쓰는 여행일본어</em></dt>
			<dd class="info"><ul>
				<li><span>저자</span>시원스쿨컨텐츠연구소</li>
				<li><span>쪽수</span>344쪽</li>
				<li class="price_comm"><del>00,000원</del><i>10%</i><strong>000,000원</strong></li>
			</ul></dd>
		</dl>
	</div>
	<div class="wrap_info2" id="bookdesc">
	</div>
</div> -->
	<!--  레이어팝업(교재소개) -->
	<!-- 레이어팝업(장바구니)
<div class="wrap_layer_popup2" id="cart_Layer">
	<p class="msg"></p>
	<div class="group_bt">
		<a href="/?s=cart" class="bt1_st1_red" style="width:120px">확인</a>
		<a href="javascript:layerPopClose()" class="bt2_st1_gray3" style="width:120px">취소</a>
	</div>
</div>
// 레이어팝업(장바구니) -->
	<!-- 레이어팝업(수강신청)
<div class="wrap_layer_popup2 pop_apply" id="pay_Layer">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3>수강신청</h3>
	<form name="paymentform" id="paymentform" method="POST" action="/?s=payment&a=payment">
	<table class="table2_st2">
		<colgroup><col /><col style="width:100px"><col style="width:70px"><col style="width:145px"><col style="width:80px"><col style="width:80px"></colgroup>
		<thead>
			<tr><th>강좌/교재명</th><th>구분</th><th>수량</th><th>판매가</th><th>배송비</th><th>선택취소</th></tr>
		</thead>
		<tbody id="goods_list">
		</tbody>
	</table>
	<ul class="desc_comm">
		<li id="goods_desc_comm"></li>
	</ul>
	<table class="table2_st2 ico mt40">
		<colgroup><col style="width:240px" /><col style="width:170px" /><col style="width:170px" /><col /></colgroup>
		<tr><th>주문금액</th><th>할인</th><th>배송비</th><th>최종 결제금액</th></tr>
		<tr>
			<td><div class="position" id="order_price"><i><img src="//img.siwonschool.com/japan/application/ico2_plus.png" alt="+" /></i></div></td>
			<td><div class="position" id="add_discount"><i><img src="//img.siwonschool.com/japan/application/ico2_plus.png" alt="+" /></i></div></td>
			<td><div class="position" id="delivery_price"><i><img src="//img.siwonschool.com/japan/application/ico2_equ.png" alt="=" /></i></div></td>
			<td><strong class="cost" id="final_price"></strong></td>
		</tr>
	</table>
	<ul class="desc_comm">
		<li>* 결제금액 25,000원 이상 시 무료배송</li>
	</ul>
	<div class="group_bt">
		<div class="fl">
			<a href="javascript:void(0)" id="lecture_add" class="bt1_st1_gray3 mr7" style="width:120px">+ 강의추가</a>
			<a href="javascript:void(0)" id="book_add" class="bt1_st1_gray3" style="width:120px">+ 교재추가</a>
		</div>
		<div class="fr">
			<a href="javascript:void(0)" class="bt1_st1_red position" id="payment_go" style="width:120px">결제하기<span class="bubble"><img src="//img.siwonschool.com/japan/application/img_bubble01.png" alt="쿠폰으로 추가할인 받기" /></span></a>
		</div>
	</div>
	<div class="wrap_btm mt30">
		<div class="ban_box"><span class="imgLiquidFill">
					<a href="/?s=event&p=pkg_allkill" onClick="FnUpdateRightBanner(4181);" target="_blank"><img src="http://data.siwonschool.com/banner/img/japan/2018/03/30/bimg_src_1522386722.jpg" alt="수강신청 레이어팝업" /></a>
				</span></div>
		<div class="card_box">
			<p class="tit">신용카드 무이자 할부안내</p>
			<div class="con">
				<p>5만원 이상 구매 시 최대 5-6개월 / 20만원 이상 구매 시 최대 12개월 할부 혜택을 드립니다.</p>
				<img src="//img.siwonschool.com/japan/application/img_card.jpg" alt="" />
			</div>
		</div>
	</div>
	</form>
</div>
// 레이어팝업(수강신청)






 -->


	<!-- 우측 퀵메뉴 -->
	<script>
		/* $(function(){
			// 퀵메뉴 고정
			qmenuComm(10);
			$(window).scroll(function(){ qmenuComm(10); });
			// 슬라이더(배너)
			if( $(".ban_quick_prod .sl li").length > 1 ){
				$(".ban_quick_prod .sl ul").bxSlider({
					auto: true,
					controls: false,
					pager: false,
					autoControls: true,
					pause: 3000,
					onSlideAfter: function() {
						$('.ban_quick_prod .bx-start').trigger('click');
					}
				});
			}

			function recent_paging(){
				$("li.recent li").css("display","none");
				var e = recent_page*3;
				var s = e-2;

				while(s<=e){
					$("li.recent li.recent_"+s).css("display","block");
					s++;
				}
				$("span.page strong").html(recent_page)
			}

			var recent_page = 1;

			$("#recent_page_prev").on("click",function(){
				if(recent_page<=1){
					alert("첫번째 목록입니다.");
				}else{
					recent_page--;
					recent_paging();
				}

			});

			$("#recent_page_next").on("click",function(){
				if(recent_page>=1){
					alert("마지막 목록입니다.");
				}else{
					recent_page++;
					recent_paging();
				}
			});
		}); */
	</script>

	<!-- <div class="ban_quick_prod" id="qmenu_comm">
	<ul class="qban">
		<li><a href="/?s=event&p=comparepack"><img src="//img.siwonschool.com/japan/banner/quick01.jpg" alt="나에게 딱 맞는 강좌를 찾자" /></a></li>
		<li class="recent">
			<p class="tit">최근 본 강좌 <em class="fc_red">(0)</em></p>
			<ul>
							</ul>
			<div class="paging">
				<a href="javascript: void(0);" class="bt_nav" id="recent_page_prev">&lt;</a>
				<span class="page"><strong>1</strong>/1</span>
				<a href="javascript: void(0);" class="bt_nav" id="recent_page_next">&gt;</a>
			</div>
		</li>
	</ul>
</div>
메뉴창
	<div class="bg_layerpop"></div>
<div class="sitemap_pop">
	<a href="javascript:void(0)" class="bt_cls ir2"><span>닫기</span></a>
	<div class="menu_con">
		<table>
			<colgroup>
				<col width="160px" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>시원스쿨 일본어</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=info&info_1">시원스쿨 일본어</a></li>
							<li><a href="/?s=info&p=info_2">일본어 연구소</a></li>
							<li><a href="/?s=info&p=info_3">학습프로그램</a></li>
							<li><a href="/?s=info&p=share">사회공헌</a></li>
							<li><a href="/?s=info&p=alliance">제휴안내</a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>선생님</th>
					<td>
						<ul class="list_type2"><li><strong>왕초보</strong></li><li><a href="/?s=teacher&p=cyr">최유리</a></li></ul>
						<ul class="list_type2"><li><strong>문법</strong></li><li><a href="/?s=teacher&p=kks">강기석</a></li></ul>
						<ul class="list_type2"><li><strong>어휘</strong></li><li><a href="/?s=teacher&p=khj">권현정</a></li></ul>
						<ul class="list_type2"><li><strong>회화</strong></li><li><a href="/?s=teacher&p=ksk">김수경</a></li><li><a href="/?s=teacher&p=ayaka">아야카</a></li></ul>
						<ul class="list_type2"><li><strong>작문</strong></li><li><a href="/?s=teacher&p=ksm">고수민</a></li></ul>
						<ul class="list_type2"><li><strong>표현</strong></li><li><a href="/?s=teacher&p=hsa">황선아</a></li></ul>
						<ul class="list_type2"><li><strong>JPL</strong></li><li><a href="/?s=teacher&p=skw">서경원</a></li></ul>
						<ul class="list_type2"><li><strong>JLPT</strong></li><li><a href="/?s=teacher&p=narumi">나루미</a></li></ul>
					</td>
				</tr>
				<tr>
					<th>수강신청</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=products#anchor_pack">패키지</a></li>
							<li><a href="/?s=products#tpl_free_title">프리패스</a></li>
							<li><a href="/?s=products#tpl_tab_title">일본어탭</a></li>
							<li><a href="/?s=products#tpl_refund_title">환급반</a></li>
							<li><a href="/?s=products#anchor_single">단과</a></li>
							<li><a href="/?s=products&p=book">교재/MP3</a></li>
							<li><a href="/?s=products"><strong>전체강좌보기 &gt;</strong></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>수강후기</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=community&b=review">베스트 수강후기</a></li>
							<li><a href="/?s=community&b=review">100% 리얼 수강후기</a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>무료학습</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=free&p=freemovie">무료강의</a></li>
							<li><a href="/?s=free&p=leveltest">레벨테스트</a></li>
							<li><a href="/?s=free&p=request_mail">학습메일</a></li>
							<li><a href="/?s=free&p=jpt">JPT 집중탐구</a></li>
							<li><a href="/?s=free&p=todayword">오늘의 단어</a></li>
							<li><a href="/?s=free&p=one_minute">하루 1분 일본어</a></li>
							<li><a href="/?s=free&p=writing">작문연습</a></li>
							<li><a href="/?s=free&p=nowjapan">지금 일본은</a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>커뮤니티</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=community&b=teacher_diary">선생님 다이어리</a></li>
							<li><a href="/?s=community&b=today_ready">오늘의 각오</a></li>
							<li><a href="/?s=community&b=study_qna">공부질문하기</a></li>
							<li><a href="/?s=community&b=study_file">공부자료실</a></li>
							<li><a href="/?s=community&b=free">자유게시판</a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>이벤트</th>
					<td>
						<ul class="list_type evt_list">
							<li><a href="/?s=event&p=170410" class="evting">지금 가입하면 24시간 수강권이 무료!</a></li>
							<li><a href="#"><strong>진행중인 이벤트명</strong></a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th>고객센터</th>
					<td>
						<ul class="list_type">
							<li><a href="/?s=customer&t=notice">공지사항</a></li>
							<li><a href="/?s=customer&t=faq">FAQ</a></li>
							<li><a href="/?s=customer&t=one">1:1 문의</a></li>
							<li><a href="/?s=customer">PC 원격지원</a></li>
							<li class="position"><a href="/?s=myclass" class="go_myclass"><img src="//img.siwonschool.com/japan/comm/bt_myclass_layer.png" alt="내 강의실 입장"></a></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</div></div>
	메뉴창  끝
<div id="siwon_footer">
	<div class="bg_footer_link">
		<div class="footer_link">
			<ul>
				<li class="fst"><a href="http://www.siwonschool.com/?s=intro" target="_blank">회사소개</a></li>
				<li><a href="http://corp.siwonschool.com/group.php" target="_blank">단체수강</a></li>
				<li><a href="/?s=community&p=alliance" target="_blank">제휴안내</a></li>
				<li><a href="http://corp.siwonschool.com/recruit/notice.php" target="_blank">채용정보</a></li>
				<li><a href="http://corp.siwonschool.com/recruit/audition.php#japan" target="_blank">강사채용</a></li>
				<li><a href="http://corp.siwonschool.com/map.php" target="_blank">찾아오시는 길</a></li>
				<li><a href="#none" class="sitemap" onclick="$('#siwon_footer .menu_all').slideToggle('fast');">사이트맵</a></li>
			</ul>
			<div class="family_site">
				<a href="#site_list" class="select" id="btn_family">FAMILY SITE</a>
				<ul id="site_list">
					<li><a href="http://www.siwonschool.com/" target="_blank">시원스쿨 기초영어</a></li>
					<li><a href="http://familytab.siwonschool.com/" target="_blank">패밀리탭</a></li>
					<li><a href="http://tab.siwonschool.com/" target="_blank">시원스쿨 탭</a></li>
					<li><a href="http://max.siwonschool.com/" target="_blank">시원스쿨 맥스</a></li>
					<li><a href="http://tel.siwonschool.com/" target="_blank">화상영어</a></li>
					<li><a href="http://welearn.siwonschool.com/" target="_blank">위런영어</a></li>
					<li><a href="http://lab.siwonschool.com/" target="_blank">시원스쿨 LAB</a></li>
					<li><a href="http://japan.siwonschool.com/" target="_blank">일본어</a></li>
					<li><a href="http://china.siwonschool.com/" target="_blank">중국어</a></li>
					<li><a href="http://vietnam.siwonschool.com/" target="_blank">베트남어</a></li>
					<li><a href="http://indonesia.siwonschool.com/" target="_blank">인도네시아어</a></li>
					<li><a href="http://spain.siwonschool.com/" target="_blank">스페인어</a></li>
					<li><a href="http://france.siwonschool.com/" target="_blank">프랑스어</a></li>
					<li><a href="http://germany.siwonschool.com/" target="_blank">독일어</a></li>
					<li><a href="http://russia.siwonschool.com/" target="_blank">러시아어</a></li>
					<li><a href="http://b2b.siwonschool.com/" target="_blank">기업교육</a></li>
				</ul>
			</div>// family_site
			<div class="help">
				<a href="#none"  id="btn_help" class="more ir2"><span>시원스쿨 고객센터 02-6409-0878 자세히 보기</span></a>
				고객센터 이용시간
				<div id="help_layer">
					<img src="//img.siwonschool.com/japan/comm/footer_ct_info.gif" alt="고객상담" />
					<div class="hide">
						고객상담 / 전화결제<br />
						평일 : 오전 9:00~오후9:30<br />
						토요일 : 오전9:00~오후2:00<br />
						기술지원<br />
						월.수.금 : 오전9:00~오후6:00<br />
						화.목 : 오전9:00~오후9:00<br />
						(일요일/공휴일은 휴무 입니다.)
					</div>
				</div>
				//고객센터 이용시간
			</div>// help
		</div>
	</div>
	사이트맵
	<div class="bg_menu_all">
	<div class="menu_all">
		<ul>
					</ul>
		<span class="close" onclick="$('.menu_all').slideUp(); ">
			<img src="//img.siwonschool.com/japan/comm/footer_sitemap_close.png" alt="닫기" />
		</span>
	</div>
	</div>
	// 사이트맵
	<div class="copyright">
		<span class="footer_logo"><img src="//img.siwonschool.com/japan/comm/footer_logo.png" alt="시원스쿨 일본어" /></span>
		<div class="address">
			<p class="pb10">
				<span class="blue">고객센터 <span class="letc">02)6409-0878</span></span> | 기업체 교육 컨설팅 및 출강 <span class="letc">02-2014-8254</span> | FAX <span class="letc">02)6406-1309</span> | <a href="https://member.siwonschool.com/?s=info&t=agreement" target="_blank">이용약관</a> | <a href="https://member.siwonschool.com/?s=info&t=policy" class="blue_bold" target="_blank">개인정보처리방침</a>
			</p>
			<p>
				사업자등록번호: <span class="letc">214-87-98782</span> | 통신판매업신고번호: 제<span class="letc">2010</span>-서울서초<span class="letc">1503</span>호 | 원격평생교육시설 신고번호: 강남교육지원청 제 원-<span class="letc">329</span>호<br />
				㈜에스제이더블유인터내셔널 | 서울특별시 영등포구 국회대로 74길 12 남중빌딩(여의도동 13-19) <br />대표: 양홍걸 | 개인정보관리책임자: 최광철<br />
				고객센터: <a href="mailto:siwoncs@siwonschool.com">siwoncs@siwonschool.com</a> | 마케팅/제휴문의: <a href="mailto:marketer@siwonschool.com">marketer@siwonschool.com</a><br />
				Copyright &copy; <span class="letc">2010</span> siwonschool. All Rights Reserved.
			</p>
		</div>
		<div class="emblem">
			<ul>
				<script src="http://mark.rankey.com/rk_mark/cert_img.mrk?no=20170926_213966&w=40&h=40"></script>
				<li><a href="http://www.siwonschool.com/?s=press"><img src="//img.siwonschool.com/comm/logo/emblem_nba2018.jpg" alt="2018 국가브랜드 대상"></a></li>
				<li><a href="javascript:void(0)" onclick="window.open('https://img.siwonschool.com/comm/pop_kbsa2017.jpg', '', 'width=595, height=842, scrollbars=yes')"><img src="//img.siwonschool.com/comm/logo/emblem_kbsa2017.jpg" alt="2017 대한민국 브랜드 만족도 1위"></a></li>
				<li><a href="https://www.goodcontent.kr/upload_public/CERTIDW/2017-09-0045_xp061op9443486620170901085714.png" target="_blank"><img src="//img.siwonschool.com/comm/logo/emblem_gcs2017_02.jpg" alt="우수 콘텐츠 서비스"></a></li>
				<li><a href="http://www.siwonschool.com/?s=press"><img src="//img.siwonschool.com/comm/logo/emblem_yearbrand02.jpg" alt="2017 올해의 브랜드 대상"></a></li>
				<li><a href="http://www.siwonschool.com/?s=press"><img src="//img.siwonschool.com/comm/logo/emblem_nba2017.jpg" alt="2017 국가브랜드 대상"></a></li>
				<li><a href="/?s=customer&t=notice&m=view&sno=76"><img src="//img.siwonschool.com/comm/logo/emblem_forbes2017.jpg" alt="2017 소비자 선정 최고의 브랜드 대상[외국어 부문]"></a></li>
				<li><a href="http://www.siwonschool.com/?s=press"><img src="//img.siwonschool.com/comm/logo/emblem_yearbrand.jpg" alt="2016 올해의 브랜드 대상"></a></li>
				<li><a href="http://www.siwonschool.com/?s=press"><img src="//img.siwonschool.com/comm/logo/emblem_nba2016.jpg" alt="NBA 2016 수상"></a></li>
				<li><a href="http://www.siwonschool.com/?s=press"><img src="//img.siwonschool.com/comm/logo/emblem_gptw2016.jpg" alt="2016 GWP 코리아" style="margin:-14px -5px 0 0"></a></li>
			</ul>
		</div>// emblem
	</div>
</div>// siwon_footer
<a href="#siwon_header" id="body_top" class="top" style="display: block;"><img src="//img.siwonschool.com/japan/comm/bt_top_comm.png" alt="맨위로"></a>

<input type="hidden" name="uno" value="2941433">


토스트 배너 170111
[D]
	1. japan.siwonschool.com/ 로 유입 시
		ㄴ 고정노출
	2. japan.siwonschool.com/?nobnr 로 유입 시
		ㄴ 2페이지 이상 이동 시 배너 10초 노출 후 숨김
		개발요청: class 'toast_comm' 에 이중 클래스 'toastpop' 추가
	3. 결제페이지, 내강의실, 이벤트에서는 노출 되지 않음
 -->

	<!--  메인 페이지 트래커 ---->
	<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js"
		async="true"></script>
	<script type="text/javascript">
		window.criteo_q = window.criteo_q || [];
		window.criteo_q.push({
			event : "setAccount",
			account : 31099
		}, {
			event : "setHashedEmail",
			email : "25bbda50f0c95ef91d3e4ad2247722c6"
		}, {
			event : "setSiteType",
			type : "d"
		}, {
			event : "viewHome"
		});
	</script>





	<!-- 네이버 프리미엄로그분석 Start -->
	<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
	<script type="text/javascript" src="http://wcs.naver.net/wcslog.js">
		
	</script>
	<script type="text/javascript">
		// AccoutId 적용
		if (!wcs_add)
			var wcs_add = {};
		wcs_add["wa"] = "s_4e5936125467";

		// 유입추적함수(최상위 도메인을 인자로 삽입)
		if (!_nasa)
			var _nasa = {};
		wcs.inflow("siwonschool.com");

		// 로그 수집 함수 호출
		wcs_do(_nasa);
	</script>
	<!-- 네이버 프리미엄로그분석 End -->


	<!-- 일본어 사이트 DA광고용 구글 스크립트 Start -->
	<!-- Google Code for &#49884;&#50896;&#49828;&#53224;&#51068;&#48376;&#50612;&#49324;&#51060;&#53944;&#48169;&#47928;_&#53468;&#44536; -->
	<!-- Google Code for Remarketing Tag -->
	<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 1065086927;
		var google_conversion_label = "jO5cCKCwkmMQz9_v-wM";
		var google_custom_params = window.google_tag_params;
		var google_remarketing_only = true;
		/* ]]> */
	</script>
	<script type="text/javascript"
		src="//www.googleadservices.com/pagead/conversion.js">
		
	</script>
	<noscript>
		<div style="display: inline;">
			<img height="1" width="1" style="border-style: none;" alt=""
				src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1065086927/?value=1.00&amp;currency_code=KRW&amp;label=jO5cCKCwkmMQz9_v-wM&amp;guid=ON&amp;script=0" />
		</div>
	</noscript>
	<!-- 일본어 사이트 DA광고용 구글 스크립트 End -->

	<!-- 신규계정 일본어 GDN 리마케팅 태그 -->
	<!-- Google Code for &#49884;&#50896;&#49828;&#53224;&#51068;&#48376;&#50612;_&#47532;&#47560;&#52992;&#54021;&#53468;&#44536; -->
	<!-- Google Code for Remarketing Tag -->
	<!--------------------------------------------------
Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. See more information and instructions on how to setup the tag on: http://google.com/ads/remarketingsetup
--------------------------------------------------->
	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 857045604;
		var google_conversion_label = "ncrvCNCZ2G8Q5PTVmAM";
		var google_custom_params = window.google_tag_params;
		var google_remarketing_only = true;
		/* ]]> */
	</script>
	<script type="text/javascript"
		src="//www.googleadservices.com/pagead/conversion.js">
		
	</script>
	<noscript>
		<div style="display: inline;">
			<img height="1" width="1" style="border-style: none;" alt=""
				src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/857045604/?value=1.00&amp;currency_code=KRW&amp;label=ncrvCNCZ2G8Q5PTVmAM&amp;guid=ON&amp;script=0" />
		</div>
	</noscript>
	<!-- 신규계정 일본어 GDN 리마케팅 태그 -->


	<!-- 일본어 사이트 DA광고용 다음 스크립트 End -->
	<script type="text/javascript">
		var roosevelt_params = {
			retargeting_id : 'VNCqe2YyiQFdvKiyGPKxIw00',
			tag_label : 'pa6yRiJLT_2yxT3r5GQYPg'
		};
	</script>
	<script type="text/javascript"
		src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
	<!-- 일본어 사이트 DA광고용 다음 스크립트 End -->




	<!-- 시원스쿨일본어 전용 GA 트래킹스크립트 Start -->
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-71808717-1', 'auto', {
			'allowLinker' : true
		});
		ga('require', 'linker');
		ga('linker:autoLink', [ 'member.siwonschool.com' ]);
		ga('require', 'linkid', 'linkid.js');
		ga('require', 'displayfeatures');
		ga('send', 'pageview');
	</script>
	<!-- 시원스쿨일본어 전용 GA 트래킹스크립트 End -->

	<!-- Facebook Pixel Code -->
	<script>
		!function(f, b, e, v, n, t, s) {
			if (f.fbq)
				return;
			n = f.fbq = function() {
				n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
						.push(arguments)
			};
			if (!f._fbq)
				f._fbq = n;
			n.push = n;
			n.loaded = !0;
			n.version = '2.0';
			n.queue = [];
			t = b.createElement(e);
			t.async = !0;
			t.src = v;
			s = b.getElementsByTagName(e)[0];
			s.parentNode.insertBefore(t, s)
		}(window, document, 'script',
				'https://connect.facebook.net/en_US/fbevents.js');
		fbq('init', '1835287110018998');
		fbq('track', 'PageView');
	</script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=1835287110018998&ev=PageView&noscript=1" />
	</noscript>
	<!-- DO NOT MODIFY -->
	<!-- End Facebook Pixel Code -->

	<!-- Withpang Tracker v3.0 [공용] start -->
	<script type="text/javascript">
	<!--
		function mobRf() {
			var rf = new EN();
			rf.setSSL(true);
			rf.sendRf();
		}
	//-->
	</script>
	<script async="true"
		src="https://cdn.megadata.co.kr/js/enliple_min2.js" onload="mobRf()"></script>
	<!-- Withpang Tracker v3.0 [공용] end -->




	<!-- WIDERPLANET  SCRIPT START 2017.3.28 -->
	<div id="wp_tg_cts" style="display: none;"></div>
	<script type="text/javascript">
		var wptg_tagscript_vars = wptg_tagscript_vars || [];
		wptg_tagscript_vars.push((function() {
			return {
				wp_hcuid : "2941433", /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
				 *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
				ti : "27932", /*광고주 코드*/
				ty : "Home", /*트래킹태그 타입*/
				device : "web" /*디바이스 종류 (web 또는 mobile)*/

			};
		}));
	</script>
	<script type="text/javascript" async
		src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
	<!-- // WIDERPLANET  SCRIPT END 2017.3.28 -->

	<!-- EDN SCRIPT START 2017.05.08 -->
	<iframe id="hfrADCheck"
		src="//adcheck.about.co.kr/mad/prd/view?shopid=siwonjp1"
		scrolling="no" frameborder="0" width="0" height="0"></iframe>
	<!-- // EDN SCRIPT START 2017.05.08 -->


	<!-- N2S 스크립트 광고 수집용 Start -->
	<script language="javascript"
		src="//web.n2s.co.kr/js/_n2s_sp_log_siwonjapan.js"></script>
	<!-- N2S 스크립트 광고 수집용 End -->

	<!--카카오광고 픽셀 스크립트 2018-03-06-->
	<script type="text/javascript" charset="UTF-8"
		src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript">
		kakaoPixel('7240486721037383177').pageView();
	</script>
	<!--카카오광고 픽셀 스크립트 2018-03-06-->

	<!-- <span itemscope="" itemtype="http://schema.org/Organization">
 <link itemprop="url" href="http://japan.siwonschool.com">
 <a itemprop="sameAs" href="https://story.kakao.com/ch/siwonjapanese/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=kakaostory"></a>
 <a itemprop="sameAs" href="http://blog.naver.com/siwonjapan/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=blog"></a>
 <a itemprop="sameAs" href="https://www.facebook.com/japan.siwonschool/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=facebook"></a>
 <a itemprop="sameAs" href="https://www.youtube.com/channel/UCOXy4aQgRqg8cCfTKnCLDdA/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=youtube"></a>
 <a itemprop="sameAs" href="https://www.instagram.com/siwonjapanese/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=instagram"></a>
 <a itemprop="sameAs" href="http://post.naver.com/siwonschool0?utm_campaign=siwonschool&utm_source=viral&utm_medium=free&utm_content=banner&utm_term=SNS_main_be_post_n"></a>
</span>
// naver chanel
<input type="hidden" name="logno" value=2941433> -->
</body>
</html>
