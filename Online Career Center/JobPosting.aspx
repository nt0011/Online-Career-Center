<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobPosting.aspx.cs" Inherits="Online_Career_Center.JobPosting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post a Job!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/105093.jpg') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto">

<div class="container">

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
    <br /><br />

     <main>
        <form id="form1" runat="server" class="form-horizontal">
            
            <div class="row">
                <div class="col-sm-12">
                    <asp:Label ID="lblError" runat="server" 
                        EnableViewState="False" CssClass="text-danger" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        ValidationGroup="Edit" CssClass="text-danger" />
                </div>
                <div class="col-sm-6">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                        HeaderText="Please correct the following errors:" 
                        ValidationGroup="New" CssClass="text-danger" />
                </div>
            </div>

            <asp:ListView ID="lstJobPosting" runat="server" 
                DataSourceID="SqlDataSource1" DataKeyNames="Job_ID"
                InsertItemPosition="LastItem"                
                OnItemDeleted="lstJobPosting_ItemDeleted" 
                OnItemInserted="lstJobPosting_ItemInserted" 
                OnItemUpdated="lstJobPosting_ItemUpdated">
                <EditItemTemplate>
                    <div class="col-sm-5">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Edit Your Postings
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtEmpEmail" runat="server" Text='<%# Bind("Emp_Email") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvEmpEmail" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtEmpEmail" 
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td><td><asp:RegularExpressionValidator ControlToValidate="txtEmpEmail" ID="revEmpEmail" runat="server" 
                                    ErrorMessage="Invalid Format" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job ID:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtJob_ID" runat="server" Text='<%# Bind("Job_ID") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvJob_ID" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtJob_ID"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Designation:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtDesg" runat="server" Text='<%# Bind("Designation") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvDesg" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtDesg"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job Description:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtJD" runat="server" Text='<%# Bind("Job_Description") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvJD" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtJD"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Minimum Requirements:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtMR" runat="server" Text='<%# Bind("Min_Req") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvMR" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtMR"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>                                                                      

                                    <tr><td><asp:Label Text="Preferred Requirements:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtPR" runat="server" Text='<%# Bind("Pref_Req") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvPR" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtPR"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>
                                                                                                          
                                    <tr><td><asp:Label Text="Salary Range:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtSR" runat="server" Text='<%# Bind("Salary_Range") %>' CssClass="form-control" /></td>
                                    <td><asp:RequiredFieldValidator ID="rfvSR" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtSR"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator></td>
                                    
                                    <tr><td><asp:Label Text="Location:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtLoc" runat="server" Text='<%# Bind("Location") %>' CssClass="form-control" /></td>
                                    <td><asp:RequiredFieldValidator ID="rfvLoc" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtLoc"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Seniority Level:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtSL" runat="server" Text='<%# Bind("Seniority_level") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvSL" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtSL"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr>
                                        <td colspan="3">
                                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="btnUpdate" CssClass="btn btn-default" ValidationGroup="Edit" />
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="btnCancel" CssClass="btn btn-default" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <div class="col-sm-5">
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
                <InsertItemTemplate>
                    <div class="col-sm-5">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Add New Postings
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtEmpEmail" runat="server" Text='<%# Bind("Emp_Email") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvEmpEmail" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtEmpEmail" 
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td><td><asp:RegularExpressionValidator ControlToValidate="txtEmpEmail" ID="revEmpEmail" runat="server" 
                                    ErrorMessage="Invalid Format" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job ID:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtJob_ID" runat="server" Text='<%# Bind("Job_ID") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvJob_ID" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtJob_ID"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Designation:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtDesg" runat="server" Text='<%# Bind("Designation") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvDesg" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtDesg"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Job Description:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtJD" runat="server" Text='<%# Bind("Job_Description") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvJD" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtJD"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Minimum Requirements:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtMR" runat="server" Text='<%# Bind("Min_Req") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvMR" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtMR"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>                                                                      

                                    <tr><td><asp:Label Text="Preferred Requirements:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtPR" runat="server" Text='<%# Bind("Pref_Req") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvPR" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtPR"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>
                                                                                                          
                                    <tr><td><asp:Label Text="Salary Range:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtSR" runat="server" Text='<%# Bind("Salary_Range") %>' CssClass="form-control" /></td>
                                    <td><asp:RequiredFieldValidator ID="rfvSR" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtSR"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator></td>
                                    
                                    <tr><td><asp:Label Text="Location:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtLoc" runat="server" Text='<%# Bind("Location") %>' CssClass="form-control" /></td>
                                    <td><asp:RequiredFieldValidator ID="rfvLoc" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtLoc"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Seniority Level:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtSL" runat="server" Text='<%# Bind("Seniority_level") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvSL" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtSL"
                                    ValidationGroup="Insert" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr>
                                        <td colspan="3">
                                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="btnInsert" CssClass="btn btn-default" ValidationGroup="New" />
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="btnCancel" CssClass="btn btn-default" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                                
                <ItemTemplate>
                    <div class="col-sm-5">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Your Postings
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
                                            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-default" />
                                            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-default" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="btnDetails" CausesValidation="false" CommandArgument='<%# Eval("Job_ID")+","+Eval("Designation") %>'
                            CommandName="JobIDnDes" Text="Applicants" BackColor="RoyalBlue" OnCommand="lstJobPosting_ItemCommand" />
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
                SelectCommand="SELECT * FROM [JobPosting] WHERE ([Emp_Email] = @Emp_Email) ORDER BY [Job_ID]" 
                UpdateCommand="UPDATE [JobPosting] SET [Designation] = @Designation, [Job_Description] = @Job_Description, [Min_Req] = @Min_Req, [Pref_Req] = @Pref_Req, [Salary_Range] = @Salary_Range, 
                [Location]=@Location, [Seniority_level] = @Seniority_level WHERE [Job_ID] = @Job_ID" 
                InsertCommand="INSERT INTO [JobPosting] ([Job_ID], [Emp_Email], [Designation], [Job_Description], [Min_Req], [Pref_Req], [Salary_Range], [Location], 
                [Seniority_level]) VALUES (@Job_ID, @Emp_Email, @Designation, @Job_Description, @Min_Req, @Pref_Req, @Salary_Range, @Location, @Seniority_level)" >
                <DeleteParameters>
                    <asp:Parameter Name="Job_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emp_Email" Type="String" />
                    <asp:Parameter Name="Job_ID" Type="String" />
                    <asp:Parameter Name="Designation" Type="String" />
                    <asp:Parameter Name="Job_Description" Type="String" />
                    <asp:Parameter Name="Min_Req" Type="String" />
                    <asp:Parameter Name="Pref_Req" Type="String" />
                    <asp:Parameter Name="Salary_Range" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="Seniority_level" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Emp_Email" SessionField="Emp_Email" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Job_ID" Type="String" />
                    <asp:Parameter Name="Designation" Type="String" />
                    <asp:Parameter Name="Job_Description" Type="String" />
                    <asp:Parameter Name="Min_Req" Type="String" />
                    <asp:Parameter Name="Pref_Req" Type="String" />
                    <asp:Parameter Name="Salary_Range" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="Seniority_level" Type="String" />
                    <asp:Parameter Name="Emp_Email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <table class="table">
                <tr><td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" CssClass="btn-danger" /></td></tr></table>            
</form>
    </main>
   
        </div>         
      
</body>
</html>
