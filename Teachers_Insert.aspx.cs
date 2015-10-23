using DAOS.LayerDao;
using DAOS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School
{
    public partial class Teachers_Insert : System.Web.UI.Page
    {
        SchoolDao scDao;
        
        Teacher teachers;
        UsersLogin usersLogin;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                usersLogin = new UsersLogin();
                teachers = new Teacher();
                scDao = new SchoolDao();

                string strTeacherLastName = txtLastName.Text;
                string strTeacherFirstName = txtFirstName.Text;
                string strTeacherDepartment = txtDepartament.Text;
                string strUserEmail = inputEmail.Text;
                string strPassword = inputPassword.Text;


                teachers.TeacherLastName = strTeacherLastName;
                teachers.TeacherFirstName = strTeacherFirstName;
                teachers.TeacherDepartment = strTeacherDepartment;
                usersLogin.UserEmail = strUserEmail;
                usersLogin.UserPassword = scDao.CreatePasswordHash(strPassword);
                scDao.InsetTeachers(teachers, usersLogin);
                lblMsg.Text = "Teacher Inserted!";
                btnInsert.Enabled = false;

            }
            catch (Exception ex)
            {
                
                lblMsg.Text=ex.Message.ToString();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teachers.aspx");
        }
    }
}