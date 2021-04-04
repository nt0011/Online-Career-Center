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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO Applicant (Applicant_Email, FName, LName, StreetAdd, City," +
                    " State,Zipcode, PhoneNumber, Password, Educational_Details, Professional_Details) VALUES (@Applicant_Email, @FName, @LName, @StreetAdd, @City," +
                    " @State, @Zipcode, @PhoneNumber, @Password, @Educational_Details, @Professional_Details)";

            string sql1 = "Select Applicant_Email from Applicant where Applicant_Email= @Applicant_Email";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd1 = new SqlCommand(sql1, connection))
                {
                    connection.Open();
                    cmd1.Parameters.AddWithValue("@Applicant_Email", txtAppEmail.Text);
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
                            cmd.Parameters.AddWithValue("@Applicant_Email", txtAppEmail.Text);
                            cmd.Parameters.AddWithValue("@FName", txtFirstName.Text);
                            cmd.Parameters.AddWithValue("@LName", txtLastName.Text);
                            cmd.Parameters.AddWithValue("@StreetAdd", txtAddress.Text);
                            cmd.Parameters.AddWithValue("@City", txtCity.Text);
                            cmd.Parameters.AddWithValue("@State", ddlState.SelectedItem.Value);
                            cmd.Parameters.AddWithValue("@Zipcode", txtZipcode.Text);
                            cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                            cmd.Parameters.AddWithValue("@Professional_Details", txtPD.Text);
                            cmd.Parameters.AddWithValue("@Educational_Details", txtED.Text);
                            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                            connection.Open();
                            cmd.ExecuteNonQuery();

                        }
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Registered Successfully')</script>");
                        Response.Redirect("~/Homepage.aspx");
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