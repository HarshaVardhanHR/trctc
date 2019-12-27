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
<body><br><br><br><br><br><br><br><br><br><center><div class="container">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<h2><%=session.getAttribute("a")%>
<%=session.getAttribute("src")%>
<%=session.getAttribute("dest")%>
<%=session.getAttribute("dat")%>
<%=session.getAttribute("t_num")%>
<%=session.getAttribute("coach")%>
<%=session.getAttribute("pass_no")%>
<%=session.getAttribute("dist")%></h2>
<%
String coach=(String)session.getAttribute("coach");
String t_num=(String)session.getAttribute("t_num");
String dist=(String)session.getAttribute("dist");
String pass_no=(String)session.getAttribute("pass_no");
String fa="",total_fare="",fare="";
Float dist1=Float.parseFloat(dist);
Float fa1,far,tot_fare;
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select "+coach+" from fare where train_type=(select type from train_info where train_no='"+t_num+"') ");
if(rs.next())
	fa=rs.getString(1);
fa1=Float.parseFloat(fa);
far=fa1*dist1;%><%
int num=Integer.parseInt(pass_no);
tot_fare=far*num;
total_fare=tot_fare.toString();
fare=far.toString();
session.setAttribute("total_fare",total_fare);
session.setAttribute("fare",fare);
response.sendRedirect("insert_pass.jsp");
%>