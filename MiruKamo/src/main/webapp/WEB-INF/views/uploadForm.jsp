

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>
<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="../resources/jQuery/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	function ch() {
		/* 왜 작동 안할까 */
		/* var packagename0 = document.getElementById("packagename");
		var title0 = document.getElementById("title");
		var teacher0 = document.getElementById("teacher");
		var languages0 = document.getElementById("languages");
		var upload0 = document.getElementById("upload");
		
		if ($("#packagename").val() == null || $("#packagename").val()== " ") {
			alert("tnp");
			return false;
		}
		
		return true; */
	}

	function coursselect() {
		var sel = document.getElementById("course");
		var val = sel.options[sel.selectedIndex].value;
		if (val == "x") {
			return;
		}
		$.ajax({
			url : 'checksen',
			type : 'POST',
			data : {
				val : val
			},
			dataType : 'JSON',
			success : function(picksensei) {
				var languages = picksensei[0].languages;
				var packagename = picksensei[0].packagename;
				var teacher = picksensei[0].teacher;
				$('#packagename').val(packagename);
				$('#languages').val(languages);
				$('#teacher').val(teacher);

				console.log(picksensei);
			},
			error : function(e) {
				alert("실패");
			}
		});
	}
</script>
</head>
<body>

	<form method="POST" action="uploadcomplete"
		enctype="multipart/form-data" onsubmit="return ch()">
		<table>
			<c:if test="${comesensei != null}">
				<select id="course" onchange="coursselect()">
					<option value="x">--신규 강의 영상 업로드--</option>
					<c:forEach items="${comesensei}" var="c" varStatus="status">
						<option id="${c.num}" value="${c.num}">${c.packagename}</option>
					</c:forEach>
				</select>
			</c:if>
			<tr>
				<th>패키지 제목</th>
				<td><input type="text" name="packagename" id="packagename"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th>선생님</th>
				<td><input type="text" name="teacher" id="teacher"></td>
			</tr>
			<tr>
				<th>언어</th>
				<td><input type="text" name="languages" id="languages"></td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="upload" size="30" id="upload"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</body>


</html>
