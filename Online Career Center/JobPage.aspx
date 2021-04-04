<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobPage.aspx.cs" Inherits="Online_Career_Center.JobPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Page</title>
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
    <div class="container">
    <form id="form1" runat="server">
        <div class="list-group">
        <div class ="list-group-item">
            <div class="list-group-item bg-secondary">Enter your details</div>
            <table class="table">

            <tr><td><asp:Label runat="server" ID="lblJobID" ></asp:Label></td></tr>

            <tr><td><asp:Label runat="server" ID="lblDesig" ></asp:Label></td></tr>

            <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
            <td><asp:TextBox ID="txtAppEmail" runat="server" /></td>
            <td><asp:RegularExpressionValidator ControlToValidate="txtAppEmail" ID="revAppEmail" runat="server" 
                ErrorMessage="Invalid Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td></tr>

            <tr><td><asp:Label Text="First Name:" runat="server" /></td>
            <td><asp:TextBox ID="txtFirstName" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtFirstName" ID="rfvFirstName" runat="server" 
                ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>
        
            <tr><td><asp:Label Text="Last Name:" runat="server" /></td>
            <td><asp:TextBox ID="txtLastName" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtLastName" ID="rfvLastName" runat="server" 
                ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>                       

            <tr><td><asp:Label Text="Resume:" runat="server" /></td>
            <td><asp:FileUpload runat="server" ID="flResume" /></td>
                <td><asp:Label runat="server" ID="lblResume" ForeColor="Green"></asp:Label></td>
            <td><asp:RequiredFieldValidator ControlToValidate="flResume" ID="rfvCity" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>    
                
            <tr><td><asp:Label runat="server" ID="lblDatelabel" Text="Date"></asp:Label></td>
                <td><asp:Label runat="server" ID="lblDate"></asp:Label></td>
            </tr>
                <tr><td><asp:Label Text="Phone Number:" runat="server" /></td>
            <td><asp:TextBox ID="txtPhoneNumber" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtPhoneNumber" ID="rfvPhoneNumber" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator></td>
            <td><asp:RegularExpressionValidator ControlToValidate="txtPhoneNumber" ID="revPhoneNumber" runat="server"
                ErrorMessage="Invalid Format. Use this format: XXX-XXX-XXXX" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td></tr>

            <tr><td colspan="2"><asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="BtnApply_Click" /></td></tr>

        </table>
        </div></div>
        <div class="list-inline">
            <asp:Label runat="server" ID="lblMessage"></asp:Label><br />
            <asp:Label runat="server" ID="lblAccount" ForeColor="Green"></asp:Label>
        </div>
    </form>
        </div>
</body>
</html>
