<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminViewPage.aspx.cs" Inherits="Online_Career_Center.AdminViewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-inline" style="text-align:left; font-size:large;">
            <br /><br /><br /><br />
            <asp:Button runat="server" ID="BtnApplicant" Text="Manage Applicants" OnClick="BtnApplicant_OnClick" />
            <asp:Button runat="server" ID="BtnEmployer" Text="Manage Employers" OnClick="BtnEmployer_OnClick" />
            <asp:Button runat="server" ID="BtnJob" Text="Manage Jobs" OnClick="BtnJob_OnClick" />
            <asp:Button runat="server" ID="BtnNewsletter" Text="Manage Subscribers" OnClick="BtnNewsletter_OnClick" />
        </div>
    </form>
</body>
</html>
