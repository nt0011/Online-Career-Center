<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetApplicants.aspx.cs" Inherits="Online_Career_Center.GetApplicants" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>See the Applicants</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/105093.jpg') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto">
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
        
        <div class="align-top">
    <asp:Label runat="server" ID="lblJobID" Visible="false"></asp:Label>
            <asp:Label runat="server" ID="lblEmpEmail" Visible="false" ></asp:Label>
</div>        
           <br /><br /> 
<asp:GridView runat="server" ID="grdGetApplicant" AllowPaging="True" OnRowCommand="grdGetApplicant_RowCommand" AllowSorting="True" AutoGenerateColumns="False" 
    DataKeyNames="Applied_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" 
    BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Vertical" ForeColor="Black">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="Applied_ID" HeaderText="Application ID" ReadOnly="True" SortExpression="Applied_ID" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="First_Name" HeaderText="First Name" SortExpression="First_Name" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Last_Name" HeaderText="Last Name" SortExpression="Last_Name" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Applicant_Email" HeaderText="Applicant Email" SortExpression="Applicant_Email" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Job_ID" HeaderText="Job ID" SortExpression="Job_ID" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" SortExpression="Phone_Number" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:HyperLinkField DataNavigateUrlFields="Resume" HeaderText="Resume [Pdf]" Text="View and Download">
        <ItemStyle HorizontalAlign="Center" />
        </asp:HyperLinkField>
        <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="btnSend" runat="server" CausesValidation="false" Text="Send message to the applicant" 
                           CommandArgument='<%# Eval("Job_ID")+","+Eval("Designation")+","+Eval("Applicant_Email") %>' 
                          CommandName="JobIDnDesnAppEmail" BackColor="RoyalBlue" />
                  </ItemTemplate>
            </asp:TemplateField>
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
                SelectCommand="SELECT * FROM [ApplicantDetails] WHERE ([Job_ID] = @Job_ID)" >               
                
                <SelectParameters>
                    <asp:SessionParameter Name="Job_ID" SessionField="JobID" Type="String" />
                </SelectParameters>
                
            </asp:SqlDataSource>
    </form>
</body>
</html>

