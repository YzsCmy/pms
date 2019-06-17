using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LMIS.page
{
    public class PageList
    {
        private SqlDataReader dataReader;        //结果集: 	通过SQL获取
        private int totalCount;     //结果总数: 	通过SQL获取
        private int currentPage = 1;//当前页: 	用户传入
        private int pageSize = 5;   //每页数据量: 用户传入
        private int beginPage = 1;  //首页:		  1
        private int totalPage;      //末页:		计算获取
        private int prevPage;       //上页:		计算获取
        private int nextPage;       //下页:		计算获取
                                        /*======================分页索引======================*/
        private int beginIndex;     //开始索引页: 计算获取 PageIndex.getPageIndex(...).getBeginIndex()
        private int endIndex;       //结束索引页: 计算获取 PageIndex.getPageIndex(...).getEndIndex()
        private int totalIndexCount = 5;    //分页页码总数: 用户传入
        private List<int> pageSizeItems = new List<int>() { 5, 10, 20, 50, 100 };
        //选择列表(用户选择显示多少条数据): 用户输入
        /**
         * 创建页面的信息对象, 只需要传入下列四个值(其他通过计算获取)
         * @param listData		符合条件的结果集合
         * @param totalCountl	符合条件的结果总数
         * @param currentPage	当前页
         * @param pageSize		页面数据量
         */
        public PageList(SqlDataReader dataReader, int totalCount,int currentPage, int pageSize)
        {
            this.dataReader = dataReader;
            this.totalCount = totalCount;
            this.currentPage = currentPage;
            this.pageSize = pageSize;

            /*-------------计算: 末页, 上页, 下页--------------*/
            this.totalPage = this.totalCount % this.pageSize == 0 ?
                    this.totalCount / this.pageSize : this.totalCount / this.pageSize + 1;
            this.prevPage = this.currentPage - 1 >= 1 ? this.currentPage - 1 : 1;
            this.nextPage = this.currentPage + 1 <= this.totalPage ?
                    this.currentPage + 1 : this.totalPage;

            /*-------------获取: 开始/结束索引页 ---------------*/
            this.beginIndex = PageIndex.getPageIndex(totalIndexCount, currentPage, totalPage).BeginIndex;
            this.endIndex = PageIndex.getPageIndex(totalIndexCount, currentPage, totalPage).EndIndex;
        }

        public SqlDataReader DataReader { get => dataReader; set => dataReader = value; }
        public int TotalCount { get => totalCount; set => totalCount = value; }
        public int CurrentPage { get => currentPage; set => currentPage = value; }
        public int PageSize { get => pageSize; set => pageSize = value; }
        public int BeginPage { get => beginPage; set => beginPage = value; }
        public int TotalPage { get => totalPage; set => totalPage = value; }
        public int PrevPage { get => prevPage; set => prevPage = value; }
        public int NextPage { get => nextPage; set => nextPage = value; }
        public int BeginIndex { get => beginIndex; set => beginIndex = value; }
        public int EndIndex { get => endIndex; set => endIndex = value; }
        public int TotalIndexCount { get => totalIndexCount; set => totalIndexCount = value; }
    }
}