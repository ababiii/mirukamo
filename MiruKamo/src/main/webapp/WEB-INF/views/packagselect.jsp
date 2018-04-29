<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../resources/jQuery/jquery-3.2.1.min.js"></script>
<script src="../resources/jQuery/jquery-ui.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>

	<c:if test="${yoshisushi != null || yoshisushi != ''}">
		<table>
			<tr>
				<td>${yoshisushi.get(0).packagename}</td>
			</tr>
			<tr>
				<td><a href="../course/videolist?teacher=${yoshisushi.get(0).teacher}" ><img src="../resources/images/koshiko1.png"
						height="300px" width="500px"></a></td>
			</tr>
		</table>
	</c:if>

	<BR>
	<bR>
	<BR>
	<br>
	<br>

	<c:if test="${tokyocold != null || tokyocold != ''}">
		<table>
			<tr>
				<td>${tokyocold.get(0).packagename}</td>
			</tr>
			<tr>
				<td><a href="../course/videolist?teacher=${tokyocold.get(0).teacher}" ><img src="../resources/images/kimsujin1.png" height="300px"
					width="500px"></a></td>
			</tr>
		</table>
	</c:if>
</body>

</html>