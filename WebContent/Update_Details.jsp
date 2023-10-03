<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Registration</title>
<style>
            body{
    color: #fff;
    font: 600 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
    margin: 0px; /*adds 0 space on all sides*/ 
    background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(photos/1.jpg) no-repeat;
}

.header1{
	position: absolute;
	top: calc(9% - 35px);
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

.main {
	top: calc(18% - 35px);
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.h1b{
	top: calc(23% - 90px);
    left: calc(35% - 255px);
    position: absolute;   
}

.h1b div{
	float: left;
	color: #fff;
	font-family: Pacifico;
	font-size: 35px;
	font-weight: 200;
}

.profile {
    top: calc(18% - 35px);
    width: 1030px;
    height: 950px;
    display: flex;
    flex-direction: row;
    position: relative;
    background-color: #fff;
    box-shadow: 5px 5px 10px 10px #888880;
}

.lb-name {
    color: #736026;
    text-align: center;
}
.lb-name p {
    margin: 0;
}
.follow, .message {
    color: #736026;
    border: 2px solid #736026;
    background-color: #fff;
    -webkit-transition: 0.3s;
    transition: 0.3s;
    width: 150px;
    border-radius: 15px;
}
.follow:hover, .message:hover {
    background-color: #736026;
    color: #fff;
}
.login-box{
	color: #736026;
}

.login-box p{
	margin-bottom: 15px;
	padding: 8px;
	color: #736026;
	font-weight: bold;
	font-size: 16px;
}

.login-box input{
	width: 200px;
	margin-bottom: 20px;
}
.login-box input[type="radio"]{
	width: 20px;
	margin-bottom: 0px;
	font-size: 16px;
}

.login-box input[type="text"], input[type="password"], input[type="date"]
{
	width: 350px;
	border: none;
	border-bottom: 1px solid #736026;
	background: transparent;
	outline: none;
	height: 40px;
	color: #736026;
	font-size: 16px;
}

.login-box input[type="submit"]
{
	border: none;
	outline: none;
	height: 40px;
	background: #736026;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;
}

.login-box input[type="submit"]:hover
{
	cursor: pointer;
	color: black;
}

.login-box input[type="date"]:hover
{
	cursor: pointer;
}

.login-box a{
	text-decoration: none;
	font-size: 14px;
	color: #736026;
}

.login-box a:hover{
	cursor: pointer;
	color: #000;
}
 </style>
</head>
<body>
<div class="header1">
	<div><%= request.getParameter("fname") %><span1><%= " " + request.getParameter("lname") %></span1></div>
</div>
<%
	String sid = request.getParameter("sid");
	String name = request.getParameter("name");
	System.out.println(request.getParameter("edu"));
	String dob = request.getParameter("BirthDate");
	System.out.println("OK");
	if(name!=null && dob!=null)
	{
			System.out.println("OK2");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
			PreparedStatement pst = conn.prepareStatement("update profile set name=?,dob=?,gender=?,mobile_no=?,address=?,email=?,languages_known=?,skills=?,hobbies=?,habit=?,about_self=?,expectation=?,height=?,education=?,occupation=?,nature=?,father_name=?,mother_name=?,sibling=? where sid=?");
			pst.setString(1,name);
			pst.setString(2,dob);
			pst.setString(3,request.getParameter("gender"));
			pst.setString(4,request.getParameter("mob"));
			pst.setString(5,request.getParameter("address"));
			pst.setString(6,request.getParameter("email"));
			pst.setString(7,request.getParameter("language"));
			pst.setString(8,request.getParameter("skill"));
			pst.setString(9,request.getParameter("hobby"));
			pst.setString(10,request.getParameter("habit"));
			pst.setString(11,request.getParameter("aboutself"));
			pst.setString(12,request.getParameter("expect"));
			pst.setString(13,request.getParameter("height"));
			pst.setString(14,request.getParameter("edu"));
			pst.setString(15,request.getParameter("occu"));
			pst.setString(16,request.getParameter("nature"));
			pst.setString(17,request.getParameter("father"));
			pst.setString(18,request.getParameter("mother"));
			pst.setString(19,request.getParameter("sibling"));
			pst.setString(20,sid);
			pst.executeUpdate();
			conn.close();
			pageContext.forward("Dashboard.jsp");
			
		}	
%>
<header>
    <nav>
      <ul class="fonta">
        <li><a href="Dashboard.jsp?uname=<%=request.getParameter("uname")%>&passwd=<%=request.getParameter("passwd")%>">Dashboard</a></li>
        <li><a href="Close_Ac.jsp?uname=<%=request.getParameter("uname")%>&passwd=<%=request.getParameter("passwd")%>">Close Account</a></li>
        <li><a href="Logout.jsp">Logout</a></li>
      </ul>
    </nav>
 </header>
 <form action="#" method="post">
 <% 
 	out.println("<input type='hidden' value='" + request.getParameter("email") + "' name='uname'");
	 out.println("<input type='hidden' value='" + request.getParameter("passwd") + "' name='passwd'");
	 out.println("<input type='hidden' value='" + request.getParameter("sid") + "' name='sid'");
 %>
 <br><br>
 <div class="h1b"><h1>Please Fill All the Details<h1></div>
    <section class="main">
            <div class="profile">       
                 <form>
                    <div class="login-box">
                	<center>
                    <table>
                        <tr>
	                    <%
	                        Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
	                    	PreparedStatement pst1 = conn1.prepareStatement("select * from profile where sid=?");
	                    	pst1.setString(1, sid);
	                    	ResultSet rs1 = pst1.executeQuery();
	                    	rs1.next();
                        %>
                            <td><p>Name : </p></td>
                            <td><input type="text" name="name" value="<%=rs1.getString(2)%>" placeholder="Full Name" required/ ></td>
                            <td><p>Habit :  </p></td>
                            <td><input type="text" name="habit" placeholder="Habit" value="<%=rs1.getString(11)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Date Of Birth : </p></td>
                                <td><input type="date" name="BirthDate" value="<%=rs1.getString(3)%>" required/></td>
                                <td><p>About Self : </p></td>
                                <td><input type="text" name="aboutself" placeholder="About Self" value="<%=rs1.getString(12)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Gender : </p></td>
                                <td><input type="radio" name="gender" value="m" checked>Male<br><input type="radio" name="gender" value="f">Female</td>
                        		<td><p>Expectation : </p></td>
                                <td><input type="text" name="expect" placeholder="Expectation" value="<%=rs1.getString(13)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Mobile No : </p></td>
                                <td><input type="text" name="mob" placeholder="Mobile No" value="<%=rs1.getString(5)%>" required/></td>
                                <td><p>Occupation : </p></td>
                                <td><input type="text" name="occu" placeholder="Occupation" value="<%=rs1.getString(16)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Address : </p></td>
                                <td><input type="text" name="address" placeholder="Address" value="<%=rs1.getString(6)%>" required/></td>
                                <td><p>Height : </p></td>
                                <td><input type="text" name="height" placeholder="Height" value="<%=rs1.getString(14)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Email Address :  </p></td>
                                <td><input type="text" name="email" placeholder="@xyz.com" value="<%=rs1.getString(7)%>" required/></td>
                                <td><p>Education : </p></td>
                                <td><input type="text" name="edu" placeholder="Education" value="<%=rs1.getString(15)%>" required/></td>
                        </tr>
                        
                        <tr>
                                <td><p>Skills :  </p></td>
                                <td><input type="text" name="skill" placeholder="Skills" value="<%=rs1.getString(9)%>" required/></td>
                                <td><p>Nature : </p></td>
                                <td><input type="text" name="nature" placeholder="Nature" value="<%=rs1.getString(17)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Hobbies :  </p></td>
                                <td><input type="text" name="hobby" placeholder="Hobbies" value="<%=rs1.getString(10)%>" required/></td>
                                <td><p>Father Name : </p></td>
                                <td><input type="text" name="father" placeholder="Father Name" value="<%=rs1.getString(18)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Mother Name : </p></td>
                                <td><input type="text" name="mother" placeholder="Mother Name" value="<%=rs1.getString(19)%>" required/></td>
                                <td><p>Sibling : </p></td>
                                <td><input type="text" name="sibling" placeholder="Sibling" value="<%=rs1.getString(20)%>" required/></td>
                        </tr>
                        <tr>
                                <td><p>Languages Known :  </p></td>
                                <td><input type="text" name="language" placeholder="Language" value="<%=rs1.getString(8)%>" required/></td>
                        </tr>
                    </table>
                    <br>
                    <br>
                    	<input type="submit" name="submit" value="Update"/>
                    </center>
                </div>
                </form>
                </div>
            
    </section>
</body>
</html>