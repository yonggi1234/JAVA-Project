<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDATA" scope="page" />
<jsp:setProperty name="user" property="block" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_action</title>
</head>
<body>
	<%
		// 현재 세션 상태를 체크한다
		String id = null;
		String block=null;
		if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		block=(String) user.getBlock();
		}
		 
		
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후에 이용해주세요')");
		script.println("location.href='home.jsp'");
		script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.block(id,user.getBlock());
			if(result==-1 || id.equals(block)){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('차단할 수 없는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("block",user.getBlock());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('차단 성공')");
			script.println("location.href='home.jsp'");
			script.println("</script>");
		}

	%>
		
</body>
</html>