using LMIS.dao;
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

        protected void Editpwd_Click(object sender, EventArgs e)
        {
            Response.Redirect("editpwd.aspx");
        }
        
        protected void Exit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}