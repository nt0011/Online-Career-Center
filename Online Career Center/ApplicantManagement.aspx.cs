using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Career_Center
{
    public partial class ApplicantManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void lstApplicantManage_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
    }
}