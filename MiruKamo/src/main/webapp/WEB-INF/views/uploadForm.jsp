<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function ch() {
	alert("들어가나");
}
</script>
</head>
<body>

<form method = "POST" action = "uploadcomplete" enctype="multipart/form-data" onsubmit="ch();">
<table>
<tr>
	<th>제목</th>
	<td><input type="text" name="title" id="title"></td>
</tr>
<tr>
	<th>선생님</th>
	<td><input type = "text" name = "teacher" id = "teacher"></td>
</tr>
<tr>
	<th>언어</th>
	<td><input type = "text" name = "languages" id = "languages"></td>
</tr>
<tr>
	<th>파일첨부</th>
	<td>
		<input type="file" name="upload" size="30">
	</td>
</tr>
<tr>
	<th>썸네일</th>
	<td>
		<input type="text" name="thumnail" size="30">
	</td>
</tr>

</table>
<tr>
	<td colspan="2"><input type="submit" value="저장" ></td>
	</tr>
	</form>

</body>
</html>
