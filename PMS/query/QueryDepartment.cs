using _201524112237;
using _201524112237.connectSql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMIS.query
{
    public class QueryDepartment : QueryObject
    {
        private int did;
        private String dname;
        private int director;

        public QueryDepartment() {
            orderByRow = "did";
        }

        public int Did { get => did; set => did = value; }
        public string Dname { get => dname; set => dname = value; }
        public int Director { get => director; set => director = value; }

        //添加自身的查询条件
        protected override void CustomizedQuery()
        {
            if (Util.HasLength(dname))
            {
                AddQuery("dname LIKE @dname", "@dname", '%' + dname + '%');
            }
            if (did != 0)
            {
                AddQuery("did = @did", "@did", did);
            }
            if (director != 0)
            {
                AddQuery("director = @director", "@director", director);
            }
        }


    }
}