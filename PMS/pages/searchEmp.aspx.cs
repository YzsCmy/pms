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
    public partial class searchEmp : System.Web.UI.Page
    {
        private EmployeeDAO employeeDao = new EmployeeDAO();
        private QueryEmployee query = new QueryEmployee();

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowMsg();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SetQueryLendRepayMsgConditons();
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
                lendRepayMsgView.DataSource = table;
                lendRepayMsgView.DataBind();
                dataReader.Close(); //使用datareader一定要关闭(只有关闭前才能使用后)
            }
        }

        private void SetQueryLendRepayMsgConditons()
        {
            String eid = eidText.Text;
            String ename = eNameText.Text;
            String minAge = minAgeText.Text;
            String maxAge = maxAgeText.Text;
            String departId = DropDownList1.SelectedValue;
            if (Util.HasLength(eid))
            {
                query.Eid = int.Parse(eid);
            }
            if (Util.HasLength(ename))
            {
                query.Ename = ename;
            }
            if (Util.HasLength(minAge))
            {
                query.MinBirth = Util.getMinBirthday(int.Parse(minAge));
            }
            if (Util.HasLength(maxAge))
            {
                query.MaxBirth = Util.getMaxBirthday(int.Parse(maxAge));
            }
            if (Util.HasLength(departId) && !"0".Equals(departId))
            {
                query.DepartId = int.Parse(departId);
            }
        }

    }
}