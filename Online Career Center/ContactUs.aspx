<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Online_Career_Center.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
        <div class="row">
        <div class="col-xs-12 table-responsive" style="text-align:center;">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Type</th>
                        <th>Number/Address</th>
                        <th>Extension</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>General</td><td>555-555-5555</td><td>0</td>
                    </tr>
                    <tr>
                        <td>Customer Service</td><td>555-555-5555</td><td>10</td>
                    </tr>
                    <tr>
                        <td>Billing & Accounts</td><td>555-555-5555</td><td>20</td>
                    </tr>
                    <tr>
                        <td>Mailing Address</td><td>123 SE 4th Ave</td><td></td>
                    </tr>
                    <tr>
                        <td>Email Address</td><td>abcd@onlinecareercenter.com</td><td></td>
                    </tr>
                    <tr>
                        <td>Facebook</td><td>www.facebook.com/onlinecareercenter</td><td></td>
                    </tr>
                    <tr>
                        <td>Twitter</td><td>www.twitter.com/onlinecareercenter</td><td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </form>
</body>
</html>

