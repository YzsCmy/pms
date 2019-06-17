using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace _201524112237
{
    public class MyConnection
    {
        private static SqlConnection myConnection;

        private MyConnection() { }

        static MyConnection()
        {
            string sqlConn = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename = '|DataDirectory|\\Database.mdf';";
            myConnection = new SqlConnection(sqlConn);
        }

        public static SqlConnection GetConnection()
        {
            while(myConnection.State != ConnectionState.Open)
            {
                myConnection.Open();
            }
            return myConnection;
        }

        public static void Close(SqlConnection conn, SqlDataReader reader)
        {
            try
            {
                if (reader != null)
                {
                    reader.Close();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                try
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
        }
    }
}