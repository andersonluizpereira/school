using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;

namespace DAOS.Models.Mapping
{
    public class ClassroomMap : EntityTypeConfiguration<Classroom>
    {
        public ClassroomMap()
        {
            // Primary Key
            this.HasKey(t => t.ClassroomID);

            // Properties
            this.Property(t => t.ClassroomSemester)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Classrooms");
            this.Property(t => t.ClassroomID).HasColumnName("ClassroomID");
            this.Property(t => t.ClassroomSemester).HasColumnName("ClassroomSemester");
            this.Property(t => t.CourseID).HasColumnName("CourseID");
            this.Property(t => t.TeacherID).HasColumnName("TeacherID");
            this.Property(t => t.ClassroomObs).HasColumnName("ClassroomObs");

            // Relationships
            this.HasMany(t => t.Students)
                .WithMany(t => t.Classrooms)
                .Map(m =>
                    {
                        m.ToTable("Classrooms-Students");
                        m.MapLeftKey("ClassroomID");
                        m.MapRightKey("StudentID");
                    });

            this.HasRequired(t => t.Cours)
                .WithMany(t => t.Classrooms)
                .HasForeignKey(d => d.CourseID);
            this.HasRequired(t => t.Teacher)
                .WithMany(t => t.Classrooms)
                .HasForeignKey(d => d.TeacherID);

        }
    }
}
