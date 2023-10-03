<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<style>
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

body{
	margin: 0;
	padding: 0;
	background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(photos/1.jpg) no-repeat;
	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

header{
  display:flex;
  justify-content: space-between;
  color: white;
  background: rgba(0,0,0,0.2)
}
.fonta{
font-family: Pacifico;
}
header div{
  display:flex;
  justify-content: space-between;
  align-items: center;
  font-family: Pacifico;
  margin: 0 2rem;
}

header div i{
  font-size: 2rem;
  margin: 1rem;
}


header nav{
  padding: 1rem 2rem;
}

.header1{
	position: absolute;
	top: calc(7% - 35px);
	left: calc(90% - 255px);
	z-index: 2;
}

.header1 div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header1 div span1{
	color: #5379fa !important;
}

nav ul li{
  list-style: none;
  display: inline;
  text-transform: uppercase;
  font-weight: bold;
  letter-spacing: 5px;
}

nav li a{
  padding: 1rem;
  margin: 1rem;
  text-decoration: none;
  color: white;
  transition: all 250ms ease-in;
}

nav li a:hover{
  background: rgba(255,255,255,.3);
  color: black;
}

.name{
	position: absolute;
	top: calc(50% - 35px);
	left: calc(40% - 255px);
	z-index: 2;
}

.name div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.name div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.link a{
	text-decoration: none;
	font-size: 14px;
	color: #fff;
}

.link a:hover{
	cursor: pointer;
	color: rgb(119, 116, 253);
}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=submit]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=submit]:hover{
	opacity: 0.8;
}

.login input[type=submit]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=submit]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
</style>
<body>
<div class="header1">
			<div>Matrimonial<span1>.com</span1></div>
	</div>
<header>
    <nav>
      <ul class="fonta">
        <li><a href="HomePage.jsp">Home</a></li>
        <li><a href="#">Sign In</a></li>
        <li><a href="About_Us.jsp">About Us</a></li>
        <li><a href="Contact_Us.jsp">Contact Us</a></li>
      </ul>
    </nav>
 </header>
		<div class="name">
			<div>Matrimonial<span>.com</span></div>
		</div>
		<br>
		<div class="login">
			<form action="#" method="post">
				<input type="text" placeholder="username" name="uname" required/><br>
				<input type="password" placeholder="password" name="passwd" required/><br>
				<input type="submit" value="Login">
			</form>
			<div class="link">
				<br>
				<a href="Signup.jsp">Sign Up ? </a>
			</div>
		</div>
		<%  
			String uname = request.getParameter("uname");
			String passwd = request.getParameter("passwd");
			if(uname!=null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
			 	PreparedStatement pst = conn.prepareStatement("select count(uname) from login where uname=? and password=?");
			 	pst.setString(1, uname);
			 	pst.setString(2, passwd);
			 	ResultSet rs = pst.executeQuery();
			 	rs.next();
			 	int result = rs.getInt(1);
			 	conn.close();
			 	
			 	if(result==1)
			 	{
			 		pageContext.forward("Dashboard.jsp");
			 	}
			 	else
			 	{
			 		pageContext.forward("Signup.jsp");
			 	}
			}
		%>
</body>
</html>