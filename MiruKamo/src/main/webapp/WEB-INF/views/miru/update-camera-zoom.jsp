<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
---
feature_name: Image Capture / Update Camera Zoom
chrome_version: 59
feature_id: 4843864737185792
local_css_files: ['update-camera-zoom.css']
check_min_version: true
index: index.html
---

<h3>Background</h3>
<p>The ImageCapture Web API allows web developers to change the zoom setting of
the camera.</p>

<video autoplay></video>
<input type="range" hidden>

{% include output_helper.html %}

{% include js_snippet.html filename='update-camera-zoom.js' %}
</body>
</html>