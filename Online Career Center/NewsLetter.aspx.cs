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
    public partial class NewsLetter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO Newsletter (EmailAdd, FName, LName) VALUES (@EmailAdd, @FName, @LName)";

            string sql1 = "Select EmailAdd from Newsletter where EmailAdd= @EmailAdd";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd1 = new SqlCommand(sql1, connection))
                {
                    connection.Open();
                    cmd1.Parameters.AddWithValue("@EmailAdd", txtEmail.Text);
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('This email is already used. Choose a new emailID!')</script>");
                    }
                    else
                    {
                        connection.Close();

                        using (SqlCommand cmd = new SqlCommand(sql, connection))
                        {
                            cmd.Parameters.AddWithValue("@EmailAdd", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@FName", txtFName.Text);
                            cmd.Parameters.AddWithValue("@LName", txtLName.Text);
                            connection.Open();
                            cmd.ExecuteNonQuery();

                        }
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Subscribed Successfully')</script>");
                        lblMessage.Text = "You have succesfully subscribed to our newsletter!";
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