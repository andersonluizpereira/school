using System;
using System.Collections.Generic;

namespace DAOS.Models
{
    public partial class Grade
    {
        public int GradeID { get; set; }
        public int StudentID { get; set; }
        public int CourseID { get; set; }
        public decimal Grade1 { get; set; }
        public virtual Cours Cours { get; set; }
        public virtual Student Student { get; set; }
    }
}
