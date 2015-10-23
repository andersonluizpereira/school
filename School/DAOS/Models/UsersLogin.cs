using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class UsersLogin
    {
        public UsersLogin()
        {
            this.Students = new List<Student>();
            this.Teachers = new List<Teacher>();
        }

        public int LoginID { get; set; }
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        public Nullable<System.DateTime> UserLastLogin { get; set; }
        public int RoleID { get; set; }
        public virtual Role Role { get; set; }
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<Teacher> Teachers { get; set; }
    }
}
