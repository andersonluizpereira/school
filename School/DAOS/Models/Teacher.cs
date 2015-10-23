using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class Teacher
    {
        public Teacher()
        {
            this.Classrooms = new List<Classroom>();
        }

        public int TeacherID { get; set; }
        public string TeacherLastName { get; set; }
        public string TeacherFirstName { get; set; }
        public System.DateTime TeacherDateJoin { get; set; }
        public string TeacherDepartment { get; set; }
        public int LoginID { get; set; }
        public virtual ICollection<Classroom> Classrooms { get; set; }
        public virtual UsersLogin UsersLogin { get; set; }
    }
}
