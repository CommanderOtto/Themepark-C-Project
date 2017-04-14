<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customerpage.aspx.cs" Inherits="customerpage" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Raju's World - User Home Page</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<!-- Bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<a href="index.html" class="logo"><strong>Raju's World</strong></a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="generic.html">Generic</a></li>
				</ul>
			</nav>

		<!-- Main -->
			<section id="main">
				<div class="inner">
					<div class="image fit">
						<img src="images/themepark2.jpg" alt="" />
					</div>
					<div class="page-header">	
						<h1>Welcome to Raju's World!</h1>
						<p>Below, view our list of attractions and options. Then...</p>
						<p>Follow the instructions below to buy your tickets and start your adventure!</p>
					</div>
					<form runat="server">
					<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="R_Id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="R_Id" HeaderText="R_Id" ReadOnly="True" InsertVisible="False" SortExpression="R_Id" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"></asp:BoundField>
                            <asp:BoundField DataField="HeightLimit" HeaderText="HeightLimit" SortExpression="HeightLimit"></asp:BoundField>
                            <asp:BoundField DataField="AgeLimit" HeaderText="AgeLimit" SortExpression="AgeLimit"></asp:BoundField>
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:oanegronConnectionString %>' SelectCommand="SELECT * FROM [Rides]"></asp:SqlDataSource>
    
						<div class="page-header">
							<h1>Already know what you are looking for? Make the following selections below to buy tickets:</h1>
						</div>
		
						
						<div>
							<h3>Choose Rides and Buy Tickets:</h3>
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="R_Id"></asp:CheckBoxList>
						</div>
						
						<div>
							<h3>Select Meal Plan Value:</h3>
                            <p>With our Meal Plans you can spend the value as you wish at any of our park restaurants and vendors.</p>
						</div>
						
						<div>
							<h3>Platinum Options:</h3>
							<p> 
                            With Platinum Standing you can use the fast-pass line for any ride of your choice.
							On your second visit, you will receive 20% discount and ability to reserve seating on restaurants.
                            This option becomes available when you visit the park at lest 3 times.
							</p>
							
						</div>
						
						<button type="button" class="btn btn-primary">Submit</button>
					</form>
					
					<form>
						<div class="page-header">
							<h1>Have you visited our parks before? Provide a rating of our rides:</h1>
						</div>
						
						<div>
							<h3>Select Ride:</h3>
						</div>
						
						<div>
							<h3>Provide Rating</h3>
							<input type="text" class="form-control" placeholder="Text input">
						</div>
						
						<div id="extrapadding">
							<button type="button" class="btn btn-primary">Submit Rating</button>
						</div>
					</form>
					
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
				</ul>
				<div class="copyright">
					&copy; Raju's World 2017. Otto Negron, Raju Pusapati
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</body>
</html>