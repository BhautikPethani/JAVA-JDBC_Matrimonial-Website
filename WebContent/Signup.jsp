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
        *{
  padding:0;
  margin:0;
  box-sizing:border-box;
}
body{
  background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(photos/1.jpg) no-repeat;
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

.wrapper{
/*   border:solid black; */
  display: -webkit-flex;
  display: flex;
  height: 100%;
}

.myForm{
/*   border:solid black; */
  background-color:white;
  margin:50px auto;
  display:flex;
  flex-direction:column;
  flex-wrap:wrap;
  justify-content:space-between;
  align-items:center;
  width:25%;
  min-width:400px;
  border-radius:5px;
/*   height:450px;     */
}



.formElement{
/*   border:solid black; */
/*   flex-basis:100%; */
  width:90%;
}

.link a{
	text-decoration: none;
	font-size: 16px;
	color: rgb(15, 15, 15);
}

.link a:hover{
	cursor: pointer;
	color: rgb(7, 59, 126);
}

.formInstructionsDiv{
  width:100%; 
/*   flex-grow:1; */
  padding:15px 0;
  background-color:rgb(158, 158, 161);
  border-radius:5px;
  border-bottom: solid rgb(15, 15, 15); 
 
}

.formInstructionsDiv h2{
  margin-left:5%;
  font-size:3em;
  font-family:"ebrima";
  font-weight:lighter;
  color: rgb(15, 15, 15);
}
.Message{
  font-size:15px;
  font-family:"ebrima";
  font-weight:lighter;
  color: red;
}
.formInstructionsDiv p{
  margin-left:5%;
  font-size:1em;
  font-family: "ebrima";
  color: rgb(15, 15, 15);
}
.fillContentDiv{
  display:flex;
  flex-direction:column;
  justify-content:space-between;
  flex-grow:1;
  margin-top:40px;
  margin-bottom: 82px;
  height:280px;
  
  
}

.formContentElement{
  min-width:100%;
}

.names{
  display:flex;
  flex-wrap:wrap;
  justify-content:space-between;

}

.names .inputRequest{
  width:47.5%;
  min-width:150px;
}

.names .inputRequest:last-child{
/*   margin-right:5%; */
}

.otherInputs{

}

.otherInputs .inputRequest{

}


.inputRequest{
/*   margin-bottom:20px; */
  padding:15px;
  font-size:1.2em;
  background-color: #f2f2f2;
  border-style:none;
  border-radius:5px;
}

.inputRequest:focus{
  border-style:solid;
  border-width:3px;
  border-color: #0d6380;
}


.submitButton{
  width:40%;
  height:100%;
  background-color: rgb(66, 65, 65);
  border-style:none;
  color:white;
  font-size:1.2em;
  font-weight:800;
  cursor:pointer;
  border-radius:5px;
}

.submitButton:hover{
  background-color:rgb(158, 158, 161);
  color: rgb(15, 15, 15);
}
.submitButtonDiv{
  grow:1;
  height:45px;
/*   padding-bottom:40px; */
  margin-bottom:20px;
  
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
        <li><a href="Contact_Us.jsp">Contact Us</a></li>
      </ul>
    </nav>
  </header>
                <div class="wrapper">
                
                  <form class="myForm" action="#" method="get">
                    <div class="formInstructionsDiv formElement">
                      <h2 class="formTitle" >Sign Up</h2>
                      <p class="instructionsText">Please fill in this form to create an account</p>
                     </div>
                    <div class="fillContentDiv formElement">
                    <div class="Message">
                      	<% 
							String fname = request.getParameter("fname");
							if(fname!=null)
							{
								String passwd = request.getParameter("passwd");
								String cpasswd = request.getParameter("cpasswd");
								String email = request.getParameter("email");
								if(!passwd.equals(cpasswd))
								{
									out.println("Confirm Password is Invalid !!!!!");
								}
								else
								{
									Class.forName("com.mysql.jdbc.Driver");
									Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
								 	PreparedStatement pst = conn.prepareStatement("select count(email) from signup where email=? ");
								 	pst.setString(1, email);
								 	ResultSet rs = pst.executeQuery();
								 	rs.next();
								 	int result = rs.getInt(1);
								 	conn.close();
								 	
								 	if(result==0)
								 	{
								 		pageContext.forward("Signup_Verification");
								 	}
								 	else
								 	{
								 		out.println("This Email Already in Used..");								 		
								 	}
								}
							}
						%>
				</div>
                    <div class="names formContentElement">  
                    
                      <input class="inputRequest " type="text" name="fname" placeholder="First Name" required/>
                
                      <input class="inputRequest " type="text" name="lname" placeholder="Last Name" required/>
                   </div>
                    
                      <label>
                        <input class="inputRequest formContentElement" type="text"  name="email" placeholder="Email" required/>
                      </label>
                      <label>
                        <input class="inputRequest formContentElement" type="password"  name="passwd" placeholder="Enter password" required/>
                      </label>
                      <label>
                        <input class="inputRequest formContentElement" type="password"  name="cpasswd" placeholder="Confirm password" required/>
                      </label>
                  
                      </div>
                    <div class="submitButtonDiv formElement">
                    
                    <input class="submitButton" type="submit" value="Sign up">
                    </div>
                    <div class="link">
						<a href="Login.jsp">Already Has Account ? </a>
						<br>
						<br>
					</div>
                  </form>
                </div>
</body>
</html>