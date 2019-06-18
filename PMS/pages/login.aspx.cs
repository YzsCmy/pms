using LMIS.dao;
using LMIS.query;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.pages
{
    public partial class login : System.Web.UI.Page
    {
        private EmployeeDAO employeeDao = new EmployeeDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            msg.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (username.Text != "" && pwd.Text != "")
            {
                string name = username.Text;
                string passwd = pwd.Text;
                QueryEmployee query = new QueryEmployee();
                query.Ename = name;
                SqlDataReader dataReader = employeeDao.Query(query).DataReader;
                
                while (dataReader.Read())
                {
                    string pwd = dataReader["password"].ToString();
                    string status = dataReader["status"].ToString();
                    string eid = dataReader["eid"].ToString();
                    if (pwd.Equals(passwd))
                    {
                        dataReader.Close();
                        msg.Text = "登录成功！";
                        HttpContext.Current.Session["name"] = name;
                        HttpContext.Current.Session["eid"] = eid;
                        HttpContext.Current.Session["status"] = status;
                        HttpContext.Current.Session["pwd"] = pwd;
                        Response.Redirect("index.aspx?name=" + name + "&status=" + status);
                    }
                }
                dataReader.Close();
            }
            msg.Text = "用户名或密码错误！";
        }
    }
}