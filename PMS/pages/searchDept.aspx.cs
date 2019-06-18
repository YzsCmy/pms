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
    public partial class searchDept : System.Web.UI.Page
    {
        private DepartmentDAO departmentDAO = new DepartmentDAO();
        private QueryDepartment query = new QueryDepartment();

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
            using (SqlDataReader dataReader = departmentDAO.Query(query).DataReader)
            {
                if (dataReader == null)
                {
                    
                }
                DataTable table = new DataTable();
                table.Load(dataReader);
                girdView.DataSource = table;
                girdView.DataBind();
                dataReader.Close(); //使用datareader一定要关闭(只有关闭前才能使用后)
            }
        }

        private void SetQueryLendRepayMsgConditons()
        {
            String did = didText.Text;
            String dname = dNameText.Text;
            String directorId = DropDownList1.SelectedValue;
            if (Util.HasLength(did))
            {
                query.Did = int.Parse(did);
            }
            if (Util.HasLength(dname))
            {
                query.Dname = dname;
            }
            if (Util.HasLength(directorId) && !"0".Equals(directorId))
            {
                query.Director = int.Parse(directorId);
            }
        }

    }
}