<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPage.aspx.cs" Inherits="Online_Career_Center.ViewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
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
    <div class="form-inline">
        <button id="Alert" runat="server" style="font-family:Arial; border-radius:25px;" class="btn btn-info" type="button" onserverclick="BtnAlert_Click">Alerts</button>
    </div>&nbsp;
    <div class="form-inline">
        <%--<asp:Button runat="server" ID="btnApplied" Text="Applied Jobs" OnClick="BtnAppliedJobs_Click"/>--%>
        <button id="AppliedJobs" runat="server" style="font-family:Arial; border-radius:25px;" class="btn btn-success" type="button" onserverclick="BtnApplied_Click">Applied Jobs</button>
    </div>&nbsp;
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

            <asp:ListView ID="lstApplicant" runat="server" 
                DataSourceID="SqlDataSource1" DataKeyNames="Applicant_Email"
                  
                OnItemDeleted="lstApplicant_ItemDeleted" 
                OnItemInserted="lstApplicant_ItemInserted" 
                OnItemUpdated="lstApplicant_ItemUpdated">
                <EditItemTemplate>
                    <div class="col-md-auto">
                        <div class="list-group">
                            <div class="list-group-item bg-secondary">
                                Edit Your Details
                            </div>
                            <div class="list-group-item">
                                <table class="table">
                                    <tr><td><asp:Label Text="Email Address:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtAppEmail" runat="server" Text='<%# Bind("Applicant_Email") %>' CssClass="form-control"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvAppEmail" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtAppEmail" 
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td><td><asp:RegularExpressionValidator ControlToValidate="txtAppEmail" ID="revAppEmail" runat="server" 
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
                                    DataTextField="StateName" DataValueField="StateCode" CssClass="form-control" SelectedValue='<%# Bind("State") %>' 
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

                                    <tr><td><asp:Label Text="Professional Details:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtPD" runat="server" Text='<%# Bind("Professional_Details") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvPD" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtPD"
                                    ValidationGroup="Edit" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Educational Details:" runat="server" /></td>
                                    <td><asp:TextBox ID="txtED" runat="server" Text='<%# Bind("Educational_Details") %>' CssClass="form-control" 
                                        MaxLength="3000" TextMode="MultiLine" Rows="4"/></td>
                                    <td><asp:RequiredFieldValidator ID="rfvED" runat="server" 
                                    ErrorMessage="Required Field" ControlToValidate="txtED"
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
                                    <td><asp:Label ID="lblAppEmail" runat="server" Text='<%# Eval("Applicant_Email") %>' CssClass="form-control"/>
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
                                    <td><asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>' CssClass="form-control"/>                                    
                                    <td><asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>' CssClass="form-control"/>
                                    </td></tr>

                                    <tr><td><asp:Label Text="Zipcode:" runat="server" /></td>
                                    <td><asp:Label ID="lblZipcode" runat="server" Text='<%# Eval("Zipcode") %>' CssClass="form-control"/>
                                    </td></tr>                                    
                                                                           
                                    <tr><td><asp:Label Text="Phone Number:" runat="server" /></td>
                                    <td><asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>' CssClass="form-control"/>
                                    </td></tr>

                                    
                                    <tr><td><asp:Label Text="Professional Details:" runat="server" /></td>
                                    <td><asp:Label ID="lblPD" runat="server" Text='<%# Eval("Professional_Details") %>' />
                                    </td></tr>

                                    <tr><td><asp:Label Text="Educational Details:" runat="server" /></td>
                                    <td><asp:Label ID="lblED" runat="server" Text='<%# Eval("Educational_Details") %>' />
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
                DeleteCommand="DELETE FROM [Applicant] WHERE [Applicant_Email] = @Applicant_Email" 
                SelectCommand="SELECT * FROM [Applicant] WHERE ([Applicant_Email] = @Applicant_Email)" 
                UpdateCommand="UPDATE [Applicant] SET [FName] = @FName, [LName] = @LName, [StreetAdd] = @StreetAdd, [City] = @City, [State] = @State, [Professional_Details] = @Professional_Details, [PhoneNumber] = @PhoneNumber, [Educational_Details] = @Educational_Details, [Password] = @Password WHERE [Applicant_Email] = @Applicant_Email" 
                InsertCommand="INSERT INTO [Applicant] ([Applicant_Email], [FName], [LName], [StreetAdd], [City], [State], [Professional_Details], [PhoneNumber], [Educational_Details], [Password]) VALUES (@Applicant_Email, @FName, @LName, @StreetAdd, @City, @State, @Professional_Details, @PhoneNumber, @Educational_Details, @Password)" >
                <DeleteParameters>
                    <asp:Parameter Name="Applicant_Email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Applicant_Email" Type="String" />
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="StreetAdd" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Professional_Details" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Educational_Details" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="Applicant_Email" SessionField="Applicant_Email" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FName" Type="String" />
                    <asp:Parameter Name="LName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Professional_Details" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Educational_Details" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Applicant_Email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
                SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]" ></asp:SqlDataSource>
            <br /><br />
<div class="list-group" style="overflow:auto">
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
                <asp:Label runat="server" ID="lblAppEmail" Visible="false"></asp:Label>
            <table class="table">
                <tr><td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="BtnLogout_Click" BackColor="#FF5050" /></td></tr></table>
</div></form>    </main>


</body>
</html>