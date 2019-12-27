<h2><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%></h2>
<!DOCTYPE html>
<html>
<head>
	<title>TRCTC</title>
  <link rel="icon" type="image/icon" href="train3.jpg">

</head>
<style>
.navi_ri8{
			font-size: 30;
			float: right;
			color: white;
	    }
		.navi_left{
			float: left;
			font-size: 30;
			color: white;
			word-spacing: 40px;

		}
		a.navi:link{
			text-decoration: none;
			font-family: monotype corsiva;
			color: white;
		}
		a.navi:visited{
			color: white;
		}
		a.navi:hover{
			text-decoration: underline;
			color: hotpink;
		}
		a.navi:active{
			text-decoration: none;
			color: black;
		}
	body {
  background-image: url(pal9.jpg); font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 70%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=email]{
  width: 30%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 56px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 56px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  background-color: #f2f2f2;
  padding: 20px;
  opacity:0.7;
  width:50%;
  border-radius: 20px;
}
h2
{
	display: none;
}
</style>
<body>
	<nav style="background-color: black; width: 100%" class="navi_left">
	<a class="navi" href="myaccount.jsp">My_Account</a>
	<a class="navi" href="menupage.jsp">Home</a>
	<a class="navi" href="PAL4.html">About</a>
	<a class="navi" href="contact us.html">Contact</a>
	<a class="navi" href="logout.jsp">Logout</a>
</nav>
	<h3 style="color:cyan;style:cooper black">PNR ENQUIRY</h3>
	<center><br><br><br><br><br><br><br><div class="container">
<form method="post" action="pnr_enquiry.jsp">
	<h3 style="color:red;font-family:cooper black;">PNR NUMBER</h3>
	<input type="text" name="pnr_num" /><br>
	<input type="submit" value="check" />
</form></div></center>
</body>
</html>