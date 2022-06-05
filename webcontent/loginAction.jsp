<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.userDATA" scope="page" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="password" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_action</title>
</head>
<body>
<%
	//세션 상태 확인
	String id=null;
	if(session.getAttribute("id")!=null){
		id= (String)session.getAttribute("password");
	}
	// 이미 로그인했으면 다시 로그인을 할 수 없게 한다
			if(id != null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 로그인이 되어 있습니다')");
				script.println("location.href='home.jsp'");
				script.println("</script>");
			}
			UserDAO userDAO = new UserDAO();	
			int result = userDAO.login(user.getId(), user.getPassword());
			 if(result == 1){
				session.setAttribute("id",user.getId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 성공')");
				script.println("location.href='home.jsp'");
				script.println("</script>");
			}else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류입니다')");
				script.println("history.back()");
				script.println("</script>");
			}
		%>
</body>
</html>
		