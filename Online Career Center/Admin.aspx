<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Online_Career_Center.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="Homepage.aspx">Online Career Center</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="ContactUs.aspx">Contact Us <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="AboutUs.aspx">About Us</a>
      </li>
    </ul>
    
  </div>
</nav>
    <form id="form1" runat="server">
        <br /><br /><br />
        <div class="container">
            <table class="table table-borderless" style="font-family:Calibri ;border-radius:15px; background-color:white; width:600px;" >
            <tr><asp:Label Text="ADMIN LOGIN:" runat="server" style="text-align:center; font-size:large" /></tr>
            <tr><td><asp:Label Text="User Name" runat="server" /></td>
            <td><asp:TextBox ID ="txtUsername" runat="server" /></td></tr>
            <tr><td><asp:Label Text="Password" runat="server" /></td>
            <td><asp:TextBox ID ="txtPassword" runat="server" TextMode="Password" /></td></tr>
            <tr><td></td><td colspan="2"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click"  /></td></tr>
            </table>
        </div>
    </form>
</body>
</html>