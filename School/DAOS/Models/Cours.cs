using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class Cours
    {
        public Cours()
        {
            this.Classrooms = new List<Classroom>();
            this.Grades = new List<Grade>();
        }

        public int CourseID { get; set; }
        public string CourseName { get; set; }
        public string CourseDescription { get; set; }
        public virtual ICollection<Classroom> Classrooms { get; set; }
        public virtual ICollection<Grade> Grades { get; set; }
    }
}
