using _201524112237;
using _201524112237.connectSql;
using LMIS.page;
using LMIS.query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMIS.dao
{
    public class EmployeeDAO
    {
        public PageList Query(QueryObject qo)
        {
            return QueryUtil.query(qo, "employee");
        }

        public int Insert(UpdateObject update)
        {
            return OperateDBTemplate.Update(update.GetInsert(), update.KeyValues);
        }

        public int Delete(UpdateObject update)
        {
            return OperateDBTemplate.Update(update.GetDelete(), update.KeyValues);
        }

        public int Update(UpdateObject update)
        {
            return OperateDBTemplate.Update(update.GetUpdate(), update.KeyValues);
        }

        //UPDATE t SET p1 = @p1, p1 = @p1 WHERE id=@id"
        public int UpdatePassword(String ename, String password)
        {
            Dictionary<String, Object> keyValues = new Dictionary<string, object>();
            keyValues.Add("password", password);
            keyValues.Add("ename", ename);
            return OperateDBTemplate.Update(
                "UPDATE employee SET password = @password WHERE ename=@ename", keyValues );

        }
    }
}