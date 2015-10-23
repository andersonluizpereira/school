using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;

namespace DAOS.Models.Mapping
{
    public class StudentMap : EntityTypeConfiguration<Student>
    {
        public StudentMap()
        {
            // Primary Key
            this.HasKey(t => t.StudentID);

            // Properties
            this.Property(t => t.StudentLastName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.StudentFirstName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.StudentAddress)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.StudentCity)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.StudentUF)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.StudentPhone)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Students");
            this.Property(t => t.StudentID).HasColumnName("StudentID");
            this.Property(t => t.StudentLastName).HasColumnName("StudentLastName");
            this.Property(t => t.StudentFirstName).HasColumnName("StudentFirstName");
            this.Property(t => t.StudentBirthday).HasColumnName("StudentBirthday");
            this.Property(t => t.StudentAddress).HasColumnName("StudentAddress");
            this.Property(t => t.StudentCity).HasColumnName("StudentCity");
            this.Property(t => t.StudentUF).HasColumnName("StudentUF");
            this.Property(t => t.StudentPhone).HasColumnName("StudentPhone");
            this.Property(t => t.StudentDateJoin).HasColumnName("StudentDateJoin");
            this.Property(t => t.LoginID).HasColumnName("LoginID");

            // Relationships
            this.HasRequired(t => t.UsersLogin)
                .WithMany(t => t.Students)
                .HasForeignKey(d => d.LoginID);

        }
    }
}
