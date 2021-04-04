<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsLetter.aspx.cs" Inherits="Online_Career_Center.NewsLetter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Newsletter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script></head>
<body>
    <form id="form1" runat="server">
        <br />
        <div class="container">
            
            <div class="list-group">
                <div class="list-group-item">
            <table runat="server" class="table table-borderless">
                <tr>
                    <td><asp:Label Text="Subscribe to our mailing list" runat="server" ForeColor="Purple" Font-Italic="true" Font-Size="X-Large" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ForeColor="Red" Text="* indicates required field"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblFName" Text="First Name: *"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtFName"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="txtFName" ID="rfvFName" runat="server" ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblLName" Text="Last Name: *"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtLName"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="txtLName" ID="rfvLName" runat="server" ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Email Address: *" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ControlToValidate="txtEmail" ID="revEmail" runat="server" 
                        ErrorMessage="Invalid Format. Use a@b.c" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>                    
                </tr>
                <tr>
                    <td></td><td colspan="2"><asp:Button ID="btnSubscribe" runat="server" CssClass="btn-secondary" Text="Subscribe" OnClick="btnSubscribe_Click"  /></td>
                </tr>
            </table>
                </div></div>
            <asp:Label runat="server" ID="lblMessage" ></asp:Label>
        </div>
    </form>
</body>
</html>

