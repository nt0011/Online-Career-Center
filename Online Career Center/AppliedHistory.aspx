<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppliedHistory.aspx.cs" Inherits="Online_Career_Center.AppliedHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Applied History</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <link href="Content/Cyborg.min.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/simple_deer_art_gray-wallpaper-3840x2160.jpg') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto"> <%--width:100vw; height:100vh;--%>
        <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="lblError" runat="server" 
                        EnableViewState="False" CssClass="text-danger" />
                </div>
            </div>
<div class="align-top">
    <asp:Label runat="server" ID="lblAppEmail" Visible="false"></asp:Label>
</div>

<div class="container-fluid">
    <main>
        <form id="form1" runat="server" class="form-horizontal">

<asp:ListView ID="lstApplied" runat="server" 
                DataSourceID="SqlDataSource1" DataKeyNames="Applied_ID"
                  
                OnItemDeleted="lstApplied_ItemDeleted" 
                OnItemInserted="lstApplied_ItemInserted" 
                OnItemUpdated="lstApplied_ItemUpdated">               
                
                <EmptyDataTemplate>
                    <div class="col-sm-6">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">No Records found</div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr>
                                        <td>
                                            <asp:Label Text="Applied ID:" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div class="col-sm-6">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Your Applied Jobs:
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Applied ID:" runat="server" /></td>
                                    <td><asp:Label ID="lblAppliedID" runat="server" Text='<%# Eval("Applied_ID") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job ID:" runat="server" /></td>
                                    <td><asp:Label ID="lblJobID" runat="server" Text='<%# Eval("Job_ID") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Date:" runat="server" /></td>
                                    <td><asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job Title:" runat="server" /></td>
                                    <td><asp:Label ID="lblJobTitle" runat="server" Text='<%# Eval("Designation") %>' CssClass="form-control"/>
                                    </td></tr>
                                    
                                </table>
                            </div>                   
                  
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" class="row"><span runat="server" id="itemPlaceholder" /></div>
                    <div class="text-center">
                        <asp:DataPager runat="server" ID="DataPager1" PageSize="1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-default"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                SelectCommand="SELECT [Applied_ID], [Job_ID], [Date], [Designation] FROM [ApplicantDetails] WHERE ([Applicant_Email] = @Applicant_Email)" >               
                
                <SelectParameters>
                    <asp:SessionParameter Name="Applicant_Email" SessionField="AppEmail" Type="String" />
                </SelectParameters>
                
            </asp:SqlDataSource>
            <table class="table">
                <tr><td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" BackColor="#FF5050" /></td></tr></table>
    </form>
    </main>
    </div>
</body>
</html>