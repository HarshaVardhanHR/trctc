<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
        <%String name= request.getParameter("f");
    String qn=request.getParameter("e");
    String ans= request.getParameter("g");
    String psw = request.getParameter("psw");
    Connection con=null;
  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
    Statement statement=con.createStatement();
    String command="select email,securityq,securitya from reg_user where email='"+name+"' and securityq='"+qn+"' and securitya='"+ans+"'";
    ResultSet rs=statement.executeQuery(command);
    if(rs.next())
    	{
    		String query="update reg_user set password='"+psw+"' where email='"+name+"'";
    		statement.executeUpdate(query);
    		response.sendRedirect("login.html");
    	}
    else
    	{
    		response.sendRedirect("forgetpass1.jsp");
    	}
 %>