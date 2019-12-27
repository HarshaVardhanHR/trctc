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
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=password]{
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
  border-radius: 10px;
  background-color: #f2f2f2;
  padding: 20px;
  opacity:0.7;
  width:40%;
}
</style>
</head>
<body>

<h3 style="color:green;">Forget Password</h3>
<form method="post" action="forgetpass2.jsp"><BR><BR><BR><BR>
<center>
<div class="container">
  <for>
        <label>User id</label><br>
    <input type="email" id="email" name="f" placeholder="Your email.." required><br>
    
       <label for="country">Security Question</label><br>
    <select id="country" name="e">
      <option value="1">What is your favorite Colour?</option>
      <option value="2">What is your favorite Number?</option>
      <option value="3">What is your pet's name?</option>
      <option value="4">What is your favorite Place?</option>
    </select><br>
    <label>Security Answer</label><br>
    <input type="text" id="ans" name="g" placeholder="Answer please....." required><br>
    <label for="psw">Password</label></br>
    <input type="password" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
<h3 style="color:red;">**Check User id</h3>

    <center><input type="submit" value="Submit"></center>
  </form>

</div></center>
</body>
</html>
