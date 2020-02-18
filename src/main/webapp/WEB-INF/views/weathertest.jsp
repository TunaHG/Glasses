<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="<%=request.getContextPath()%>/resources/css/jzee.css" type="text/css" rel="stylesheet" />
	<title>Weather Test</title>
</head>
<body>
	<div class="weather-wrapper">
	    <div class="weather-card madrid">
	        <div class="weather-icon sun"></div>
	        <h1>${t1h }º</h1>
	        <p>Madrid</p>
	    </div>
	</div>
</body>
</html>