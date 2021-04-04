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
    public partial class ViewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lblAppEmail.Text = Session["Applicant_Email"].ToString();

        }
        protected void lstApplicant_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }

        protected void lstApplicant_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }

        protected void lstApplicant_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
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



        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            //string txtKeyword = String.Format("{0}", Request.Form["Keyword"]);
            //string txtLocation = String.Format("{0}", Request.Form["Location"]);

            string sql = "select Job_ID, Designation, Job_Description, Min_Req, Pref_Req, Salary_Range, Location, Seniority_Level from JobPosting " +
                            "where (Designation like concat('%', @Des,'%') and Location like concat('%', @Loc,'%'))"; //+ txtJobName.Text + "%' or Location like '%" + txtLocation.Text + "%'";

            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@Des", "%" + txtKeyword1.Text + "%"); //txtJobName.Text + "%");
                    cmd.Parameters.AddWithValue("@Loc", "%" + txtLocation1.Text + "%");//txtLocation.Text + "%");

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        grdJob.DataSource = ds;
                        grdJob.DataBind();
                    }
                }
            }
        }

        protected void BtnApplied_Click(object sender, EventArgs e)
        {
            Session["AppEmail"] = Session["Applicant_Email"]; //lstApplicant.SelectedValue;
            //Response.Redirect("AppliedHistory.aspx");
            Server.Transfer("AppliedHistory.aspx");

        }

        protected void BtnAlert_Click(object sender, EventArgs e)
        {
            Session["AppEmail"] = Session["Applicant_Email"]; //lstApplicant.SelectedValue;
            //Response.Redirect("AppliedHistory.aspx");
            Server.Transfer("Alert.aspx");

        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "JobIDnDes")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                Session["Job_ID"] = commandArgs[0];
                Session["Designation"] = commandArgs[1];
                //Session["Job_ID"] = e.CommandArgument;
                //string JobID = Convert.ToInt32(e.CommandArgument);
                // either put ID in session and check 
                //Session["Job_ID"] = Convert.ToString(JobID);
                Server.Transfer("JobPage.aspx");
            }
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["ConnectionString1"].ConnectionString;
        }
    }
}