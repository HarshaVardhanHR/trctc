
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
  opacity:0.7;
  width:40%;
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
<h3 style="color:green;">Bookings Search</h3>
<form method="post" action="bookingtrial1.jsp">
<br><br><br><br><br><br>
<center><div class="container">

</form>
<label id="a">source:</label><br>
 <select id="country" name="src" required>
       <option value="" selected>select your source</option>
       <option value="AGC">Agra</option>
       <option value="BPL">Bhopal</option>
       <option value="MS" >Chennai Egmore</option>
       <option value="MAS">Dr .MGR Chennai Central</option>
       <option value="NZM">Hazarat Nizamuddin</option>
       <option value="CAPE">Kanyakumari</option>
       <option value="KPD">Katpadi</option>
       <option value="KQN">kodai Road</option>
       <option value="CVP">Kovilpatti</option>
       <option value="SBC">KSR Bengaluru city</option>
       <option value="MDU">Madurai</option>
       <option value="NCJ">Nagerkovil</option>
       <option value="NGP">Nagpur</option>
       <option value="SRT">Sattur</option>
       <option value="SCT">Sengottai</option>
       <option value="SVKS">Sivakasi</option>
       <option value="SVPR">Srivilliputhur</option>
       <option value="TBM">Tambaram</option>
       <option value="TSI">Tenkasi</option>
       <option value="TPJ">Tiruchirapalli</option>
       <option value="TEN">Tirunelveli</option>
       <option value="VPT">Virudhunagar</option>
       <option value="BZA">Vijayawada</option>
       
    </select><br>
	</label id="b">destination:<label><br>
 <select id="country1" name="dest"  required>
       <option value="" selected>select your destination</option>
       <option value="AGC">Agra</option>
       <option value="BPL">Bhopal</option>
       <option value="MS">Chennai Egmore</option>
       <option value="MAS">Dr .MGR Chennai Central</option>
       <option value="NZM">Hazarat Nizamuddin</option>
       <option value="CAPE" >Kanyakumari</option>
       <option value="KPD">Katpadi</option>
       <option value="KQN">kodai Road</option>
       <option value="CVP">Kovilpatti</option>
       <option value="SBC">KSR Bengaluru city</option>
       <option value="MDU">Madurai</option>
       <option value="NCJ">Nagerkovil</option>
       <option value="NGP">Nagpur</option>
       <option value="SRT">Sattur</option>
       <option value="SCT">Sengottai</option>
       <option value="SVKS">Sivakasi</option>
       <option value="SVPR">Srivilliputhur</option>
       <option value="TBM">Tambaram</option>
       <option value="TSI">Tenkasi</option>
       <option value="TPJ">Tiruchirapalli</option>
       <option value="TEN">Tirunelveli</option>
       <option value="VPT">Virudhunagar</option>
       <option value="BZA">Vijayawada</option>
        
      
      
      

      </select><br>
      
	<label id="c">date:</label><br>
<input type="date" id="c" name="dat" min="2019-12-01" max="2019-12-03" value="2019-12-01"/><br>
	<input type="submit" value="search" /></div></center>
</body>
</html>
<%=session.getAttribute("a")%>
