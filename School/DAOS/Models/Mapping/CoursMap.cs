using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;

namespace DAOS.Models.Mapping
{
    public class CoursMap : EntityTypeConfiguration<Cours>
    {
        public CoursMap()
        {
            // Primary Key
            this.HasKey(t => t.CourseID);

            // Properties
            this.Property(t => t.CourseName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.CourseDescription)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Courses");
            this.Property(t => t.CourseID).HasColumnName("CourseID");
            this.Property(t => t.CourseName).HasColumnName("CourseName");
            this.Property(t => t.CourseDescription).HasColumnName("CourseDescription");
        }
    }
}
