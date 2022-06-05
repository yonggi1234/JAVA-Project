<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDATA" scope="page" />
<jsp:setProperty name="user" property="name" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="password" />
<jsp:setProperty name="user" property="phoneNumber" />
<jsp:setProperty name="user" property="address" />
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
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(id != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다')");
		script.println("location.href='home.jsp'");
		script.println("</script>");
		}
		if(user.getId() == null || user.getPassword() == null || user.getName()==null||user.getAddress()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				session.setAttribute("id",user.getId());
				session.setAttribute("category",user.getCategory());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='home.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>