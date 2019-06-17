using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace _201524112237
{
    public class OperateDBTemplate
    {
        private OperateDBTemplate() { }

        //增删改(DML)模板
        public static int Update(String sql, Dictionary<String, Object> keyValues)
        {
            SqlCommand sqlCommand = null;
            SqlConnection myConnection = MyConnection.GetConnection();
            try
            {
                //获取预编译sql语句对象
                sqlCommand = new SqlCommand(sql, myConnection);
                //设置占位符参数
                foreach (KeyValuePair<String, Object> keyValuesPairs in keyValues)
                {
                    sqlCommand.Parameters.AddWithValue(keyValuesPairs.Key, keyValuesPairs.Value);

                }
                //执行SQL语句			
                return sqlCommand.ExecuteNonQuery();
            }
            catch
            {
                //throw new Exception();
                return 0;
            }
            finally
            {
                myConnection.Close();
            }
        }

        //查询(DDL)模板
        public static SqlDataReader Query(String sql, Dictionary<String, Object> keyValues)
        {
            SqlConnection myConnection = MyConnection.GetConnection();
            try
            {
                using (SqlCommand sqlCommand = new SqlCommand(sql, myConnection))
                {
                    //设置占位符参数
                    foreach (KeyValuePair<String, Object> keyValuesPairs in keyValues)
                    {
                        sqlCommand.Parameters.AddWithValue(keyValuesPairs.Key, keyValuesPairs.Value);
                    }
                    return sqlCommand.ExecuteReader(CommandBehavior.CloseConnection);
                }
            }
            catch
            {
                myConnection.Close();
                throw new Exception();
            }
        }
    }
}