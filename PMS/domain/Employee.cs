using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PMS.domain
{
    public class Employee
    {
        private int eid;
        private String ename;
        private int departId;
        private DateTime birth;
        private String password;
        private int status;

        public Employee() { }

        public int Eid { get => eid; set => eid = value; }
        public string Ename { get => ename; set => ename = value; }
        public int DepartId { get => departId; set => departId = value; }
        public DateTime Birth { get => birth; set => birth = value; }
        public string Password { get => password; set => password = value; }
        public int Status { get => status; set => status = value; }
    }
}