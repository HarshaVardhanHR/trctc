<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*" %>
        <%
    String src= request.getParameter("src");
    String dest=request.getParameter("dest");
    String dat=request.getParameter("dat");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");
    Statement statement=con.createStatement();
    String command="select t.train_no,t.train_name,s.departure_time_hr,s.departure_time_min,w.arrival_time_hr,w.arrival_time_min,((select km from train_schedule where train_no=t.train_no and station_id='"+dest+"')-(select km  from train_schedule where train_no=t.train_no and station_id='"+src+"'))as distance from  train_info t inner join train_schedule s on t.train_no=s.train_no inner join train_schedule w on t.train_no=w.train_no where s.station_id='"+src+"' and w.station_id='"+dest+"' and s.stop_no < any (select distinct w.stop_no from train_info q inner join train_schedule w on q.train_no=w.train_no where q.train_no=s.train_no and w.station_id='"+dest+"')";
    ResultSet rs=statement.executeQuery(command);
    String x1;
    int x;
    int y=1;

    if (src!=dest) {
    %>
    <table border="2px">
    	<tr>
    		<th>Train No</th>
    		<th>Name</th>
    		<th>Departure</th>
    		<th>Arrival</th>
    		<th>Days</th>
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
    			y=2;
    		}
    		%>

    		<tr>
    		<td><%=rs.getString("train_no")%></td>
    		<td><%=rs.getString("train_name")%></td>
    		<td><%=rs.getString("departure_time_hr")+ ":"+rs.getString("departure_time_min")%></td>
    		<td><% out.print(x+":");%><%=rs.getString("arrival_time_min")%></td>
    		<td><% out.print(y);%></td>
    		<td><%=rs.getString("distance")%></td>
    		</tr>

    	<%}%></table><%
    }
    %>
    <!DOCTYPE html>
    <html>
    <head>
    	<title></title>
    </head>
    <body>
    <form method="post" action="check_availability.jsp">
    	<input type="text" name="t_num" />
    	<input type="submit" value="check" />
    	<% session.setAttribute("dest", dest);%>
    	<% session.setAttribute("src", src);%>
        <% session.setAttribute("dat", dat);%>
    </form>
    <%String t_num=request.getParameter("t_num");%>
    <% session.setAttribute("t_num",t_num);%>
    </body>
    </html>