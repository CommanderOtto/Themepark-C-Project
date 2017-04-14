<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="Registration2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Raju's World - Login</title>
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
			<li><a href="login.html">Login/Registration</a></li>
			<li><a href="elements.html">Elements</a></li>
		</ul>
	</nav>

	<div class="container">
		<h1 class="well">Account Registration</h1>
		<div class="col-lg-12 well">
			<div class="row">
				<form id="Registration_Form" runat="server">
                    <div>
                        <asp:ValidationSummary runat="server" ID="summary" Style="color: Red" DisplayMode="BulletList" HeaderText="<b>Please review the following errors:</b>" />
                    </div>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
                                <asp:Label Text="First Name" runat="server" />
                                <asp:TextBox ID="FirstName_Form" runat="server" placeholder="Enter First Name Here.." class="form-control" />
                                <asp:RequiredFieldValidator ID="ValidateFirstName" Display="dynamic" Style="color: Red" ErrorMessage="*First Name is Required" SetFocusOnError="true" ControlToValidate="FirstName_Form" runat="server" Text="*" />
							</div>
							<div class="col-sm-6 form-group">
                                <asp:Label Text="Last Name" runat="server" />
                                <asp:TextBox ID="LastName_Form" runat="server" placeholder="Enter Last Name Here.." class="form-control"/>
                                <asp:RequiredFieldValidator ID="ValidateLastName" Display="dynamic" Style="color: Red" ErrorMessage="*Last Name is Required" SetFocusOnError="true" ControlToValidate="LastName_Form" runat="server" Text="*" />
							</div>
						</div>					
						<div class="form-group">
                            <asp:Label Text="Address" runat="server" />
                            <asp:TextBox ID="Address_Form" runat="server" placeholder="Enter Address Here.." TextMode="MultiLine" rows="3" class="form-control" />
							<asp:RequiredFieldValidator ID="ValidateAddress" Display="dynamic" Style="color: Red" ErrorMessage="*Address is Required" SetFocusOnError="true" ControlToValidate="Address_Form" runat="server" Text="*" />
                        </div>	
						<div class="row">
							<div class="col-sm-4 form-group">
                                <asp:Label Text="City" runat="server" />
                                <asp:TextBox ID="City_Form" runat="server" placeholder="Enter City Name Here.." class="form-control"/>
								<asp:RequiredFieldValidator ID="ValidateCity" Display="dynamic" Style="color: Red" ErrorMessage="*City is Required" SetFocusOnError="true" ControlToValidate="City_Form" runat="server" Text="*" />
                            </div>	
							<div class="col-sm-4 form-group">
                                <asp:Label Text="State" runat="server" />
                                <asp:TextBox ID="State_Form" runat="server" placeholder="Enter State Name Here.." class="form-control"/>
                                <asp:RequiredFieldValidator ID="ValidateState" Display="dynamic" Style="color: Red" ErrorMessage="*State is Required" SetFocusOnError="true" ControlToValidate="State_Form" runat="server" Text="*" />
                            </div>	
							<div class="col-sm-4 form-group">
                                <asp:Label Text="Zip" runat="server" />
                                <asp:TextBox ID="Zip_Form" runat="server" placeholder="Enter Zip Code Here.." class="form-control"/>
								<asp:RequiredFieldValidator ID="ValidateZip" Display="dynamic" Style="color: Red" ErrorMessage="*Zip Code is Required" SetFocusOnError="true" ControlToValidate="Zip_Form" runat="server" Text="*" />
                            </div>	
						</div>
												
						<div class="form-group">
                            <asp:Label Text="Phone Number" runat="server" />
                            <asp:TextBox ID="Phone_Form" runat="server" placeholder="Enter Phone Number Here.." class="form-control"/>
						    <asp:RequiredFieldValidator ID="ValidatePhone" Display="dynamic" Style="color: Red" ErrorMessage="*Phone Number is Required" SetFocusOnError="true" ControlToValidate="Phone_Form" runat="server" Text="*" />
                        </div>		
						<div class="form-group">
                            <asp:Label Text="Email" runat="server" />
                            <asp:TextBox ID="Email_Form"  runat="server" placeholder="Enter Email Address Here.." class="form-control"/>
						    <asp:RequiredFieldValidator ID="ValidateEmail" Display="dynamic" Style="color: Red" ErrorMessage="*Email is Required" SetFocusOnError="true" ControlToValidate="Email_Form" ValidationExpression=".*@.{2,}\..{2,}" runat="server" Text="*" />
                        </div>
                        <div class="row">
                            <div class="col-sm-4 form-group">
                                <asp:Label Text="Password" runat="server" />
                                <asp:TextBox ID="Password_Form" runat="server" TextMode="Password" placeholder="Enter Password Here.." class="form-control"/>
						        <asp:RequiredFieldValidator ID="ValidatePassword" Display="dynamic" Style="color: Red" ErrorMessage="*Password Required. It must be between 8 and 10 characters, contain at least one digit and one alphabetic character, and must not contain special characters" SetFocusOnError="true" ControlToValidate="Password_Form" runat="server" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" Text="*" />
                            </div>
                            <div class="col-sm-4 form-group">
                                <asp:Label Text="Confirm Password" runat="server" />
                                <asp:TextBox ID="ConfirmPassword_Form" runat="server" TextMode="Password" placeholder="Enter Password Here.." class="form-control"/>
						        <asp:RequiredFieldValidator ID="ValidateConfirmPassword" Display="dynamic" Style="color: Red" ErrorMessage="*Please confirm your password" SetFocusOnError="true" ControlToValidate="Password_Form" runat="server" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" Text="*" />
                                <asp:CompareValidator ErrorMessage="Both passwords must match" ControlToValidate="ConfirmPassword_Form" ControlToCompare="Password_Form" runat="server" Text="*" Style="color: Red"/>
                            </div>
                        </div>
                        <div>
                            <asp:Button ID="RegistrationSubmit" Text="Submit" runat="server" class="btn btn-lg btn-info" OnClick="RegistrationSubmit_Click"/>				
						</div>

					</div>
				</form> 
			</div>
		</div>
	</div>
</body>

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


</html>
