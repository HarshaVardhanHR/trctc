<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
<%=session.getAttribute("a")%>
<%=session.getAttribute("src")%>
<%=session.getAttribute("dest")%>
<%=session.getAttribute("dat")%>
<%=session.getAttribute("t_num")%>
<%=session.getAttribute("coach")%>
<%=session.getAttribute("pass_no")%>
<%=session.getAttribute("dist")%>
<%=session.getAttribute("total_fare")%>
<%=session.getAttribute("fare")%>
<%
String user=(String)session.getAttribute("a");
String total_fare=(String)session.getAttribute("total_fare");
String fare=(String)session.getAttribute("fare");
String num=(String)session.getAttribute("pass_no");
String t_num=(String)session.getAttribute("t_num");
String src=(String)session.getAttribute("src");
String dest=(String)session.getAttribute("dest");
String dat=(String)session.getAttribute("dat");
String coach=(String)session.getAttribute("coach");
String cnt;

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select (select pnr from pnrholder) as temmp ,seat_no from coaches where train_no='"+t_num+"' and departure_date='"+dat+"' and coach_no='"+coach+"'");

String seat_no="0";
String ttt="0";
if(rs.next())
{
seat_no=rs.getString("seat_no");
ttt=rs.getString("temmp");
}
int seat=Integer.parseInt(seat_no);
int tempo=Integer.parseInt(ttt);
int seats=seat;

int seat2;


//session.setAttribute("seat_no",seat_no);
out.print("amount per person"+fare);
out.print("total amount for "+num+" persons is "+total_fare);
String a[]=request.getParameterValues("a");
String b[]=request.getParameterValues("b");
String c[]=request.getParameterValues("c");
int n=Integer.parseInt(num);

int pnr_num=(int)(Math.random() * 100*tempo);

String pnr_number=String.valueOf(pnr_num);
session.setAttribute("pnr_number",pnr_number);
int i=0;
st.executeUpdate("insert into ticket_detail values('"+pnr_number+"','"+src+"','"+dest+"','"+t_num+"','"+dat+"','"+coach+"')");
for (i=0;i<n ;i++ ) {

	seat=seat+1;
	
		seat_no=String.valueOf(seat);
	
	cnt=String.valueOf(i+1);
st.executeUpdate("insert into passenger_info(name,age,gender,seat_no,coach_no,pnr,serial_no,user_id) values('"+a[i]+"','"+b[i]+"','"+c[i]+"','"+seat_no+"','"+coach+"','"+pnr_number+"','"+cnt+"','"+user+"')");
}
response.sendRedirect("success.jsp");
//out.print(a[0]+" "+b[0]+" "+c[0]);
%>