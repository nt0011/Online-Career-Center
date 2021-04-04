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
    public partial class SendMessagetoApp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            lblAppEmail.Text = Session["AppEmail"].ToString();
            lblJobID.Text = Session["JobID"].ToString();
            lblDesignation.Text = Session["Designation"].ToString();
            lblEmpEmail.Text = Session["EmpEmail"].ToString();

        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            string sql = "insert into Alert (Message, Applicant_Email, Emp_Email, Job_ID, Designation) values (@Message, @Applicant_Email, @Emp_Email, @Job_ID, @Designation)";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text);
                    cmd.Parameters.AddWithValue("@Applicant_Email", lblAppEmail.Text);
                    cmd.Parameters.AddWithValue("@Emp_Email", lblEmpEmail.Text);
                    cmd.Parameters.AddWithValue("@Job_ID", lblJobID.Text);
                    cmd.Parameters.AddWithValue("@Designation", lblDesignation.Text);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    lblConfirm.Text = "Your message has been sent";
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