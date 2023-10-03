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
  background: url(photos/1.jpg) no-repeat;
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



/* ------------------------ TOP SECTION ----------------*/

.titles{
  color: white;
  text-align: center;
  width: 50vw;
  margin: 0 auto;
}

.titles h1{
  font-family: Pacifico;
  font-size: 5rem;
  margin-bottom: 0;
  text-shadow: 1px 1px 0 black;

}

.titles p{
  letter-spacing: 3px;
  text-shadow: 1px 1px 0 black;
}

/* ------------------------ BOT SECTION ----------------*/



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


/* MEDIAQUERIES */


@media (max-width: 1160px){
   .icon{
    font-size: 2rem;
    padding: 0.5rem;
  }
  .text h3{
    text-transform: uppercase;
    letter-spacing: 4px;
    margin-bottom: 0;
    font-size: 1rem;
  }

  .text p{
    margin-top: 1rem;
    line-height: 1.5rem;
    text-align: left;
    font-size: .8rem;
  }
  nav li a:hover{
  background: none;
  color: black;
  }
}


@media (max-width: 850px){
  body{
    height: 100%;
  }
  .container-boxes{
    flex-direction: column;
  }
  .box:hover{
    background: rgba(255,255,255,.7);
    transform: none;
  }
  .titles h1{
  font-size: 3rem;
  }
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
        <li><a href="#">Home</a></li>
        <li><a href="Login.jsp">Sign In</a></li>
        <li><a href="About_Us.jsp">About Us</a></li>
        <li><a href="Contact_Us.jsp">Contact Us</a></li>
      </ul>
    </nav>
  </header>

  <section class="titles">

    <h1>Matrimonial.com</h1>
    <p>We bring people together.</p>
    <p>Love unites them....</p>

  </section>

  <section class="container-boxes">
    <div class="box">

      <div class="icon">
        <a href="HomePage.jsp"><i class="fas fa-fire"></i></a>
      </div>

      <div class="text">
        <a href="Signup.jsp">
          <h3>Register Today</h3>
          <p>Register for free & Put up your Profile"</p>
        </a>
      </div>

    </div>

    <div class="box">

      <div class="icon">
        <a href=""><i class="fas fa-seedling"></i></a>
      </div>

      <div class="text">
        <a href="Contact_Us.jsp">
          <h3>Contact Us</h3>
          <p>We will use only animal-friendly, fair-trade yarn. Only the best!</p>
        </a>
      </div>

    </div>

    <div class="box">

      <div class="icon">
        <a href=""><i class="fas fa-address-card"></i></a>
      </div>

      <div class="text">
        <a href="About_Us.jsp">
          <h3>About Us</h3>
          <p>Over 60 Lakh Happy Stories, We bring people together.</p>
        </a>
      </div>

    </div>
  </section>

</body>
</html>