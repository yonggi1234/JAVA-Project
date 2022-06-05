<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalog-Z About page</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
	<style>
.wrapper { position: relative; }
        #switch {
          position: absolute;
          /* hidden */
          appearance: none;
          -webkit-appearance: none;
          -moz-appearance: none;
        }
        .switch_label {
          position: relative;
          cursor: pointer;
          display: inline-block;
          width: 58px;
          height: 28px;
          background: rgba(206, 230, 253, 0.418);
          border: 2px solid rgba(0, 166, 255, 0.201);
          border-radius: 20px;
          transition: 0.2s;
        }
        .switch_label:hover {
          background: rgba(0, 166, 255, 0.201);
        }
        .onf_btn {
          position: absolute;
          top: 5px;
          left: 5px;
          display: inline-block;
          width: 19px;
          height: 19px;
          border-radius: 20px;
          background: #fff;
          transition: 0.2s;
        }
        #switch:checked+.switch_label {
          background: rgba(0, 166, 255, 0.137);
          border: 2px solid rgba(0, 166, 255, 0.354);
        }
        
        #switch:checked+.switch_label:hover {
          background: rgba(0, 166, 255, 0.201);
        }
        
        /* move */
        #switch:checked+.switch_label .onf_btn {
          left: 33px;
          background: rgb(255, 255, 255);
          box-shadow: 1px 2px 3px #00000020;
        }		
	</style>
</head>

<body>
	<%
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
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
                    <a class="nav-link nav-link-1" aria-current="page" href="home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-3" href="board.jsp">board</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link nav-link-4 active" href="user.jsp">user</a>
                </li>
            </ul>
            </div>
        </div>
    </nav>

    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg"></div>

    <div class="container-fluid tm-mt-60">
        <!-- row -->
        <div class="row tm-mb-50">
            <div class="col-md-4 col-12">
                <div class="tm-about-3-col">
                    <div class="tm-about-icon-container mb-5">
                        <i class="fas fa-desktop fa-3x tm-text-primary"></i>
                    </div>                
                    <h2 class="tm-text-primary mb-4">관심 목록</h2>
                    <p class="mb-4">관심있는 카테고리의 상품이 제시됩니다.</p>
                    <form id="contact-form" action="categoryAction.jsp" method="POST" class="tm-contact-form mx-auto">
	                    <div class="form-group">
	                        <select class="form-control" id="contact-select" name="category">
	                            <option value="books">book</option>
	                            <option value="cloth">cloth</option>
	                            <option value="">None</option>
	                        </select>
	                    </div>
	                    <div class="form-group tm-text-right">
                        <button type="submit" class="btn btn-primary">Apply</button>
                    </div>
                    </form>
                </div>                
            </div>
            <div class="col-md-4 col-12">
                <div class="tm-about-3-col">
                    <div class="tm-about-icon-container mb-5">
                        <i class="fas fa-mobile-alt fa-3x tm-text-primary"></i>
                    </div>                
                    <h2 class="tm-text-primary mb-4">회원탈퇴</h2>
                    <p class="tm-mb-50">사용자의 계정이 삭제됩니다.</p>                
                    <div class="text-center">
                        <a href="withdrawal.jsp" class="btn btn-primary">회원탈퇴</a>
                    </div>
                </div>                
            </div>
            <div class="col-md-4 col-12">
                <div class="tm-about-3-col">
                    <div class="tm-about-icon-container mb-5">
                        <i class="fas fa-photo-video fa-3x tm-text-primary"></i>
                    </div>                
                    <h2 class="tm-text-primary mb-4">사용자 차단</h2>
                    <p class="mb-4">지정된 사용자가 작성한 글이 차단됩니다.</p>
                  	<form id="contact-form" action="blockAction.jsp" method="POST" class="tm-contact-form mx-auto">
                    <div class="form-group">
                        <input type="text" name="block" class="form-control rounded-0" placeholder="username" required />
                    </div>
                    <div class="form-group tm-text-right">
                        <button type="submit" class="btn btn-primary">block</button>
                    </div>
                </form>
                    
                </div>                
            </div>
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
    
    <script src="js/plugins.js"></script>
    <script>
        $(window).on("load", function() {
            $('body').addClass('loaded');
        });
    </script>
</body>
</html>