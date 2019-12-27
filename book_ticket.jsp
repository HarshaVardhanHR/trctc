<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%>
<%=session.getAttribute("src")%>
<%=session.getAttribute("dest")%>
<%=session.getAttribute("dat")%>
<%=session.getAttribute("t_num")%>

<%
String t_num=(String)session.getAttribute("t_num");
String dest=(String)session.getAttribute("dest");
String src=(String)session.getAttribute("src");
String coach=request.getParameter("coach");
String pass_no=request.getParameter("pass_no");
session.setAttribute("coach",coach);
session.setAttribute("pass_no",pass_no);
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select distinct((select km  from train_schedule where train_no='"+t_num+"' and station_id='"+dest+"')-(select km  from train_schedule where train_no='"+t_num+"' and station_id='"+src+"')) as  from fare");
String dist="";
if(rs.next()){
//while(rs.next())
dist=rs.getString(1);
session.setAttribute("dist",dist);
out.print(dist);
response.sendRedirect("book_ticket1.jsp");
}%>




