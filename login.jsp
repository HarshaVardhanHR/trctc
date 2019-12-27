<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
 String a=request.getParameter("a");
String b=request.getParameter("psw");
Connection con=null;
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
    Statement statement=con.createStatement();
    String command="select user_id,password from reg_user where user_id='"+a+"' and password='"+b+"'";
    ResultSet rs=statement.executeQuery(command);
    if (rs.next()) {
        session.setAttribute("a", a);
    	response.sendRedirect("menupage.jsp");
    }
    else{
    response.sendRedirect("login1.html");
}
%>