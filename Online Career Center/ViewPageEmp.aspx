<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPageEmp.aspx.cs" Inherits="Online_Career_Center.ViewPageEmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body style="background:url('Images/105093.jpg') no-repeat 100% 0; background-size:cover; justify-content:center; display:flex; align-items:center; overflow:auto">

    <main>
        <form id="form1" runat="server" class="form-horizontal">

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
    <asp:Button ID="btnPosting" runat="server" Text="Job Posting Page" OnClick="BtnPosting_Click" CssClass="btn-info" />
</nav>
            <br /><br /><br /><br />
<div class="container">

            
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

            <asp:ListView ID="lstEmployer" runat="server" 
                DataSourceID="SqlDataSource1" DataKeyNames="Emp_Email"
                  
                OnItemDeleted="lstEmployer_ItemDeleted" 
                OnItemInserted="lstEmployer_ItemInserted" 
                OnItemUpdated="lstEmployer_ItemUpdated">
                <EditItemTemplate>
                    <div class="col-md-auto">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Edit Your Details
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtEmpEmail" runat="server" Text='<%# Bind("Emp_Email") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvEmpEmail" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtEmpEmail" 
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td><asp:RegularExpressionValidator ControlToValidate="txtEmpEmail" ID="revEmpEmail" runat="server" 
                                    ErrorMessage="Invalid Format" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="First Name:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FName") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtFirstName"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Last Name:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("LName") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtLastName"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Address:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("StreetAdd") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtAddress"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="City:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtCity"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="State" runat="server" /></td>
                                    <td><asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSource2"
                                    DataTextField="StateName" DataValueField="StateCode" 
                                    CssClass="form-control" SelectedValue='<%# Bind("State") %>' 
                                    ></asp:DropDownList></td> 
                                    <td></td></tr>

                                    <tr><td><asp:Label Text="Zipcode:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtZipcode" runat="server" Text='<%# Bind("Zipcode") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvZipcode" runat="server"
                                    ErrorMessage="Required Field" ControlToValidate="txtZipcode"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>
                                                                                                          
                                    <tr><td><asp:Label Text="Phone Number:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="form-control" /></td>
                                    <td><asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtPhoneNumber"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator></td>
                                    <td><asp:RegularExpressionValidator ControlToValidate="txtPhoneNumber" ID="revPhoneNumber" runat="server"
                                    ErrorMessage="Invalid Format" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Company Name:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtCompName" runat="server" Text='<%# Bind("Comp_Name") %>' CssClass="form-control" /></td>
                                    <td><asp:RequiredFieldValidator ID="rfvCompName" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtCompName"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Password:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtPassword"
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
                    <div class="col-md-auto">
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
                    <div class="col-md-auto">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Your Details
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:Label ID="lblEmpEmail" runat="server" Text='<%# Eval("Emp_Email") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="First Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FName") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Last Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LName") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Address:" runat="server" /></td>
                                    <td><asp:Label ID="lblAddress" runat="server" Text='<%# Eval("StreetAdd") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="City:" runat="server" /></td>
                                    <td><asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>' CssClass="form-control"/>&nbsp;</td>
                                    <td><asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Zipcode:" runat="server" /></td>
                                    <td><asp:Label ID="lblZipcode" runat="server" Text='<%# Eval("Zipcode") %>' CssClass="form-control"/>
                                    </td></tr>                                    
                                                                           
                                    <tr><td><asp:Label Text="Phone Number:" runat="server" /></td>
                                    <td><asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>' CssClass="form-control"/>
                                    </td></tr>
                                                                        
                                    <tr><td><asp:Label Text="Company Name:" runat="server" /></td>
                                    <td><asp:Label ID="lblCompName" runat="server" Text='<%# Eval("Comp_Name") %>' />
                                    </td></tr>

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
                </ItemTemplate>
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" class="row"><span runat="server" id="itemPlaceholder" /></div>
                    <div class="text-center">
                        <asp:DataPager runat="server" ID="DataPager1" PageSize="1">
                            
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Employer] WHERE [Emp_Email] = @Emp_Email" 
                SelectCommand="SELECT * FROM [Employer] WHERE ([Emp_Email] = @Emp_Email)" 
                UpdateCommand="UPDATE [Employer] SET [FName] = @FName, [LName] = @LName, [StreetAdd] = @StreetAdd, [City] = @City, [State] = @State, [Zipcode]=@Zipcode, [Comp_Name] = @Comp_Name, [PhoneNumber] = @PhoneNumber, [Password] = @Password WHERE [Emp_Email] = @Emp_Email" 
                InsertCommand="INSERT INTO [Employer] ([Emp_Email], [FName], [LName], [StreetAdd], [City], [State], [Zipcode], [Comp_Name], [PhoneNumber], [Password]) VALUES (@Emp_Email, @FName, @LName, @StreetAdd, @City, @State, @Zipcode, @Comp_Name, @PhoneNumber, @Password)" >
                <DeleteParameters>
                    <asp:Parameter Name="Emp_Email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Emp_Email" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="StreetAdd" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zipcode" Type="String" />
                    <asp:Parameter Name="Comp_Name" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Emp_Email" SessionField="Emp_Email" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Zipcode" Type="String" />
                    <asp:Parameter Name="Comp_Name" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Emp_Email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]" ></asp:SqlDataSource>
            
            <table class="table">
                <tr><td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" CssClass="btn-danger" /></td></tr></table>
        </div>
    
</form>
    </main>
</body>
</html>
