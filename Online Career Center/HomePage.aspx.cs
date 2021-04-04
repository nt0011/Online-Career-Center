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
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Session["Applicant_Email"] = txtEmail.Text;
            Session["Emp_Email"] = txtEmail.Text;

            string sql = "SELECT Applicant_Email, Password FROM Applicant WHERE Applicant_Email=@Applicant_Email AND Password=@Password";

            string sql1 = "SELECT Emp_Email, Password FROM Employer WHERE Emp_Email = @Emp_Email AND Password=@Password";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(sql, connection))
                {

                    cmd.Parameters.AddWithValue("@Applicant_Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Response.Redirect("ViewPage.aspx");
                    }
                    else
                    {
                        connection.Close();

                        using (SqlCommand cmd1 = new SqlCommand(sql1, connection))
                        {
                            connection.Open();
                            cmd1.Parameters.Add("@Emp_Email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;
                            cmd1.Parameters.AddWithValue("@Password", txtPassword.Text);
                            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                            DataTable dt1 = new DataTable();
                            da1.Fill(dt1);
                            if (dt1.Rows.Count > 0)
                            {
                                Response.Redirect("ViewPageEmp.aspx");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Email and Password! Check again')</script>");
                            }
                        }
                    }
                }
            }
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");

        }
        protected void BtnRegisterEmp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrationEmp.aspx");

        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string sql = "select Job_ID, Designation, Job_Description, Min_Req, Pref_Req, Salary_Range, Location, Seniority_Level from JobPosting " +
                            " where (Designation like concat('%', @Des,'%') and Location like concat('%', @Loc,'%'))";

            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@Des", "%" + txtKeyword1.Text + "%");
                    cmd.Parameters.AddWithValue("@Loc", "%" + txtLocation1.Text + "%");

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        lblAlert.Text = "Before you start applying, make an account with us to get your Application history and Alerts from employers!";
                        grdJob.DataSource = ds;
                        grdJob.DataBind();
                    }
                }
            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "JobIDnDes")
            {
                //Session["Job_ID"] = e.CommandArgument;
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                Session["Job_ID"] = commandArgs[0];
                Session["Designation"] = commandArgs[1];
                Server.Transfer("JobPage.aspx");
            }
        }

        //protected void chk_CheckedChanged(object sender, EventArgs e)
        //{
        //    Response.Write("<script>alert('Job selected!');</script>");
        //}

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString1"].ConnectionString;
        }
    }
}