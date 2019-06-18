using _201524112237;
using LMIS.dao;
using LMIS.query;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS.pages
{
    public partial class browseEmp : System.Web.UI.Page
    {
        private EmployeeDAO employeeDao = new EmployeeDAO();
        private QueryEmployee query = new QueryEmployee();

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowMsg();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String ename = eNameText.Text;
            if (Util.HasLength(ename))
            {
                query.Ename = ename;
            }
            ShowMsg();
        }

        private void ShowMsg()
        {
            using (SqlDataReader dataReader = employeeDao.Query(query).DataReader)
            {
                if (dataReader == null)
                {
                }
                DataTable table = new DataTable();
                table.Load(dataReader);
                GirdView.DataSource = table;
                GirdView.DataBind();
                dataReader.Close(); //使用datareader一定要关闭(只有关闭前才能使用后)
            }
        }
    }
}