<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>logout</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		alert('로그아웃');
		location.href="home.jsp";
	</script>
</body>
</html>