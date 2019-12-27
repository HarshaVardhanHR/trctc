<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<form method="post">
	<input type="text" name="a" />
	<input type="submit" />
</form>
</body>
</html>
        <%@ page import="java.sql.*" %>
<%
String ab=request.getParameter("a");
String show="";
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","Madurai123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("insert into troop values('"+ab+"')");
if(rs.next())
{}
%>