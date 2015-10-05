using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;

namespace DAOS.Models.Mapping
{
    public class GradeMap : EntityTypeConfiguration<Grade>
    {
        public GradeMap()
        {
            // Primary Key
            this.HasKey(t => t.GradeID);

            // Properties
            // Table & Column Mappings
            this.ToTable("Grades");
            this.Property(t => t.GradeID).HasColumnName("GradeID");
            this.Property(t => t.StudentID).HasColumnName("StudentID");
            this.Property(t => t.CourseID).HasColumnName("CourseID");
            this.Property(t => t.Grade1).HasColumnName("Grade");

            // Relationships
            this.HasRequired(t => t.Cours)
                .WithMany(t => t.Grades)
                .HasForeignKey(d => d.CourseID);
            this.HasRequired(t => t.Student)
                .WithMany(t => t.Grades)
                .HasForeignKey(d => d.StudentID);

        }
    }
}
