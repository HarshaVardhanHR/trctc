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
  width:100%;
}
h2
{
	display: none;
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %><h2>
<%=session.getAttribute("a")%>
<%=session.getAttribute("src")%>
<%=session.getAttribute("dest")%>
<%=session.getAttribute("dat")%>
<%=session.getAttribute("t_num")%>
<%=session.getAttribute("coach")%>
<%=session.getAttribute("pass_no")%>
<%=session.getAttribute("dist")%>
<%=session.getAttribute("total_fare")%>
<%=session.getAttribute("fare")%></h2>
<%
String total_fare=(String)session.getAttribute("total_fare");
String fare=(String)session.getAttribute("fare");
String num=(String)session.getAttribute("pass_no");
String cnt;
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();%><h3 style="color:green;">Fare Details</h3><h3 style="color:red;font-family:harlow solid"><%
out.print("Amount per person  "+fare);%><br><%
out.print("Total amount for  "+num+" persons is "+total_fare);
%></h3>
<h3 style="color:green;">Passenger Details</h3>
<form method="post" action="insertion.jsp"><br><br><br>
<center><div class="container">
<h3 style="color:red;">Passengers </h3>
<% int i=0,n=0;
n=Integer.parseInt(num);
for (i=0;i<n ;i++ ) {

 %>
    <input type="text" id="ans" name="a" placeholder="Name....." value="aaa" required>
    <input type="text" id="an" name="b" placeholder="Age....." value="12" required>
   <input type="text" id="ge" name="c" placeholder="Gender....." value="male" required>
<%}%>
<br>
<a href="menupage.jsp"><input type="button" value="  Cancel  " ></a>&emsp;&emsp;&emsp;&emsp;&emsp;

</form><input type="submit" value="  Submit  " ></form></div></center>
