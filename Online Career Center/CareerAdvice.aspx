<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CareerAdvice.aspx.cs" Inherits="Online_Career_Center.CareerAdvice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Career Advice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>

<body style="background:url('Images/69275.png') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto">

    
<div class="container">
    <form id="form1" runat="server">
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
    </ul>
         <div class="form-inline">
             <div class="form-group">     <%--style="width:10px;text-indent:1em;"--%>
                 <label id="lblKeyword" for="Keyword" style="font-family:Arial; color:azure;">Keyword</label>
                <asp:TextBox runat="server" ID="txtKeyword1"></asp:TextBox>
                 <%-- <input id="txtKeyword" type="text" placeholder="Enter Keyword" name="Keyword" style="font-family:Arial; color:black; border-radius:15px" />--%>
             </div>
             <div class="form-group">
                 <label id="lblLocation" for="Keyword" style="font-family:Arial; color:azure;">Location</label>
                 <asp:TextBox runat="server" ID="txtLocation1"></asp:TextBox>
                 <%--<input id="txtLocation" type="text" placeholder="Enter Location" name="Location" style="font-family:Arial; color:black; border-radius:15px" />--%>
             </div>
             <button id="Search" runat="server" style="font-family:Arial; background-color:lightgreen; text-emphasis-color:greenyellow; border-radius:15px" class="btn btn-outline-success my-2 my-sm-0" type="submit" onserverclick="BtnSearch_Click">Search</button>
             <%--<asp:Button runat="server" CssClass="btn btn-default" ID="BtnSearch" Text="Search" OnClick="BtnSearch_Click" />--%>
         </div>
  </div>   
    </nav>
    
        <br />
        <br />
        <br />
        <div class="list-group">
            <div class="list-group-item">
                <asp:HyperLink runat="server" ID="link1" Text="Career Advice for Software Engineer" NavigateUrl="https://www.indeed.com/career/software-engineer/career-advice"></asp:HyperLink>
            </div>
            <div class="list-group-item">
                <asp:HyperLink runat="server" ID="link2" Text="Career Advice Software Developers Must Consider" NavigateUrl="https://mariopeshev.com/career-advice-software-developers-must-consider/"></asp:HyperLink>
            </div>
        </div>
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
    </div></div>
    </form>
    </div>
</body>
</html>
