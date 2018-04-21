<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>

<c:if test="${list != null}">
<c:forEach items="${list}" var="a">
<form action="videolist" method="POST">
<input type="hidden" name="name" value="${a.file_name}">
번호:${a.num}
파일명:${a.title}
선생님:${a.teacher}
언어:${a.languages}
썸네일:${a.thumnail}
<br><br>
<%-- <a href = "login/preview?name=${a.file_name }">${a.title}</a> --%>
<input type = "submit" value = "선택">
</form>
</c:forEach>
</c:if>






</body>
</html>