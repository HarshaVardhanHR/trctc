<!DOCTYPE html>
<html>
<head>
	<title>TRCTC</title>
  <link rel="icon" type="image/icon" href="train3.jpg">

</head>
<style>
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
  width:40%;
  color: white;
}
</style>
<body><h2><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1" %>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%></h2>
<%Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
String user=(String)session.getAttribute("a");
ResultSet rs=st.executeQuery("select * from reg_user where user_id='"+user+"'");%>
<h3 style="color:green;">My Account</h3>
<br><br><br><br><br><br>
  <center><div class="container"><br><br>
<table id="customers">
<%
while(rs.next())
  {
  %><tr>
    <tr><th>Name</th>
    <td><%=rs.getString(1)%></td></tr>
    <tr><th>Gender</th>
    <td><%=rs.getString(2)%></td></tr>
    <tr><th>Age</th>
    <td><%=rs.getString(3)%></td></tr>
    <tr><th>Mob_number</th>
    <td><%=rs.getString(4)%></td></tr>
    </tr><%
  }
%>
</table><br><br></div></center>
</body></html>
