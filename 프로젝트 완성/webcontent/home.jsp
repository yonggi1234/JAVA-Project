<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.ResultSet"%>
<%@page import="user.UserDAO"%>
<%@ page import = "user.wtDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 새로 만든 css 파일을 참조 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">
<title>index</title>
	
</head>
<body>
	<%
	UserDAO userDAO = new UserDAO();
	String id=null;
	ResultSet nx=null;
	String ad=null;
	String block=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
		 nx= userDAO.getAddress(id);
		 block=(String)session.getAttribute("block");
	}	
	wtDAO wtDAO = new wtDAO();
	ResultSet rs;
	String category = null;
	if(request.getParameter("search") != null){
		String search = request.getParameter("search");
		rs = wtDAO.getSearchWt(search);
	}
	else if(request.getParameter("select") != null){
		String select = request.getParameter("select");
		rs = wtDAO.getCategoryWt(select);
	}
	else if(request.getParameter("category") != null){
		category = request.getParameter("category");
		rs = wtDAO.getCateWt(category);
	}
	else{
		rs = wtDAO.getWt();
	}
	%>
    
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-film mr-2"></i>
                KUOM
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link nav-link-1 active" aria-current="page" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-3" href="board.jsp">board</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-4" href="user.jsp">user</a>
                </li>
            </ul>
            </div>
        </div>
    </nav>
    
    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg">
        <form class="d-flex tm-search-form" method="GET">
            <input class="form-control tm-search-input" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success tm-search-btn" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>

    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
         <%if(id!=null){ 
        	 while(nx.next()){
        		 ad=nx.getString("address");
         %>	
            	<h2 class="col-6 tm-text-primary">
           			
                <%=nx.getString("address")%>
            </h2> 
					<%}
        	 }else{ %>
        			<h2 class="col-6 tm-text-primary">추천 상품</h2>	 
        		 <%}
                %>
        </div>
        <h3>
        </h3>
        <div class="row tm-mb-90 tm-gallery">    
        	<%while(rs.next()){ 
        		if(!rs.getString("write_id").equals(block)){
        			if(ad==null||ad.equals(rs.getString("address"))){
        			%>
            	<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
	                <figure class="effect-ming tm-video-item">
	                    <%
	                    if(rs.getString("img_data")!=null){
	                    %>
	                    <img src="<%=rs.getString("img_data") %>" alt="Image" class="img-fluid">
	                    <%}else{ %>
	                    <img src="img/none.png" alt="Image" class="img-fluid">
	                    <%}%>
	                    <figcaption class="d-flex align-items-center justify-content-center">
	                        <h2><%=rs.getString("write_title")%></h2>
	                        <a href="viewer.jsp?num=<%=rs.getInt("write_num")%>">View more</a>
	                    </figcaption>                    
	                </figure>
	                <div class="d-flex justify-content-between tm-text-gray">
	                    <span class="tm-text-gray-light"><%=rs.getString("date")%></span>
	                    <span><%=rs.getInt("view") %></span>
	                </div>
	            </div>
            <%} } }%>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
            
        </div> 
        <!-- row -->

    <!-- container-fluid, tm-container-content -->

    <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">Develop By</h3>
                    <p>KGU java project.</p>
                    <p>이건아</p>
                    <p>김용기</p>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">Our Links</h3>
                    <ul class="tm-footer-links pl-0">
                        <li><a href="#">Advertise</a></li>
                        <li><a href="#">Support</a></li>
                        <li><a href="#">Our Company</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
                        <li class="mb-2"><a href="https://facebook.com"><i class="fab fa-facebook"></i></a></li>
                        <li class="mb-2"><a href="https://twitter.com"><i class="fab fa-twitter"></i></a></li>
                        <li class="mb-2"><a href="https://instagram.com"><i class="fab fa-instagram"></i></a></li>
                        <li class="mb-2"><a href="https://pinterest.com"><i class="fab fa-pinterest"></i></a></li>
                    </ul>
                    <%
                    if(id==null){
                    %>
                    <a href="login.jsp" class="tm-text-gray text-right d-block mb-2">Login</a>
                    <a href="join.jsp" class="tm-text-gray text-right d-block">Register</a>
                <% } else{%>
                <a href="logoutAction.jsp" class="tm-text-gray text-right d-block">LogOut</a>
                <% } %>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-7 col-12 px-5 mb-3">
                    Copyright 2020 Catalog-Z Company. All rights reserved.
                </div>
                <div class="col-lg-4 col-md-5 col-12 px-5 text-right">
                    Designed by <a href="https://templatemo.com" class="tm-text-gray" rel="sponsored" target="_parent">TemplateMo</a>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="js/plugins.js"></script>
    <script>
        $(window).on("load", function() {
            $('body').addClass('loaded');
        });
    </script>
</body>

</html>