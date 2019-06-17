using _201524112237.connectSql;
using PMS.domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.update
{
    public class UpdateEmployee : UpdateObject
    {
        Employee employee = new Employee();

        public Employee Employee { get => employee; set => employee = value; }

        public UpdateEmployee()
        {
            tableName = "employee";
            flagPos = 5;
        }

        //插入
        protected override void CustomizedInsert()
        {
            AddQuery("ename", "@ename", employee.Ename);
            AddQuery("birth", "@birth", employee.Birth);
            AddQuery("departId", "@departId", employee.DepartId);
            AddQuery("password", "@password", employee.Password);
            AddQuery("status", "@stauts", employee.Status);
        }

        //删除
        protected override void CustomizedDelete()
        {
            AddQuery("eid = @eid", "@eid", employee.Eid);
        }

        //更新
        protected override void CustomizedUpdate()
        {
            AddQuery("ename = @ename", "@ename", employee.Ename);
            AddQuery("departId = @departId", "@departId", employee.DepartId);
            AddQuery("password = @password", "@password", employee.Password);
            AddQuery("status = @status", "@status", employee.Status);
            AddQuery("eid = @eid", "@eid", employee.Eid);
        }
    }
}