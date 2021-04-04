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
    public partial class Alert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            Session["AppEmail"] = Session["AppEmail"];
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Homepage.aspx");
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString1"].ConnectionString;
        }
    }
}