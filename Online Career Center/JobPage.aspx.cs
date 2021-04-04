using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace Online_Career_Center
{
    public partial class JobPage : System.Web.UI.Page
    {
        private static String resumelink;

        //static Int32 Applied_ID;
        private static Int32 Applied_ID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Job_ID"] != null)
            {
                lblJobID.Text = Session["Job_ID"].ToString();
            }
            if (Session["Designation"] != null)
            {
                lblDesig.Text = Session["Designation"].ToString();
            }
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lblDate.Text = DateTime.Now.ToString("MM/dd/yyyy");
        }

        protected void BtnApply_Click(object sender, EventArgs e)

        {
            if (uploadresume() == true)
            {
                //string sessionID = Session["Job_ID"].ToString();
                string sql = "insert into ApplicantDetails (Applied_ID, First_Name, Last_Name, Applicant_Email, Job_ID, Resume, Date, Phone_Number, Designation) values " +
                    "(" + Applied_ID + ",'" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtAppEmail.Text + "','" + lblJobID.Text + "','" + resumelink + "','" + DateTime.Now.ToString("MM/dd/yyyy") + "','" + txtPhoneNumber.Text + "','" + lblDesig.Text + "')"; //"','" + sessionID + 

                //string sql3 = "select Applicant_Email FROM Applicant WHERE Applicant_Email=@Applicant_Email";

                using (SqlConnection connection = new SqlConnection(GetConnectionString()))
                {
                    connection.Open();

                    using (SqlCommand cmd = new SqlCommand(sql, connection))
                    {
                        cmd.CommandText = sql;
                        cmd.Connection = connection;
                        cmd.ExecuteNonQuery();
                        //Response.Write("<script>alert('Your Application ID is " + Applied_ID.ToString() + " for Further Reference .Thank you For applying!');</script>");
                        lblMessage.Text = "Your Application ID is " + Applied_ID.ToString() + " for Further Reference .Thank you For applying.";
                        txtFirstName.Text = "";
                        txtLastName.Text = "";
                        txtAppEmail.Text = "";
                        txtPhoneNumber.Text = "";
                        lblAccount.Text = "If you haven't already, get an account with us to see your application history!";
                        //using (SqlCommand cmd1 = new SqlCommand(sql3, connection))
                        //{
                        //    cmd1.Parameters.AddWithValue("@Applicant_Email", txtAppEmail.Text);
                        //SqlDataAdapter da = new SqlDataAdapter(cmd1);
                        //DataTable dt = new DataTable();
                        //da.Fill(dt);
                        //if (dt.Rows.Count > 0)
                        //{
                        //Response.Redirect("ViewPage.aspx?Applicant_Email=" + txtAppEmail.Text);
                        //}
                        //else
                        //{
                        //Response.Redirect("Registration.aspx");
                        //}
                        //}

                    }
                }
            }
        }

        private Boolean uploadresume()
        {
            Boolean resumesaved = false;
            if (flResume.HasFile == true)
            {

                String contenttype = flResume.PostedFile.ContentType;

                if (contenttype == "application/pdf")
                {
                    int filesize;
                    filesize = flResume.PostedFile.ContentLength;

                    getapplicationid();
                    flResume.SaveAs(Server.MapPath("~/Data/") + Applied_ID + ".pdf");

                    resumelink = "Data/" + Applied_ID + ".pdf";
                    resumesaved = true;
                    lblResume.Text = "";
                }
                else
                {
                    lblResume.Text = "Upload Resume in PDF format only";
                }

            }
            else
            {
                lblResume.Text = "Kindly upload Resume before applying in PDF Format";
            }


            return resumesaved;
        }

        public void getapplicationid()
        {
            string sql1 = "select Applied_ID from ApplicantDetails";
            string sql2 = "select max(Applied_ID) from ApplicantDetails";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sql1, connection))
                {
                    cmd.CommandText = sql1;
                    cmd.Connection = connection;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    connection.Close();
                    if (ds.Tables[0].Rows.Count < 1)
                    {
                        Applied_ID = 10001;
                    }
                    else
                    {
                        using (SqlCommand cmd1 = new SqlCommand(sql2, connection))
                        {
                            cmd1.CommandText = sql2;
                            cmd1.Connection = connection;
                            SqlDataAdapter da1 = new SqlDataAdapter();
                            da1.SelectCommand = cmd1;
                            DataSet ds1 = new DataSet();
                            da1.Fill(ds1);
                            Applied_ID = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
                            Applied_ID = Applied_ID + 1;
                            connection.Close();
                        }
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