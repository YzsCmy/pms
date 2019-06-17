using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace _201524112237.connectSql
{
    public class UpdateObject
    {
        
        protected string tableName; //表名
        protected int flagPos;  //结束更新标记(flagPos前为set, flagPos后为where)
        protected string insertSql = @"INSERT INTO ";
        protected string deleteSql = @"DELETE FROM ";
        protected string updateSql = @"UPDATE ";
        protected string whereSql = " WHERE ";
        //封装 语句
        private List<string> conditions = new List<string>();

        //封装 属性(SET) 和 参数(VALUE)
        private Dictionary<String, Object> keyValues = new Dictionary<string, object>();
        public Dictionary<string, object> KeyValues { get => keyValues; set => keyValues = value; }

        protected virtual void CustomizedInsert() { }
        protected virtual void CustomizedDelete() { }
        protected virtual void CustomizedUpdate() { }

        //INSERT INTO t (, , ,) VALUES (@, @, @)
        public String GetInsert()
        {
            conditions.Clear();
            keyValues.Clear();
            CustomizedInsert();

            StringBuilder intoSB = new StringBuilder(200);
            StringBuilder valuesSB = new StringBuilder(200);
            int i = 0;

            foreach (KeyValuePair<String, Object> keyValuesPairs in keyValues)
            {
                if (i == 0)
                {
                    intoSB.Append(" ( ");
                    valuesSB.Append(" VALUES (");
                }
                else
                {
                    intoSB.Append(" ,");
                    valuesSB.Append(" ,");
                }
                //拼接属性
                intoSB.Append(conditions[i++]);
                valuesSB.Append(keyValuesPairs.Key);
            }
            //去除最后的, 并替换成(
            String setSql = intoSB.ToString();
            setSql += ")";
            String valuesSql = valuesSB.ToString();
            valuesSql += ")";

            return insertSql + tableName + setSql + valuesSql;
        }

        //DELETE FROM t WHERE id=@id
        public String GetDelete()
        {
            conditions.Clear();
            keyValues.Clear();
            CustomizedDelete();

            StringBuilder conditionSql = new StringBuilder(200);

            //1): 拼接 查询sql: WHERE子句
            for (int i = 0; i < keyValues.Count; i++)
            {
                //第一个条件: WHERE(记得空格)
                if (i != 0)
                {
                    conditionSql.Append(" AND ");
                }
                //拼接查询条件
                conditionSql.Append(conditions[i]);
            }

            return deleteSql + tableName + whereSql + conditionSql;
        }

        //UPDATE t SET p1 = @p1, p1 = @p1 WHERE id=@id"
        public String GetUpdate()
        {
            conditions.Clear();
            keyValues.Clear();
            CustomizedUpdate();

            StringBuilder setSB = new StringBuilder(200);
            StringBuilder conditionSql = new StringBuilder(200);
            int i = 0;

            foreach (KeyValuePair<String, Object> keyValuesPairs in keyValues)
            {
                if (i == 0)
                {
                    setSB.Append(" SET ");
                    setSB.Append(conditions[i++]);
                }
                else if(i+1 >= flagPos)
                {
                    if (i + 1 != flagPos)
                    {
                        conditionSql.Append(" AND ");
                    }
                    conditionSql.Append(conditions[i++]);
                }
                else
                {
                    setSB.Append(" ,");
                    setSB.Append(conditions[i++]);
                }
            }
            String setSql = setSB.ToString();

            return updateSql + tableName + setSql + whereSql + conditionSql;
        }

        protected void AddQuery(String condition, String key, Object param)
        {
            conditions.Add(condition);
            keyValues.Add(key, param);
        }
    }
}