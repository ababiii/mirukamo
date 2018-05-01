<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<c:url value = "/resources/jQuery/jquery-1.8.3.min.js"/>"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
<script type="text/javascript">
//로그인 안할시 문제풀이 접근 방지
$(document).ready(function(){	
	if (${userId == null} || ${noun == null} ) {
		 setTimeout(function(){

			 $('#fromDrill').submit();

			 }, 3000);
	}
});
//제약 사항
function checkq(){
	var q1 = document.getElementsByName("q1");
	var q2 = document.getElementsByName("q2");
	var q3 = document.getElementsByName("q3");
	var q4 = document.getElementsByName("q4");
	var q5 = document.getElementsByName("q5");
	
	var array = new Array();
	
	var j = 0;
	for (var i= 0; i < q1.length; i++){
		if(q1[i].checked == false){
			j=j+1;
			}
		else{
			array[0] = q1[i].value;
		}
		}
	if (j==5) {
		alert("1번 문제를 풀어주세요")
		return;
	}
	var j = 0;
	for (var i= 0; i < q2.length; i++){
		if(q2[i].checked == false){
			j=j+1;
			}	
		else{
				array[1] = q2[i].value;
			}
		}
	if (j==5) {
		alert("2번 문제를 풀어주세요")
		return;
	}
	var j = 0;
	for (var i= 0; i < q3.length; i++){
		if(q3[i].checked == false){
			j=j+1;
			}
		else{
				array[2] = q3[i].value;
			}
		}
	if (j==5) {
		alert("3번 문제를 풀어주세요")
		return;
	}
	var j = 0;
	for (var i= 0; i < q4.length; i++){
		if(q4[i].checked == false){
			j=j+1;
			}
		else{
			array[3] = q4[i].value;
		}
		}
	if (j==5) {
		alert("4번 문제를 풀어주세요")
		return;
	}
	var j = 0;
	for (var i= 0; i < q5.length; i++){
		if(q5[i].checked == false){
			j=j+1;
			}
		else{
			array[4] = q5[i].value;
		}
		}
	if (j==5) {
		alert("5번 문제를 풀어주세요")
		return;
	}
	jQuery.ajaxSettings.traditional = true;
	var cnt=0;
 	$.ajax({
		url: 'lastcheck',
		type: "post",
		dataType:"JSON",
		data: {'array':array},
		success : function(asd){	
			console.log(asd);
			for (var i = 0; i < 5; i++) {
				if (asd[i]!="") {	//asd배열안에 값이 있으면 트루 -> 실행되는 if문
					for (var h = 1; h < 6; h++) {
						if ($(":input:radio[name=q"+h+"]:checked").val() == asd[i]) {
						$("#noun"+h).text("O");
						cnt++;
						}
					}
				}
			}

		var div = document.getElementById('yourscore');
		div.innerText = "다섯문제 중 " + cnt + "문제 정답입니다.";
		
		if (cnt >= 4) {
			div.innerText += "대단합니다."	
				div.innerHTML += "<hr>";
			div.innerHTML += '<input type="button" value ="다시 풀기" onclick="retry()">';
		}
		if (cnt <= 2) {
			div.innerText += "분발하세요."	
			div.innerHTML += "<hr>";
			div.innerHTML += '<input type="button" value ="다시 풀기" onclick="retry()">';
		}

		},
		error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
}

function retry(){
	location.reload();
}

</script>
<title>ミルカモ</title>
</head>
<body>
<jsp:include page="../menu.jsp" flush="true" /> 

<div id="siwon_container" class="mylec_section">
	<div class="sec_navi_comm"><ul class="navi_list"><li><a href="/">홈</a></li><li><a href="myCourseView">今日の問題</a></li></ul></div>	<div class="inner_container">
		<!-- 상단 네비 -->
		<div class="navi_tit_comm">
			<h2 class="tit">多く間違った文章</h2>
		</div>
		<!--// 상단 네비 -->
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
					<tr >
			<th class="th_list_comm5 box_th">1位</th>
			<th class="th_list_comm5 box_th">${rank[0].original_word}</th>
			<th class="th_list_comm5 box_th">${rank[0].num}</th>
			
		</tr>
			
		<tr>
					<th class="th_list_comm3 box_th">2位</th>
					<th class="th_list_comm3 box_th">${rank[1].original_word}</th>
					<th class="th_list_comm5 box_th">${rank[1].num}</th>
					
		</tr>
		<tr>
					<th class="th_list_comm3 box_th">3位</th>
					<th class="th_list_comm3 box_th">${rank[2].original_word}</th>
					<th class="th_list_comm5 box_th">${rank[2].num}</th>
					
		</tr>
			
					</tbody>
				</table>
			</div>
			
			<div class="navi_tit_comm">
			<h2 class="tit">今日の問題</h2>
		</div>
		
		<!-- Testdrill에서 가져옴 -->
		
		<form action="<c:url value= "/login"/>" method="get" id="fromDrill">
		<input type="hidden" name="fromDrill" value="true">
	</form>
		<c:if test="${userId == null}">
	로그인 후 사용해주세요.
</c:if>
	<c:if test="${userId != null && noun == null}">
		좀더 공부하고 오세요.
</c:if> 
<c:if test="${userId != null && noun != null}">
	
	
	<br>
	<table  class="table_st8 mt10">
		<tr>
			<td colspan="5"><div>1. ${noun[0]}</div><div id = noun1></div>
		</tr>
		<tr>
			<td>1) ${questions[0][0]}<input type="radio" name="q1" id="q1" class="q1" value="${questions[0][0]}"></td>
			<td>2) ${questions[0][1]}<input type="radio" name="q1" id="q1" class="q1" value="${questions[0][1]}"></td>
			<td>3) ${questions[0][2]}<input type="radio" name="q1" id="q1" class="q1" value="${questions[0][2]}"></td>
			<td>4) ${questions[0][3]}<input type="radio" name="q1" id="q1" class="q1" value="${questions[0][3]}"></td>
			<td>5) ${questions[0][4]}<input type="radio" name="q1" id="q1" class="q1" value="${questions[0][4]}"></td>
		</tr>
		<tr>
			<td colspan="5"><div>2. ${noun[1]}</div><div id = noun2></div></td>
		</tr>
		<tr>
			<td>1) ${questions[1][0]}<input type="radio" name="q2" id="q2"
				value="${questions[1][0]}"></td>
			<td>2) ${questions[1][1]}<input type="radio" name="q2" id="q2"
				value="${questions[1][1]}"></td>
			<td>3) ${questions[1][2]}<input type="radio" name="q2" id="q2"
				value="${questions[1][2]}"></td>
			<td>4) ${questions[1][3]}<input type="radio" name="q2" id="q2"
				value="${questions[1][3]}"></td>
			<td>5) ${questions[1][4]}<input type="radio" name="q2" id="q2"
				value="${questions[1][4]}"></td>
		</tr>

		<tr>
			<td colspan="5"><div>3. ${noun[2]}</div><div id = noun3></div></td>
		</tr>
		<tr>
			<td>1) ${questions[2][0]}<input type="radio" name="q3" id="q3"
				value="${questions[2][0]}"></td>
			<td>2) ${questions[2][1]}<input type="radio" name="q3" id="q3"
				value="${questions[2][1]}"></td>
			<td>3) ${questions[2][2]}<input type="radio" name="q3" id="q3"
				value="${questions[2][2]}"></td>
			<td>4) ${questions[2][3]}<input type="radio" name="q3" id="q3"
				value="${questions[2][3]}"></td>
			<td>5) ${questions[2][4]}<input type="radio" name="q3" id="q3"
				value="${questions[2][4]}"></td>
		</tr>
		<tr>
			<td colspan="5"><div>4. ${noun[3]}</div><div id = noun4></div></td>
		</tr>
		<tr>
			<td>1) ${questions[3][0]}<input type="radio" name="q4" id="q4"
				value="${questions[3][0]}"></td>
			<td>2) ${questions[3][1]}<input type="radio" name="q4" id="q4"
				value="${questions[3][1]}"></td>
			<td>3) ${questions[3][2]}<input type="radio" name="q4" id="q4"
				value="${questions[3][2]}"></td>
			<td>4) ${questions[3][3]}<input type="radio" name="q4" id="q4"
				value="${questions[3][3]}"></td>
			<td>5) ${questions[3][4]}<input type="radio" name="q4" id="q4"
				value="${questions[3][4]}"></td>
		</tr>
		<tr>
			<td colspan="5"><div>5. ${noun[4]}</div><div id = noun5></div></td>
		</tr>
		<tr>
			<td>1) ${questions[4][0]}<input type="radio" name="q5" id="q5"
				value="${questions[4][0]}"></td>
			<td>2) ${questions[4][1]}<input type="radio" name="q5" id="q5"
				value="${questions[4][1]}"></td>
			<td>3) ${questions[4][2]}<input type="radio" name="q5" id="q5"
				value="${questions[4][2]}"></td>
			<td>4) ${questions[4][3]}<input type="radio" name="q5" id="q5"
				value="${questions[4][3]}"></td>
			<td>5) ${questions[4][4]}<input type="radio" name="q5" id="q5"
				value="${questions[4][4]}"></td>
		</tr>
	</table>
	<br>
	<br>
		<div id="yourscore"></div>
	<br>
	<br>
	<input type="button" value="답 확인" onclick="checkq()">
	</c:if>
</div></div></div>
</body>
</html>