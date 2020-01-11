
<%@page import="com.charity.dao.UserDao"%>
<%@page import="com.charity.bean.User"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SoS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">

	<link rel="stylesheet" href="css/style.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 text-left fh5co-link">
						<a href="#">FAQ</a>
						<a href="#">Forum</a>
						<a href="#">Contact</a>
					</div>
					<div class="col-md-6 col-sm-6 text-right fh5co-social">
						<a href="#" class="grow"><i class="icon-facebook2"></i></a>
						<a href="#" class="grow"><i class="icon-twitter2"></i></a>
						<a href="#" class="grow"><i class="icon-instagram2"></i></a>
					</div>
				</div>
			</div>
		</div>
		<header id="fh5co-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
					<h1 id="fh5co-logo"><a href="index.html">SON OF SOIL [SoS]</a></h1>
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li class="active">
								<a href="index.html">Home</a>
							</li>
                                <li><a href="Register.html">Register</a></li>
                                <li><a href="Login.html">Login</a></li>
							<li><a href="about.html">About</a></li>
							<li>
								<a href="#" class="fh5co-sub-ddown">Get Involved</a>
								<ul class="fh5co-sub-menu">
									<li><a href="#">Donate</a></li>
									<li><a href="#">Fundraise</a></li>
									<li><a href="#">Campaign</a></li>
									<li><a href="#">Philantrophy</a></li>
									<li><a href="#">Volunteer</a></li>
								</ul>
							</li>
							<li>
								<a href="#" class="fh5co-sub-ddown">Projects</a>
								 <ul class="fh5co-sub-menu">
								 	<li><a href="#">Water World</a></li>
								 	<li><a href="#">Cloth Giving</a></li>
								 	<li><a href="#">Medical Mission</a></li>
								</ul>
							</li>
                                                       	<li><a href="blog.html">Blog</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
		
      <%
         User user = new User();
         UserDao udao = new UserDao();
         String id1 = request.getParameter("id");
         int id=Integer.parseInt(id1);
         String fname = request.getParameter("fname");
         String lname = request.getParameter("lname");
         String prof = request.getParameter("prof");
         String Qualif = request.getParameter("Qualif");
         String phone = request.getParameter("phone");
         String sex = request.getParameter("sex");
         String country = request.getParameter("country");
         String email = request.getParameter("email");
         
         
     

         user.setFirstname(fname);
         user.setLastname(lname);
         user.setProfession(prof);
         user.setQualification(Qualif);
         user.setPhonenumber(phone);
         user.setSex(sex);
         user.setCountry(country);
         user.setEmail(email);
         user.setId(id);
         boolean flag;
                
         
         flag = udao.edit(user);
        
         
        if(flag==true){
            out.println("successfully  updated");
        
        }else{
            out.println("Error occured...............please try again");
        }



        %>

                    

	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/sticky.js"></script>

	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	
	<!-- Main JS -->
	<script src="js/main.js"></script>

	</body>
</html>

