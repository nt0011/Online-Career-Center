using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Online_Career_Center
{
    public partial class GetApplicants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            lblJobID.Text = Session["JobID"].ToString();
            lblEmpEmail.Text = Session["EmpEmail"].ToString();
            Session["EmplEmail"] = Session["EmpEmail"];
        }

        protected void grdGetApplicant_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "JobIDnDesnAppEmail")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                Session["JobID"] = commandArgs[0];
                Session["Designation"] = commandArgs[1];
                Session["AppEmail"] = commandArgs[2];

                Server.Transfer("SendMessagetoApp.aspx");
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString1"].ConnectionString;
        }
    }
}