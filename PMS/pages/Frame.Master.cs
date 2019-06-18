using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class Frame : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session != null)
            {
                if (HttpContext.Current.Session["name"] == null || HttpContext.Current.Session["name"].ToString().Trim()== "")
                {
                    Response.Redirect("login.aspx");
                }
            }

        }
    }
}