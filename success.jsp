<!DOCTYPE html>
<html>
<head>
	<title>TRCTC</title>
  <link rel="icon" type="image/icon" href="train3.jpg">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  background-image: url(pal9.jpg); font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 30%;
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
  width:60%;
}
h2
{
	display: none;
}

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
  color: white;
}
</style>
</head>
<body>
	<nav style="background-color: black; width: 100%" class="navi_left">
	<a class="navi" href="myaccount.jsp">My_Account</a>
	<a class="navi" href="menupage.jsp">Home</a>
	<a class="navi" href="PAL4.html">About</a>
	<a class="navi" href="contact us.html">Contact</a>
	<a class="navi" href="logout.jsp">Logout</a>
</nav><h2>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("pnr_number")%></h2>
<%
String pnr_num=(String)session.getAttribute("pnr_number");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select distinct  a.pnr,a.coach_no,a.seat_no,a.name,a.gender,a.age,a.serial_no,b.src,b.dest,b.train_no,b.departure_date from ticket_detail b left join passenger_info a on a.pnr=b.pnr where a.pnr='"+pnr_num+"'order by a.serial_no");
%>
<br><br><br><br><center><div class="container">
<%
rs.next();%>
<%
String pnr=rs.getString(1);
String coach=rs.getString(2);
String src=rs.getString(8);
String dest=rs.getString(9);
String t_num=rs.getString(10);
String dat=rs.getString(11);
String seats;
int ss;
%><h3 style="color:green;font-family:times new roman">Booking Details</h3><h4 style="color:red;font-family:Arial;" align="left"><%
out.print("PNR            = "+pnr);%><br><%
out.print("SOURCE         = "+src);%><br><%
out.print("DESTINATION    = "+dest);%><br><%
out.print("DEPARTURE DATE = "+dat);%><br><%
out.print("TRAIN NUMBER   = "+t_num);%><br><%
out.print("COACH NO = "+coach);%></h4>

<table id="customers">
	<tr>
	<th>S.NO</th>
	<th>NAME</th>
	<th>AGE</th>
	<th>GENDER</th>
	<th>SEAT NO</th>
	</tr>
	<tr>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(5)%></td>
		<td><% seats=rs.getString("seat_no");
 ss=Integer.parseInt(seats);
if(ss>18)
{
	ss=ss-18;
	out.print("WL/");
	out.print(ss);
}
else
{
	out.print("CNF/");
	out.print(ss);
}


   %></td>
	</tr>
<%
while(rs.next())
{%>
	<tr>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getString(5)%></td>
		<td><% seats=rs.getString("seat_no");
 ss=Integer.parseInt(seats);
if(ss>18)
{
	ss=ss-18;
	out.print("WL/");
	out.print(ss);
}
else
{
	out.print("CNF/");
	out.print(ss);
}


   %></td>
	</tr>
  <%}%>
</table>
<br></center>
</div></body>
</html>