<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mirukamo MyPage</title>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		/* $('#ing').css('background', 'yellow');
		$('#tumori').on('click', function() {
			$.ajax({
				url : 'getTumori',
				type : 'post',
				data : {id : '${userId}'},
				dataType : 'json',
				success : function(ob){
					alert('성공');
				},
				error : function(e){
					alert('오류가 발생했습니다.');
				}
				
			});
			
		});
		$('#ing').on('click', function() {

		});
		$('#end').on('click', function() {

		}); */
	});
</script>
<style>
h1 {
	text-align: center;
}

table {
	width: 500px;
	margin: auto;
}

th {
	border: 1;
	border-style: dashed;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<a href="./"><img src="<c:url value="resources/images/loverdug.jpg" />"
		height="100px" width="100px"></a>
	<h1>MyPage</h1>

<!-- 	<table>
		<tr>
			<th id="tumori">수강 예정 강의</th>
			<th id="ing">수강 중 강의</th>
			<th id="end">수강 완료 강의</th>
		</tr>
	</table> -->

	<table>
		<tr>
			<th>강의명</th>
			<th>선생님</th>
			<th>언어</th>
			<!-- <th>시작일</th>
			<th>종료일</th>
			<th>남은 일수</th> -->
		</tr>
		<tr>
		<c:if test="${list.size()==0}">
			<td colspan="3">수강 중인 강의가 없습니다.</td>
		</c:if>
		<c:if test="${list.size()!=0 }">
		<c:forEach items="${list}" var="list">
			<td>${list.title}</td>
			<td>${list.teacher}</td>
			<td>${list.languages}</td>
		</c:forEach>
		</c:if>
		</tr>

	</table>

</body>
</html>