using _201524112237;
using LMIS.dao;
using PMS.update;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.pages
{
    public partial class addEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("onclick", "return input()");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            EmployeeDAO dao = new EmployeeDAO();
            UpdateEmployee insert = new UpdateEmployee();
            insert.Employee.Ename = ename.Text;
            insert.Employee.Birth = Util.GetDateTime(birth.Text);
            insert.Employee.DepartId = int.Parse(DropDownList1.SelectedValue);
            insert.Employee.Password = pwd.Text;
            insert.Employee.Status =  Convert.ToInt32(status.Text);
            dao.Insert(insert);
            Response.Redirect("searchEmp.aspx");
        }
    }
}