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
            //2019 - 05 - 14 14:37:09
            String[] time = new string[6];
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
                int.Parse(time[2]),
                int.Parse(time[3]),
                int.Parse(time[4]),
                int.Parse(time[5]));
        }
    }
}