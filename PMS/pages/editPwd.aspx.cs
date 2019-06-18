using LMIS.dao;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.pages
{
    public partial class editPwd : System.Web.UI.Page
    {
        private EmployeeDAO employeeDAo = new EmployeeDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            msg.Text = "";
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string pwdstr = pwd.Text;
            string epwdstr = epwd.Text;
            string repwdstr = repwd.Text;

            if (pwdstr != "" && epwdstr != "" && repwdstr != "" && epwdstr.Equals(repwdstr))
            {
                if (pwdstr.Equals(HttpContext.Current.Session["pwd"].ToString()))
                {
                    employeeDAo.UpdatePassword(HttpContext.Current.Session["name"].ToString(), repwdstr);
                    msg.ForeColor = Color.Blue;
                    msg.Text = "修改成功";
                    return;
                }
            }
            msg.ForeColor = Color.Red;
            msg.Text = "修改失败";
        }
    }
}