using _201524112237.connectSql;
using PMS.domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.update
{
    public class UpdateDepartment : UpdateObject
    {
        Department department = new Department();

        public Department Department { get => department; set => department = value; }

        public UpdateDepartment()
        {
            tableName = "department";
            flagPos = 3;
        }

        //插入
        protected override void CustomizedInsert()
        {
            AddQuery("dname", "@dname", department.Dname);
            AddQuery("director", "@director", department.Director);
        }

        //删除
        protected override void CustomizedDelete()
        {
            AddQuery("did = @did", "@did", department.Did);
        }

        //更新
        protected override void CustomizedUpdate()
        {
            AddQuery("dname = @dname", "@dname", department.Dname);
            AddQuery("director = @director", "@director", department.Director);
            AddQuery("did = @did", "@did", department.Did);
        }
    }
}