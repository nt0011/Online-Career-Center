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
    public partial class JobPosting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Session["EmpEmail"] = Session["EmpEmail"];
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Homepage.aspx");
        }

        protected void lstJobPosting_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }

        protected void lstJobPosting_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }
        protected void lstJobPosting_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }

        //protected void lstJobPosting_ItemCommand(object sender, ListViewCommandEventArgs e)
        protected void lstJobPosting_ItemCommand(object sender, CommandEventArgs e)

        {
            if (e.CommandName == "JobIDnDes")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                Session["JobID"] = commandArgs[0];
                Session["Designation"] = commandArgs[1];

                Server.Transfer("GetApplicants.aspx");
            }
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
    }
}