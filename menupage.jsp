<html>
<head>
	<title>TRCTC</title>
  <link rel="icon" type="image/icon" href="train18.jpg">

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<style>
		.navi_ri8{
			font-size: 30;
			float: right;
			color: white;
	    }
		.navi_left{
			float: right;
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

		a.menu:link{
			text-shadow: 3px 2px grey;
			text-decoration: none;
            color: cyan; 
            font-family: cooper black;
            font-size: 24;
            padding-top: 10;

		}
		a.menu:hover{
            text-decoration: underline;
            color: violet;
            font-size: 34;
		}
		a.menu:visited{
			color: yellow;
		}
		a.menu:visited:hover{
			color: violet;
		}
		a.menu:active{
			color: red;
		}
		.row:after{
            content:"";
            display:"table";
            clear:"both";

		}
		.column2{
			
			width:100%;
			height: 30%;
			background-color: rgba(0,0,0,0.5);
		    font-family: cooper;
		    color: white;
		    word-spacing: 70px;
		}
		.bor{
			border-style: solid;
			border-width: 5px;
		    border-radius: 8px;
			background-color: rgba(255,0,0,0.5);
		}
		.brand{
			border-style: dashed solid;
			border-width: 3px;
			border-radius: 10px;
			border-color: #36D7B7;
			width: 30%;
			float: left;
			height: 35%;   
		}
		.offer{
			border-style: dashed solid;
			border-width: 3px;
			border-radius: 10px;
			border-color: #36D7B7;
			width: 30%;
			float: right;
			height: 35%;
		}
		.over{
			overflow-y: auto;
			font-family: gabriola;
			font-size: 25;
		    height: 70%;
		    background-color: rgba(255,0,0,0.3);
		}
		.change{
			width: 20%;
			height: 20%;
			color: black;
			border-style: solid;
			border-radius: 20px;
			border-width: 5px;
			border-color: white;
			animation: myanimation 3s  infinite;
			font-family: harrington;
			font-weight: bold;
		}
		@keyframes myanimation{
			0%{background-color: cyan;}
			50%{background-color: yellow;}
			100%{background-color: cyan;}
		}
	</style>
</head>
<body background="train18.jpg" style="background-repeat: no-repeat; background-size:cover;">
<nav style=" width: 100%" class="navi_left">
	<a class="navi" href="myaccount.jsp">My_Account</a>
	<a class="navi" href="PAL4.html">About</a>
	<a class="navi" href="contact us.html">Contact</a>
	<a class="navi" href="logout.jsp">Logout</a>
</nav>


<p style="font-family: chiller"><font color="black">
<b><div><center>
</p></b></center>

</div>
</font>
<br>
<div class="row">


<div class="column2" style="padding-top: 20px">	
	<br><br>
    <img src="train3.jpg" style="border-style: dashed;border-color: rgba(0,0,0,0.4);border-radius: 7px" alt="trctc" height="100" width="100" />
    <right>	
	<a class="menu" href="booking_entry.jsp"><font color="red">Book_Ticket</font></a>
	<a class="menu" href="pnr_enquiry_entry.jsp">PNR_Enquiry</a>
	<a class="menu" href="mybooking1.jsp">My_Bookings</a>
	<a class="menu" href="availability.jsp">Availability</a>
    </right>
</div>

</div>
</center>
<hr style="background-color: rgba(0,0,0,0.5);">
<br>
</left>
<!--
<div class="offer">
	<h1 style="font-family: forte;font-size: 20;margin-left: 5">Announcements</h1>
	<div class="over">
		<ul>
			<li><marquee>New train to Coimbatore</marquee></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>-->
<br><br><br><br><br>
</body>
</html>
<%=session.getAttribute("a")%>