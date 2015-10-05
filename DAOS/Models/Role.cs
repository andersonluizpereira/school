using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class Role
    {
        public Role()
        {
            this.UsersLogins = new List<UsersLogin>();
        }

        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public virtual ICollection<UsersLogin> UsersLogins { get; set; }
    }
}
