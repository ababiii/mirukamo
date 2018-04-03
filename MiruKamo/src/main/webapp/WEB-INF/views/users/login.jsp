<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
