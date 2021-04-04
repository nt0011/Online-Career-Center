<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationEmp.aspx.cs" Inherits="Online_Career_Center.RegistrationEmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Here!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/69275.png') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto">

    <form id="form1" runat="server">

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
    <br /><br /><br /><br />
    <div class="container">
    
        <div class="list-group">
        <div class ="list-group-item">
            <div class="list-group-item bg-secondary">Enter your details</div>
            <table class="table">
            <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
            <td><asp:TextBox ID="txtEmpEmail" runat="server" /></td>
            <td><asp:RegularExpressionValidator ControlToValidate="txtEmpEmail" ID="revEmpEmail" runat="server" 
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
            
            <tr><td><asp:Label Text="Street Address:" runat="server" /></td>
            <td><asp:TextBox ID="txtAddress" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtAddress" ID="rfvAddress" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>

            <tr><td><asp:Label Text="City:" runat="server" /></td>
            <td><asp:TextBox ID="txtCity" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtCity" ID="rfvCity" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>

            <tr><td><asp:Label Text="State" runat="server" /></td>
            <td><asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateName" 
                DataValueField="StateCode"></asp:DropDownList></td>
            <td><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                SelectCommand="SELECT * FROM [States] ORDER BY [StateCode]" ></asp:SqlDataSource></td>
            <td><asp:RequiredFieldValidator ControlToValidate="ddlState" ID="rfvState" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>

            <tr><td><asp:Label Text="Zipcode:" runat="server" /></td>
            <td><asp:TextBox ID="txtZipcode" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtZipcode" ID="rfvZipcode" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator></td></tr>
            

            <tr><td><asp:Label Text="Phone Number:" runat="server" /></td>
            <td><asp:TextBox ID="txtPhoneNumber" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtPhoneNumber" ID="rfvPhoneNumber" runat="server" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator></td>
            <td><asp:RegularExpressionValidator ControlToValidate="txtPhoneNumber" ID="revPhoneNumber" runat="server"
                ErrorMessage="Invalid Format. Use this format: XXX-XXX-XXXX" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td></tr>

            <tr><td><asp:Label Text="Company Name:" runat="server" /></td>
            <td><asp:TextBox ID="txtCompName" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtCompName" ID="rfvCompName" runat="server" 
                ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>

            <tr><td><asp:Label Text="Password:" runat="server" /></td>
            <td><asp:TextBox ID="txtPassword" runat="server" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtPassword" ID="rfvPassword" runat="server" 
                ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>

            <tr><td colspan="2"><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" /></td></tr>

        </table>
        </div></div>
          </div>
      
        </form>
</body>
</html>


