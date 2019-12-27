<!DOCTYPE html>
<html>
<head>
  <title>TRCTC</title>
  <link rel="icon" type="image/icon" href="train3.jpg">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="refresh" content="4;url=menupage.jsp" />
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
  width:50%;
}
h2
{
	display: none;
}
</style>
</head>
<body><h2>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%></h2>
<%
String pnr_num=request.getParameter("pnr_num");
String seat="";
String s;
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(serial_no) from passenger_info where pnr='"+pnr_num+"'");
rs.next();
	s=rs.getString(1);
	
	int n=Integer.parseInt(s);
for (int i=0;i<n ;i++ ) {
seat=String.valueOf(i+1);
	st.executeUpdate("delete from passenger_info where pnr='"+pnr_num+"' and serial_no='"+seat+"'");
}
st.executeUpdate("delete from ticket_detail where pnr='"+pnr_num+"'");
%><h3 style="color:green;">Ticket Cancellation</h3><center>
	<br><br><br><br><br><br><br><br>
<div class="container">
	<center><h1 style="color:red;">Your Ticket has been cancelled</h1></center>
</div></center></body></html>