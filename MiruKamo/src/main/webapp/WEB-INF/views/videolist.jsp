<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="../resources/jQuery/jquery-ui.js"></script>
<script type="text/javascript">
	/* 수강신청 펑션 */
	/*$(document).ready(function(){
	 if (${userId == null}) {
	 $('#videolistlogin').submit();
	 }
	 }); */
	function signclass(msg) {
		$.ajax({
			url : 'signclass',
			type : 'POST',
			dataType : "text",
			data : {
				msg : msg
			},
			success : function(e) {
				if (e == 0) {
					alert("수강 실패");
				}
				else if (e == 1) {
					alert("수강 성공");
					location.reload();
				}
			},
			error : function(e) {
				alert("신청 오류");
			}
		});
	}
    //엄정환 사용자가 인강을 선택해서 들을려 할때 인강의 정보를 넘겨주고 수강한 인강인지 아닌지 확인해 줄 수 있는 ajax
    /* function sendPackagenameandTitle() {
    	var mForm = document.insert;
    	var obj = new Object();
    	obj.packagename = mForm.$('#packagename').val();
    	obj.file_name = mForm.$('#file_name').val();
    	var json_data = JSON.stringify(obj);
    	$.ajax({
          url : 'videolist',
          type : 'POST',
          dataType: "json",
          data : json_data,
          success : function(e) {
             if (e == 0) {
                alert("강의를 시청할 수 없습니다. 수강 신청을 먼저 해주세요.");
             }
             if (e == 1) {
             }
          },
          error : function(e) {
             alert("오류 발생");
          }
       });
    }
   */
    function insert_action(){
    	   var mForm = document.insert; // form의 값을 가져오기 위함
    	   var obj = new Object(); // JSON형식으로 변환 할 오브젝트
    	   obj.user_id = mForm.user_id.value; // form의 값을 오브젝트에 저장
    	   obj.user_password = mForm.user_password.value;
    	    
    	   var json_data = JSON.stringify(obj); // form의 값을 넣은 오브젝트를 JSON형식으로 변환
    	    
    	   var request = $.ajax({
    	    url:"값을 전송할 URL",
    	    type:"POST",
    	    data:json_data, // {“user_id”:”입력값”, “user_password”:”입력값”} 형식으로 전달 됨
    	    dataType:"json"
    	   });
    	   request.done(function(data){ // 전송 후, 결과 값 받아오는 부분
    	    if (data != null){
    	     if (data.error == 2) { // 임의 값 JSON 형식의 {“error”:2} 값을 서버에서 전달
    	                                                                         // data 오브젝트에 error의 값이 2일 때의 이벤트 처리
    	      alert("이미 등록되어 있는 아이디 입니다.");
    	     } else if (data.submit == true) {
    	      alert("등록 완료! 로그인 하시기 바랍니다.");
    	     }
    	    }
    	   });

<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/ababiii/mirukamo.git
</script>
</head>
<body>
	<!-- 비 정상적인 접속시 로그인페이지로 이동 -->
	<div>
		<form action="login/login" method="get" id="videolistlogin">
			<input type="hidden" name="fromvideolist" value="true">
		</form>
	</div>
	<c:if test="${userId == null}">
		로그인 후 수강 신청을 해주세요.
	</c:if>
	<!-- 수강 신청 버튼-->
	<c:if test="${userId != null}">
	${callmebaby.get(0).teacher} 선생님과 함께 기초 실력을 다지세요!
		<c:if test="${good != null }">
			<br> 현재 강의를 수강 중이십니다.</c:if>
		<c:if test="${good == null }">
			<input type="button" onclick="signclass('${callmebaby.get(0).num}')"
				value="수강 신청" id="signid">
			<input type="hidden" name="signid" id="signid" value="${callmebaby}">
		</c:if>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>썸네일</td>
				<td>제목</td>
				<td>선생님</td>
				<td>언어</td>
				<td>파일명</td>
				<td>썸네일</td>
				<td>시청</td>
				<td></td>
			</tr>
			<c:if test="${callmebaby != null || callmebaby != ''}">
				<form action="videolist" method="POST">
					<c:forEach items="${callmebaby}" var="a" varStatus="ppap">
							<tr>
							<td>${ppap.count}</td>
							<td>${a.title}</td>
							<td>${a.teacher}</td>
							<td>${a.languages}</td>
							<td>${a.file_name}</td>
							<td><img src="../resources/images/${a.thumnail}" style="width: 100px; height: auto;"></td>
							<td><button onclick="sendPackagenameandTitle()" >선택</button></td>
							<td><input type="submit" value="선택"></td>
						</tr>
						</c:forEach>
				</form>
			</c:if>
		</table>
</c:if>
</body>

</html>