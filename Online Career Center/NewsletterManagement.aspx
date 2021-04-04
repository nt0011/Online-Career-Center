<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsletterManagement.aspx.cs" Inherits="Online_Career_Center.NewsletterManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Newsletter Management</title>
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
            <asp:ListView runat="server" ID="lstNewsletterManage" DataSourceID="SqlDataSource1"
                DataKeyNames="EmailAdd"               
                OnItemDeleted="lstNewsletterManage_ItemDeleted">
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
                                Newsletter Subscribers:
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailAdd") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="First Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblFName" runat="server" Text='<%# Eval("FName") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Last Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LName") %>' CssClass="form-control"/>
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
                DeleteCommand="DELETE FROM [Newsletter] WHERE [EmailAdd] = @EmailAdd" 
                SelectCommand="SELECT [EmailAdd], [FName], [LName] FROM [Newsletter] ORDER BY [EmailAdd]" >
                <DeleteParameters>
                    <asp:Parameter Name="EmailAdd" Type="String" />
                </DeleteParameters>                
            </asp:SqlDataSource>
        </div>
        
    </form>
</body>
</html>
