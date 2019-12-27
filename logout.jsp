<%
session.setAttribute("a", null);
session.invalidate();
response.sendRedirect("login.html");
%>