
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.charity.dao.DBDAO"%>
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
                                <li><a href="login.jsp">Login</a></li>
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
                        User user = (User)session.getAttribute("user");
                        out.print("Welcome, "+user.getFirstname());  
                        String id=request.getParameter("id"); 
                      // session.setAttribute("id", id);
                	//UserDao.edit(user);
                        Connection con = DBDAO.getDbCon();
                        PreparedStatement ps=con.prepareStatement("Select firstname,lastname,profession,qualification,phonenumber,sex,country,email from CHARITY_REG where id=?");
                        ps.setString(1, id);
                        ResultSet rs=ps.executeQuery();
                        String Firstname="",Lastname="",Profession="",Qualification="",Phonenumber="",sex="",country="",email="";
                        int users_id=0;
                         while(rs.next()){ 
                    System.out.println("............inside while dont dare..............");
	             
                        Firstname=rs.getString("FIRSTNAME");
	            Lastname=rs.getString("LASTNAME"); 
                   Profession=rs.getString("PROFESSION");
                    Qualification=rs.getString("QUALIFICATION");
                    Phonenumber=rs.getString("PHONENUMBER");
	           sex=rs.getString("SEX");  
	            country=rs.getString("COUNTRY");
                   email= rs.getString("EMAIL"); 
                   
	        }

                        %>
                        
                        <div >
			
				<h3>
						<form action="editconfirm.jsp" method="post">
						<div class="container">
						<div>
                                                    <input type="hidden" name="id" value="<%=id%>" required>
                                                <label for="fname"><b>Firstname</b></label>
                                                <input type="text" name="fname" value="<%=Firstname%>" required>
						
                                                </div>
						</br>
						<div>
						<label for="lname"><b>Lastname</b></label>
                                                <input type="text" name="lname" value="<%=Lastname%>"required>
						</div>
						</br>
						<br/>
						<div>
						<label for="Profession"><b>Profession</b></label>
                                                <input type="text" name="prof" value="<%=Profession%>" required>
						</div>
						</br>
						<div>
						<label for="Qualification"><b>Qualification</b></label>
						<input type="text" name="Qualif"value="<%=Qualification%>"required>
						</div>
						</br>
						<div>
						<label for="Phonenumber"><b>Phonenumber</b></label>
						<input type="text" name="phone" value="<%=Phonenumber%>"required>
						</div>
						</br>
						<div>
						<label for="Sex"><b>Sex</b></label>
						<input type="radio" name="sex" value="male"/>Male   
						<input type="radio" name="sex" value="female"/>Female </td></tr> 
						</div>
						</br>
						<div>
						<label for="Country"><b>Country</b></label>
						<select name="country" style="width:155px">  
						<option>India</option>  
						<option>Pakistan</option>  
						<option>Afghanistan</option>  
						<option>Berma</option>  
						<option>Other</option>  
						</select>
						</div>
						</br>
						<div>
						<label for="Email"><b>Email</b></label>
						<input type="text"name="email" value="<%=email%>"required>
						</div>
						
						</br>
							<button style=" background-color: orange;""type="submit">Update</button>
						</div>
						</br>
						<div class="container" >
						<button style=" background-color: orange;"type="button" class="cancelbtn">Cancel</button>
						</div>
						</form>
						</h3>
					</div>
			
		<!-- end:header-top -->
		
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


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

