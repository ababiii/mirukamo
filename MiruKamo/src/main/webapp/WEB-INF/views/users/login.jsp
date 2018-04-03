<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<html>
<head>
	<title>login</title>
</head>
<body>
<div><span style="font: red;">${erorrMsg }</span></div>
<form action="login" method="post">
	<input type="text" placeholder="id" name="userId">
	<input type="password" placeholder="password" name="userPassword">
	<input type="submit">
</form>
</body>
</html>
