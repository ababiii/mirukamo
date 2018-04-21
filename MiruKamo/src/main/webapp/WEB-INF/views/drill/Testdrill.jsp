<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<script src="resources/jQuery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	if (${userId == null}) {
		$('#fromDrill').submit();	
	}
});
</script>
</head>
<body>
	<form action="login/login" method="get" id="fromDrill">
		<input type="hidden" name="fromDrill" value="true">
	</form>
	<c:if test="${userId == null}">
	로그인 후 사용해주세요.
</c:if>
	오늘의 문제
	<br>
	<table border="1">
		<tr>
			<td colspan="5">1. ${noun0}</td>
		</tr>
		<tr>
			<td>1) ${qqq0}<input type="checkbox" name="q10" id="q10"></td>
			<td>2) ${qqq1}<input type="checkbox" name="q11" id="q11"></td>
			<td>3) ${qqq2}<input type="checkbox" name="q12" id="q12"></td>
			<td>4) ${qqq3}<input type="checkbox" name="q13" id="q13"></td>
			<td>5) ${qqq4}<input type="checkbox" name="q14" id="q14"></td>
		</tr>

		<tr>
			<td colspan="5">2. ${noun1}</td>
		</tr>
		<tr>
		<tr>
			<td>1) ${qqq1}<input type="checkbox" name="q21" id="q21"></td>
			<td>2)${qqq2}<input type="checkbox" name="q22" id="q22"></td>
			<td>3) ${qqq3}<input type="checkbox" name="q23" id="q23"></td>
			<td>4) ${qqq4}<input type="checkbox" name="q24" id="q24"></td>
			<td>5) ${qqq0}<input type="checkbox" name="q20" id="q20"></td>
		</tr>

		<tr>
			<td colspan="5">3. ${noun2}</td>
		</tr>
		<tr>
			<td>1) ${qqq0}<input type="checkbox" name="q30" id="q30"></td>
			<td>2) ${qqq3}<input type="checkbox" name="q33" id="q33"></td>
			<td>3) ${qqq2}<input type="checkbox" name="q32" id="q32"></td>
			<td>4) ${qqq1}<input type="checkbox" name="q31" id="q31"></td>
			<td>5) ${qqq4}<input type="checkbox" name="q34" id="q34"></td>
		</tr>
		<tr>
			<td colspan="5">4. ${noun3}</td>
		</tr>
		<tr>
			<td>1) ${qqq4}<input type="checkbox" name="q44" id="q44"></td>
			<td>2) ${qqq3}<input type="checkbox" name="q43" id="q43"></td>
			<td>3) ${qqq2}<input type="checkbox" name="q42" id="q42"></td>
			<td>4) ${qqq0}<input type="checkbox" name="q40" id="q40"></td>
			<td>5) ${qqq1}<input type="checkbox" name="q41" id="q41"></td>
		</tr>
		<tr>
			<td colspan="5">5. ${noun4}</td>
		</tr>
		<tr>
			<td>1) ${qqq3}<input type="checkbox" name="q53" id="q53"></td>
			<td>2) ${qqq2}<input type="checkbox" name="q52" id="q52"></td>
			<td>3) ${qqq1}<input type="checkbox" name="q51" id="q51"></td>
			<td>4) ${qqq4}<input type="checkbox" name="q53" id="q53"></td>
			<td>5) ${qqq0}<input type="checkbox" name="q50" id="q50"></td>
		</tr>
	</table>
	<input type="button" value="답 확인" onclick="checkq()">
</body>
</html>