<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/weather-icons.min.css" type="text/css" rel="stylesheet" />
	<meta charset="UTF-8">
	<title>test</title>
	<style type="text/css">
		.wi {
			width: 60px;
			height: 60px;
		}
		.wi::before{
			width: 60px;
			height: 60px;
		}
	</style>
</head>
<body>
all : ${member }<br>
id : ${member.member_id }<br>
house : ${member.house_id }<br>
name : ${member.name }<br>
temp : ${member.selecttemp }<br>

<hr>

<i class="wi wi-day-sunny"></i>
<i class="wi wi-day-cloudy"></i>
<i class="wi wi-day-rain"></i>
<i class="wi wi-day-snow"></i><br>

<i class="wi wi-cloudy"></i>
<i class="wi wi-rain"></i>
<i class="wi wi-snow"></i><br>


<i class="wi wi-night-clear"></i>
<i class="wi wi-night-alt-cloudy"></i>
<i class="wi wi-night-alt-rain"></i>
<i class="wi wi-night-alt-snow"></i>

</body>
</html>