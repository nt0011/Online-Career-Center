using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace Online_Career_Center
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {

            Session["AdminUsername"] = txtUsername.Text;

            string sql = "SELECT AdminUserName, Password FROM Admin WHERE AdminUserName=@Adminusername AND Password=@Password";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {

                    cmd.Parameters.AddWithValue("@Adminusername", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("AdminViewPage.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Email and Password! Check again')</script>");
                    }
                }
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString1"].ConnectionString;
        }
    }
}