<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicantManagement.aspx.cs" Inherits="Online_Career_Center.ApplicantManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Applicant Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="lblError" runat="server" 
                        EnableViewState="False" CssClass="text-danger" />
                </div>
            </div>
        <div>
            <asp:ListView runat="server" ID="lstApplicantManage" DataSourceID="SqlDataSource1"
                DataKeyNames="Applicant_Email"               
                OnItemDeleted="lstApplicantManage_ItemDeleted">
                <EmptyDataTemplate>
                    <div class="col-sm-6">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">No Records found</div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr>
                                        <td>
                                            <asp:Label Text="Email Address:" runat="server" />
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
                                Applicant Details
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:Label ID="lblAppEmail" runat="server" Text='<%# Eval("Applicant_Email") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="First Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FName") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Last Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LName") %>' CssClass="form-control"/>
                                    </td></tr>                                                                      

                                    <tr><td><asp:Label Text="City:" runat="server" /></td>
                                    <td><asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>' CssClass="form-control"/>
                                    &nbsp;
                                    <td><asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>' CssClass="form-control"/>
                                    </td></tr>                                    

                                    <tr>
                                        <td colspan="2">                                            
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-default" />
                                        </td>
                                    </tr>
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
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
                DeleteCommand="DELETE FROM [Applicant] WHERE [Applicant_Email] = @Applicant_Email" 
                SelectCommand="SELECT [Applicant_Email], [FName], [LName], [City], [State] FROM [Applicant] ORDER BY [Applicant_Email]" >
                <DeleteParameters>
                    <asp:Parameter Name="Applicant_Email" Type="String" />
                </DeleteParameters>                
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
