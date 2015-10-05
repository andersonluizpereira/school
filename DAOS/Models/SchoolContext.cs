
using DAOS.Models.Mapping;
using System.Data.Entity;

namespace DAOS.Models
{
    public partial class SchoolContext : DbContext
    {
        static SchoolContext()
        {
            Database.SetInitializer<SchoolContext>(null);
        }

        public SchoolContext()
            : base("Name=SchoolContext")
        {
        }

        public DbSet<Classroom> Classrooms { get; set; }
        public DbSet<Cours> Courses { get; set; }
        public DbSet<Grade> Grades { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<Teacher> Teachers { get; set; }
        public DbSet<UsersLogin> UsersLogins { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new ClassroomMap());
            modelBuilder.Configurations.Add(new CoursMap());
            modelBuilder.Configurations.Add(new GradeMap());
            modelBuilder.Configurations.Add(new RoleMap());
            modelBuilder.Configurations.Add(new StudentMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new TeacherMap());
            modelBuilder.Configurations.Add(new UsersLoginMap());
        }
    }
}
