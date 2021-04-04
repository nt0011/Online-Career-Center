<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMessagetoApp.aspx.cs" Inherits="Online_Career_Center.SendMessagetoApp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Messaging the Applicant</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/105093.jpg') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto">
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
            <div class="list-group-item bg-secondary">Send your message:</div>
            <table class="table">
            <tr><td><asp:Label Text="Applicant Email:" runat="server" /></td>
            <td><asp:Label runat="server" ID="lblAppEmail"></asp:Label></td></tr>           

            <tr><td><asp:Label Text="Job ID:" runat="server" /></td>
            <td><asp:Label runat="server" ID="lblJobID"></asp:Label></td></tr> 

            <tr><td><asp:Label Text="Designation:" runat="server" /></td>
            <td><asp:Label runat="server" ID="lblDesignation"></asp:Label></td></tr>
                
            <tr><td><asp:Label Text="Employee Email:" runat="server" /></td>
            <td><asp:Label runat="server" ID="lblEmpEmail"></asp:Label></td></tr>

            <tr><td><asp:Label Text="Message:" runat="server" /></td>
            <td><asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" MaxLength="3000" /></td>
            <td><asp:RequiredFieldValidator ControlToValidate="txtMessage" ID="rfvMessage" runat="server" ForeColor="Red" 
                 ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td></tr>
            
            <tr><td colspan="2"><asp:Button ID="btnSend" runat="server" Text="Send" OnClick="BtnSend_Click" /></td></tr>              

        </table>
                        <asp:Label runat="server" ID="lblConfirm"></asp:Label>

        </div></div>        </div>

    </form>
</body>
</html>

