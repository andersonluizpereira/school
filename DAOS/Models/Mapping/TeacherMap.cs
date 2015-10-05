using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;

namespace DAOS.Models.Mapping
{
    public class TeacherMap : EntityTypeConfiguration<Teacher>
    {
        public TeacherMap()
        {
            // Primary Key
            this.HasKey(t => t.TeacherID);

            // Properties
            this.Property(t => t.TeacherLastName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.TeacherFirstName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.TeacherDepartment)
                .IsRequired()
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Teachers");
            this.Property(t => t.TeacherID).HasColumnName("TeacherID");
            this.Property(t => t.TeacherLastName).HasColumnName("TeacherLastName");
            this.Property(t => t.TeacherFirstName).HasColumnName("TeacherFirstName");
            this.Property(t => t.TeacherDateJoin).HasColumnName("TeacherDateJoin");
            this.Property(t => t.TeacherDepartment).HasColumnName("TeacherDepartment");
            this.Property(t => t.LoginID).HasColumnName("LoginID");

            // Relationships
            this.HasRequired(t => t.UsersLogin)
                .WithMany(t => t.Teachers)
                .HasForeignKey(d => d.LoginID);

        }
    }
}
