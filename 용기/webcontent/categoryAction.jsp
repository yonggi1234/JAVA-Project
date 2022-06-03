<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDATA" scope="page" />
<jsp:setProperty name="user" property="category" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>plus category</title>
</head>
<body>
	<%
		// 현재 세션 상태를 체크한다
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 안되어있습니다.')");
		script.println("location.href='home.jsp'");
		script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.category(id, user.getCategory());
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('카테고리 적용되었습니다.')");
			script.println("home.jsp");
			script.println("</script>");
		}else {
			session.setAttribute("id",user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("location.href='history.back()'");
			script.println("</script>");
		}
		
	%>
</body>
</html>