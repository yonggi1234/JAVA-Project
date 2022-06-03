
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDATA" scope="page" />
<jsp:setProperty name="user" property="id" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//현재 세션 상태를 체크한다
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		// 로그인 해야지 회원 탈퇴 가능하도록 한다
		if(id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='home.jsp'");
		script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();	
		int result = userDAO.withdrawl(id);
		 if(result == -1){
			 PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류입니다')");
				script.println("history.back()");
				script.println("</script>");
			
		}else{
			session.setAttribute("id",user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴 성공')");
			session.invalidate();
			script.println("location.href='home.jsp'");
			script.println("</script>");
		}
%>
</body>
</html>