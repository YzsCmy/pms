using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMIS.page
{
    public class PageIndex
    {
        private int beginIndex;
        private int endIndex;

        public PageIndex(int beginIndex, int endIndex)
        {
            this.beginIndex = beginIndex;
            this.endIndex = endIndex;
        }

        public int BeginIndex { get => beginIndex; set => beginIndex = value; }
        public int EndIndex { get => endIndex; set => endIndex = value; }

        /**
         * 首页 上页 [1]  2  3  4  5  6  7  8  9   10   下页 末页 当前第1/18页 一共53条记录 每页3条
         * 首页 上页    1  [2] 3  4  5  6  7  8  9   10   下页 末页 当前第1/18页 一共53条记录 每页3条
         * 首页 上页    2   3  4  5 [6] 7  8  9  10  11   下页 末页 当前第1/18页 一共53条记录 每页3条
         * @param 	totalIndexCount	分页页码总数			 	10
         * @param 	currentPage		当前页				     1
         * @param 	totalPage		末页/总页数				18
         * @return	PageIndex		分页页码信息对象
         * 分三种情况:
         * 	1): 正常情况
         *  2): 开始索引页 < 1
         *  3): 结束索引页 > totalPage
         */
        public static PageIndex getPageIndex(int totalIndexCount, int currentPage, int totalPage)
        {

            /*初始页面计算(正常情况)
             * 当前页  - totalIndexCount/2-1或totalIndexCount/2 
             * 当前页currentPage
             * 当前页  + totalIndexCount/2 
             */
            //开始索引页
            int startPageIndex = currentPage
                    - (totalIndexCount % 2 == 0 ? totalIndexCount / 2 - 1 : totalIndexCount / 2);
            //最后索引页
            int endPageIndex = currentPage + totalIndexCount / 2;


            //===============计算结果处理==========================
            /*开始索引页  <1 : 
                startPageIndex = 1; 
                (总页数  >= 总索引页数)
                endPageIndex = 总索引页数;
                (总页数  < 总索引页数)
                endPageIndex = 总页数
            */
            if (startPageIndex < 1)
            {
                startPageIndex = 1;
                endPageIndex = totalPage >= totalIndexCount ? totalIndexCount : totalPage;
            }
            /*最后索引页 > 总页数
             *  endPageIndex = 总页数
             *  (最后索引页 > 总索引数) 即最后一页为9, 总索引数为8 
                startPageIndex = 最后索引页  - 总索引数 + 1;
                (最后索引页 <= 总索引数) 即最后一页为9, 中索引数为9
                startPageIndex = 1;
             */
            if (endPageIndex > totalPage)
            {
                endPageIndex = totalPage;
                startPageIndex = endPageIndex > totalIndexCount ?
                        endPageIndex - totalIndexCount + 1 : 1;
            }
            return new PageIndex(startPageIndex, endPageIndex);
        }
    }
}