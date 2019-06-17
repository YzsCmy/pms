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
    public partial class WebForm1 : System.Web.UI.Page
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
            query.Eid = 100000;
            query.Ename = "曾繁星";
            query.DepartId = 10001;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateEmployee update = new UpdateEmployee();
            update.Employee.Ename += "hahaha";
            update.Employee.Birth = new DateTime(1999,01,01);
            update.Employee.DepartId = 10000;
            update.Employee.Password = "aab";
            update.Employee.Status = 2;

            if (employeeDao.Insert(update) == 1)
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
            UpdateEmployee update = new UpdateEmployee();
            update.Employee.Eid = 100005;
            if (employeeDao.Delete(update) == 1)
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
            UpdateEmployee update = new UpdateEmployee();
            update.Employee.Eid = 100006;
            update.Employee.Ename = "aaaaaaaaa";
            update.Employee.DepartId = 10000;
            update.Employee.Password = "xxx";
            update.Employee.Status = 1;
            if (employeeDao.Update(update) == 1)
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