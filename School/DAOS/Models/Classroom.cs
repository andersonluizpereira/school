using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class Classroom
    {
        public Classroom()
        {
            this.Students = new List<Student>();
        }

        public int ClassroomID { get; set; }
        public string ClassroomSemester { get; set; }
        public int CourseID { get; set; }
        public int TeacherID { get; set; }
        public string ClassroomObs { get; set; }
        public virtual Cours Cours { get; set; }
        public virtual Teacher Teacher { get; set; }
        public virtual ICollection<Student> Students { get; set; }
    }
}
