<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Matrimonial Home</title>

<style>
* {
  box-sizing: border-box;
}
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
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

html {
  margin: 0;
  padding: 0;
}

body{
  margin:0;
  padding: 0;
  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(photos/1.jpg) no-repeat;
  background-size: cover;
  color: black;
  font-family: "open sans";
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

/* ------------------------ NAVBAR ----------------*/


header{
  display:flex;
  justify-content: space-between;
  color: white;
  background: rgba(0,0,0,0.2)
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

.login-box{
	width: 800px;
	height: 400px;
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	top: 60%;
	left: 50%;
	position: absolute;
	transform: translate(-50%,-50%);
	box-sizing: border-box;
	padding: 70px 30px
}
h1{
	margin: 0;
	padding: 0 0 20px;
	text-align: center;
	font-size: 29px;
}

h2{
	margin: 0;
	text-align: center;
	font-size: 12px;
}

.login-box p{
	margin-bottom: 15px;
	padding: 8px;
	color: #fff;
	font-size: 22px;
}
</style>
</head>
<body>
<div class="header1">
			<div>Matrimonial<span1>.com</span1></div>
	</div>
<header>
    <nav>
      <ul>
        <li><a href="HomePage.jsp">Home</a></li>
        <li><a href="Login.jsp">Sign In</a></li>
        <li><a href="About_Us.jsp">About Us</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </nav>
  </header>

	<div class="login-box">
		<h1>Contact Us</h1>
		<p>Mail      : matrimonial.Shaadi@gmail.com</p>
		<p>Help Line : 789 - 4568524</p>
		<br><br><br><br>
		
		<h2>Powerd By : planicssolution@yahoo.com</h1>
		<h2>All rights reserved to Matrimonial.com</h1>
	</div>
</body>
</html>