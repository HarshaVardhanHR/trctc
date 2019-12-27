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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
        <%
    String src= request.getParameter("src");
    String dest=request.getParameter("dest");
    String dat=request.getParameter("dat");
    out.print(dat);
    String i="/0";

    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
    Statement statement=con.createStatement();
  if(src==dest)
    response.sendRedirect("booking1.html");
    String command="select t.train_no,t.train_name,s.departure_time_hr,s.departure_time_min,w.arrival_time_hr,w.arrival_time_min,((select km from train_schedule where train_no=t.train_no and station_id='"+dest+"')-(select km  from train_schedule where train_no=t.train_no and station_id='"+src+"'))as distance from  train_info t inner join train_schedule s on t.train_no=s.train_no inner join train_schedule w on t.train_no=w.train_no where s.station_id='"+src+"' and w.station_id='"+dest+"' and s.stop_no < any (select distinct w.stop_no from train_info q inner join train_schedule w on q.train_no=w.train_no where q.train_no=s.train_no and w.station_id='"+dest+"')";
    ResultSet rs=statement.executeQuery(command);
    String x1;
    String t1;
    Integer t;
    int x;
    int y=0;
    if(src==dest)
    response.sendRedirect("booking1.html");

    if (src!=dest) {
    %><h3 style="color:green;">Available Trains</h3><br><br><br><center>
<div class="container">
   <table id="customers"> <tr>
            <th>Train No</th>
            <th>Name</th>
            <th>Departure</th>
            <th>Arrival</th>
            <th>Day</th>
            <th>Distance</th>
        </tr>
    <%
    	while(rs.next())
    	{
    		 x1=rs.getString("arrival_time_hr");
             x=Integer.parseInt(x1);
    		if(x>100)
    		{
    			x=x-100;
    			y=1;
    		}
    		%>
            
    		<tr>
    		<td><%=rs.getString("train_no")%></td>
    		<td><%=rs.getString("train_name")%></td>
    		<td><% t1=rs.getString("departure_time_hr");
                 t=Integer.parseInt(t1);
                 if(t<10)
                 {
                  out.print("0"+t+":");
                 }
                 else
                 {
                  out.print(t+":");
                 }
             %>
             <% t1=rs.getString("departure_time_min");
                t=Integer.parseInt(t1);
                 if(t<10)
                 {
                  out.print("0"+t);
                 }
                 else
                 {
                  out.print(t);
                 }


             %></td>
    		<td><% if(x<10)
                 {
                  out.print("0"+x+":");
                 }
                 else
                 {
                  out.print(x+":");
                 }
                 %>
                 <% t1=rs.getString("arrival_time_min");
                      t=Integer.parseInt(t1);
                 if(t<10)
                 {
                  out.print("0"+t);
                 }
                 else
                 {
                  out.print(t);
                 }
                 %></td>
    		<td><% out.print(y);%></td>
    		<td><%=rs.getString("distance")%><%out.print(" KM"); %></td>
    		</tr>

    	<%}%></table><%
    }%>

    <h3 style="color:red;">Please enter the train number to check the availability</h3>    
    <form method="post" action="check_availability.jsp">
    	<input type="text" name="t_num" value="1211">
    	<input type="submit" value="check Availability">
        
    	<% session.setAttribute("dest", dest);%>
    	<% session.setAttribute("src", src);%>
        <% session.setAttribute("dat", dat);%>
    </form></div></center>
    </body>
    </html>