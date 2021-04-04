<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobManagement.aspx.cs" Inherits="Online_Career_Center.JobManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script></head>
<body>
    <form id="form1" runat="server">
        <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="lblError" runat="server" 
                        EnableViewState="False" CssClass="text-danger" />
                </div>
            </div>           

            <asp:ListView ID="lstJobManagement" runat="server" 
                DataSourceID="SqlDataSource1" DataKeyNames="Job_ID"
                OnItemDeleted="lstJobManagement_ItemDeleted" >
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
                                Job Postings
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:Label ID="lblEmpEmail" runat="server" Text='<%# Eval("Emp_Email") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job ID:" runat="server" /></td>
                                    <td><asp:Label ID="lblJob_ID" runat="server" Text='<%# Eval("Job_ID") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Designation:" runat="server" /></td>
                                    <td><asp:Label ID="lblDesg" runat="server" Text='<%# Eval("Designation") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job Description:" runat="server" /></td>
                                    <td><asp:Label ID="lblJD" runat="server" Text='<%# Eval("Job_Description") %>' />
                                    </td></tr>

                                    <tr><td><asp:Label Text="Minimum Requuirements:" runat="server" /></td>
                                    <td><asp:Label ID="lblMR" runat="server" Text='<%# Eval("Min_Req") %>' />
                                    </td></tr>

                                    <tr><td><asp:Label Text="Preferred Requirements:" runat="server" /></td>
                                    <td><asp:Label ID="lblPR" runat="server" Text='<%# Eval("Pref_Req") %>' />
                                    </td></tr>                                    
                                                                           
                                    <tr><td><asp:Label Text="Salary Range:" runat="server" /></td>
                                    <td><asp:Label ID="lblSR" runat="server" Text='<%# Eval("Salary_Range") %>' CssClass="form-control"/>
                                    </td></tr>
                                                                        
                                    <tr><td><asp:Label Text="Location:" runat="server" /></td>
                                    <td><asp:Label ID="lblLoc" runat="server" Text='<%# Eval("Location") %>' />
                                    </td></tr>

                                    <tr><td><asp:Label Text="Seniority Level:" runat="server" /></td>
                                    <td><asp:Label ID="lblSL" runat="server" Text='<%# Eval("Seniority_level") %>' CssClass="form-control"/></td></tr>

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
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                DeleteCommand="DELETE FROM [JobPosting] WHERE [Job_ID] = @Job_ID" 
                SelectCommand="SELECT * FROM [JobPosting] ORDER BY [Job_ID]" >
                <DeleteParameters>
                    <asp:Parameter Name="Job_ID" Type="String" />
                </DeleteParameters>                
            </asp:SqlDataSource>
    </form>
</body>
</html>
