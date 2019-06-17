using System;
using System.Collections.Generic;
using System.Text;

namespace _201524112237.connectSql
{
    public class QueryObject
    {
        //封装 查询语句
        private List<string> conditions = new List<string>();
        
        //封装 查询条件(WHERE) 和 查询参数(占位符参数)
        private Dictionary<String, Object> keyValues = new Dictionary<string, object>();

        protected String orderByRow;

        //当前页
        protected int currentPage = 1;

        //每页最多显示多少条数据(默认)
        protected int pageSize = 10;

        protected virtual void CustomizedQuery(){ }

        public String getQuery()
        {
            //每次输入新的查询条件进行拼接,都要清空之前的 '查询条件'和'占位符参数'
            conditions.Clear();
            keyValues.Clear();
            
            StringBuilder sql = new StringBuilder(200);

            //子类添加查询条件
            CustomizedQuery();

            //1): 拼接 查询sql: WHERE子句
            for (int i = 0; i < keyValues.Count; i++)
            {
                //第一个条件: WHERE(记得空格)
                if (i == 0)
                {
                    sql.Append(" WHERE ");
                }
                else
                {
                    sql.Append(" AND ");
                }
                //拼接查询条件
                sql.Append(conditions[i]);
            }

            return sql.ToString();
        }

        protected void AddQuery(String condition, String key, Object param)
        {
            //添加查询条件: ()保证执行顺序
            //添加占位符参数
            conditions.Add("(" + condition + ")");
            keyValues.Add(key, param);
        }

        public Dictionary<string, object> KeyValues { get => keyValues; set => keyValues = value; }
        public int CurrentPage { get => currentPage; set => currentPage = value; }
        public int PageSize { get => pageSize; set => pageSize = value; }
        public string OrderByRow { get => orderByRow; set => orderByRow = value; }
    }
}