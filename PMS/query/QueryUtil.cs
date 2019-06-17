using _201524112237;
using _201524112237.connectSql;
using LMIS.page;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LMIS.query
{
    public class QueryUtil
    {
        private QueryUtil() { }

        /**
         * @param 	qo			查询基类(拼接WHERE子句), 存放用户传入的信息
         * @param 	tableName	查询表名
         * @return				返回分页信息
         * new PageList(countReader, totalCountl, currentPage, pageSize)
         */
        public static PageList query(QueryObject qo, String tableName)
        {
            //1): 查询结果总数
            String countSql = "SELECT COUNT(*) FROM " + tableName + qo.getQuery();
            SqlDataReader countReader = OperateDBTemplate.Query(countSql, qo.KeyValues);
            countReader.Read();
            int totalCount = countReader.GetInt32(0);
            countReader.Close();
            //2): 查询结果集
            String orderByRow = qo.OrderByRow;
            String baseSql = "SELECT * FROM " + tableName + qo.getQuery()
                + " order by "+ orderByRow + " offset((@currentPage-1)*@pageSize) rows fetch next @pageSize rows only ";
            Dictionary<String, Object> newParams = new Dictionary<string, object>(qo.KeyValues);
            //添加第一个? 开始索引
            newParams.Add("@currentPage", qo.CurrentPage);
            //添加第二个? 每页数据量
            newParams.Add("@pageSize", qo.PageSize);
            //获取结果集
            SqlDataReader objectReader = OperateDBTemplate.Query(baseSql, newParams);
            return new PageList(objectReader, totalCount, qo.CurrentPage, qo.PageSize);
        }
    }
}
