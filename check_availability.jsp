<!DOCTYPE html>
<html>
<head>
  <title>TRCTC</title>
  <link rel="icon" type="image/icon" href="train3.jpg">

<meta name="viewport" content="width=device-width, initial-scale=1">
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
			font-family: sans-serif;
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
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=email]{
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=date]{
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=number]{
  width: 80%;
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
  opacity:0.8;
  width:40%;
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
h2
{
	display: none;
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
</nav>
	<br><br><br><br><center>
<div class="container">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<h2><%=session.getAttribute("a")%>
<%=session.getAttribute("src")%>
<%=session.getAttribute("dest")%>
<%=session.getAttribute("dat")%></h2>
<%String t_num=request.getParameter("t_num");%>
<%String src=request.getParameter("src");%>
<%String dest=request.getParameter("dest");%>
    <% session.setAttribute("t_num",t_num);%>
    <% String dat=(String)session.getAttribute("dat"); %>
<%Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select coach_no,seat_no from coaches where train_no='"+t_num+"' and departure_date='"+dat+"'");
String avail;
int x=0;
int y=0;
%>
<form method="post" action="book_ticket.jsp">
<table id="customers">
		<tr>
			<th>Class</th>
			<th>Availability</th>
      <th>Booking</th>
        </tr>
<%
while(rs.next())
{
	avail=rs.getString("seat_no");
	x=Integer.parseInt(avail);
	y=18-x;
	%><tr>
		<td><%=rs.getString("coach_no")%></td>
		<td><% if(y>0)
      {out.print("AVAILABLE ");
      out.print(y);
        }
      else
      {out.print("WL ");
       out.print(-y);}%></td>
       <td><button name="coach" type="submit" value="<%out.print(rs.getString("coach_no"));%>">book now</button></td>
	</tr>
<%
} 
%>
</table>
<br>

	No.of passengers<input type="number" name="pass_no" max="6" value="6" /><br>
	<input type="submit" value="book" /><br>
</form>
</div></center>
</body>
</html>
<% 
//else 
//response.sendRedirect("booking.html");
%>