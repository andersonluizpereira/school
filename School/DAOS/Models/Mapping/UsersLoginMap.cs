using System.ComponentModel.DataAnnotations;
using System.Data.Entity.ModelConfiguration;

namespace DAOS.Models.Mapping
{
    public class UsersLoginMap : EntityTypeConfiguration<UsersLogin>
    {
        public UsersLoginMap()
        {
            // Primary Key
            this.HasKey(t => t.LoginID);

            // Properties
            this.Property(t => t.UserEmail)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.UserPassword)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("UsersLogin");
            this.Property(t => t.LoginID).HasColumnName("LoginID");
            this.Property(t => t.UserEmail).HasColumnName("UserEmail");
            this.Property(t => t.UserPassword).HasColumnName("UserPassword");
            this.Property(t => t.UserLastLogin).HasColumnName("UserLastLogin");
            this.Property(t => t.RoleID).HasColumnName("RoleID");

            // Relationships
            this.HasRequired(t => t.Role)
                .WithMany(t => t.UsersLogins)
                .HasForeignKey(d => d.RoleID);

        }
    }
}
