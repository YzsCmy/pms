using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.domain
{
    public class Department
    {
        private int did;
        private String dname;
        private int director;

        public Department() { }

        public int Did { get => did; set => did = value; }
        public string Dname { get => dname; set => dname = value; }
        public int Director { get => director; set => director = value; }
    }
}