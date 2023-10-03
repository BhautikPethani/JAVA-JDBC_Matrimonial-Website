<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String uname = request.getParameter("uname");
	String passwd = request.getParameter("passwd");
	if(uname!=null && passwd!=null)
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
		PreparedStatement pst1 = conn1.prepareStatement("delete from profile where sid=(select sid from signup where email=? and passwd=?)");
		pst1.setString(1, uname);
		pst1.setString(2, passwd);
		pst1.executeUpdate();
		conn1.close();
		
		Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
		PreparedStatement pst2 = conn2.prepareStatement("delete from login where uname=? and password=?");
		pst2.setString(1, uname);
		pst2.setString(2, passwd);
		pst2.executeUpdate();
		conn2.close();
		
		Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
		PreparedStatement pst3 = conn3.prepareStatement("delete from signup where email=? and passwd=?");
		pst3.setString(1, uname);
		pst3.setString(2, passwd);
		pst3.executeUpdate();
		conn3.close();
		pageContext.forward("HomePage.jsp");
	}
	else
	{
		pageContext.forward("HomePage.jsp");
	}
%>
</body>
</html>