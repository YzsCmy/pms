using _201524112237;
using LMIS.dao;
using LMIS.query;
using PMS.update;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMS
{
    public partial class WebForm2 : System.Web.UI.Page
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
                    show.Text = "无数据";
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
            query.Did = 10000;
            query.Dname = "技术";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateDepartment update = new UpdateDepartment();
            update.Department.Dname = "销售部门";
            update.Department.Director = 100000;
            if (departmentDAO.Insert(update) == 1)
            {
                show.Text = "插入成功";
            }
            else
            {
                show.Text = "插入失败";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateDepartment update = new UpdateDepartment();
            update.Department.Did = 10015;
            if (departmentDAO.Delete(update) == 1)
            {
                show.Text = "删除成功";
            }
            else
            {
                show.Text = "删除失败";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            UpdateDepartment update = new UpdateDepartment();
            update.Department.Dname = "sssssssss";
            update.Department.Director = 100004;
            update.Department.Did = 10016;
            if (departmentDAO.Update(update) == 1)
            {
                show.Text = "更新成功";
            }
            else
            {
                show.Text = "更新失败";
            }
        }
    }
}