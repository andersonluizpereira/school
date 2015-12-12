using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using DAOS.Models;
using GenericFunctions;

namespace DAOS.LayerDao
{
    public class SchoolDao : Dao
    {
        FunctionsGen fugen = new FunctionsGen();
        public bool VerifyPassword(string suppliedUserEmail, string suppliedPassword)
        {
            
            bool passwordMatch = false;
            SqlParameter sqlParam = cmd.Parameters.Add("@UserEmail", SqlDbType.NVarChar, 50);
            sqlParam.Value = suppliedUserEmail;

            try
            {
                OpenConnection();
                cmd.CommandType = CommandType.StoredProcedure; 
                cmd.CommandText = "TryLogin";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@UserEmail",suppliedUserEmail);
                GravaLog("login com usuário " + suppliedUserEmail +" com a senha " +suppliedPassword);
                


                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                string dbPasswordHash = reader.GetString(0);
                reader.Close();

                string hashedPassword = CreatePasswordHash(suppliedPassword);
                passwordMatch = hashedPassword.Equals(dbPasswordHash);
            }
            catch (Exception ex)
            {
                
               ex.Message.ToString();
               GravaLog(ex.Message.ToString());
            }

            finally
            {
                ClosedConnection();
            }

            return passwordMatch;

        }

        public string CreatePasswordHash(string pwd)
        {
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "SHA1");
            return hashedPwd;
        }

        public DataTable ListTeachers() {
            
            DataTable dt = new DataTable();

            try
            {
                OpenConnection();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "GetTeachers";
                da.SelectCommand = cmd;
                da.Fill(dt);
              

            }
            catch (Exception ex)
            {
                throw ex;

            }

            finally {
                ClosedConnection();
            }
            return dt;
        
        }

       public void AlterTeachers(Teacher teacher){

           try
           {

               OpenConnection();
               cmd.CommandType = System.Data.CommandType.StoredProcedure;
               cmd.CommandText = "UpdateTeacher";
               cmd.Parameters.Clear();
               cmd.Parameters.AddWithValue("@TeacherID", teacher.TeacherID);
               cmd.Parameters.AddWithValue("@TeacherLastName", teacher.TeacherLastName);
               cmd.Parameters.AddWithValue("@TeacherFirstName", teacher.TeacherFirstName);
               cmd.Parameters.AddWithValue("@TeacherDateJoin", teacher.TeacherDateJoin);
               cmd.Parameters.AddWithValue("@TeacherDepartment", teacher.TeacherDepartment);
               cmd.ExecuteNonQuery();
               GravaLog("Alterando a lista de professores");



           }
           catch (Exception ex)
           {

               throw ex;
               GravaLog(ex.Message.ToString());
           }

           finally {

               ClosedConnection();
           
           }
       
       }

       public void DeleteTeachers(Teacher teacher)
       {
           try
           {
               OpenConnection();
               cmd.CommandType = System.Data.CommandType.StoredProcedure;
               cmd.CommandText = "DeleteTeacher";
               cmd.Parameters.Clear();
               cmd.Parameters.AddWithValue("@TeacherID", teacher.TeacherID);
               cmd.Parameters.AddWithValue("@LoginID", -1);
               cmd.ExecuteNonQuery();
               GravaLog("Deletando professores");
              
           }
           catch (Exception ex)
           {

               throw ex;
               GravaLog(ex.Message.ToString());
           }

           finally {
               ClosedConnection();
           }
       
       }

       public void InsetTeachers(Teacher teacher, UsersLogin usersLogin)
       {

           try{
              
               OpenConnection();
               cmd.CommandType = System.Data.CommandType.StoredProcedure;
               cmd.CommandText = "InsertTeacher";
               cmd.Parameters.Clear();
               cmd.Parameters.AddWithValue("@TeacherLastName", teacher.TeacherLastName);
               cmd.Parameters.AddWithValue("@TeacherFirstName", teacher.TeacherFirstName);
               cmd.Parameters.AddWithValue("@TeacherDepartment", teacher.TeacherDepartment);
               cmd.Parameters.AddWithValue("@UserEmail", usersLogin.UserEmail);
               cmd.Parameters.AddWithValue("@UserPassword", usersLogin.UserPassword);
               cmd.ExecuteNonQuery();
               GravaLog("Inserindo professores "+usersLogin);
           }
           catch (Exception ex){
               
               throw ex;
               GravaLog(ex.Message.ToString());
           }

           finally {

               ClosedConnection();
           
           }


       }

       public void GravaLog(string _message) { 
        String ambiente = fugen.GetEnvironmentVariableServer("AMBDEVELOPMENT");
        String local = "C:\\Projetos\\School\\print";

        System.IO.StreamWriter GravaMes = new System.IO.StreamWriter(@local + "\\Log.txt");

        //'Grava no arquivo uma linha com a data e hora atual
        GravaMes.WriteLine("Log do dia :" + DateTime.Now.ToString());
        GravaMes.WriteLine("Ambiente :" + ambiente.ToString());
        GravaMes.WriteLine("Mensagem  :" + _message.ToString());
        GravaMes.Close();
       
       }

       //Captura o IP
       public string GetIPAddress()
       {
           System.Web.HttpContext context = System.Web.HttpContext.Current;
           string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

           if (!string.IsNullOrEmpty(ipAddress))
           {
               string[] addresses = ipAddress.Split(',');
               if (addresses.Length != 0)
               {
                   return addresses[0];
               }
           }

           return context.Request.ServerVariables["REMOTE_ADDR"];
       }

    }
}
