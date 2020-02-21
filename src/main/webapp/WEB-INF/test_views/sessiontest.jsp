<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
id : ${member.member_id }<br>
pw : ${member.password }<br>
name : ${member.name }<br>
phone : ${member.phone }<br>
allow : ${member.allowed }<br>
house : ${member.house_id }<br>
<a href="logout">logout</a>
</body>
</html>