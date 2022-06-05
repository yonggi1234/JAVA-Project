<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog-Z Contact page</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    
</head>

<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
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
                    <a class="nav-link nav-link-3" href="board.jsp?category=product">product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-4" href="board.jsp?category=promotion">promotion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-4" href="board.jsp?category=information">information</a>
                </li>
            </ul>
            </div>
        </div>
    </nav>
	
	
	<!-- 네비게이션 영역 끝 -->
	
	<!-- 게시판 글쓰기 양식 영역 시작 -->
	<div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg"></div>

    <div class="container-fluid tm-mt-60">
        <div class="row tm-mb-100">
            <div class="col-lg-12 col-12 mb-5">
                <h2 class="tm-text-primary mb-5">Write</h2>
                <form action="writeAction.jsp" method="POST" >
                    <div class="form-group">
                        <input type="text" name="write_title" class="form-control rounded-0" placeholder="Title" required />
                    </div>
                    
                    <div class="form-group">
                        <select class="form-control" id="category" name="category" onchange="viewProduct()">
                            <option value="-">게시판</option>
                            <option value="product">중고거래</option>
                            <option value="promotion">홍보</option>
                            <option value="information">정보</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="select" name="select" style="display:none" onchange="viewBooks()">
                            <option value="-">판매상품</option>
                            <option value="books">전공책</option>
                            <option value="pencil">필기구</option>
                            <option value="etc">기타</option>
                        </select>
                    </div>
                    <div class="form-group">
                    	<select class="form-control" id="use" name="use" style="display:none">
                            <option value="-">필기여부</option>
                            <option value="many">대부분 필기함</option>
                            <option value="soso">가끔 필기한곳 있음</option>
                            <option value="no">필기안함</option>
                        </select>
                        <br>
                        <textarea rows="12" name="write_content" class="form-control rounded-0" placeholder="Content" required=></textarea>
						<input id="fileInput" type="file" name="img" onchange="openFile(event)">
						<input id="img" name="img_data" type="hidden">
					</div>
					<img id = "preview">
					<br>
					
                    <div class="form-group tm-text-right">
                        <button type="submit" class="btn btn-primary">글쓰기</button>
                    </div>
                </form>                
            </div>
        </div>
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
    
    <script>
	  var openFile = function(event) {
	    var input = event.target;
	
	    var reader = new FileReader();
	    reader.onload = function(){
	      var dataURL = reader.result;
	      var output = document.getElementById('preview');
	      output.src = dataURL;
	      img_data = document.getElementById('img');
		  img_data.value=dataURL;
	    };
	    reader.readAsDataURL(input.files[0]);
	  };
	  
	  function viewProduct(){
		  var sel = document.getElementById('category');
		  if(sel.value=="product"){
			  document.getElementById('select').style.display="";
		  }
		  else{
			  document.getElementById('select').style.display="none";
		  }
	  }
	  
	  function viewBooks(){
		  var sel = document.getElementById('select');
		  if(sel.value=="books"){
			  document.getElementById('use').style.display="";
		  }
		  else{
			  document.getElementById('use').style.display="none";
		  }
	  } 
</script>
</body>
</html>