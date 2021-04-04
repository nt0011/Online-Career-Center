<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Online_Career_Center.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>

<body style="background:url('Images/48087.jpg') no-repeat 100% 0; background-size:cover; overflow:auto">        
<main>      
     <form id="form1" runat="server" class="form-horizontal">
    
<div class="container">

<nav class="navbar navbar-expand-lg navbar-dark bg-transparent fixed-top" >
  <a class="navbar-brand mb-0 h1" href="Homepage.aspx">Online Career Center</a>
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
        <li class="nav-item">
            <a class="nav-link" href="Admin.aspx">Admin</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="CareerAdvice.aspx">Career Advice</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="NewsLetter.aspx">NewsLetter</a>
        </li>
    </ul>
         <div class="form-inline">
             <div class="form-group">     <%--style="width:10px;text-indent:1em;"--%>
                 <label id="lblKeyword" for="Keyword" style="font-family:Arial; color:azure;">Keyword</label>&nbsp;
                <asp:TextBox runat="server" ID="txtKeyword1"></asp:TextBox>
                 <%-- <input id="txtKeyword" type="text" placeholder="Enter Keyword" name="Keyword" style="font-family:Arial; color:black; border-radius:15px" />--%>
             </div>&nbsp;
             <div class="form-group">
                 <label id="lblLocation" for="Keyword" style="font-family:Arial; color:azure;">Location</label>&nbsp;
                 <asp:TextBox runat="server" ID="txtLocation1"></asp:TextBox>
                 <%--<input id="txtLocation" type="text" placeholder="Enter Location" name="Location" style="font-family:Arial; color:black; border-radius:15px" />--%>
             </div>&nbsp;
             <button id="Search" runat="server" style="font-family:Arial; background-color:lightgreen; text-emphasis-color:greenyellow; border-radius:15px" class="btn btn-outline-success my-2 my-sm-0" type="submit" onserverclick="BtnSearch_Click">Search</button>
             <%--<asp:Button runat="server" CssClass="btn btn-default" ID="BtnSearch" Text="Search" OnClick="BtnSearch_Click" />--%>
         </div>
  </div>   
    </nav>

    <br /><br /><br /><br />
        
         <!--<div class="container" style="width:800px; background-color:white">-->
            <table class="table table-borderless justify-content-center" style="font-family:Calibri ;border-radius:15px; 
                background-color:white; width:600px; margin:auto" >
            <tr><td><asp:Label Text="Already have an account? Sign in" runat="server" /></td><td></td></tr>
            <tr><td><asp:Label Text="Email Address" runat="server" /></td>
            <td><asp:TextBox ID ="txtEmail" runat="server" /></td></tr>
            <tr><td><asp:Label Text="Password" runat="server" /></td>
            <td><asp:TextBox ID ="txtPassword" runat="server" TextMode="Password" /></td></tr>
            <tr><td></td><td colspan="2"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click"  /></td></tr>
            </table><!--</div>-->
           
           <br />

        <!--<div class="container" style="width:800px; background-color:ghostwhite">-->
            <table class="table table-borderless" style="font-family:Calibri; border-radius:15px; background-color:white; margin:auto; width:800px">
            <tr><td><asp:Label Text="Haven't registered yet? Sign up to start applying" runat="server" /></td>
            <td colspan="1"><asp:Button ID="btnRegister" CssClass="btn-primary" runat="server" Text="Register as Applicant" OnClick="BtnRegister_Click" /></td>
            <td colspan="1"><asp:Button ID="btnRegisterEmp" CssClass="btn-success" runat="server" Text="Register as Employer" OnClick="BtnRegisterEmp_Click" /></td></tr>
            </table>
         <!--</div>-->

         <br /><br />
         <asp:Label runat="server" ID="lblAlert" ForeColor="White"></asp:Label>
         

 <div class="list-group" style="overflow:auto;">
     <div class="list-group-horizontal">

<asp:GridView ID="grdJob" runat="server" AutoGenerateColumns="False" DataKeyNames="Job_ID" AllowPaging="True" 
    CssClass="table table-bordered table-striped table-condensed" OnRowCommand="grd_RowCommand" HeaderStyle-BackColor="Gray"  BackColor="WhiteSmoke">
    <Columns>
        <asp:BoundField DataField="Job_ID" HeaderText="Job ID" 
                            ReadOnly="True" SortExpression="Job_ID">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Designation" HeaderText="Designation" >
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Job_Description" HeaderText="Job Description" >
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Min_Req" HeaderText="Minimum Requirement" 
                            DataFormatString="{0:c}">
                            <ItemStyle CssClass="col-xs-2 text-right" />
                            <HeaderStyle CssClass="text-right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Pref_Req" HeaderText="Preferred Requirement">
                            <ItemStyle CssClass="col-xs-2 text-right" />
                            <HeaderStyle CssClass="text-right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Salary_Range" HeaderText="Salary Range" 
                            SortExpression="CategoryID, Name">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Location" HeaderText="Location" 
                            DataFormatString="{0:c}">
                            <ItemStyle CssClass="col-xs-2 text-right" />
                            <HeaderStyle CssClass="text-right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Seniority_Level" HeaderText="Seniority Level">
                            <ItemStyle CssClass="col-xs-2 text-right" />
                            <HeaderStyle CssClass="text-right" />
                        </asp:BoundField>
        <%--<asp:HyperLinkField Text="Select this job" DataNavigateUrlFields="Job_ID" DataNavigateUrlFormatString="~/JobPage.aspx?Job_ID={0}"/>--%>
        <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="btnDetails" runat="server" CausesValidation="false"
                           CommandArgument='<%# Eval("Job_ID")+","+Eval("Designation") %>' CommandName="JobIDnDes" Text="Select" BackColor="RoyalBlue" />
                  </ItemTemplate>
            </asp:TemplateField>
    </Columns>
</asp:GridView>
    </div></div></div>

    </form>
        </main>
</body>
</html>


