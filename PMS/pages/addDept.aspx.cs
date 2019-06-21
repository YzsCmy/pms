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
    public partial class addDept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("onclick", "return input()");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DepartmentDAO departmentDAO = new DepartmentDAO();
            UpdateDepartment update = new UpdateDepartment();
            update.Department.Dname = dname.Text;
            update.Department.Director = int.Parse(DropDownList1.SelectedValue);
            departmentDAO.Insert(update);
            Response.Redirect("searchDept.aspx");
        }
    }
}
