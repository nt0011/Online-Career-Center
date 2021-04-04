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
    public partial class CareerAdvice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            //string txtKeyword = String.Format("{0}", Request.Form["Keyword"]);
            //string txtLocation = String.Format("{0}", Request.Form["Location"]);

            string sql = "select Job_ID, Designation, Job_Description, Min_Req, Pref_Req, Salary_Range, Location, Seniority_Level from JobPosting " +
                            "where (Designation like concat('%', @Des,'%') and Location like concat('%', @Loc,'%'))";

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
                        lblAlert.Text = "Before you start applying, make an account with us to get your application history!";
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