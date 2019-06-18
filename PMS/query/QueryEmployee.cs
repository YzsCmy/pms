using _201524112237;
using _201524112237.connectSql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMIS.query
{
    public class QueryEmployee : QueryObject
    {
        private int eid;
        private String ename;
        private int departId;
        private DateTime minBirth;
        private DateTime maxBirth;

        public QueryEmployee() {
            orderByRow = "eid";
        }

        public int Eid { get => eid; set => eid = value; }
        public string Ename { get => ename; set => ename = value; }
        public int DepartId { get => departId; set => departId = value; }
        public DateTime MinBirth { get => minBirth; set => minBirth = value; }
        public DateTime MaxBirth { get => maxBirth; set => maxBirth = value; }

        //添加自身的查询条件
        protected override void CustomizedQuery()
        {
            if (eid != 0)
            {
                AddQuery("eid = @eid", "@eid", eid);
            }
            if (Util.HasLength(ename))
            {
                AddQuery("ename LIKE @ename", "@ename", '%' + ename + '%');
            }
            if (departId != 0)
            {
                AddQuery("departId = @departId", "@departId", departId);
            }
            if (minBirth != new DateTime(0001, 01, 01, 0, 00, 00))
            {
                AddQuery("birth <= @minBirth", "@minBirth", minBirth);
            }
            if (maxBirth.Date != new DateTime(0001, 01, 01, 0, 00, 00))
            {
                AddQuery("birth >= @maxBirth", "@maxBirth", maxBirth);
            }
        }


    }
}