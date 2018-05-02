<%-- 
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ミルカモMyCourse</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="true" />
<div id="siwon_container" class="mylec_section">
	<div class="sec_navi_comm"><ul class="navi_list"><li><a href="/">홈</a></li><li><a href="myCourseView">受講内訳</a></li></ul></div>	<div class="inner_container">
		<!-- 상단 네비 -->
		<div class="navi_tit_comm">
			<h2 class="tit">受講内訳</h2>
		</div>
		<!--// 상단 네비 -->

		<!-- 컨텐츠 영역 -->
		<ul class="wrap_lecinfo">
			<div class="inside">
				<li class="st1">
					<img src="http://data.siwonschool.com/common/avatar/avatar01.png" alt="이미지" class="avatar"/>
					<p class="con">
											<span class="name"><strong>${userId}</strong>さん</span><br />日本語の実力が向上することを応援します。
						<a href="https://member.siwonschool.com/?s=modify" class="bt_st1_s mt12" style="width:86px">マイページ</a>
					</p>
				</li>
			
			</div>
		</ul>
	</div><!--// inner_container -->

	

	<div class="inner_container">
		<!-- 이벤트성 연장재수강 관련 170215 -->
		
		<div class="wrap_japan">
			<!-- [D] 연장재수강 탭 항시 노출. 이벤트 기간에만 활성화.
			이벤트 기간 아닐 시 경고창: 지금은 이벤트 기간이 아닙니다. -->
			
			<div class="tab_con con1">
				<!-- [D] 내강의실 상품별 노출 기능 170330 -->
				<div class="area_srch">
					
				</div>

				<!-- 강좌 그룹 -->
				<table class="table_st8 mt10">
					<colgroup><col style="width:203px"/><col /><col style="width:298px"/><col style="width:190px"/></colgroup>
					<tbody id="ing_list">
					<tr class="tr_top">
			<th class="th_list_comm5 box_th">講義名</th>
			<th class="th_list_comm3 box_th">先生</th>
			<th class="th_list_comm3 box_th">言語</th>
		</tr>
			<c:if test="${list == null||list.size()==0}">
				<th colspan="3"  class="th_list_comm3 box_th">수강 중인 강의가 없습니다.</th>
			</c:if>
			<c:if test="${list.size() !=0 }">
				<c:forEach items="${list}" var="list">
		<tr>
					<th class="th_list_comm3 box_th"><a href="">${list.packagename}</a></th>
					<th class="th_list_comm3 box_th">${list.teacher}</th>
					<th class="th_list_comm3 box_th">${list.languages}</th>
		</tr>
				</c:forEach>
			</c:if>
					</tbody>
				</table>
			</div>

			<div class="tab_con con2">
				<!-- [D] 내강의실 상품별 노출 기능 170330 -->
				

				<!-- 강좌 그룹 -->
				<table class="table_st8 mt10">
					<colgroup><col style="width:203px"/><col /><col style="width:298px"/><col style="width:190px"/></colgroup>
					<tbody id="end_list">
					</tbody>
				</table>
			</div>
				<!-- 이벤트성 연장재수강 관련 170207 -->
			<div class="tab_con con3">
				<div class="evtprod_noti">
					<dl>
						<dt>잠깐만요!</dt>
						<dd>&bull; 연장 구매 회원의 경우 현재 수강 중인 강좌에 기간이 연장됩니다.</dd>
						<dd>&bull; 재수강은 현재 진행 중인 강좌, 모두 종료 후에만 구매가 가능하며, 구매 시 새로운 강좌가 생성됩니다.</dd>
						<dd>&bull; 최초 구매하신 패키지 상품 내 강좌가 한개라도 수강기간 종료될 경우 재수강으로 신청 가능합니다.</dd>
						<dd>&bull; 연장/재수강 구매 가능 대상은 각 상품별 대상자 안내를 확인해주세요.</dd>
						<dd>&bull; 연장/재수강 상품의 경우 구매 제한 상품으로 환불 시 재구매가 불가합니다.</dd>
						<dd>&bull; 재구매 제한 : 연장 수강 2회 / 재수강 1회 가능 / 환급반 및 단과 구매자 불가</dd>
						<dd>&bull; 대상 : 해당 패키지 / 프리패스 구매 회원</dd>
						<dd>&bull; 연장 : 현재 수강 중인 회원 / 재수강 : 수강 완료 회원</dd>
						<dd>( ※ 최초 구매하신 패키지 상품 내 수강기간 만료된 강의가 1개라도 있을 경우, 해당 상품은 '연장가'가 아닌 '재수강가'로 결제됩니다. )</dd>
					</dl>
				</div>
				<div class="evtprod_sec" id="products_list_tpl">
				
					<h3 class="tit_comm">송수근님의 연장, 재수강 혜택</h3>

					<ul class="info">
						<li>* 송수근 회원님께서 구매하실 수 있는 패키지 / 프리패스 연장, 재수강 상품 리스트 입니다.</li>
					</ul>

					<ul class="product_list">
											<li class="blank"><div class="tb_cell">
							<p>구매 가능한 패키지/프리패스 연장, 재수강 상품이 없습니다.</p>
							<a href="/?s=products">지금 수강신청 바로가기 ▶</a>
						</div></li>
																</ul><!--// product_list -->
					
					<h3 class="tit_comm">패키지 / 프리패스 연장, 재수강</h3>
					<p class="target">
						* 대상 : 해당 패키지 / 프리패스 구매 회원
						<br /> * 연장 : 현재 수강 중인 회원 (기본 수강 일수 기준) / 재수강 : 수강 완료 회원 (단, 수강 기간 만료된 강의가 1개라도 있을 경우, ‘재수강가’로 결제)
					</p>
					<ul class="product_list">
						<li id="area00003476">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505983726775388.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">스마트패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				스마트패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 44강좌<br />기초부터 시험까지 이거 하나면 끝!			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">549,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003476" add_sno="3038" id="prod00003476_EX_6" id="prod00003476" class="id_check" disabled value="00003476"/>	<label onClick="alert('`스마트패키지` 구매이력이 없습니다.')" for="prod00003476_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">171,000원</span>	</label></li><li><input type="radio" name="prod00003476" add_sno="3039" id="prod00003476_EX_12" id="prod00003476" class="id_check" disabled value="00003476"/>	<label onClick="alert('`스마트패키지` 구매이력이 없습니다.')" for="prod00003476_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">221,000원</span>	</label></li><li><input type="radio" name="prod00003476" add_sno="3040" id="prod00003476_RE_12" id="prod00003476" class="id_check" disabled value="00003476"/>	<label onClick="alert('`스마트패키지` 구매이력이 없습니다.')" for="prod00003476_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">231,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003476" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004207">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513244112560124.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">일본어 끝장패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				일본어 끝장패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 53강좌<br />전 강좌+교재27권+사은품5종+730일무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">480,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004207" add_sno="3441" id="prod00004207_EX_6" id="prod00004207" class="id_check" disabled value="00004207"/>	<label onClick="alert('`일본어 끝장패키지` 구매이력이 없습니다.')" for="prod00004207_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">171,000원</span>	</label></li><li><input type="radio" name="prod00004207" add_sno="3442" id="prod00004207_EX_12" id="prod00004207" class="id_check" disabled value="00004207"/>	<label onClick="alert('`일본어 끝장패키지` 구매이력이 없습니다.')" for="prod00004207_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">221,000원</span>	</label></li><li><input type="radio" name="prod00004207" add_sno="3443" id="prod00004207_RE_12" id="prod00004207" class="id_check" disabled value="00004207"/>	<label onClick="alert('`일본어 끝장패키지` 구매이력이 없습니다.')" for="prod00004207_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">231,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004207" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003701">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505977457188016.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">일본어 365패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				일본어 365패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 35강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">390,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003701" add_sno="3154" id="prod00003701_EX_6" id="prod00003701" class="id_check" disabled value="00003701"/>	<label onClick="alert('`일본어 365패키지` 구매이력이 없습니다.')" for="prod00003701_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">161,000원</span>	</label></li><li><input type="radio" name="prod00003701" add_sno="3155" id="prod00003701_EX_12" id="prod00003701" class="id_check" disabled value="00003701"/>	<label onClick="alert('`일본어 365패키지` 구매이력이 없습니다.')" for="prod00003701_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">201,000원</span>	</label></li><li><input type="radio" name="prod00003701" add_sno="3156" id="prod00003701_RE_12" id="prod00003701" class="id_check" disabled value="00003701"/>	<label onClick="alert('`일본어 365패키지` 구매이력이 없습니다.')" for="prod00003701_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">211,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003701" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00001119">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505977810633128.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">울트라패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				울트라패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 20강좌<br />기초 20강좌+1년무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">288,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00001119" add_sno="405" id="prod00001119_EX_6" id="prod00001119" class="id_check" disabled value="00001119"/>	<label onClick="alert('`울트라패키지` 구매이력이 없습니다.')" for="prod00001119_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">151,000원</span>	</label></li><li><input type="radio" name="prod00001119" add_sno="406" id="prod00001119_EX_12" id="prod00001119" class="id_check" disabled value="00001119"/>	<label onClick="alert('`울트라패키지` 구매이력이 없습니다.')" for="prod00001119_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">191,000원</span>	</label></li><li><input type="radio" name="prod00001119" add_sno="407" id="prod00001119_RE_12" id="prod00001119" class="id_check" disabled value="00001119"/>	<label onClick="alert('`울트라패키지` 구매이력이 없습니다.')" for="prod00001119_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">201,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00003361" class="id_check" value="00003361"/><label for="prod00003361" class="type-checkbox2">	<span class="tit">울트라패키지 교재 SET (전21권)<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">울트라패키지 교재 SET (전21권)</em>	<span class="desc">()</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1508749562048095.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">203,040원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00001119" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004392">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1524466814188372.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">나눔패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				나눔패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 40강좌<br />기초~고급 전 강좌+신규강좌+395일 무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">320,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004392" add_sno="3598" id="prod00004392_EX_6" id="prod00004392" class="id_check" disabled value="00004392"/>	<label onClick="alert('`나눔패키지` 구매이력이 없습니다.')" for="prod00004392_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">158,000원</span>	</label></li><li><input type="radio" name="prod00004392" add_sno="3599" id="prod00004392_EX_12" id="prod00004392" class="id_check" disabled value="00004392"/>	<label onClick="alert('`나눔패키지` 구매이력이 없습니다.')" for="prod00004392_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">198,000원</span>	</label></li><li><input type="radio" name="prod00004392" add_sno="3600" id="prod00004392_RE_12" id="prod00004392" class="id_check" disabled value="00004392"/>	<label onClick="alert('`나눔패키지` 구매이력이 없습니다.')" for="prod00004392_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">208,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00003999" class="id_check" value="00003999"/><label for="prod00003999" class="type-checkbox2">	<span class="tit">일본어365 교재 전권 SET (전27권)<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">일본어365 교재 전권 SET (전27권)</em>	<span class="desc">()</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1520571798725698.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">272,250원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004392" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004329">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1522079909897310.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">올킬패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				올킬패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 55강좌<br />전 강좌+교재25권+사은품5종+455일무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">450,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004329" add_sno="3531" id="prod00004329_EX_6" id="prod00004329" class="id_check" disabled value="00004329"/>	<label onClick="alert('`올킬패키지` 구매이력이 없습니다.')" for="prod00004329_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">171,000원</span>	</label></li><li><input type="radio" name="prod00004329" add_sno="3532" id="prod00004329_EX_12" id="prod00004329" class="id_check" disabled value="00004329"/>	<label onClick="alert('`올킬패키지` 구매이력이 없습니다.')" for="prod00004329_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">221,000원</span>	</label></li><li><input type="radio" name="prod00004329" add_sno="3533" id="prod00004329_RE_12" id="prod00004329" class="id_check" disabled value="00004329"/>	<label onClick="alert('`올킬패키지` 구매이력이 없습니다.')" for="prod00004329_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">231,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004329" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000135">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506089196764296.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">왕초보프리패스 12개월</a></dt>			<dd>				<span class="dd_tit">대상:</span>				왕초보프리패스 12개월 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />대국민 일본어 말문열기 프로젝트			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">195,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000135" add_sno="408" id="prod00000135_EX_6" id="prod00000135" class="id_check" disabled value="00000135"/>	<label onClick="alert('`왕초보프리패스 12개월` 구매이력이 없습니다.')" for="prod00000135_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">90,000원</span>	</label></li><li><input type="radio" name="prod00000135" add_sno="409" id="prod00000135_EX_12" id="prod00000135" class="id_check" disabled value="00000135"/>	<label onClick="alert('`왕초보프리패스 12개월` 구매이력이 없습니다.')" for="prod00000135_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">126,000원</span>	</label></li><li><input type="radio" name="prod00000135" add_sno="410" id="prod00000135_RE_12" id="prod00000135" class="id_check" disabled value="00000135"/>	<label onClick="alert('`왕초보프리패스 12개월` 구매이력이 없습니다.')" for="prod00000135_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">134,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000135" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000656">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506089271444693.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">김수경회화 프리패스</a></dt>			<dd>				<span class="dd_tit">대상:</span>				김수경회화 프리패스 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />일본어 회화공부의 새로운 패러다임			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">120,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000656" add_sno="411" id="prod00000656_EX_6" id="prod00000656" class="id_check" disabled value="00000656"/>	<label onClick="alert('`김수경회화 프리패스` 구매이력이 없습니다.')" for="prod00000656_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">79,000원</span>	</label></li><li><input type="radio" name="prod00000656" add_sno="412" id="prod00000656_RE_6" id="prod00000656" class="id_check" disabled value="00000656"/>	<label onClick="alert('`김수경회화 프리패스` 구매이력이 없습니다.')" for="prod00000656_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">90,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000656" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000991">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1512638516279333.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">비즈니스 프리패스</a></dt>			<dd>				<span class="dd_tit">대상:</span>				비즈니스 프리패스 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />까다로운 비즈니스 회화를 쉽고 명쾌하게 해결!			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">130,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000991" add_sno="413" id="prod00000991_EX_6" id="prod00000991" class="id_check" disabled value="00000991"/>	<label onClick="alert('`비즈니스 프리패스` 구매이력이 없습니다.')" for="prod00000991_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">89,000원</span>	</label></li><li><input type="radio" name="prod00000991" add_sno="414" id="prod00000991_RE_6" id="prod00000991" class="id_check" disabled value="00000991"/>	<label onClick="alert('`비즈니스 프리패스` 구매이력이 없습니다.')" for="prod00000991_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">100,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00002318" class="id_check" value="00002318"/><label for="prod00002318" class="type-checkbox2">	<span class="tit">일본어 비즈니스회화 SET (전3권)<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">일본어 비즈니스회화 SET (전3권)</em>	<span class="desc">(일본어 비즈니스회화 강의교재 3종)</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506077915269987.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">29,160원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000991" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000140">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505977830195027.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">JPT 초급완성</a></dt>			<dd>				<span class="dd_tit">대상:</span>				JPT 초급완성 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />속성문법+JPT 550독해/청해+90일무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">120,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000140" add_sno="415" id="prod00000140_EX_3" id="prod00000140" class="id_check" disabled value="00000140"/>	<label onClick="alert('`JPT 초급완성` 구매이력이 없습니다.')" for="prod00000140_EX_3" class="type-radio5 disabled">	<span class="tit">연장 3개월 (강의)</span>	<span class="price">79,000원</span>	</label></li><li><input type="radio" name="prod00000140" add_sno="416" id="prod00000140_RE_3" id="prod00000140" class="id_check" disabled value="00000140"/>	<label onClick="alert('`JPT 초급완성` 구매이력이 없습니다.')" for="prod00000140_RE_3" class="type-radio5 disabled">	<span class="tit">재수강 3개월 (강의)</span>	<span class="price">90,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00001812" class="id_check" value="00001812"/><label for="prod00001812" class="type-checkbox2">	<span class="tit">일취월장 JPT 실전모의고사 500점<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">일취월장 JPT 실전모의고사 500점</em>	<span class="desc">(JPT 550+ 독해 / 청해 공식교재)</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506078408779305.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">14,500원</span></label></li><li class="book_check"><input type="checkbox" id="prod00003762" class="id_check" value="00003762"/><label for="prod00003762" class="type-checkbox2">	<span class="tit">스피드 업! 일본어 속성문법<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">스피드 업! 일본어 속성문법</em>	<span class="desc">(핵심만 빠르게 독학 가능한 일본어 속성문법 공식교재)</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1515392706718890.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">13,500원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000140" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003840">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649637582585.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">최유리 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				최유리 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />267강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003840" add_sno="3318" id="prod00003840_EX_6" id="prod00003840" class="id_check" disabled value="00003840"/>	<label onClick="alert('`최유리 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003840_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003840" add_sno="3319" id="prod00003840_RE_6" id="prod00003840" class="id_check" disabled value="00003840"/>	<label onClick="alert('`최유리 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003840_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003840" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003998">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649697009385.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">최유리 마니아패스 (12개월 +교재5권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				최유리 마니아패스 (12개월 +교재5권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">215,500원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003998" add_sno="3349" id="prod00003998_EX_6" id="prod00003998" class="id_check" disabled value="00003998"/>	<label onClick="alert('`최유리 마니아패스 (12개월 +교재5권)` 구매이력이 없습니다.')" for="prod00003998_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003998" add_sno="3350" id="prod00003998_EX_12" id="prod00003998" class="id_check" disabled value="00003998"/>	<label onClick="alert('`최유리 마니아패스 (12개월 +교재5권)` 구매이력이 없습니다.')" for="prod00003998_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003998" add_sno="3351" id="prod00003998_RE_12" id="prod00003998" class="id_check" disabled value="00003998"/>	<label onClick="alert('`최유리 마니아패스 (12개월 +교재5권)` 구매이력이 없습니다.')" for="prod00003998_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003998" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003569">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649749621570.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">김수경 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				김수경 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 7강좌<br />219강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003569" add_sno="3080" id="prod00003569_EX_6" id="prod00003569" class="id_check" disabled value="00003569"/>	<label onClick="alert('`김수경 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003569_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003569" add_sno="3081" id="prod00003569_RE_6" id="prod00003569" class="id_check" disabled value="00003569"/>	<label onClick="alert('`김수경 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003569_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003569" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003580">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649788766444.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">김수경 마니아패스 (12개월 + 교재 7권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				김수경 마니아패스 (12개월 + 교재 7권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 7강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">227,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003580" add_sno="3082" id="prod00003580_EX_6" id="prod00003580" class="id_check" disabled value="00003580"/>	<label onClick="alert('`김수경 마니아패스 (12개월 + 교재 7권)` 구매이력이 없습니다.')" for="prod00003580_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003580" add_sno="3083" id="prod00003580_EX_12" id="prod00003580" class="id_check" disabled value="00003580"/>	<label onClick="alert('`김수경 마니아패스 (12개월 + 교재 7권)` 구매이력이 없습니다.')" for="prod00003580_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003580" add_sno="3084" id="prod00003580_RE_12" id="prod00003580" class="id_check" disabled value="00003580"/>	<label onClick="alert('`김수경 마니아패스 (12개월 + 교재 7권)` 구매이력이 없습니다.')" for="prod00003580_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003580" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004331">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649859097436.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">권현정 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				권현정 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />203강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004331" add_sno="3542" id="prod00004331_EX_6" id="prod00004331" class="id_check" disabled value="00004331"/>	<label onClick="alert('`권현정 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004331_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004331" add_sno="3543" id="prod00004331_RE_6" id="prod00004331" class="id_check" disabled value="00004331"/>	<label onClick="alert('`권현정 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004331_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004331" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004333">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649817246524.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">권현정 마니아패스 (12개월 + 교재 6권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				권현정 마니아패스 (12개월 + 교재 6권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">189,900원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004333" add_sno="3544" id="prod00004333_EX_6" id="prod00004333" class="id_check" disabled value="00004333"/>	<label onClick="alert('`권현정 마니아패스 (12개월 + 교재 6권)` 구매이력이 없습니다.')" for="prod00004333_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004333" add_sno="3545" id="prod00004333_EX_12" id="prod00004333" class="id_check" disabled value="00004333"/>	<label onClick="alert('`권현정 마니아패스 (12개월 + 교재 6권)` 구매이력이 없습니다.')" for="prod00004333_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00004333" add_sno="3546" id="prod00004333_RE_12" id="prod00004333" class="id_check" disabled value="00004333"/>	<label onClick="alert('`권현정 마니아패스 (12개월 + 교재 6권)` 구매이력이 없습니다.')" for="prod00004333_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004333" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003831">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649880204383.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">강기석 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				강기석 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />189강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003831" add_sno="3537" id="prod00003831_EX_6" id="prod00003831" class="id_check" disabled value="00003831"/>	<label onClick="alert('`강기석 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003831_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003831" add_sno="3538" id="prod00003831_RE_6" id="prod00003831" class="id_check" disabled value="00003831"/>	<label onClick="alert('`강기석 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003831_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003831" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003833">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649904624659.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">강기석 마니아패스 (12개월 + 교재 5권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				강기석 마니아패스 (12개월 + 교재 5권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">208,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003833" add_sno="3539" id="prod00003833_EX_6" id="prod00003833" class="id_check" disabled value="00003833"/>	<label onClick="alert('`강기석 마니아패스 (12개월 + 교재 5권)` 구매이력이 없습니다.')" for="prod00003833_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003833" add_sno="3540" id="prod00003833_EX_12" id="prod00003833" class="id_check" disabled value="00003833"/>	<label onClick="alert('`강기석 마니아패스 (12개월 + 교재 5권)` 구매이력이 없습니다.')" for="prod00003833_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003833" add_sno="3541" id="prod00003833_RE_12" id="prod00003833" class="id_check" disabled value="00003833"/>	<label onClick="alert('`강기석 마니아패스 (12개월 + 교재 5권)` 구매이력이 없습니다.')" for="prod00003833_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003833" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004209">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649931647285.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">아야카 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				아야카 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 7강좌<br />215강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004209" add_sno="3447" id="prod00004209_EX_6" id="prod00004209" class="id_check" disabled value="00004209"/>	<label onClick="alert('`아야카 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004209_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004209" add_sno="3448" id="prod00004209_RE_6" id="prod00004209" class="id_check" disabled value="00004209"/>	<label onClick="alert('`아야카 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004209_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004209" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003991">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649955562336.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">서경원 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				서경원 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />143강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003991" add_sno="3342" id="prod00003991_EX_6" id="prod00003991" class="id_check" disabled value="00003991"/>	<label onClick="alert('`서경원 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003991_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003991" add_sno="3343" id="prod00003991_RE_6" id="prod00003991" class="id_check" disabled value="00003991"/>	<label onClick="alert('`서경원 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003991_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003991" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003992">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649979627844.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">서경원 마니아패스 (12개월 + 교재4권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				서경원 마니아패스 (12개월 + 교재4권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />143강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">208,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003992" add_sno="3344" id="prod00003992_EX_6" id="prod00003992" class="id_check" disabled value="00003992"/>	<label onClick="alert('`서경원 마니아패스 (12개월 + 교재4권)` 구매이력이 없습니다.')" for="prod00003992_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003992" add_sno="3345" id="prod00003992_EX_12" id="prod00003992" class="id_check" disabled value="00003992"/>	<label onClick="alert('`서경원 마니아패스 (12개월 + 교재4권)` 구매이력이 없습니다.')" for="prod00003992_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003992" add_sno="3346" id="prod00003992_RE_12" id="prod00003992" class="id_check" disabled value="00003992"/>	<label onClick="alert('`서경원 마니아패스 (12개월 + 교재4권)` 구매이력이 없습니다.')" for="prod00003992_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003992" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004211">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513650001566630.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">나루미 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				나루미 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 9강좌<br />208강  |  180일 / 365일  |  12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004211" add_sno="3452" id="prod00004211_EX_6" id="prod00004211" class="id_check" disabled value="00004211"/>	<label onClick="alert('`나루미 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004211_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004211" add_sno="3453" id="prod00004211_RE_6" id="prod00004211" class="id_check" disabled value="00004211"/>	<label onClick="alert('`나루미 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004211_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004211" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004212">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1517450641307982.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">나루미 마니아패스 (12개월 + 교재 1권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				나루미 마니아패스 (12개월 + 교재 1권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 9강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">204,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004212" add_sno="3454" id="prod00004212_EX_6" id="prod00004212" class="id_check" disabled value="00004212"/>	<label onClick="alert('`나루미 마니아패스 (12개월 + 교재 1권)` 구매이력이 없습니다.')" for="prod00004212_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004212" add_sno="3455" id="prod00004212_EX_12" id="prod00004212" class="id_check" disabled value="00004212"/>	<label onClick="alert('`나루미 마니아패스 (12개월 + 교재 1권)` 구매이력이 없습니다.')" for="prod00004212_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00004212" add_sno="3456" id="prod00004212_RE_12" id="prod00004212" class="id_check" disabled value="00004212"/>	<label onClick="alert('`나루미 마니아패스 (12개월 + 교재 1권)` 구매이력이 없습니다.')" for="prod00004212_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004212" id="pop_apply">구매하기</a>		</div>	</div></li>					</ul><!--// product_list -->
				</div>
			</div><!-- tab_con con3 -->
		<!-- // 이벤트성 연장재수강 관련 170207 -->
				</div>
	
		<!--// 컨텐츠 영역 -->
	</div><!-- // inner_container-->
</div><!-- // lecture_section -->

<style>
/* 레이어팝업: 증명서 발급(전사이트 공통) 171123 */
#layer_certificate{width:540px;padding:0 29px 29px;border:1px solid #25252b}
#layer_certificate .bt_cls{display:block;overflow:hidden;position:absolute;top:28px;right:29px;width:25px;height:25px;background:url(//img.siwonschool.com/comm/close_25x25_gray.png) no-repeat;font-size:0;text-indent:100%}
#layer_certificate .pop_tit{height:80px;padding:0;border:none;background:none;font-size:24px;color:#111;line-height:80px;text-indent:inherit}
#layer_certificate .pop_cont{padding:0}
#layer_certificate .pop_cont ol li{margin-top:30px}
#layer_certificate .pop_cont ol li:first-child{margin-top:0}
#layer_certificate .pop_cont ol .tit{display:block;padding-bottom:15px;font-size:16px;color:#111}
#layer_certificate .pop_cont ol .certificate_bt{overflow:hidden;text-align:center}
#layer_certificate .pop_cont ol button{display:inline-block;width:48%;height:40px;background:#999;font-size:14px;color:#fff;line-height:40px}
#layer_certificate .pop_cont ol button:first-child{margin-right:1%}
#layer_certificate .pop_cont ol button.on{background:#111}
#layer_certificate .pop_cont ol select{width:100%;height:30px;border:1px solid #ddd}
#layer_certificate .pop_cont .bt_print{display:block;width:130px;height:40px;margin:30px auto 0;background:#111;font-size:14px;color:#fff;text-indent:inherit}
</style>
<!-- 레이어팝업: 증명서발급 -->
<div class="wrap_layer_popup2" id="certificate_Layer">
	<a href="javascript:void(0)" onclick="layerPopClose()" class="bt_close">닫기</a>
	<div class="inner">
		<h3>증명서 발급</h3>
		<div class="wrap_tmenu" id="tmenu_comm2">
			<ul class="tmenu">
				<li><a href="javascript:;" key=1 class="bt1_st1_gray4">수강증</a></li>
				<li><a href="javascript:;" key=2 class="bt1_st1_gray4">출석확인증</a></li>
				<li><a href="javascript:;" key=3 class="bt1_st1_gray4">수료증</a></li>
			</ul>
			<ul class="tcon">
				<!-- 수강증 -->
				<li>
					<ul class="desc">
						<li>&bull; 시원스쿨 일본어에서 강의를 수강하였음을 증명하는 서류입니다.</li>
						<li>&bull; 결제한 상품을 기준으로 출력 가능합니다.</li>
					</ul>
					<div class="select">
						<select name="rprint" id="" class="select2_st1 certi_prod">
							<option value="">구매한 상품을 선택하세요.</option>
							<option value="상품코드">상품01</option>
						</select>
					</div>
				</li><!--// 수강증 -->
				<!-- 출석확인증 -->
				<li>
					<ul class="desc">
						<li>&bull; 해당 강의에 출석 사실을 확인하고 이를 증명하기 위한 서류입니다.</li>
						<li>&bull; 각 강의별로 출력 가능합니다.</li>
					</ul>
					<div class="select">
						<select name="rprint" id="certi_prod2" class="select2_st1 certi_prod">
							<option value="">구매한 상품을 선택하세요.</option>
						</select>
						<select name="rprint2" class="select2_st1 certi_lec">
							<option value="">증명서 발급 내용을 선택하세요.</option>
						</select>
					</div>
				</li><!--// 출석확인증 -->
				<!-- 수료증 -->
				<li>
					<ul class="desc">
						<li>&bull; 이 수료증은 시원스쿨 일본어에서 자체 발급한 증서로서 법적인 효력을 보장할 수 없습니다.</li>
						<li>&bull; 시원스쿨 일본어의 강의 이수 기준을 통과하였음을 증명하는 서류입니다.</li>
						<li>&bull; 성취도평가 90점 이상 달성 시 달성일로부터 6개월간 수료증 출력이 가능합니다.</li>
					</ul>
					<div class="select">
						<select name="rprint" id="certi_prod3" class="select2_st1 certi_prod">
							<option value="">구매한 상품을 선택하세요.</option>
						</select>
					</div>
					<div class="comp"><ul class="completion_list">
						<li class="tc"><label>상품을 선택해주세요.</label></li>
					</ul></div>
				</li><!--// 수료증 -->
			</ul>
			<form name="completionF" action="/?s=myclass&a=completion_pop" method="POST" target="_blank">
			<input type="hidden" name="idx_arr">
			</form>
		</div>
		<div class="group_bt">
			<a href="javascript:;" id="bt_print" class="bt1_st1_red bt_print">출력하기</a>
		</div>
	</div>
</div><!-- // 레이어팝업: 증명서발급 -->

<script type="text/javascript">

var go_certificate = function(val){

	var basicsChk = $("input#basicsChk:checked").val();

	if(!basicsChk){
		basicsChk = "N";
	}

	if(val==1){
		if($("select[name=rprint]").val() == ""){
			alert("발급하실 수강증을 선택해주세요.");
			$("select[name=rprint]").focus();
			return;
		}

		var sno = $("select[name=rprint]").val();
		window.open("/module/myclass/pop/regi.php?sno=" + sno + "&basicsChk=" + basicsChk,"certificate_pop", "scrollbars=yes, toolbars=no, resizable=yes,width=642, height=568");
	}else if(val==2){

		if($("select[name=rprint2]").val()==""){
			alert("발급하실 출석확인증을 선택해주세요.");
			$("select[name=rprint2]").focus();
			return;
		}

		var sno = $("select[name=rprint2]").val();
		window.open("/module/myclass/pop/attendance.php?sno=" + sno + "&cateChk=" + basicsChk + "&cateSite=japan","certificate_pop", "scrollbars=yes, toolbars=no, resizable=yes,width=642, height=486");
	}else if(val==3){
		var idx = new Array();
		var i = 0;
		$(".completion_list input:checked").not("#prod_all").each(function(i){
			idx[i] = $(this).val();
		});

		if(!idx[0]){
			alert("선택한 강의가 없습니다.");
		}else{
			var f = $("form[name=completionF]");
			var temp = idx.join("|");
			$("input[name=idx_arr]",f).val(temp);
			f.submit();
		}
	}
}

$(document).ready(function(){
		$.ajax({
			url:"/?s=myclass&p=certificate&a=certificate",
			type:"POST",
			dataType: "json",
			async: true,
			data:{a: "load_products", site:'japan'},
			//xhrFields: {withCredentials: true},
			success : function(data){
				if(data.result == 1){
					$(".certi_prod").html(data.list);
					$('.certi_cnt').html(data.cnt);
				}
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});

		$("#bt_print").on("click",function(){
			var key = $("#tmenu_comm2 .tmenu .on a").attr("key");
			go_certificate(key);
		});


		$(document).on("click", ".completion_list #prod_all", function(){
			var checked = $(this).prop("checked");

			$(".completion_list label").not(".prod_all").each(function(){
				if(checked){
				$(this).addClass("checked");
				$(this).prev("input").prop("checked",true);
				}else{
				$(this).removeClass("checked");
				$(this).prev("input").prop("checked",false);
				}
			});

		});

		$(document).on("click", ".completion_list input:checkbox", function(){
			var checked = $(this).prop("checked");
			var prod_all = $("#prod_all");
			if(!checked){
				prod_all.prop("checked",false);
				prod_all.next("label").removeClass("checked");
			}

		});

		$("select.certi_prod").on("change",function(){
			var sno = "";
			var key = $("#tmenu_comm2 .tmenu .on a").attr("key");

			if(key==3){
				sno = $("#certi_prod3 option:selected").val();
				$.ajax({
					url:"/?s=myclass&p=certificate&a=certificate",
					type:"POST",
					dataType: "json",
					data:{a: "load_lecture", sno: sno,certi_type:'completion'},
					success : function(data){
						$('.completion_list').html(data.list);
						$("input[type=checkbox].id_check").customizeCRInput();
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});				
			}else{
				if(key==2){
				sno = $("#certi_prod2 option:selected").val();
				}
				var lecture = $("#certi_prod option:selected").text();

				$.ajax({
					url:"/?s=myclass&p=certificate&a=certificate",
					type:"POST",
					dataType: "json",
					data:{a: "load_lecture", sno: sno, lname: lecture},
					success : function(data){
						if(data.result == 1){
							$(".certi_lec").html(data.list);
						}
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
});
</script>
<!-- 강좌 일시정지 팝업창 -->
<div class="wrap_layer_popup pop_pause pop_no1" id="pop_pause_Layer">
	<h2 class="pop_tit">강좌 일시 정지<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3 class="tit_sub_nor mt0">일시 정지 신청</h3>
		<table class="table_st1">
			<colgroup>
				<col style="width:195px">
				<col style="width:145px">
				<col style="width:132px">
				<col style="width:124px">
				<col style="width:86px">
			</colgroup>
			<thead>
				<tr>
					<th>강의명</th>
					<th>수강기간</th>
					<th>정지 기간 선택</th>
					<th class="lh1">정지 가능 수<br />(정지 가능 기간)</th>
					<th>접수</th>
				</tr>
			</thead>
			<tbody id="onestop_list">
			</tbody>
		</table>
		<h3 class="tit_sub_line mt35">유의사항</h3>
		<ul class="mt10">
			<li class="dot_li">시원스쿨 수강 중 부득이하게 수강을 할 수 없는 경우, 일시 수강정지 기능을 사용할 수 있습니다.</li>
			<li class="dot_li">현재 수강중인 강의를 1회 10일 씩 <span class="bold">총 3회 최장 30일</span>까지 정지할 수 있습니다.</li>
			<li class="dot_li">이벤트 강의 또는 무료강의의 경우 일시 정지 불가합니다.</li>
			<li class="dot_li">패키지 강좌 의 경우 <span class="bold">한 강좌만 선택해서 정지</span>해도 묶어진 강좌 <span class="bold">전체가 한꺼번에 일괄정지</span> 처리 됩니다.</li>
			<li class="dot_li"><span class="bold">정지 기간 이후에는 자동으로 정지해제</span>되어 수강이 다시 시작됩니다.</li>
			<li class="dot_li">신규결제 후 수강 7일 이내 수강정지 한 경우, 100% 환불 되지 않으므로 유의하시기 바랍니다.</li>
		</ul>
	</div><!--// wrap_layer_popup -->
</div><!--// wrap_layer_popup : 강좌 일시정지 팝업창 -->

<!-- 환급 팝업창: 환급현황 -->
<div class="wrap_layer_popup pop_refund_mission">
	<h2 class="pop_tit">환급현황<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<div class="wrap_prod">
			<h3 class="vertical">환급반</h3>
			<select name="lret_list" id="lret_list" class="select_st2">
							</select>
		</div>
		<div id="refund_detail_area">
		</div>
	</div>
</div>
<!--// 환급 팝업창: 환급현황 -->
<!-- 환급 팝업창: 신청 -->
<div class="wrap_layer_popup pop_refund_apply">
	<a href="javascript:;" class="layer_popup" id="pop_refund_apply"></a>
	<form name="pop_refund_applyF" method="POST" action="/?s=myclass&a=refund_apply" autocomplete="off" enctype="multipart/form-data">
	<input type="hidden" name="refund_tcode">
	<input type="hidden" name="refund_tno">
	<h2 class="pop_tit">환급신청<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3><span>아래 사항을 정확히 입력해주세요.</span></h3>
		<table class="table_st2">
			<colgroup>
				<col style="width:111px"/>
				<col style=""/>
			</colgroup>
			<tr>
				<th>예금주</th>
				<td><input type="text" name="name" id="name" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>은행명</th>
				<td><input type="text" name="bank" id="bank" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="bank_num" id="bank_num" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone" id="phone" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>신분증 사본</th>
				<td>
					<div class="wrap_file">
						<input type="text" id="fileOutput" readonly class="input_st3" placeholder="이미지 파일을 첨부해주세요"/>
						<a href="javascript:;" class="bt_st4_s">첨부하기</a><input type="file" name="fileInput"/>
					</div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function pop_refund_apply(){
				var f = $("form[name=pop_refund_applyF]");

				if(!$("#name",f).val()){
					alert("예금주를 입력해주세요.");
					$("#name",f).focus();
				}else if(!$("#bank",f).val()){
					alert("은행명을 입력해주세요.");
					$("#bank",f).focus();
				}else if(!$("#bank_num",f).val()){
					alert("계좌번호를 입력해주세요.");
					$("#bank_num",f).focus();
				}else if(!$("#phone",f).val()){
					alert("연락처를 입력해주세요.");
					$("#phone",f).focus();
				}else if(!$("#ref_agree",f).prop("checked")){
					alert("개인정보 수집 및 이용안내에 동의해주세요.");
				}else if(!$("input[name=fileInput]:file").val()){
					alert("신분증 사본을 첨부해주세요.");
				}else if(confirm("환급신청을 하시겠습니까?")){
					f.submit();
				}
			}
		</script>
		<ul class="box_notice">
			<li>현금으로 해당 계좌에 환급됩니다.</li>
			<li>해당 ID 이름과 계좌번호 예금주가 반드시 일치되어야 합니다.</li>
			<li>연락처는 해당 ID 정보와 일치되어야 합니다.</li>
			<li>일본어 환급반 2.0의 제세공과금 처리를 위하여 관련 법령(소득세법 제 145조 및 소득세법 시행규칙 제 100조)에 근거하여 주민등록번호를 수집할 수 있습니다.</li>
			<li>주민번호 식별이 불가능할 경우, 환급이 진행되지 않습니다.</li>
			<li>JPG, PNG, BMP, GIF만 첨부 가능하며(10MB이하), 제출하신 이미지는 반환되지 않습니다.</li>
			<li>해당정보는 확인절차 이후, 바로 자동 폐기됩니다.</li>
		</ul>
		<span class="wrap_agree">
			<input type="checkbox" id="ref_agree"/><label for="ref_agree">개인정보 수집에 동의합니다</label>
		</span>
		<div class="group_bt">
			<a href="javascript:;" class="bt_st9_e layer_popup_close" style="width:74px">취소</a>
			<a href="javascript:;" class="bt_st8_e" onClick="pop_refund_apply()" style="width:74px">신청하기</a>
		</div>
	</div>
	</form>
</div>
<!-- //환급 팝업창: 신청 -->
<!-- 환급 팝업창: 신청완료 -->
<div class="wrap_layer_popup pop_refund_done">
	<a href="javascript:;" class="layer_popup" id="pop_refund_done"></a>
	<h2 class="pop_tit">환급신청<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3>환급신청이 완료되었습니다.<br/>입력정보를 확인해주세요.</h3>
		<div  id="refund_done_area">

		</div>
	</div>
</div>
<!-- //환급 팝업창: 신청완료 -->

<!-- 환급 팝업창: 평가 -->
<div class="wrap_layer_popup pop_refund_test">
	<form name="refund_testF" method="POST">
	<input type="hidden" name="tcode" value="">
	<input type="hidden" name="data_type" value="resultquestion">
	<input type="hidden" name="tno" value="">
	<h2 class="pop_tit">성취도 평가</h2>
	<div class="wrap_layer_cont">
		<h3>성취도 평가<em id="score">총 20문제 중 80점이상 합격!</em></h3>
		<div id="test_question_qrea">

		</div>
		<script type="text/javascript">
			var cur_page = 1;
			function refund_question_page(key){
				if(key=='prev'){
					cur_page--;
				}else{
					cur_page++;
				}


				if(cur_page==1){
					$('#btn_prev').hide();
				}else if(cur_page>1){
					$('#btn_prev').show();
				}

				if(cur_page>=10){
					$('#btn_next').hide();
				}

				if(cur_page<10){
					$('#btn_next').show();
				}

				if(cur_page==10){
					$("#refund_test_submit").show();
				}else{
					$("#refund_test_submit").hide();
				}

				$('div.pop_refund_test li.page').hide();
				$('div.pop_refund_test li.page'+cur_page).show();
			}

			function refund_test_submit(){


				if(confirm("제출하시겠습니까?")){
					$.ajax({url:"/?s=myclass&a=refund_detail",
						type:"POST",
						dataType: "json",
						data:$('form[name=refund_testF]').serialize(),
						async : false,
						success : function(data){
							$(".wrap_layer_popup").fadeOut();
							if(data.msg!="ok"){
								alert(data.msg);
							}else{
								$("#test_result_area").html(data.test_result_area);
								$("a.hidden_layer_popup").attr("id","pop_refund_result");
								$("a.hidden_layer_popup").trigger("click");
							}

						}
					});
				}
			}
		</script>
		<div class="wrap_notice" id="caution_text">
			<!--h3 class="tit_sub_nor line">유의사항</h3>
			<ul>
				<li>환급 미션 달성과 상관 없이 수강기간 종료 후 7일 이내 환급 신청이 가능합니다.</li>
				<li>수강 완료된 강의에서 환급 및 도전 신청 가능합니다.</li>
			</ul-->
		</div>
		<div class="group_bt">
			<a href="javascript:;" onClick="refund_question_page('prev')" id="btn_prev" class="bt_st9_e" style="width:74px; display:none;">이전</a>
			<a href="javascript:;" onClick="refund_question_page('next')" id="btn_next" class="bt_st8_e" style="width:74px">다음</a>
			<a href="javascript:;" id="refund_test_submit" onClick="refund_test_submit();" class="bt_st8_e" style="width:74px; display:none;">제출하기</a>
		</div>
	</div>
	</form>
</div>
<!-- //환급 팝업창: 평가 -->

<!-- 환급 팝업창: 평가결과 -->
<div class="wrap_layer_popup pop_refund_result">
	<h2 class="pop_tit">성취도 평가결과<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div id="test_result_area">

	</div>
</div>
<!-- 환급 팝업창: 평가결과 -->

<!-- 환급 팝업창: 정답 -->
<div class="wrap_layer_popup pop_refund_aw">
	<h2 class="pop_tit">정답 및 해설<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3>정답 및 해설</h3>
		<ul class="result_count">
			<li class="correct" id="o_cnt">0개</li>
			<li class="wrong" id="x_cnt">0개</li>
		</ul>
		<table class="table_st1 mt30">
			<colgroup>
				<col style="width:105px"/>
				<col style="width:452px"/>
				<col style="width:105px"/>
				<col style="width:105px"/>
				<col style="width:105px"/>
				<col style="width:105px"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>문제</th>
					<th>선택</th>
					<th>정답</th>
					<th>정답유무</th>
					<th>해설</th>
				</tr>
			</thead>
			<tbody id="test_explain_area">

			</tbody>
		</table>
		<div class="wrap_button">
			<a href="javascript:;" onClick="$('.pop_refund_aw').hide()" class="bt_st8_e bt_apply" style="width:76px">확인</a>
		</div>
	</div>
</div>
<!-- //환급 팝업창: 정답 -->

<!-- 레이어팝업: 패키지 연장재수강 앵콜 -->
<div class="wrap_layer_popup" id="encore_Layer">
	<div class="popcls_ck_comm">
		<div class="innerbox">
			<a href="javascript:layerPopClose();">닫기</a>
		</div>
	</div>
	<div class="layer_cont">
		<div class="encore_tit tc"><img src="//img.siwonschool.com/japan/lecture/encore_tit.jpg" alt="패키지 연장/재수강 앵콜 알림 문자 예약!" /></div>
		<div id="encore_box">
			<div class="encore_top tc">
				<img src="//img.siwonschool.com/japan/lecture/encore_top.png" alt="현재 패키지 연장/재수강 앵콜 알림 참여자" />
				<span class="join_num tc">882명</span><!-- 현재 참여자 수 노출 -->
			</div>
			<div class="encore_btm">
				<span class="phone_num tc">휴대폰 번호 <span class="phone_gubun">|</span> 010-8982-9690</span><!-- 휴대폰 번호 - 로그인 회원 정보 연동 -->
				<div class="notice_wrap">
					<span class="notice_tit">유의사항</span>
					<div class="notice_box">【 개인정보 수]집 및 활용 동의 안내 】<br/><br/>
						<p class="notice_1">1. 개인정보 수집 이용 목적<br/>
						- 이벤트 상품의 발송, 시원스쿨일본어 사이트의 새로운 서비스, 신상품이나 이벤트, 최신정보 발송 등 신청하신 분들의 취향에 맞는 최적의 서비스를 제공하기 위함.</p>
						<p class="notice_2">2. 개인정보 수집 항목<br/>
						- 신청인들의 전화번호</p>
						<p class="notice_3">3. 개인정보 제공 동의 거부 권리 및 동의 거부에 따른 불이익<br/>
						- 귀하는 개인 정보 제공 동의를 거부할 권리가 있으며 동의 거부에 따른 불이익은 없으나, 위 제공사항은 이벤트 알림에 반드시 필요한 사항으로 거부하실 경우 문자 예약이 불가능함을 알려드립니다.</p>
					</div>
					<div class="ck_box"><input type="checkbox" name="ck_agree" id="ck_agree" class="id_check"/><label for="ck_agree" class="type-checkbox2">개인정보를 제공하는 것에 동의합니다.</label></div>
				</div>
			</div>
		</div>
		<a href="javascript:;" class="encore_btn" id="rebuy_alarm_btn"><img src="//img.siwonschool.com/japan/lecture/encore_btn.png" alt="앵콜! 알림 신청하기" /></a>
		<!-- 알림 신청하기 버튼 클릭 시 :
			 1) “ 패키지 연장/재수강 앵콜 문자 예약이 완료되었습니다.”
			 2) “이미 참여하셨습니다. “
			 // 문자발송 프로세스 : 신청 후 구매자 제외, 전주 참여자 차주 이벤트 오픈시 문자 발송 제외-->
		<ul class="check_list">
			<li>&bull; 앵콜 참여자가 많을 경우 이벤트는 조기에 오픈됩니다.</li>
			<li>&bull; 패키지 연장/재수강 이벤트 오픈시 알림 문자는 신청 후 1회만 발송 됩니다.</li>
			<li>&bull; 연락처 수정은 MY &gt; <a href="https://member.siwonschool.com/?s=modify&_ga=1.217722320.794716863.1489038201">내정보 관리</a> 에서 수정 가능합니다.</li>
		</ul>
	</div>
</div>
<!-- // 레이어팝업: 패키지 연장재수강 앵콜 -->

<!-- 레이어팝업(수강신청) -->
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
<!--// 레이어팝업(수강신청) --><div class="rebuy_temp" id="rebuy_temp" style="display:none;">

</div>






<!----------------------------------------------------------- 배너추가 --------------------------------------------------------------------------->

<!-- 레이어팝업 (사과문) -->
<!--// 레이어팝업 (사과문) -->










<!----------------------------------------------------------- 성취도평가 추가 --------------------------------------------------------------------------->


<!-- 레이어팝업(성취도평가) -->
<div class="wrap_layer_popup aw" id="test_Layer"><div class="inner"><!-- 해설보이게하려면 aw삽입 -->
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3 id="achievement_info">김수경선생님의 <span class="fc_red">초급회화 성취도평가</span></h3>
	<p class="desc">* 성취도평가 90점 이상 시 수료증 출력 가능합니다. (6개월이내 / 증명서 발급 > 수료증 출력)</p>

	<div class="wrap_score" style="display: none;">
		<div class="graph">
			<div id="donut1"></div>
			<div class="txt"><strong></strong></div>
		</div>
		<div class="info">
			<p class="txt1">총<span class="num_all"></span>문항 / 정답<span class="num_correct fc_red"></span>문항</p>
			<p class="txt2"><span class="test_date"></span><span class="candidate"></span></p>
		</div>
	</div><!--// wrap_score -->

	<form name="frm" id="frm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="cno" value="">
		<input type="hidden" name="idx" value="">
	<ul id="achievement_question">

	</ul>
	</form>
	<div class="group_bt">
		<a href="javascript:;" class="bt1_st1_red btn_check_answer">정답 확인하기</a>
	</div>
	<div class="wrap_recomm">
		<h4>추천 강좌</h4>
		<h5 class="mt0">NEXT 추천강좌</h5>
		<ul id="next_recommend">

		</ul>
		<h5>함께 들으면 더 좋은 강좌</h5>
		<ul id="with_recommend">

		</ul>
	</div><!--// wrap_recomm -->
	<div class="group_bt">
		<a href="javascript:layerPopClose()" class="bt1_st1">닫기</a>
		<a href="javascript:void(0);" class="bt1_st1_red btn_retest">성취도 평가 다시보기</a>
	</div>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(성취도평가) -->

<!-- 레이어팝업(작문평가) -->
<div class="wrap_layer_popup write_st1" id="write_Layer"><div class="inner">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3>일본어 작문 <span class="fc_red">FINAL TEST</span></h3>
	<form name="writing_frm" id="writing_frm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="writing_cno" value="">
		<input type="hidden" name="writing_idx" value="">
	<div class="theme_box"><dl>
		<dt>주제선택</dt>
		<dd><input type="radio" class="id_check" value="1" id="ck_theme1" name="theme"/><label for="ck_theme1" class="radio_h20_red">자기소개</label></dd>
		<dd><input type="radio" class="id_check" value="2" id="ck_theme2" name="theme"/><label for="ck_theme2" class="radio_h20_red">여행/휴가</label></dd>
		<dd><input type="radio" class="id_check" value="3" id="ck_theme3" name="theme"/><label for="ck_theme3" class="radio_h20_red">하루일과</label></dd>
		<dd><input type="radio" class="id_check" value="4" id="ck_theme4" name="theme"/><label for="ck_theme4" class="radio_h20_red">올해목표</label></dd>
		<dd><input type="radio" class="id_check" value="5" id="ck_theme5" name="theme"/><label for="ck_theme5" class="radio_h20_red">기타</label></dd>
	</dl></div>
	<div class="tip_box"><dl>
		<dt>작문 TIP!</dt>
		<dd><strong>자기소개</strong>~です/ ます<em>|</em>~て(で)います</dd>
		<dd><strong>하루일과</strong>~まで/までに<em>|</em>あいだ/あいだに<em>|</em>なければならない</dd>
		<dd><strong>여행/휴가</strong>~たら / なら<em>|</em>~つもりです<em>|</em>~やすい/がたい</dd>
		<dd><strong>올해목표</strong>~こと/もの<em>|</em>~ようり<em>|</em>~ことにする/ことになる</dd>
	</dl></div>
	<div class="input_box position">
		<textarea name="writing" id="writing" cols="1500" rows="10" placeholder="주어진 단어를 입력해 작문을 해보세요"></textarea>
		<p class="txt_cols"><em>0</em>/1500</p>
	</div>
	<div class="email_box">
		<dl><dt>이메일</dt><dd><input type="text" name="email" placeholder="예 ) japanes@siwonschool.com" class="input2_st1"/></dd></dl>
	</div>
	<ul class="desc">
		<li>&middot; <a href="/?s=customer&t=notice&m=view&page=1&sno=9" target="_blank">일본어 자판 설치 방법 (PC) 바로가기</a> ▶</li>
		<li>&middot; 4-5일 (주말/공휴일 제외)이내에 이메일로 첨삭결과를 보내드립니다.</li>
	</ul>
	<div class="group_bt">
		<a href="javascript:void(0);" class="bt1_st1_red btn_writing_submit">제출하기</a>
		<a href="javascript:layerPopClose();" class="bt1_st1_gray2">취소</a>
	</div>
	</form>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(작문평가) -->

<!-- 레이어팝업(작문평가- 첨삭) -->
<div class="wrap_layer_popup write_st1" id="write_correct_Layer"><div class="inner">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3 class="noline_b">일본어 작문 <span class="fc_red">FINAL TEST</span></h3>
	<h4><span>자기소개</span></h4>
	<div class="txt_box">
		<p></p>
	</div>
	<h5>첨삭지도란</h5>
	<div class="txt_box correct">
		<p></p>
	</div>
	<div class="group_bt">
		<a href="javascript:layerPopClose();" class="bt1_st1">닫기</a>
	</div>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(작문평가- 첨삭) -->

<!-- 레이어팝업(작문평가- 모범답안) -->
<div class="wrap_layer_popup write_st1" id="write_aw_Layer"><div class="inner">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3>일본어 작문 FINAL TEST <span class="fc_red">모범답안</span></h3>
	<div class="theme_box"><dl>
		<dt>주제선택</dt>
		<dd><input type="radio" class="id_check" id="ck_theme1" name="theme"/><label for="ck_theme1" class="radio_h20_red checked">자기소개</label></dd>
		<dd><input type="radio" class="id_check" id="ck_theme2" name="theme"/><label for="ck_theme2" class="radio_h20_red">여행/휴가</label></dd>
		<dd><input type="radio" class="id_check" id="ck_theme3" name="theme"/><label for="ck_theme3" class="radio_h20_red">하루일과</label></dd>
		<dd><input type="radio" class="id_check" id="ck_theme4" name="theme"/><label for="ck_theme4" class="radio_h20_red">올해목표</label></dd>
	</dl></div>
	<div class="tip_box"><dl>
		<dt>작문 TIP!</dt>
		<dd><strong>자기소개</strong>~です/ ます<em>|</em>~て(で)います</dd>
		<dd><strong>하루일과</strong>~まで/までに<em>|</em>あいだ/あいだに<em>|</em>なければならない</dd>
		<dd><strong>여행/휴가</strong>~たら / なら<em>|</em>~つもりです<em>|</em>~やすい/がたい</dd>
		<dd><strong>올해목표</strong>~こと/もの<em>|</em>~ようり<em>|</em>~ことにする/ことになる</dd>
	</dl></div>
	<div class="txt_box"><ul>
		<li style="display:block">
			<p>
				こんにちは。わたしはゴスミンです。
				プサンに住(す)んでいます。私(わたし)は結婚(けっこん)しています。
				4人(にん)家族(かぞく)で、主人(しゅじん)、娘(むすめ)1人(ひとり)、息子(むすこ)1人(ひとり)がいます。
				娘(むすめ)は私(わたし)によく似(に)ています。とてもかわいいです。
				娘(むすめ)は小学校(しょうがっこう)２年生(ねんせい)で、息子(むすこ)は中学校(ちゅうがっこう)1年生(ねんせい)です。
				主人(しゅじん)は会社員(かいしゃいん)です。建設会社(けんせつかいしゃ)に勤(つと)めています。
				来年(らいねん)、家族(かぞく)と一緒(いっしょ)に日本(にほん)に旅行(りょこう)するつもりです。
				それで、毎日(まいにち)１時間(じかん)ずつ日本語(にほんご)を勉強(べんきょう)しています。
				また、週末(しゅうまつ)ごとに友達(ともだち)に会(あ)って会話(かいわ)も練習(れんしゅう)しています。
				日本語(にほんご)の勉強(べんきょう)はすこし難(むずか)しいですが、とても面白(おもしろ)いです。
			</p>
		</li>
		<li>
			<p>
				今年(ことし)の夏休(なつやす)みには、友達(ともだち、りかちゃん)と2人(ふたり)で東京(とうきょう)に行(い)くつもりだ。
				東京(とうきょう)に行(い)くなら、予(あらかじ)め地下鉄(ちかてつ)の路線図(ろせんず)を勉強(べんきょう)したほうがいいと聞(き)いて、インターネットで路線図(ろせんず)を探(さが)してみた。
				思(おも)ったより複雑(ふくざつ)だった。大丈夫(だいじょうぶ)かな…。
				東京(とうきょう)に行(い)ったら、新宿(しんじゅく)と原宿(はらじゅく)に行(い)ってみたい。
				そしてフィギュアを売(う)っている店(みせ)にも行(い)きたい。
				りかちゃんは東京(とうきょう)タワーに行(い)きたがっている。
				全部(ぜんぶ)行(い)けるか分(わ)からないけど…。まあ、何(なん)とかなるよね。
				旅行(りょこう)のために、日本語(にほんご)の勉強(べんきょう)も一生懸命(いっしょうけんめい)にしている。
				平仮名(ひらがな)は読(よ)みやすいが、まだ、漢字(かんじ)は読(よ)みにくい。日本語(にほんご)って難(むずか)しい!!
				でも、せっかくの旅行(りょこう)だから、話(はな)せるようになるまで、頑張(がんば)ろう!!
			</p>
		</li>
		<li>
			<p>
				しまった!!　昨日(きのう)、飲(の)みすぎたせいで、8時(じ)に起(お)きちゃった!!
				9時(じ)までに出勤(しゅっきん)しなければならないのに…。
				だけど、何(なん)とかぎりぎり間(ま)に合(あ)った。
				会議(かいぎ)をしている間(あいだ)に彼女(かのじょ)から3回(かい)も電話(でんわ)が来(き)た。
				昨日(きのう)お酒(さけ)を飲(の)んでいる間(あいだ)、ずっと携帯(けいたい)の電源(でんげん)が切(き)れていたからだ。
				どうしよう!!　彼女(かのじょ)に振(ふ)られちゃう!!
				仕事(しごと)終(お)わって、すぐに謝(あやま)ったので、怒(おこ)られなかった。
				今日(きょう)は天国(てんごく)と地獄(じごく)を味(あじ)わう日(ひ)だった。
				しっかりしろ!　命(いのち)は一つ(ひとつ)しかないから!!
			</p>
		</li>
		<li>
			<p>
				もうすぐ新年(しんねん)が始(はじ)まる。それで新年(しんねん)の目標(もくひょう)についてじっくり考(かんが)えてみた。
				1.　毎月(まいげつ)、本(ほん)を1冊(さつ)以上(いじょう)読(よ)むこと。
				2.　毎日(まいにち)、日本語(にほんご)の勉強(べんきょう)を三十分(さんじゅっぷん)以上(いじょう)すること。
				3.　貯金(ちょきん)すること。
				4.　週(しゅう)に三回(さんかい)以上(いじょう)、運動(うんどう)すること。
				大学生(だいがくせい)の時(とき)はよく本(ほん)を読(よ)んだものだが、就職(しゅうしょく)してからは本(ほん)をあまり読(よ)んでいない。
				今(いま)からでも時間(じかん)を割(さ)いて読(よ)まなきゃ…。
				そして6か月(げつ)前(まえ)、りかちゃんの誘(さそ)いで日本語(にほんご)の勉強(べんきょう)を始(はじ)めることになった。
				もっと勉強(べんきょう)して来年(らいねん)は日本語(にほんご)で会話(かいわ)ができるようになりたい。
				今度(こんど)こそは何(なん)としても、絶対(ぜったい)に目標(もくひょう)を達成(たっせい)してやる!!
			</p>
		</li>
	</ul></div>
	<div class="group_bt">
		<a href="javascript:layerPopClose();" class="bt1_st1">닫기</a>
	</div>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(작문평가- 모범답안) -->

<script type="text/javascript">
$(document).ready(function(){
	$("#rebuy_coupon_btn").on("click",function(){
		$.ajax({
			type : "POST",
			url:"/?s=myclass&a=rebuy_coupon",
			dataType : "json",
			async : false,
			success : function(data){
				alert(data.msg);
			}
		});
	});

	});
</script><!----><div class="bg_layerpop"></div>
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
	</div>
	<div class="sec_btm">
		<p>시원스쿨 일본어의 <span>다양한 소식</span>을 빠르게 만날 수 있어요!</p>
		<div class="sns_links">
			<ul>
				<li><a href="https://www.facebook.com/japan.siwonschool" class="sns_fb" target="_blank">페이스북</a></li>
				<li><a href="https://story.kakao.com/ch/siwonjapanese" class="sns_kakao" target="_blank">카카오</a></li>
				<li><a href="http://blog.naver.com/siwonjapan" class="sns_nblog" target="_blank">블로그</a></li>
				<li><a href="https://www.instagram.com/siwonjapanese/" class="sns_insta" target="_blank">인스타</a></li>
				<li><a href="http://tvcast.naver.com/siwonjapanese" class="sns_nplay" target="_blank">네이버플레이</a></li>
				<li><a href="https://www.youtube.com/c/시원스쿨일본어" class="sns_utube" target="_blank">유투브</a></li>
			</ul>
		</div>
	</div>
</div><!--// sitemap_pop -->
<div id="siwon_footer">
	
	<!-- 사이트맵 -->
	<div class="bg_menu_all">
	<div class="menu_all">
		<ul>
					</ul>
		<span class="close" onclick="$('.menu_all').slideUp(); ">
			<img src="//img.siwonschool.com/japan/comm/footer_sitemap_close.png" alt="닫기" />
		</span>
	</div>
	</div>
	<!--// 사이트맵 -->
	
</div><!--// siwon_footer -->
<a href="#siwon_header" id="body_top" class="top" style="display: block;"><img src="//img.siwonschool.com/japan/comm/bt_top_comm.png" alt="맨위로"></a>

<input type="hidden" name="uno" value="2941433">


<!-- 토스트 배너 170111 -->
<!-- [D]
	1. japan.siwonschool.com/ 로 유입 시
		ㄴ 고정노출
	2. japan.siwonschool.com/?nobnr 로 유입 시
		ㄴ 2페이지 이상 이동 시 배너 10초 노출 후 숨김
		개발요청: class 'toast_comm' 에 이중 클래스 'toastpop' 추가
	3. 결제페이지, 내강의실, 이벤트에서는 노출 되지 않음
-->
	<script type="text/javascript">
			</script>
	

<!--  메인 페이지 트래커 ---->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    window.criteo_q.push(
        { event: "setAccount", account: 31099 },
        { event: "setHashedEmail", email: "25bbda50f0c95ef91d3e4ad2247722c6" },
        { event: "setSiteType", type: "d" },
        { event: "viewHome" }
    );
</script>





<!-- 네이버 프리미엄로그분석 Start -->
<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
// AccoutId 적용
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_4e5936125467";

// 유입추적함수(최상위 도메인을 인자로 삽입)
if (!_nasa) var _nasa={};
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
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1065086927/?value=1.00&amp;currency_code=KRW&amp;label=jO5cCKCwkmMQz9_v-wM&amp;guid=ON&amp;script=0"/>
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
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/857045604/?value=1.00&amp;currency_code=KRW&amp;label=ncrvCNCZ2G8Q5PTVmAM&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>
<!-- 신규계정 일본어 GDN 리마케팅 태그 -->


<!-- 일본어 사이트 DA광고용 다음 스크립트 End -->
<script type="text/javascript">
    var roosevelt_params = {
        retargeting_id:'VNCqe2YyiQFdvKiyGPKxIw00',
        tag_label:'pa6yRiJLT_2yxT3r5GQYPg'
    };
</script>
<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
<!-- 일본어 사이트 DA광고용 다음 스크립트 End -->




<!-- 시원스쿨일본어 전용 GA 트래킹스크립트 Start -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-71808717-1', 'auto', {'allowLinker': true});
ga('require', 'linker');
ga('linker:autoLink', ['member.siwonschool.com']);
ga('require', 'linkid', 'linkid.js');
ga('require', 'displayfeatures');
ga('send', 'pageview');
</script>
<!-- 시원스쿨일본어 전용 GA 트래킹스크립트 End -->

<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1835287110018998');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=1835287110018998&ev=PageView&noscript=1"
/></noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->

<!-- Withpang Tracker v3.0 [공용] start -->
<script type="text/javascript">
    <!--
    function mobRf(){
        var rf = new EN();
        rf.setSSL(true);
        rf.sendRf();
    }
    //-->
</script>
<script async="true" src="https://cdn.megadata.co.kr/js/enliple_min2.js" onload="mobRf()"></script>
<!-- Withpang Tracker v3.0 [공용] end -->




<!-- WIDERPLANET  SCRIPT START 2017.3.28 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
    var wptg_tagscript_vars = wptg_tagscript_vars || [];
    wptg_tagscript_vars.push(
        (function() {
            return {
                wp_hcuid:"2941433",   /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
                 *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
                ti:"27932",	/*광고주 코드*/
                ty:"Home",	/*트래킹태그 타입*/
                device:"web"	/*디바이스 종류 (web 또는 mobile)*/

            };
        }));
</script>
<script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2017.3.28 -->

<!-- EDN SCRIPT START 2017.05.08 -->
<iframe id="hfrADCheck" src="//adcheck.about.co.kr/mad/prd/view?shopid=siwonjp1" scrolling="no" frameborder="0" width="0" height="0"></iframe>
<!-- // EDN SCRIPT START 2017.05.08 -->


<!-- N2S 스크립트 광고 수집용 Start -->
<script language="javascript" src="//web.n2s.co.kr/js/_n2s_sp_log_siwonjapan.js"></script>
<!-- N2S 스크립트 광고 수집용 End -->

<!--카카오광고 픽셀 스크립트 2018-03-06-->
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
      kakaoPixel('7240486721037383177').pageView();
</script>
<!--카카오광고 픽셀 스크립트 2018-03-06--><span itemscope="" itemtype="http://schema.org/Organization">
 <link itemprop="url" href="http://japan.siwonschool.com">
 <a itemprop="sameAs" href="https://story.kakao.com/ch/siwonjapanese/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=kakaostory"></a>
 <a itemprop="sameAs" href="http://blog.naver.com/siwonjapan/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=blog"></a>
 <a itemprop="sameAs" href="https://www.facebook.com/japan.siwonschool/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=facebook"></a>
 <a itemprop="sameAs" href="https://www.youtube.com/channel/UCOXy4aQgRqg8cCfTKnCLDdA/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=youtube"></a>
 <a itemprop="sameAs" href="https://www.instagram.com/siwonjapanese/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=instagram"></a>
 <a itemprop="sameAs" href="http://post.naver.com/siwonschool0?utm_campaign=siwonschool&utm_source=viral&utm_medium=free&utm_content=banner&utm_term=SNS_main_be_post_n"></a>
</span>
<!--// naver chanel -->
<input type="hidden" name="logno" value=2941433>

</body>
=======
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ミルカモMyCourse</title>
</head>
<body>
<jsp:include page="menu.jsp" flush="true" />
<div id="siwon_container" class="mylec_section">
	<div class="sec_navi_comm"><ul class="navi_list"><li><a href="/">홈</a></li><li><a href="myCourseView">受講内訳</a></li></ul></div>	<div class="inner_container">
		<!-- 상단 네비 -->
		<div class="navi_tit_comm">
			<h2 class="tit">受講内訳</h2>
		</div>
		<!--// 상단 네비 -->

		<!-- 컨텐츠 영역 -->
		<ul class="wrap_lecinfo">
			<div class="inside">
				<li class="st1">
					<img src="http://data.siwonschool.com/common/avatar/avatar01.png" alt="이미지" class="avatar"/>
					<p class="con">
											<span class="name"><strong>${userId}</strong>さん</span><br />日本語の実力が向上することを応援します。
						<a href="https://member.siwonschool.com/?s=modify" class="bt_st1_s mt12" style="width:86px">マイページ</a>
					</p>
				</li>
			
			</div>
		</ul>
	</div><!--// inner_container -->

	

	<div class="inner_container">
		<!-- 이벤트성 연장재수강 관련 170215 -->
		
		<div class="wrap_japan">
			<!-- [D] 연장재수강 탭 항시 노출. 이벤트 기간에만 활성화.
			이벤트 기간 아닐 시 경고창: 지금은 이벤트 기간이 아닙니다. -->
			
			<div class="tab_con con1">
				<!-- [D] 내강의실 상품별 노출 기능 170330 -->
				<div class="area_srch">
					
				</div>

				<!-- 강좌 그룹 -->
				<table class="table_st8 mt10">
					<colgroup><col style="width:203px"/><col /><col style="width:298px"/><col style="width:190px"/></colgroup>
					<tbody id="ing_list">
					<tr class="tr_top">
			<th class="th_list_comm5 box_th">講義名</th>
			<th class="th_list_comm3 box_th">先生</th>
			<th class="th_list_comm3 box_th">言語</th>
		</tr>
			<c:if test="${list == null||list.size()==0}">
				<th colspan="3"  class="th_list_comm3 box_th">수강 중인 강의가 없습니다.</th>
			</c:if>
			<c:if test="${list.size() !=0 }">
				<c:forEach items="${list}" var="list">
		<tr>
					<th class="th_list_comm3 box_th"><a href="">${list.packagename}</a></th>
					<th class="th_list_comm3 box_th">${list.teacher}</th>
					<th class="th_list_comm3 box_th">${list.languages}</th>
		</tr>
				</c:forEach>
			</c:if>
					</tbody>
				</table>
			</div>

			<div class="tab_con con2">
				<!-- [D] 내강의실 상품별 노출 기능 170330 -->
				

				<!-- 강좌 그룹 -->
				<table class="table_st8 mt10">
					<colgroup><col style="width:203px"/><col /><col style="width:298px"/><col style="width:190px"/></colgroup>
					<tbody id="end_list">
					</tbody>
				</table>
			</div>
				<!-- 이벤트성 연장재수강 관련 170207 -->
			<div class="tab_con con3">
				<div class="evtprod_noti">
					<dl>
						<dt>잠깐만요!</dt>
						<dd>&bull; 연장 구매 회원의 경우 현재 수강 중인 강좌에 기간이 연장됩니다.</dd>
						<dd>&bull; 재수강은 현재 진행 중인 강좌, 모두 종료 후에만 구매가 가능하며, 구매 시 새로운 강좌가 생성됩니다.</dd>
						<dd>&bull; 최초 구매하신 패키지 상품 내 강좌가 한개라도 수강기간 종료될 경우 재수강으로 신청 가능합니다.</dd>
						<dd>&bull; 연장/재수강 구매 가능 대상은 각 상품별 대상자 안내를 확인해주세요.</dd>
						<dd>&bull; 연장/재수강 상품의 경우 구매 제한 상품으로 환불 시 재구매가 불가합니다.</dd>
						<dd>&bull; 재구매 제한 : 연장 수강 2회 / 재수강 1회 가능 / 환급반 및 단과 구매자 불가</dd>
						<dd>&bull; 대상 : 해당 패키지 / 프리패스 구매 회원</dd>
						<dd>&bull; 연장 : 현재 수강 중인 회원 / 재수강 : 수강 완료 회원</dd>
						<dd>( ※ 최초 구매하신 패키지 상품 내 수강기간 만료된 강의가 1개라도 있을 경우, 해당 상품은 '연장가'가 아닌 '재수강가'로 결제됩니다. )</dd>
					</dl>
				</div>
				<div class="evtprod_sec" id="products_list_tpl">
				
					<h3 class="tit_comm">송수근님의 연장, 재수강 혜택</h3>

					<ul class="info">
						<li>* 송수근 회원님께서 구매하실 수 있는 패키지 / 프리패스 연장, 재수강 상품 리스트 입니다.</li>
					</ul>

					<ul class="product_list">
											<li class="blank"><div class="tb_cell">
							<p>구매 가능한 패키지/프리패스 연장, 재수강 상품이 없습니다.</p>
							<a href="/?s=products">지금 수강신청 바로가기 ▶</a>
						</div></li>
																</ul><!--// product_list -->
					
					<h3 class="tit_comm">패키지 / 프리패스 연장, 재수강</h3>
					<p class="target">
						* 대상 : 해당 패키지 / 프리패스 구매 회원
						<br /> * 연장 : 현재 수강 중인 회원 (기본 수강 일수 기준) / 재수강 : 수강 완료 회원 (단, 수강 기간 만료된 강의가 1개라도 있을 경우, ‘재수강가’로 결제)
					</p>
					<ul class="product_list">
						<li id="area00003476">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505983726775388.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">스마트패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				스마트패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 44강좌<br />기초부터 시험까지 이거 하나면 끝!			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">549,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003476" add_sno="3038" id="prod00003476_EX_6" id="prod00003476" class="id_check" disabled value="00003476"/>	<label onClick="alert('`스마트패키지` 구매이력이 없습니다.')" for="prod00003476_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">171,000원</span>	</label></li><li><input type="radio" name="prod00003476" add_sno="3039" id="prod00003476_EX_12" id="prod00003476" class="id_check" disabled value="00003476"/>	<label onClick="alert('`스마트패키지` 구매이력이 없습니다.')" for="prod00003476_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">221,000원</span>	</label></li><li><input type="radio" name="prod00003476" add_sno="3040" id="prod00003476_RE_12" id="prod00003476" class="id_check" disabled value="00003476"/>	<label onClick="alert('`스마트패키지` 구매이력이 없습니다.')" for="prod00003476_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">231,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003476" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004207">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513244112560124.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">일본어 끝장패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				일본어 끝장패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 53강좌<br />전 강좌+교재27권+사은품5종+730일무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">480,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004207" add_sno="3441" id="prod00004207_EX_6" id="prod00004207" class="id_check" disabled value="00004207"/>	<label onClick="alert('`일본어 끝장패키지` 구매이력이 없습니다.')" for="prod00004207_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">171,000원</span>	</label></li><li><input type="radio" name="prod00004207" add_sno="3442" id="prod00004207_EX_12" id="prod00004207" class="id_check" disabled value="00004207"/>	<label onClick="alert('`일본어 끝장패키지` 구매이력이 없습니다.')" for="prod00004207_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">221,000원</span>	</label></li><li><input type="radio" name="prod00004207" add_sno="3443" id="prod00004207_RE_12" id="prod00004207" class="id_check" disabled value="00004207"/>	<label onClick="alert('`일본어 끝장패키지` 구매이력이 없습니다.')" for="prod00004207_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">231,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004207" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003701">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505977457188016.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">일본어 365패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				일본어 365패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 35강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">390,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003701" add_sno="3154" id="prod00003701_EX_6" id="prod00003701" class="id_check" disabled value="00003701"/>	<label onClick="alert('`일본어 365패키지` 구매이력이 없습니다.')" for="prod00003701_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">161,000원</span>	</label></li><li><input type="radio" name="prod00003701" add_sno="3155" id="prod00003701_EX_12" id="prod00003701" class="id_check" disabled value="00003701"/>	<label onClick="alert('`일본어 365패키지` 구매이력이 없습니다.')" for="prod00003701_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">201,000원</span>	</label></li><li><input type="radio" name="prod00003701" add_sno="3156" id="prod00003701_RE_12" id="prod00003701" class="id_check" disabled value="00003701"/>	<label onClick="alert('`일본어 365패키지` 구매이력이 없습니다.')" for="prod00003701_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">211,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003701" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00001119">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505977810633128.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">울트라패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				울트라패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 20강좌<br />기초 20강좌+1년무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">288,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00001119" add_sno="405" id="prod00001119_EX_6" id="prod00001119" class="id_check" disabled value="00001119"/>	<label onClick="alert('`울트라패키지` 구매이력이 없습니다.')" for="prod00001119_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">151,000원</span>	</label></li><li><input type="radio" name="prod00001119" add_sno="406" id="prod00001119_EX_12" id="prod00001119" class="id_check" disabled value="00001119"/>	<label onClick="alert('`울트라패키지` 구매이력이 없습니다.')" for="prod00001119_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">191,000원</span>	</label></li><li><input type="radio" name="prod00001119" add_sno="407" id="prod00001119_RE_12" id="prod00001119" class="id_check" disabled value="00001119"/>	<label onClick="alert('`울트라패키지` 구매이력이 없습니다.')" for="prod00001119_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">201,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00003361" class="id_check" value="00003361"/><label for="prod00003361" class="type-checkbox2">	<span class="tit">울트라패키지 교재 SET (전21권)<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">울트라패키지 교재 SET (전21권)</em>	<span class="desc">()</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1508749562048095.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">203,040원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00001119" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004392">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1524466814188372.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">나눔패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				나눔패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 40강좌<br />기초~고급 전 강좌+신규강좌+395일 무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">320,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004392" add_sno="3598" id="prod00004392_EX_6" id="prod00004392" class="id_check" disabled value="00004392"/>	<label onClick="alert('`나눔패키지` 구매이력이 없습니다.')" for="prod00004392_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">158,000원</span>	</label></li><li><input type="radio" name="prod00004392" add_sno="3599" id="prod00004392_EX_12" id="prod00004392" class="id_check" disabled value="00004392"/>	<label onClick="alert('`나눔패키지` 구매이력이 없습니다.')" for="prod00004392_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">198,000원</span>	</label></li><li><input type="radio" name="prod00004392" add_sno="3600" id="prod00004392_RE_12" id="prod00004392" class="id_check" disabled value="00004392"/>	<label onClick="alert('`나눔패키지` 구매이력이 없습니다.')" for="prod00004392_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">208,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00003999" class="id_check" value="00003999"/><label for="prod00003999" class="type-checkbox2">	<span class="tit">일본어365 교재 전권 SET (전27권)<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">일본어365 교재 전권 SET (전27권)</em>	<span class="desc">()</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1520571798725698.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">272,250원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004392" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004329">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1522079909897310.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">올킬패키지</a></dt>			<dd>				<span class="dd_tit">대상:</span>				올킬패키지 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 55강좌<br />전 강좌+교재25권+사은품5종+455일무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">450,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004329" add_sno="3531" id="prod00004329_EX_6" id="prod00004329" class="id_check" disabled value="00004329"/>	<label onClick="alert('`올킬패키지` 구매이력이 없습니다.')" for="prod00004329_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">171,000원</span>	</label></li><li><input type="radio" name="prod00004329" add_sno="3532" id="prod00004329_EX_12" id="prod00004329" class="id_check" disabled value="00004329"/>	<label onClick="alert('`올킬패키지` 구매이력이 없습니다.')" for="prod00004329_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">221,000원</span>	</label></li><li><input type="radio" name="prod00004329" add_sno="3533" id="prod00004329_RE_12" id="prod00004329" class="id_check" disabled value="00004329"/>	<label onClick="alert('`올킬패키지` 구매이력이 없습니다.')" for="prod00004329_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">231,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004329" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000135">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506089196764296.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">왕초보프리패스 12개월</a></dt>			<dd>				<span class="dd_tit">대상:</span>				왕초보프리패스 12개월 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />대국민 일본어 말문열기 프로젝트			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">195,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000135" add_sno="408" id="prod00000135_EX_6" id="prod00000135" class="id_check" disabled value="00000135"/>	<label onClick="alert('`왕초보프리패스 12개월` 구매이력이 없습니다.')" for="prod00000135_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">90,000원</span>	</label></li><li><input type="radio" name="prod00000135" add_sno="409" id="prod00000135_EX_12" id="prod00000135" class="id_check" disabled value="00000135"/>	<label onClick="alert('`왕초보프리패스 12개월` 구매이력이 없습니다.')" for="prod00000135_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">126,000원</span>	</label></li><li><input type="radio" name="prod00000135" add_sno="410" id="prod00000135_RE_12" id="prod00000135" class="id_check" disabled value="00000135"/>	<label onClick="alert('`왕초보프리패스 12개월` 구매이력이 없습니다.')" for="prod00000135_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">134,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000135" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000656">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506089271444693.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">김수경회화 프리패스</a></dt>			<dd>				<span class="dd_tit">대상:</span>				김수경회화 프리패스 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />일본어 회화공부의 새로운 패러다임			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">120,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000656" add_sno="411" id="prod00000656_EX_6" id="prod00000656" class="id_check" disabled value="00000656"/>	<label onClick="alert('`김수경회화 프리패스` 구매이력이 없습니다.')" for="prod00000656_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">79,000원</span>	</label></li><li><input type="radio" name="prod00000656" add_sno="412" id="prod00000656_RE_6" id="prod00000656" class="id_check" disabled value="00000656"/>	<label onClick="alert('`김수경회화 프리패스` 구매이력이 없습니다.')" for="prod00000656_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">90,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000656" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000991">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1512638516279333.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">비즈니스 프리패스</a></dt>			<dd>				<span class="dd_tit">대상:</span>				비즈니스 프리패스 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />까다로운 비즈니스 회화를 쉽고 명쾌하게 해결!			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">130,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000991" add_sno="413" id="prod00000991_EX_6" id="prod00000991" class="id_check" disabled value="00000991"/>	<label onClick="alert('`비즈니스 프리패스` 구매이력이 없습니다.')" for="prod00000991_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">89,000원</span>	</label></li><li><input type="radio" name="prod00000991" add_sno="414" id="prod00000991_RE_6" id="prod00000991" class="id_check" disabled value="00000991"/>	<label onClick="alert('`비즈니스 프리패스` 구매이력이 없습니다.')" for="prod00000991_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">100,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00002318" class="id_check" value="00002318"/><label for="prod00002318" class="type-checkbox2">	<span class="tit">일본어 비즈니스회화 SET (전3권)<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">일본어 비즈니스회화 SET (전3권)</em>	<span class="desc">(일본어 비즈니스회화 강의교재 3종)</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506077915269987.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">29,160원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000991" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00000140">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1505977830195027.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">JPT 초급완성</a></dt>			<dd>				<span class="dd_tit">대상:</span>				JPT 초급완성 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 3강좌<br />속성문법+JPT 550독해/청해+90일무제한			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">120,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00000140" add_sno="415" id="prod00000140_EX_3" id="prod00000140" class="id_check" disabled value="00000140"/>	<label onClick="alert('`JPT 초급완성` 구매이력이 없습니다.')" for="prod00000140_EX_3" class="type-radio5 disabled">	<span class="tit">연장 3개월 (강의)</span>	<span class="price">79,000원</span>	</label></li><li><input type="radio" name="prod00000140" add_sno="416" id="prod00000140_RE_3" id="prod00000140" class="id_check" disabled value="00000140"/>	<label onClick="alert('`JPT 초급완성` 구매이력이 없습니다.')" for="prod00000140_RE_3" class="type-radio5 disabled">	<span class="tit">재수강 3개월 (강의)</span>	<span class="price">90,000원</span>	</label></li><li class="book_check"><input type="checkbox" id="prod00001812" class="id_check" value="00001812"/><label for="prod00001812" class="type-checkbox2">	<span class="tit">일취월장 JPT 실전모의고사 500점<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">일취월장 JPT 실전모의고사 500점</em>	<span class="desc">(JPT 550+ 독해 / 청해 공식교재)</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1506078408779305.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">14,500원</span></label></li><li class="book_check"><input type="checkbox" id="prod00003762" class="id_check" value="00003762"/><label for="prod00003762" class="type-checkbox2">	<span class="tit">스피드 업! 일본어 속성문법<!-- <i class="book_more">	<span class="layer_book">	<em class="tit">스피드 업! 일본어 속성문법</em>	<span class="desc">(핵심만 빠르게 독학 가능한 일본어 속성문법 공식교재)</span>	<span class="wrap_thumb"><img src="http://data.siwonschool.com/products/list_thumb/1515392706718890.jpg" alt="교재 썸네일" class="thumb" /></span>	</span></i> --></span><span class="price">13,500원</span></label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00000140" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003840">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649637582585.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">최유리 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				최유리 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />267강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003840" add_sno="3318" id="prod00003840_EX_6" id="prod00003840" class="id_check" disabled value="00003840"/>	<label onClick="alert('`최유리 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003840_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003840" add_sno="3319" id="prod00003840_RE_6" id="prod00003840" class="id_check" disabled value="00003840"/>	<label onClick="alert('`최유리 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003840_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003840" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003998">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649697009385.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">최유리 마니아패스 (12개월 +교재5권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				최유리 마니아패스 (12개월 +교재5권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">215,500원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003998" add_sno="3349" id="prod00003998_EX_6" id="prod00003998" class="id_check" disabled value="00003998"/>	<label onClick="alert('`최유리 마니아패스 (12개월 +교재5권)` 구매이력이 없습니다.')" for="prod00003998_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003998" add_sno="3350" id="prod00003998_EX_12" id="prod00003998" class="id_check" disabled value="00003998"/>	<label onClick="alert('`최유리 마니아패스 (12개월 +교재5권)` 구매이력이 없습니다.')" for="prod00003998_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003998" add_sno="3351" id="prod00003998_RE_12" id="prod00003998" class="id_check" disabled value="00003998"/>	<label onClick="alert('`최유리 마니아패스 (12개월 +교재5권)` 구매이력이 없습니다.')" for="prod00003998_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003998" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003569">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649749621570.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">김수경 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				김수경 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 7강좌<br />219강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003569" add_sno="3080" id="prod00003569_EX_6" id="prod00003569" class="id_check" disabled value="00003569"/>	<label onClick="alert('`김수경 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003569_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003569" add_sno="3081" id="prod00003569_RE_6" id="prod00003569" class="id_check" disabled value="00003569"/>	<label onClick="alert('`김수경 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003569_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003569" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003580">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649788766444.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">김수경 마니아패스 (12개월 + 교재 7권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				김수경 마니아패스 (12개월 + 교재 7권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 7강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">227,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003580" add_sno="3082" id="prod00003580_EX_6" id="prod00003580" class="id_check" disabled value="00003580"/>	<label onClick="alert('`김수경 마니아패스 (12개월 + 교재 7권)` 구매이력이 없습니다.')" for="prod00003580_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003580" add_sno="3083" id="prod00003580_EX_12" id="prod00003580" class="id_check" disabled value="00003580"/>	<label onClick="alert('`김수경 마니아패스 (12개월 + 교재 7권)` 구매이력이 없습니다.')" for="prod00003580_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003580" add_sno="3084" id="prod00003580_RE_12" id="prod00003580" class="id_check" disabled value="00003580"/>	<label onClick="alert('`김수경 마니아패스 (12개월 + 교재 7권)` 구매이력이 없습니다.')" for="prod00003580_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003580" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004331">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649859097436.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">권현정 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				권현정 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />203강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004331" add_sno="3542" id="prod00004331_EX_6" id="prod00004331" class="id_check" disabled value="00004331"/>	<label onClick="alert('`권현정 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004331_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004331" add_sno="3543" id="prod00004331_RE_6" id="prod00004331" class="id_check" disabled value="00004331"/>	<label onClick="alert('`권현정 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004331_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004331" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004333">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649817246524.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">권현정 마니아패스 (12개월 + 교재 6권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				권현정 마니아패스 (12개월 + 교재 6권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 8강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">189,900원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004333" add_sno="3544" id="prod00004333_EX_6" id="prod00004333" class="id_check" disabled value="00004333"/>	<label onClick="alert('`권현정 마니아패스 (12개월 + 교재 6권)` 구매이력이 없습니다.')" for="prod00004333_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004333" add_sno="3545" id="prod00004333_EX_12" id="prod00004333" class="id_check" disabled value="00004333"/>	<label onClick="alert('`권현정 마니아패스 (12개월 + 교재 6권)` 구매이력이 없습니다.')" for="prod00004333_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00004333" add_sno="3546" id="prod00004333_RE_12" id="prod00004333" class="id_check" disabled value="00004333"/>	<label onClick="alert('`권현정 마니아패스 (12개월 + 교재 6권)` 구매이력이 없습니다.')" for="prod00004333_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004333" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003831">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649880204383.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">강기석 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				강기석 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />189강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003831" add_sno="3537" id="prod00003831_EX_6" id="prod00003831" class="id_check" disabled value="00003831"/>	<label onClick="alert('`강기석 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003831_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003831" add_sno="3538" id="prod00003831_RE_6" id="prod00003831" class="id_check" disabled value="00003831"/>	<label onClick="alert('`강기석 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003831_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003831" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003833">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649904624659.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">강기석 마니아패스 (12개월 + 교재 5권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				강기석 마니아패스 (12개월 + 교재 5권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">208,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003833" add_sno="3539" id="prod00003833_EX_6" id="prod00003833" class="id_check" disabled value="00003833"/>	<label onClick="alert('`강기석 마니아패스 (12개월 + 교재 5권)` 구매이력이 없습니다.')" for="prod00003833_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003833" add_sno="3540" id="prod00003833_EX_12" id="prod00003833" class="id_check" disabled value="00003833"/>	<label onClick="alert('`강기석 마니아패스 (12개월 + 교재 5권)` 구매이력이 없습니다.')" for="prod00003833_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003833" add_sno="3541" id="prod00003833_RE_12" id="prod00003833" class="id_check" disabled value="00003833"/>	<label onClick="alert('`강기석 마니아패스 (12개월 + 교재 5권)` 구매이력이 없습니다.')" for="prod00003833_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003833" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004209">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649931647285.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">아야카 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				아야카 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 7강좌<br />215강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004209" add_sno="3447" id="prod00004209_EX_6" id="prod00004209" class="id_check" disabled value="00004209"/>	<label onClick="alert('`아야카 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004209_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004209" add_sno="3448" id="prod00004209_RE_6" id="prod00004209" class="id_check" disabled value="00004209"/>	<label onClick="alert('`아야카 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004209_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004209" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003991">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649955562336.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">서경원 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				서경원 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />143강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003991" add_sno="3342" id="prod00003991_EX_6" id="prod00003991" class="id_check" disabled value="00003991"/>	<label onClick="alert('`서경원 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003991_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003991" add_sno="3343" id="prod00003991_RE_6" id="prod00003991" class="id_check" disabled value="00003991"/>	<label onClick="alert('`서경원 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00003991_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003991" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00003992">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513649979627844.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">서경원 마니아패스 (12개월 + 교재4권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				서경원 마니아패스 (12개월 + 교재4권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 6강좌<br />143강 | 180일 / 365일 | 12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">208,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00003992" add_sno="3344" id="prod00003992_EX_6" id="prod00003992" class="id_check" disabled value="00003992"/>	<label onClick="alert('`서경원 마니아패스 (12개월 + 교재4권)` 구매이력이 없습니다.')" for="prod00003992_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00003992" add_sno="3345" id="prod00003992_EX_12" id="prod00003992" class="id_check" disabled value="00003992"/>	<label onClick="alert('`서경원 마니아패스 (12개월 + 교재4권)` 구매이력이 없습니다.')" for="prod00003992_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00003992" add_sno="3346" id="prod00003992_RE_12" id="prod00003992" class="id_check" disabled value="00003992"/>	<label onClick="alert('`서경원 마니아패스 (12개월 + 교재4권)` 구매이력이 없습니다.')" for="prod00003992_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00003992" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004211">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1513650001566630.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">나루미 마니아패스 (6개월)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				나루미 마니아패스 (6개월) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 9강좌<br />208강  |  180일 / 365일  |  12개월구매시 교재포함			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">150,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004211" add_sno="3452" id="prod00004211_EX_6" id="prod00004211" class="id_check" disabled value="00004211"/>	<label onClick="alert('`나루미 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004211_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004211" add_sno="3453" id="prod00004211_RE_6" id="prod00004211" class="id_check" disabled value="00004211"/>	<label onClick="alert('`나루미 마니아패스 (6개월)` 구매이력이 없습니다.')" for="prod00004211_RE_6" class="type-radio5 disabled">	<span class="tit">재수강 6개월 (강의)</span>	<span class="price">127,500원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004211" id="pop_apply">구매하기</a>		</div>	</div></li><li id="area00004212">	<div class="img_area">		<span class="thumb"><img src="http://data.siwonschool.com/products/list_thumb/1517450641307982.jpg" alt="강의 썸네일" /></span>	</div>	<div class="tit_area">		<dl>			<dt><a href="javascript:;">나루미 마니아패스 (12개월 + 교재 1권)</a></dt>			<dd>				<span class="dd_tit">대상:</span>				나루미 마니아패스 (12개월 + 교재 1권) 구매자			</dd>			<dd>				<span class="dd_tit">강좌:</span>				총 9강좌<br />			</dd>			<dd class="price">				신규신청시 : <del class="fc_red">204,000원</del>			</dd>		</dl>	</div>	<div class="apply_area">		<ul class="check_area"><li><input type="radio" name="prod00004212" add_sno="3454" id="prod00004212_EX_6" id="prod00004212" class="id_check" disabled value="00004212"/>	<label onClick="alert('`나루미 마니아패스 (12개월 + 교재 1권)` 구매이력이 없습니다.')" for="prod00004212_EX_6" class="type-radio5 disabled">	<span class="tit">연장 6개월 (강의)</span>	<span class="price">114,000원</span>	</label></li><li><input type="radio" name="prod00004212" add_sno="3455" id="prod00004212_EX_12" id="prod00004212" class="id_check" disabled value="00004212"/>	<label onClick="alert('`나루미 마니아패스 (12개월 + 교재 1권)` 구매이력이 없습니다.')" for="prod00004212_EX_12" class="type-radio5 disabled">	<span class="tit">연장 12개월 (강의)</span>	<span class="price">150,000원</span>	</label></li><li><input type="radio" name="prod00004212" add_sno="3456" id="prod00004212_RE_12" id="prod00004212" class="id_check" disabled value="00004212"/>	<label onClick="alert('`나루미 마니아패스 (12개월 + 교재 1권)` 구매이력이 없습니다.')" for="prod00004212_RE_12" class="type-radio5 disabled">	<span class="tit">재수강 12개월 (강의)</span>	<span class="price">180,000원</span>	</label></li>		</ul>		<div class="bt_area"><a href="javascript:;" class="bt_apply tradego_class" area_seq="00004212" id="pop_apply">구매하기</a>		</div>	</div></li>					</ul><!--// product_list -->
				</div>
			</div><!-- tab_con con3 -->
		<!-- // 이벤트성 연장재수강 관련 170207 -->
				</div>
	
		<!--// 컨텐츠 영역 -->
	</div><!-- // inner_container-->
</div><!-- // lecture_section -->

<style>
/* 레이어팝업: 증명서 발급(전사이트 공통) 171123 */
#layer_certificate{width:540px;padding:0 29px 29px;border:1px solid #25252b}
#layer_certificate .bt_cls{display:block;overflow:hidden;position:absolute;top:28px;right:29px;width:25px;height:25px;background:url(//img.siwonschool.com/comm/close_25x25_gray.png) no-repeat;font-size:0;text-indent:100%}
#layer_certificate .pop_tit{height:80px;padding:0;border:none;background:none;font-size:24px;color:#111;line-height:80px;text-indent:inherit}
#layer_certificate .pop_cont{padding:0}
#layer_certificate .pop_cont ol li{margin-top:30px}
#layer_certificate .pop_cont ol li:first-child{margin-top:0}
#layer_certificate .pop_cont ol .tit{display:block;padding-bottom:15px;font-size:16px;color:#111}
#layer_certificate .pop_cont ol .certificate_bt{overflow:hidden;text-align:center}
#layer_certificate .pop_cont ol button{display:inline-block;width:48%;height:40px;background:#999;font-size:14px;color:#fff;line-height:40px}
#layer_certificate .pop_cont ol button:first-child{margin-right:1%}
#layer_certificate .pop_cont ol button.on{background:#111}
#layer_certificate .pop_cont ol select{width:100%;height:30px;border:1px solid #ddd}
#layer_certificate .pop_cont .bt_print{display:block;width:130px;height:40px;margin:30px auto 0;background:#111;font-size:14px;color:#fff;text-indent:inherit}
</style>
<!-- 레이어팝업: 증명서발급 -->
<div class="wrap_layer_popup2" id="certificate_Layer">
	<a href="javascript:void(0)" onclick="layerPopClose()" class="bt_close">닫기</a>
	<div class="inner">
		<h3>증명서 발급</h3>
		<div class="wrap_tmenu" id="tmenu_comm2">
			<ul class="tmenu">
				<li><a href="javascript:;" key=1 class="bt1_st1_gray4">수강증</a></li>
				<li><a href="javascript:;" key=2 class="bt1_st1_gray4">출석확인증</a></li>
				<li><a href="javascript:;" key=3 class="bt1_st1_gray4">수료증</a></li>
			</ul>
			<ul class="tcon">
				<!-- 수강증 -->
				<li>
					<ul class="desc">
						<li>&bull; 시원스쿨 일본어에서 강의를 수강하였음을 증명하는 서류입니다.</li>
						<li>&bull; 결제한 상품을 기준으로 출력 가능합니다.</li>
					</ul>
					<div class="select">
						<select name="rprint" id="" class="select2_st1 certi_prod">
							<option value="">구매한 상품을 선택하세요.</option>
							<option value="상품코드">상품01</option>
						</select>
					</div>
				</li><!--// 수강증 -->
				<!-- 출석확인증 -->
				<li>
					<ul class="desc">
						<li>&bull; 해당 강의에 출석 사실을 확인하고 이를 증명하기 위한 서류입니다.</li>
						<li>&bull; 각 강의별로 출력 가능합니다.</li>
					</ul>
					<div class="select">
						<select name="rprint" id="certi_prod2" class="select2_st1 certi_prod">
							<option value="">구매한 상품을 선택하세요.</option>
						</select>
						<select name="rprint2" class="select2_st1 certi_lec">
							<option value="">증명서 발급 내용을 선택하세요.</option>
						</select>
					</div>
				</li><!--// 출석확인증 -->
				<!-- 수료증 -->
				<li>
					<ul class="desc">
						<li>&bull; 이 수료증은 시원스쿨 일본어에서 자체 발급한 증서로서 법적인 효력을 보장할 수 없습니다.</li>
						<li>&bull; 시원스쿨 일본어의 강의 이수 기준을 통과하였음을 증명하는 서류입니다.</li>
						<li>&bull; 성취도평가 90점 이상 달성 시 달성일로부터 6개월간 수료증 출력이 가능합니다.</li>
					</ul>
					<div class="select">
						<select name="rprint" id="certi_prod3" class="select2_st1 certi_prod">
							<option value="">구매한 상품을 선택하세요.</option>
						</select>
					</div>
					<div class="comp"><ul class="completion_list">
						<li class="tc"><label>상품을 선택해주세요.</label></li>
					</ul></div>
				</li><!--// 수료증 -->
			</ul>
			<form name="completionF" action="/?s=myclass&a=completion_pop" method="POST" target="_blank">
			<input type="hidden" name="idx_arr">
			</form>
		</div>
		<div class="group_bt">
			<a href="javascript:;" id="bt_print" class="bt1_st1_red bt_print">출력하기</a>
		</div>
	</div>
</div><!-- // 레이어팝업: 증명서발급 -->

<script type="text/javascript">

var go_certificate = function(val){

	var basicsChk = $("input#basicsChk:checked").val();

	if(!basicsChk){
		basicsChk = "N";
	}

	if(val==1){
		if($("select[name=rprint]").val() == ""){
			alert("발급하실 수강증을 선택해주세요.");
			$("select[name=rprint]").focus();
			return;
		}

		var sno = $("select[name=rprint]").val();
		window.open("/module/myclass/pop/regi.php?sno=" + sno + "&basicsChk=" + basicsChk,"certificate_pop", "scrollbars=yes, toolbars=no, resizable=yes,width=642, height=568");
	}else if(val==2){

		if($("select[name=rprint2]").val()==""){
			alert("발급하실 출석확인증을 선택해주세요.");
			$("select[name=rprint2]").focus();
			return;
		}

		var sno = $("select[name=rprint2]").val();
		window.open("/module/myclass/pop/attendance.php?sno=" + sno + "&cateChk=" + basicsChk + "&cateSite=japan","certificate_pop", "scrollbars=yes, toolbars=no, resizable=yes,width=642, height=486");
	}else if(val==3){
		var idx = new Array();
		var i = 0;
		$(".completion_list input:checked").not("#prod_all").each(function(i){
			idx[i] = $(this).val();
		});

		if(!idx[0]){
			alert("선택한 강의가 없습니다.");
		}else{
			var f = $("form[name=completionF]");
			var temp = idx.join("|");
			$("input[name=idx_arr]",f).val(temp);
			f.submit();
		}
	}
}

$(document).ready(function(){
		$.ajax({
			url:"/?s=myclass&p=certificate&a=certificate",
			type:"POST",
			dataType: "json",
			async: true,
			data:{a: "load_products", site:'japan'},
			//xhrFields: {withCredentials: true},
			success : function(data){
				if(data.result == 1){
					$(".certi_prod").html(data.list);
					$('.certi_cnt').html(data.cnt);
				}
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});

		$("#bt_print").on("click",function(){
			var key = $("#tmenu_comm2 .tmenu .on a").attr("key");
			go_certificate(key);
		});


		$(document).on("click", ".completion_list #prod_all", function(){
			var checked = $(this).prop("checked");

			$(".completion_list label").not(".prod_all").each(function(){
				if(checked){
				$(this).addClass("checked");
				$(this).prev("input").prop("checked",true);
				}else{
				$(this).removeClass("checked");
				$(this).prev("input").prop("checked",false);
				}
			});

		});

		$(document).on("click", ".completion_list input:checkbox", function(){
			var checked = $(this).prop("checked");
			var prod_all = $("#prod_all");
			if(!checked){
				prod_all.prop("checked",false);
				prod_all.next("label").removeClass("checked");
			}

		});

		$("select.certi_prod").on("change",function(){
			var sno = "";
			var key = $("#tmenu_comm2 .tmenu .on a").attr("key");

			if(key==3){
				sno = $("#certi_prod3 option:selected").val();
				$.ajax({
					url:"/?s=myclass&p=certificate&a=certificate",
					type:"POST",
					dataType: "json",
					data:{a: "load_lecture", sno: sno,certi_type:'completion'},
					success : function(data){
						$('.completion_list').html(data.list);
						$("input[type=checkbox].id_check").customizeCRInput();
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});				
			}else{
				if(key==2){
				sno = $("#certi_prod2 option:selected").val();
				}
				var lecture = $("#certi_prod option:selected").text();

				$.ajax({
					url:"/?s=myclass&p=certificate&a=certificate",
					type:"POST",
					dataType: "json",
					data:{a: "load_lecture", sno: sno, lname: lecture},
					success : function(data){
						if(data.result == 1){
							$(".certi_lec").html(data.list);
						}
					},
					error : function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		});
});
</script>
<!-- 강좌 일시정지 팝업창 -->
<div class="wrap_layer_popup pop_pause pop_no1" id="pop_pause_Layer">
	<h2 class="pop_tit">강좌 일시 정지<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3 class="tit_sub_nor mt0">일시 정지 신청</h3>
		<table class="table_st1">
			<colgroup>
				<col style="width:195px">
				<col style="width:145px">
				<col style="width:132px">
				<col style="width:124px">
				<col style="width:86px">
			</colgroup>
			<thead>
				<tr>
					<th>강의명</th>
					<th>수강기간</th>
					<th>정지 기간 선택</th>
					<th class="lh1">정지 가능 수<br />(정지 가능 기간)</th>
					<th>접수</th>
				</tr>
			</thead>
			<tbody id="onestop_list">
			</tbody>
		</table>
		<h3 class="tit_sub_line mt35">유의사항</h3>
		<ul class="mt10">
			<li class="dot_li">시원스쿨 수강 중 부득이하게 수강을 할 수 없는 경우, 일시 수강정지 기능을 사용할 수 있습니다.</li>
			<li class="dot_li">현재 수강중인 강의를 1회 10일 씩 <span class="bold">총 3회 최장 30일</span>까지 정지할 수 있습니다.</li>
			<li class="dot_li">이벤트 강의 또는 무료강의의 경우 일시 정지 불가합니다.</li>
			<li class="dot_li">패키지 강좌 의 경우 <span class="bold">한 강좌만 선택해서 정지</span>해도 묶어진 강좌 <span class="bold">전체가 한꺼번에 일괄정지</span> 처리 됩니다.</li>
			<li class="dot_li"><span class="bold">정지 기간 이후에는 자동으로 정지해제</span>되어 수강이 다시 시작됩니다.</li>
			<li class="dot_li">신규결제 후 수강 7일 이내 수강정지 한 경우, 100% 환불 되지 않으므로 유의하시기 바랍니다.</li>
		</ul>
	</div><!--// wrap_layer_popup -->
</div><!--// wrap_layer_popup : 강좌 일시정지 팝업창 -->

<!-- 환급 팝업창: 환급현황 -->
<div class="wrap_layer_popup pop_refund_mission">
	<h2 class="pop_tit">환급현황<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<div class="wrap_prod">
			<h3 class="vertical">환급반</h3>
			<select name="lret_list" id="lret_list" class="select_st2">
							</select>
		</div>
		<div id="refund_detail_area">
		</div>
	</div>
</div>
<!--// 환급 팝업창: 환급현황 -->
<!-- 환급 팝업창: 신청 -->
<div class="wrap_layer_popup pop_refund_apply">
	<a href="javascript:;" class="layer_popup" id="pop_refund_apply"></a>
	<form name="pop_refund_applyF" method="POST" action="/?s=myclass&a=refund_apply" autocomplete="off" enctype="multipart/form-data">
	<input type="hidden" name="refund_tcode">
	<input type="hidden" name="refund_tno">
	<h2 class="pop_tit">환급신청<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3><span>아래 사항을 정확히 입력해주세요.</span></h3>
		<table class="table_st2">
			<colgroup>
				<col style="width:111px"/>
				<col style=""/>
			</colgroup>
			<tr>
				<th>예금주</th>
				<td><input type="text" name="name" id="name" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>은행명</th>
				<td><input type="text" name="bank" id="bank" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td><input type="text" name="bank_num" id="bank_num" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone" id="phone" class="input_st3" style="width:277px"/></td>
			</tr>
			<tr>
				<th>신분증 사본</th>
				<td>
					<div class="wrap_file">
						<input type="text" id="fileOutput" readonly class="input_st3" placeholder="이미지 파일을 첨부해주세요"/>
						<a href="javascript:;" class="bt_st4_s">첨부하기</a><input type="file" name="fileInput"/>
					</div>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function pop_refund_apply(){
				var f = $("form[name=pop_refund_applyF]");

				if(!$("#name",f).val()){
					alert("예금주를 입력해주세요.");
					$("#name",f).focus();
				}else if(!$("#bank",f).val()){
					alert("은행명을 입력해주세요.");
					$("#bank",f).focus();
				}else if(!$("#bank_num",f).val()){
					alert("계좌번호를 입력해주세요.");
					$("#bank_num",f).focus();
				}else if(!$("#phone",f).val()){
					alert("연락처를 입력해주세요.");
					$("#phone",f).focus();
				}else if(!$("#ref_agree",f).prop("checked")){
					alert("개인정보 수집 및 이용안내에 동의해주세요.");
				}else if(!$("input[name=fileInput]:file").val()){
					alert("신분증 사본을 첨부해주세요.");
				}else if(confirm("환급신청을 하시겠습니까?")){
					f.submit();
				}
			}
		</script>
		<ul class="box_notice">
			<li>현금으로 해당 계좌에 환급됩니다.</li>
			<li>해당 ID 이름과 계좌번호 예금주가 반드시 일치되어야 합니다.</li>
			<li>연락처는 해당 ID 정보와 일치되어야 합니다.</li>
			<li>일본어 환급반 2.0의 제세공과금 처리를 위하여 관련 법령(소득세법 제 145조 및 소득세법 시행규칙 제 100조)에 근거하여 주민등록번호를 수집할 수 있습니다.</li>
			<li>주민번호 식별이 불가능할 경우, 환급이 진행되지 않습니다.</li>
			<li>JPG, PNG, BMP, GIF만 첨부 가능하며(10MB이하), 제출하신 이미지는 반환되지 않습니다.</li>
			<li>해당정보는 확인절차 이후, 바로 자동 폐기됩니다.</li>
		</ul>
		<span class="wrap_agree">
			<input type="checkbox" id="ref_agree"/><label for="ref_agree">개인정보 수집에 동의합니다</label>
		</span>
		<div class="group_bt">
			<a href="javascript:;" class="bt_st9_e layer_popup_close" style="width:74px">취소</a>
			<a href="javascript:;" class="bt_st8_e" onClick="pop_refund_apply()" style="width:74px">신청하기</a>
		</div>
	</div>
	</form>
</div>
<!-- //환급 팝업창: 신청 -->
<!-- 환급 팝업창: 신청완료 -->
<div class="wrap_layer_popup pop_refund_done">
	<a href="javascript:;" class="layer_popup" id="pop_refund_done"></a>
	<h2 class="pop_tit">환급신청<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3>환급신청이 완료되었습니다.<br/>입력정보를 확인해주세요.</h3>
		<div  id="refund_done_area">

		</div>
	</div>
</div>
<!-- //환급 팝업창: 신청완료 -->

<!-- 환급 팝업창: 평가 -->
<div class="wrap_layer_popup pop_refund_test">
	<form name="refund_testF" method="POST">
	<input type="hidden" name="tcode" value="">
	<input type="hidden" name="data_type" value="resultquestion">
	<input type="hidden" name="tno" value="">
	<h2 class="pop_tit">성취도 평가</h2>
	<div class="wrap_layer_cont">
		<h3>성취도 평가<em id="score">총 20문제 중 80점이상 합격!</em></h3>
		<div id="test_question_qrea">

		</div>
		<script type="text/javascript">
			var cur_page = 1;
			function refund_question_page(key){
				if(key=='prev'){
					cur_page--;
				}else{
					cur_page++;
				}


				if(cur_page==1){
					$('#btn_prev').hide();
				}else if(cur_page>1){
					$('#btn_prev').show();
				}

				if(cur_page>=10){
					$('#btn_next').hide();
				}

				if(cur_page<10){
					$('#btn_next').show();
				}

				if(cur_page==10){
					$("#refund_test_submit").show();
				}else{
					$("#refund_test_submit").hide();
				}

				$('div.pop_refund_test li.page').hide();
				$('div.pop_refund_test li.page'+cur_page).show();
			}

			function refund_test_submit(){


				if(confirm("제출하시겠습니까?")){
					$.ajax({url:"/?s=myclass&a=refund_detail",
						type:"POST",
						dataType: "json",
						data:$('form[name=refund_testF]').serialize(),
						async : false,
						success : function(data){
							$(".wrap_layer_popup").fadeOut();
							if(data.msg!="ok"){
								alert(data.msg);
							}else{
								$("#test_result_area").html(data.test_result_area);
								$("a.hidden_layer_popup").attr("id","pop_refund_result");
								$("a.hidden_layer_popup").trigger("click");
							}

						}
					});
				}
			}
		</script>
		<div class="wrap_notice" id="caution_text">
			<!--h3 class="tit_sub_nor line">유의사항</h3>
			<ul>
				<li>환급 미션 달성과 상관 없이 수강기간 종료 후 7일 이내 환급 신청이 가능합니다.</li>
				<li>수강 완료된 강의에서 환급 및 도전 신청 가능합니다.</li>
			</ul-->
		</div>
		<div class="group_bt">
			<a href="javascript:;" onClick="refund_question_page('prev')" id="btn_prev" class="bt_st9_e" style="width:74px; display:none;">이전</a>
			<a href="javascript:;" onClick="refund_question_page('next')" id="btn_next" class="bt_st8_e" style="width:74px">다음</a>
			<a href="javascript:;" id="refund_test_submit" onClick="refund_test_submit();" class="bt_st8_e" style="width:74px; display:none;">제출하기</a>
		</div>
	</div>
	</form>
</div>
<!-- //환급 팝업창: 평가 -->

<!-- 환급 팝업창: 평가결과 -->
<div class="wrap_layer_popup pop_refund_result">
	<h2 class="pop_tit">성취도 평가결과<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div id="test_result_area">

	</div>
</div>
<!-- 환급 팝업창: 평가결과 -->

<!-- 환급 팝업창: 정답 -->
<div class="wrap_layer_popup pop_refund_aw">
	<h2 class="pop_tit">정답 및 해설<a href="javascript:;" class="layer_popup_close"><img src="//img.siwonschool.com/japan/comm/bt_close2.png" alt="닫기" /></a></h2>
	<div class="wrap_layer_cont">
		<h3>정답 및 해설</h3>
		<ul class="result_count">
			<li class="correct" id="o_cnt">0개</li>
			<li class="wrong" id="x_cnt">0개</li>
		</ul>
		<table class="table_st1 mt30">
			<colgroup>
				<col style="width:105px"/>
				<col style="width:452px"/>
				<col style="width:105px"/>
				<col style="width:105px"/>
				<col style="width:105px"/>
				<col style="width:105px"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>문제</th>
					<th>선택</th>
					<th>정답</th>
					<th>정답유무</th>
					<th>해설</th>
				</tr>
			</thead>
			<tbody id="test_explain_area">

			</tbody>
		</table>
		<div class="wrap_button">
			<a href="javascript:;" onClick="$('.pop_refund_aw').hide()" class="bt_st8_e bt_apply" style="width:76px">확인</a>
		</div>
	</div>
</div>
<!-- //환급 팝업창: 정답 -->

<!-- 레이어팝업: 패키지 연장재수강 앵콜 -->
<div class="wrap_layer_popup" id="encore_Layer">
	<div class="popcls_ck_comm">
		<div class="innerbox">
			<a href="javascript:layerPopClose();">닫기</a>
		</div>
	</div>
	<div class="layer_cont">
		<div class="encore_tit tc"><img src="//img.siwonschool.com/japan/lecture/encore_tit.jpg" alt="패키지 연장/재수강 앵콜 알림 문자 예약!" /></div>
		<div id="encore_box">
			<div class="encore_top tc">
				<img src="//img.siwonschool.com/japan/lecture/encore_top.png" alt="현재 패키지 연장/재수강 앵콜 알림 참여자" />
				<span class="join_num tc">882명</span><!-- 현재 참여자 수 노출 -->
			</div>
			<div class="encore_btm">
				<span class="phone_num tc">휴대폰 번호 <span class="phone_gubun">|</span> 010-8982-9690</span><!-- 휴대폰 번호 - 로그인 회원 정보 연동 -->
				<div class="notice_wrap">
					<span class="notice_tit">유의사항</span>
					<div class="notice_box">【 개인정보 수]집 및 활용 동의 안내 】<br/><br/>
						<p class="notice_1">1. 개인정보 수집 이용 목적<br/>
						- 이벤트 상품의 발송, 시원스쿨일본어 사이트의 새로운 서비스, 신상품이나 이벤트, 최신정보 발송 등 신청하신 분들의 취향에 맞는 최적의 서비스를 제공하기 위함.</p>
						<p class="notice_2">2. 개인정보 수집 항목<br/>
						- 신청인들의 전화번호</p>
						<p class="notice_3">3. 개인정보 제공 동의 거부 권리 및 동의 거부에 따른 불이익<br/>
						- 귀하는 개인 정보 제공 동의를 거부할 권리가 있으며 동의 거부에 따른 불이익은 없으나, 위 제공사항은 이벤트 알림에 반드시 필요한 사항으로 거부하실 경우 문자 예약이 불가능함을 알려드립니다.</p>
					</div>
					<div class="ck_box"><input type="checkbox" name="ck_agree" id="ck_agree" class="id_check"/><label for="ck_agree" class="type-checkbox2">개인정보를 제공하는 것에 동의합니다.</label></div>
				</div>
			</div>
		</div>
		<a href="javascript:;" class="encore_btn" id="rebuy_alarm_btn"><img src="//img.siwonschool.com/japan/lecture/encore_btn.png" alt="앵콜! 알림 신청하기" /></a>
		<!-- 알림 신청하기 버튼 클릭 시 :
			 1) “ 패키지 연장/재수강 앵콜 문자 예약이 완료되었습니다.”
			 2) “이미 참여하셨습니다. “
			 // 문자발송 프로세스 : 신청 후 구매자 제외, 전주 참여자 차주 이벤트 오픈시 문자 발송 제외-->
		<ul class="check_list">
			<li>&bull; 앵콜 참여자가 많을 경우 이벤트는 조기에 오픈됩니다.</li>
			<li>&bull; 패키지 연장/재수강 이벤트 오픈시 알림 문자는 신청 후 1회만 발송 됩니다.</li>
			<li>&bull; 연락처 수정은 MY &gt; <a href="https://member.siwonschool.com/?s=modify&_ga=1.217722320.794716863.1489038201">내정보 관리</a> 에서 수정 가능합니다.</li>
		</ul>
	</div>
</div>
<!-- // 레이어팝업: 패키지 연장재수강 앵콜 -->

<!-- 레이어팝업(수강신청) -->
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
<!--// 레이어팝업(수강신청) --><div class="rebuy_temp" id="rebuy_temp" style="display:none;">

</div>






<!----------------------------------------------------------- 배너추가 --------------------------------------------------------------------------->

<!-- 레이어팝업 (사과문) -->
<!--// 레이어팝업 (사과문) -->










<!----------------------------------------------------------- 성취도평가 추가 --------------------------------------------------------------------------->


<!-- 레이어팝업(성취도평가) -->
<div class="wrap_layer_popup aw" id="test_Layer"><div class="inner"><!-- 해설보이게하려면 aw삽입 -->
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3 id="achievement_info">김수경선생님의 <span class="fc_red">초급회화 성취도평가</span></h3>
	<p class="desc">* 성취도평가 90점 이상 시 수료증 출력 가능합니다. (6개월이내 / 증명서 발급 > 수료증 출력)</p>

	<div class="wrap_score" style="display: none;">
		<div class="graph">
			<div id="donut1"></div>
			<div class="txt"><strong></strong></div>
		</div>
		<div class="info">
			<p class="txt1">총<span class="num_all"></span>문항 / 정답<span class="num_correct fc_red"></span>문항</p>
			<p class="txt2"><span class="test_date"></span><span class="candidate"></span></p>
		</div>
	</div><!--// wrap_score -->

	<form name="frm" id="frm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="cno" value="">
		<input type="hidden" name="idx" value="">
	<ul id="achievement_question">

	</ul>
	</form>
	<div class="group_bt">
		<a href="javascript:;" class="bt1_st1_red btn_check_answer">정답 확인하기</a>
	</div>
	<div class="wrap_recomm">
		<h4>추천 강좌</h4>
		<h5 class="mt0">NEXT 추천강좌</h5>
		<ul id="next_recommend">

		</ul>
		<h5>함께 들으면 더 좋은 강좌</h5>
		<ul id="with_recommend">

		</ul>
	</div><!--// wrap_recomm -->
	<div class="group_bt">
		<a href="javascript:layerPopClose()" class="bt1_st1">닫기</a>
		<a href="javascript:void(0);" class="bt1_st1_red btn_retest">성취도 평가 다시보기</a>
	</div>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(성취도평가) -->

<!-- 레이어팝업(작문평가) -->
<div class="wrap_layer_popup write_st1" id="write_Layer"><div class="inner">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3>일본어 작문 <span class="fc_red">FINAL TEST</span></h3>
	<form name="writing_frm" id="writing_frm" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="writing_cno" value="">
		<input type="hidden" name="writing_idx" value="">
	<div class="theme_box"><dl>
		<dt>주제선택</dt>
		<dd><input type="radio" class="id_check" value="1" id="ck_theme1" name="theme"/><label for="ck_theme1" class="radio_h20_red">자기소개</label></dd>
		<dd><input type="radio" class="id_check" value="2" id="ck_theme2" name="theme"/><label for="ck_theme2" class="radio_h20_red">여행/휴가</label></dd>
		<dd><input type="radio" class="id_check" value="3" id="ck_theme3" name="theme"/><label for="ck_theme3" class="radio_h20_red">하루일과</label></dd>
		<dd><input type="radio" class="id_check" value="4" id="ck_theme4" name="theme"/><label for="ck_theme4" class="radio_h20_red">올해목표</label></dd>
		<dd><input type="radio" class="id_check" value="5" id="ck_theme5" name="theme"/><label for="ck_theme5" class="radio_h20_red">기타</label></dd>
	</dl></div>
	<div class="tip_box"><dl>
		<dt>작문 TIP!</dt>
		<dd><strong>자기소개</strong>~です/ ます<em>|</em>~て(で)います</dd>
		<dd><strong>하루일과</strong>~まで/までに<em>|</em>あいだ/あいだに<em>|</em>なければならない</dd>
		<dd><strong>여행/휴가</strong>~たら / なら<em>|</em>~つもりです<em>|</em>~やすい/がたい</dd>
		<dd><strong>올해목표</strong>~こと/もの<em>|</em>~ようり<em>|</em>~ことにする/ことになる</dd>
	</dl></div>
	<div class="input_box position">
		<textarea name="writing" id="writing" cols="1500" rows="10" placeholder="주어진 단어를 입력해 작문을 해보세요"></textarea>
		<p class="txt_cols"><em>0</em>/1500</p>
	</div>
	<div class="email_box">
		<dl><dt>이메일</dt><dd><input type="text" name="email" placeholder="예 ) japanes@siwonschool.com" class="input2_st1"/></dd></dl>
	</div>
	<ul class="desc">
		<li>&middot; <a href="/?s=customer&t=notice&m=view&page=1&sno=9" target="_blank">일본어 자판 설치 방법 (PC) 바로가기</a> ▶</li>
		<li>&middot; 4-5일 (주말/공휴일 제외)이내에 이메일로 첨삭결과를 보내드립니다.</li>
	</ul>
	<div class="group_bt">
		<a href="javascript:void(0);" class="bt1_st1_red btn_writing_submit">제출하기</a>
		<a href="javascript:layerPopClose();" class="bt1_st1_gray2">취소</a>
	</div>
	</form>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(작문평가) -->

<!-- 레이어팝업(작문평가- 첨삭) -->
<div class="wrap_layer_popup write_st1" id="write_correct_Layer"><div class="inner">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3 class="noline_b">일본어 작문 <span class="fc_red">FINAL TEST</span></h3>
	<h4><span>자기소개</span></h4>
	<div class="txt_box">
		<p></p>
	</div>
	<h5>첨삭지도란</h5>
	<div class="txt_box correct">
		<p></p>
	</div>
	<div class="group_bt">
		<a href="javascript:layerPopClose();" class="bt1_st1">닫기</a>
	</div>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(작문평가- 첨삭) -->

<!-- 레이어팝업(작문평가- 모범답안) -->
<div class="wrap_layer_popup write_st1" id="write_aw_Layer"><div class="inner">
	<a href="javascript:layerPopClose()" class="bt_close">닫기</a>
	<h3>일본어 작문 FINAL TEST <span class="fc_red">모범답안</span></h3>
	<div class="theme_box"><dl>
		<dt>주제선택</dt>
		<dd><input type="radio" class="id_check" id="ck_theme1" name="theme"/><label for="ck_theme1" class="radio_h20_red checked">자기소개</label></dd>
		<dd><input type="radio" class="id_check" id="ck_theme2" name="theme"/><label for="ck_theme2" class="radio_h20_red">여행/휴가</label></dd>
		<dd><input type="radio" class="id_check" id="ck_theme3" name="theme"/><label for="ck_theme3" class="radio_h20_red">하루일과</label></dd>
		<dd><input type="radio" class="id_check" id="ck_theme4" name="theme"/><label for="ck_theme4" class="radio_h20_red">올해목표</label></dd>
	</dl></div>
	<div class="tip_box"><dl>
		<dt>작문 TIP!</dt>
		<dd><strong>자기소개</strong>~です/ ます<em>|</em>~て(で)います</dd>
		<dd><strong>하루일과</strong>~まで/までに<em>|</em>あいだ/あいだに<em>|</em>なければならない</dd>
		<dd><strong>여행/휴가</strong>~たら / なら<em>|</em>~つもりです<em>|</em>~やすい/がたい</dd>
		<dd><strong>올해목표</strong>~こと/もの<em>|</em>~ようり<em>|</em>~ことにする/ことになる</dd>
	</dl></div>
	<div class="txt_box"><ul>
		<li style="display:block">
			<p>
				こんにちは。わたしはゴスミンです。
				プサンに住(す)んでいます。私(わたし)は結婚(けっこん)しています。
				4人(にん)家族(かぞく)で、主人(しゅじん)、娘(むすめ)1人(ひとり)、息子(むすこ)1人(ひとり)がいます。
				娘(むすめ)は私(わたし)によく似(に)ています。とてもかわいいです。
				娘(むすめ)は小学校(しょうがっこう)２年生(ねんせい)で、息子(むすこ)は中学校(ちゅうがっこう)1年生(ねんせい)です。
				主人(しゅじん)は会社員(かいしゃいん)です。建設会社(けんせつかいしゃ)に勤(つと)めています。
				来年(らいねん)、家族(かぞく)と一緒(いっしょ)に日本(にほん)に旅行(りょこう)するつもりです。
				それで、毎日(まいにち)１時間(じかん)ずつ日本語(にほんご)を勉強(べんきょう)しています。
				また、週末(しゅうまつ)ごとに友達(ともだち)に会(あ)って会話(かいわ)も練習(れんしゅう)しています。
				日本語(にほんご)の勉強(べんきょう)はすこし難(むずか)しいですが、とても面白(おもしろ)いです。
			</p>
		</li>
		<li>
			<p>
				今年(ことし)の夏休(なつやす)みには、友達(ともだち、りかちゃん)と2人(ふたり)で東京(とうきょう)に行(い)くつもりだ。
				東京(とうきょう)に行(い)くなら、予(あらかじ)め地下鉄(ちかてつ)の路線図(ろせんず)を勉強(べんきょう)したほうがいいと聞(き)いて、インターネットで路線図(ろせんず)を探(さが)してみた。
				思(おも)ったより複雑(ふくざつ)だった。大丈夫(だいじょうぶ)かな…。
				東京(とうきょう)に行(い)ったら、新宿(しんじゅく)と原宿(はらじゅく)に行(い)ってみたい。
				そしてフィギュアを売(う)っている店(みせ)にも行(い)きたい。
				りかちゃんは東京(とうきょう)タワーに行(い)きたがっている。
				全部(ぜんぶ)行(い)けるか分(わ)からないけど…。まあ、何(なん)とかなるよね。
				旅行(りょこう)のために、日本語(にほんご)の勉強(べんきょう)も一生懸命(いっしょうけんめい)にしている。
				平仮名(ひらがな)は読(よ)みやすいが、まだ、漢字(かんじ)は読(よ)みにくい。日本語(にほんご)って難(むずか)しい!!
				でも、せっかくの旅行(りょこう)だから、話(はな)せるようになるまで、頑張(がんば)ろう!!
			</p>
		</li>
		<li>
			<p>
				しまった!!　昨日(きのう)、飲(の)みすぎたせいで、8時(じ)に起(お)きちゃった!!
				9時(じ)までに出勤(しゅっきん)しなければならないのに…。
				だけど、何(なん)とかぎりぎり間(ま)に合(あ)った。
				会議(かいぎ)をしている間(あいだ)に彼女(かのじょ)から3回(かい)も電話(でんわ)が来(き)た。
				昨日(きのう)お酒(さけ)を飲(の)んでいる間(あいだ)、ずっと携帯(けいたい)の電源(でんげん)が切(き)れていたからだ。
				どうしよう!!　彼女(かのじょ)に振(ふ)られちゃう!!
				仕事(しごと)終(お)わって、すぐに謝(あやま)ったので、怒(おこ)られなかった。
				今日(きょう)は天国(てんごく)と地獄(じごく)を味(あじ)わう日(ひ)だった。
				しっかりしろ!　命(いのち)は一つ(ひとつ)しかないから!!
			</p>
		</li>
		<li>
			<p>
				もうすぐ新年(しんねん)が始(はじ)まる。それで新年(しんねん)の目標(もくひょう)についてじっくり考(かんが)えてみた。
				1.　毎月(まいげつ)、本(ほん)を1冊(さつ)以上(いじょう)読(よ)むこと。
				2.　毎日(まいにち)、日本語(にほんご)の勉強(べんきょう)を三十分(さんじゅっぷん)以上(いじょう)すること。
				3.　貯金(ちょきん)すること。
				4.　週(しゅう)に三回(さんかい)以上(いじょう)、運動(うんどう)すること。
				大学生(だいがくせい)の時(とき)はよく本(ほん)を読(よ)んだものだが、就職(しゅうしょく)してからは本(ほん)をあまり読(よ)んでいない。
				今(いま)からでも時間(じかん)を割(さ)いて読(よ)まなきゃ…。
				そして6か月(げつ)前(まえ)、りかちゃんの誘(さそ)いで日本語(にほんご)の勉強(べんきょう)を始(はじ)めることになった。
				もっと勉強(べんきょう)して来年(らいねん)は日本語(にほんご)で会話(かいわ)ができるようになりたい。
				今度(こんど)こそは何(なん)としても、絶対(ぜったい)に目標(もくひょう)を達成(たっせい)してやる!!
			</p>
		</li>
	</ul></div>
	<div class="group_bt">
		<a href="javascript:layerPopClose();" class="bt1_st1">닫기</a>
	</div>
</div></div><!--// wrap_popup_layer -->
<!--// 레이어팝업(작문평가- 모범답안) -->

<script type="text/javascript">
$(document).ready(function(){
	$("#rebuy_coupon_btn").on("click",function(){
		$.ajax({
			type : "POST",
			url:"/?s=myclass&a=rebuy_coupon",
			dataType : "json",
			async : false,
			success : function(data){
				alert(data.msg);
			}
		});
	});

	});
</script><!----><div class="bg_layerpop"></div>
<div id="siwon_footer">
	
	<!-- 사이트맵 -->
	<div class="bg_menu_all">
	<div class="menu_all">
		<ul>
					</ul>
		<span class="close" onclick="$('.menu_all').slideUp(); ">
			<img src="//img.siwonschool.com/japan/comm/footer_sitemap_close.png" alt="닫기" />
		</span>
	</div>
	</div>
	<!--// 사이트맵 -->
	
</div><!--// siwon_footer -->
<a href="#siwon_header" id="body_top" class="top" style="display: block;"><img src="//img.siwonschool.com/japan/comm/bt_top_comm.png" alt="맨위로"></a>

<input type="hidden" name="uno" value="2941433">


<!-- 토스트 배너 170111 -->
<!-- [D]
	1. japan.siwonschool.com/ 로 유입 시
		ㄴ 고정노출
	2. japan.siwonschool.com/?nobnr 로 유입 시
		ㄴ 2페이지 이상 이동 시 배너 10초 노출 후 숨김
		개발요청: class 'toast_comm' 에 이중 클래스 'toastpop' 추가
	3. 결제페이지, 내강의실, 이벤트에서는 노출 되지 않음
-->
	<script type="text/javascript">
			</script>
	

<!--  메인 페이지 트래커 ---->
<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
<script type="text/javascript">
    window.criteo_q = window.criteo_q || [];
    window.criteo_q.push(
        { event: "setAccount", account: 31099 },
        { event: "setHashedEmail", email: "25bbda50f0c95ef91d3e4ad2247722c6" },
        { event: "setSiteType", type: "d" },
        { event: "viewHome" }
    );
</script>





<!-- 네이버 프리미엄로그분석 Start -->
<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
// AccoutId 적용
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_4e5936125467";

// 유입추적함수(최상위 도메인을 인자로 삽입)
if (!_nasa) var _nasa={};
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
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1065086927/?value=1.00&amp;currency_code=KRW&amp;label=jO5cCKCwkmMQz9_v-wM&amp;guid=ON&amp;script=0"/>
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
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/857045604/?value=1.00&amp;currency_code=KRW&amp;label=ncrvCNCZ2G8Q5PTVmAM&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>
<!-- 신규계정 일본어 GDN 리마케팅 태그 -->


<!-- 일본어 사이트 DA광고용 다음 스크립트 End -->
<script type="text/javascript">
    var roosevelt_params = {
        retargeting_id:'VNCqe2YyiQFdvKiyGPKxIw00',
        tag_label:'pa6yRiJLT_2yxT3r5GQYPg'
    };
</script>
<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
<!-- 일본어 사이트 DA광고용 다음 스크립트 End -->




<!-- 시원스쿨일본어 전용 GA 트래킹스크립트 Start -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-71808717-1', 'auto', {'allowLinker': true});
ga('require', 'linker');
ga('linker:autoLink', ['member.siwonschool.com']);
ga('require', 'linkid', 'linkid.js');
ga('require', 'displayfeatures');
ga('send', 'pageview');
</script>
<!-- 시원스쿨일본어 전용 GA 트래킹스크립트 End -->

<!-- Facebook Pixel Code -->
<script>
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
  n.callMethod.apply(n,arguments):n.queue.push(arguments)};
  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script',
  'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '1835287110018998');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
  src="https://www.facebook.com/tr?id=1835287110018998&ev=PageView&noscript=1"
/></noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->

<!-- Withpang Tracker v3.0 [공용] start -->
<script type="text/javascript">
    <!--
    function mobRf(){
        var rf = new EN();
        rf.setSSL(true);
        rf.sendRf();
    }
    //-->
</script>
<script async="true" src="https://cdn.megadata.co.kr/js/enliple_min2.js" onload="mobRf()"></script>
<!-- Withpang Tracker v3.0 [공용] end -->




<!-- WIDERPLANET  SCRIPT START 2017.3.28 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
    var wptg_tagscript_vars = wptg_tagscript_vars || [];
    wptg_tagscript_vars.push(
        (function() {
            return {
                wp_hcuid:"2941433",   /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
                 *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
                ti:"27932",	/*광고주 코드*/
                ty:"Home",	/*트래킹태그 타입*/
                device:"web"	/*디바이스 종류 (web 또는 mobile)*/

            };
        }));
</script>
<script type="text/javascript" async src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET  SCRIPT END 2017.3.28 -->

<!-- EDN SCRIPT START 2017.05.08 -->
<iframe id="hfrADCheck" src="//adcheck.about.co.kr/mad/prd/view?shopid=siwonjp1" scrolling="no" frameborder="0" width="0" height="0"></iframe>
<!-- // EDN SCRIPT START 2017.05.08 -->


<!-- N2S 스크립트 광고 수집용 Start -->
<script language="javascript" src="//web.n2s.co.kr/js/_n2s_sp_log_siwonjapan.js"></script>
<!-- N2S 스크립트 광고 수집용 End -->

<!--카카오광고 픽셀 스크립트 2018-03-06-->
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
      kakaoPixel('7240486721037383177').pageView();
</script>
<!--카카오광고 픽셀 스크립트 2018-03-06--><span itemscope="" itemtype="http://schema.org/Organization">
 <link itemprop="url" href="http://japan.siwonschool.com">
 <a itemprop="sameAs" href="https://story.kakao.com/ch/siwonjapanese/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=kakaostory"></a>
 <a itemprop="sameAs" href="http://blog.naver.com/siwonjapan/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=blog"></a>
 <a itemprop="sameAs" href="https://www.facebook.com/japan.siwonschool/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=facebook"></a>
 <a itemprop="sameAs" href="https://www.youtube.com/channel/UCOXy4aQgRqg8cCfTKnCLDdA/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=youtube"></a>
 <a itemprop="sameAs" href="https://www.instagram.com/siwonjapanese/?utm_campaign=siwonschool&utm_source=viral&utm_medium=channel&utm_content=brand&utm_term=instagram"></a>
 <a itemprop="sameAs" href="http://post.naver.com/siwonschool0?utm_campaign=siwonschool&utm_source=viral&utm_medium=free&utm_content=banner&utm_term=SNS_main_be_post_n"></a>
</span>
<!--// naver chanel -->
<input type="hidden" name="logno" value=2941433>

</body>

</html>