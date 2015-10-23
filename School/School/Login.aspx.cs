using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Security.Cryptography;
using DAOS.LayerDao;



namespace School
{
    public partial class Login : System.Web.UI.Page
    {
        SchoolDao scDao;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool passwordVerified = false;

            try
            {
                scDao = new SchoolDao();
                passwordVerified = scDao.VerifyPassword(inputEmail.Text, inputPassword.Text);
            }
            catch (Exception ex)
            {
                
                lblMsg.Text = ex.Message.ToString();
                return;
            }

            if (passwordVerified)
            {
                FormsAuthentication.RedirectFromLoginPage(inputEmail.Text, true);
            }

            else {
                lblMsg.Text = "Invalid email or password";
            
            }

        }

    }
}