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
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=email]{
  width: 100%;
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
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  opacity:0.7;
}
</style>
</head>
<body>

<h3 style="color:green;">Signup</h3>
<form method="get" action="menu page.html">

<div class="container">
  <for>
    <label for="fname">Name</label>
    <input type="text" id="fname" name="a" placeholder="Your name..">
    <label for="ge">Gender</label><br>
   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="radio" id="ge" name="c" value="male">Male<br>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="radio" id="ge" name="c" value="female">Female<br>
    <label>Age</label>
    <input type="Number" id="age" name="d" placeholder="Your age..">
    <label>Phone Number</label>
    <input type="Number" id="ph" name="h" placeholder="Your Phone no..">
    <label>Email</label>
    <input type="email" id="email" name="f" placeholder="Your email..">
    <label>Password</label>
    <input type="password" id="password" name="i" placeholder="Your password..">
       <label for="Security">Security Question</label>
    <select id="Security" name="e">
      <option value="1">What is your favorite Colour?</option>
      <option value="2">What is your favorite Number?</option>
      <option value="3">What is your pet's name?</option>
      <option value="4">What is your favorite Place?</option>
    </select>
    <label>Security Answer</label>
    <input type="text" id="ans" name="g" placeholder="Answer please.....">
    <center><input type="submit" value="Submit"></center>
  </form>
</div>
</body>
<%@ page import="java.sql.*" %>
  <%Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:trctc","system","sollamudiyathu");%>
<%
    String name= request.getParameter("a");
    String gender=request.getParameter("c");
    String ph= request.getParameter("h");
    String email = request.getParameter("f");
    String age = request.getParameter("d");
    String password = request.getParameter("i");
    String secqs= request.getParameter("e");
    String secans= request.getParameter("g");
    Statement stmt=con.createStatement();
    String command="insert into reg_user values('"name+"','"+gender+"','"+age+"','"+ph+"','"+password+"','"+email+"','"+secqs+"','"+secans+"')"
    ResultSet rs=stmt.executeUpdate(command);
%>
</html>
