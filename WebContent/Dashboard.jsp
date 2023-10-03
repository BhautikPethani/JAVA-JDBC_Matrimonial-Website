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
<title>Insert title here</title>
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

.container-boxes{
  margin: 0 auto;
  padding: 0;
  display:flex;
  justify-content: space-around;
  align-items: flex-end;
  max-width: 80vw;
}

.box{
  background: rgba(255,255,255,.5);
  margin: 1rem;
  padding: .5rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 350px;
  max-height: 180px;
  min-height: 180px;
  transition: all 250ms ease-out;
}

.box:hover{
  background: rgba(255,255,255,.7);
  transform: translateY(-20%);
}

.box a{
  text-decoration: none;
  color: black;
}

.icon{
  font-size: 3rem;
  padding: 1rem;
}

.text h3{
  text-transform: uppercase;
  letter-spacing: 4px;
  margin-bottom: 0;
}

.text p{
  margin-top: 1rem;
  line-height: 1.5rem;
  text-align: left;
}

.text{
  padding: .5rem;
}
</style>
</head>
<body>
<div class="header1">
			<%! String sid;
			String fname;
			String lname;%>
<% 
	String email = request.getParameter("uname");
	String passwd = request.getParameter("passwd");
	if(email!=null && passwd!=null)
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
		//PreparedStatement pst = conn.prepareStatement("select name,dob from profile where sid=?");
		PreparedStatement pst = conn.prepareStatement("select sid,fname,lname from signup where email=? and passwd=?");
		pst.setString(1,email);
		pst.setString(2,passwd);
		ResultSet rs = pst.executeQuery();
		rs.next();
		sid = rs.getString(1);
		fname = rs.getString(2);
		lname = rs.getString(3);
		conn.close();
		System.out.println(sid);
		if(sid.equals("0"))
		{
			pageContext.forward("Login.jsp");	
		}
	}
	else
	{
		pageContext.forward("Login.jsp");	
	}
%>
			<div><%= fname %><span1><%= " " + lname %></span1></div>
	</div>
<header>
    <nav>
      <ul>
        <li><a href="#">My Profile</a></li>
        <li><a href="Close_Ac.jsp?uname=<%=request.getParameter("uname")%>&passwd=<%=request.getParameter("passwd")%>">Close Account</a></li>
        <li><a href="Logout.jsp">Logout</a></li>
      </ul>
    </nav>
 </header>
<%
	Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
	PreparedStatement pst1 = conn1.prepareStatement("select count(pid) from profile where sid=?");
	pst1.setString(1, sid);
	ResultSet rs1 = pst1.executeQuery();
	rs1.next();
	int result = rs1.getInt(1);
	conn1.close();
	if(result==0)
	{	//out.println("<form action='Registration.jsp'>" + "<input type='hidden' name='uname' value='" + email + "'><input type='hidden' name='passwd' value='" + passwd + "'><input type='hidden' name='sid' value='" + sid + "'>");
		out.println("  <section class='container-boxes'><div class='box'><div class='text'><a href='Registration.jsp?sid=" + sid + "&uname=" + email + "&passwd=" + passwd + "&fname=" + fname + "&lname=" + lname + "'><h3>My Details</h3><p>For Further Process, Please Fill the Details.</p>"
	       +" </a></div></div></section>");
	}
	else
	{
		out.println("  <section class='container-boxes'><div class='box'><div class='text'><a href='Update_Details.jsp?sid=" + sid + "&uname=" + email + "&passwd=" + passwd + "&fname=" + fname + "&lname=" + lname + "'><h3>See Profile</h3><p>Your Profile is Registered. Click for Update.</p>"
			       +" </a></div></div></section>");	
	}
%>
</body>
</html>