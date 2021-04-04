using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Career_Center
{
    public partial class AdminViewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnApplicant_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/ApplicantManagement.aspx");

        }

        protected void BtnEmployer_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/EmployerManagement.aspx");

        }

        protected void BtnJob_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("~/JobManagement.aspx");

        }

        protected void BtnNewsletter_OnClick(Object sender, EventArgs e)
        {
            Response.Redirect("~/NewsletterManagement.aspx");
        }
    }
}