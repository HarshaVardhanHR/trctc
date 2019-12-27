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
input[type=date]{
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
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;}
</style>
<body>
<nav style="background-color: black; width: 100%" class="navi_left">
	<a class="navi" href="myaccount.jsp">My_Account</a>
	<a class="navi" href="menupage.jsp">Home</a>
	<a class="navi" href="PAL4.html">About</a>
	<a class="navi" href="contact us.html">Contact</a>
	<a class="navi" href="logout.jsp">Logout</a>
</nav>
	<h2><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%></h2><h3 style="color:green;">Availability</h3><br><br><br><br>
<%
String t_num=request.getParameter("t_num");
String dat=request.getParameter("dat");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select coach_no,seat_no from coaches where train_no='"+t_num+"' and departure_date='"+dat+"'");
String avail;
int x=0;
int y=0;
%><center><div class="container"><br><br>
<table id="customers">
	<tr>
		<th>coach no</th>
		<th>availability</th>
	</tr>
<%
while(rs.next())
	{
		avail=rs.getString("seat_no");
	x=Integer.parseInt(avail);
	y=16-x;
	%><tr>
		<td><%=rs.getString("coach_no")%></td>
		<td><% out.print(y);%></td>
		</tr><%
	}
%>
</table><br><br></div></center>
</body></html>