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
    public partial class AppliedHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lblAppEmail.Text = Session["AppEmail"].ToString();
        }

        protected void lstApplied_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }

        protected void lstApplied_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }

        protected void lstApplied_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Homepage.aspx");
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString1"].ConnectionString;
        }
    }
}