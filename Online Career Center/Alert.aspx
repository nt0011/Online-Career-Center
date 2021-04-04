<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alert.aspx.cs" Inherits="Online_Career_Center.Alert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Message from Employers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/48087.jpg') no-repeat 100% 0; background-size:cover; overflow:auto">  
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
    <br /><br />
    <div class="container-fluid">
        <form id="form1" runat="server">
        <asp:GridView runat="server" ID="grdAlert" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="SqlDataSource1" DataKeyNames="Alert_ID" ForeColor="Black" GridLines="Vertical" EmptyDataText="No records found" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Job_ID" HeaderText="Job ID" SortExpression="Job_ID">
                </asp:BoundField>
                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message">
                </asp:BoundField>
                <asp:BoundField DataField="Emp_Email" HeaderText="Employer Email" SortExpression="Emp_Email">
                </asp:BoundField>
                

            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                SelectCommand="SELECT * FROM [Alert] WHERE ([Applicant_Email] = @Applicant_Email) ORDER BY [Job_ID]">
                <SelectParameters>
                    <asp:SessionParameter Name="Applicant_Email" SessionField="AppEmail" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table class="table">
                <tr><td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" BackColor="#FF5050" /></td></tr></table>
    </form>
        </div>
</body>
</html>
