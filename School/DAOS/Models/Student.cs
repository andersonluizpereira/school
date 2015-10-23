using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class Student
    {
        public Student()
        {
            this.Grades = new List<Grade>();
            this.Classrooms = new List<Classroom>();
        }

        public int StudentID { get; set; }
        public string StudentLastName { get; set; }
        public string StudentFirstName { get; set; }
        public System.DateTime StudentBirthday { get; set; }
        public string StudentAddress { get; set; }
        public string StudentCity { get; set; }
        public string StudentUF { get; set; }
        public string StudentPhone { get; set; }
        public System.DateTime StudentDateJoin { get; set; }
        public int LoginID { get; set; }
        public virtual ICollection<Grade> Grades { get; set; }
        public virtual UsersLogin UsersLogin { get; set; }
        public virtual ICollection<Classroom> Classrooms { get; set; }
    }
}
