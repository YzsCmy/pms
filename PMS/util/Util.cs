using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _201524112237
{
    public class Util
    {
        private Util() { }

        public static bool HasLength(String str)
        {
            return str != null && !"".Equals(str.Trim());
        }

        public static DateTime GetDateTime(String dateTime)
        {
            //2019 - 05 - 14 
            String[] time = new string[3];
            for (int i = 0, j = 0; i < dateTime.Length; i++)
            {
                if (char.IsNumber(dateTime[i]))
                {
                    time[j] += dateTime[i];
                }
                else if (i + 1 <= dateTime.Length && !char.IsNumber(dateTime[i]))
                {
                    j++;
                }
            }
            return new DateTime(
                int.Parse(time[0]),
                int.Parse(time[1]),
                int.Parse(time[2]));
        }

        //根据年龄计算出生日期段: 18~20岁: 2018-11-17 --> [1997-11-18 00:00:00 , 2000-11-17 23:59:59]
        //计算年龄的最小出生年月日
        public static DateTime getMinBirthday(int minAge)
        {
            String nowYear = DateTime.Now.Year.ToString();
            String nowMonth = DateTime.Now.Month.ToString();
            String nowDay = DateTime.Now.Day.ToString();
            DateTime dateTime = new DateTime(
                int.Parse(nowYear) - minAge,
                int.Parse(nowMonth),
                int.Parse(nowDay) + 1,
                0, 0, 0);
            return dateTime;
        }
        //计算年龄的最大出生年月日
        public static DateTime getMaxBirthday(int maxAge)
        {
            String nowYear = DateTime.Now.Year.ToString();
            String nowMonth = DateTime.Now.Month.ToString();
            String nowDay = DateTime.Now.Day.ToString();
            DateTime dateTime = new DateTime(
                int.Parse(nowYear) - maxAge - 1,
                int.Parse(nowMonth),
                int.Parse(nowDay),
                23, 59, 59);
            return dateTime;
        }
    }
}