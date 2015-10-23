using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using DAOS.Models;

namespace DAOS.LayerDao
{
   public class SchoolDao : Dao
    {
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




           }
           catch (Exception ex)
           {

               throw ex;
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
              
           }
           catch (Exception ex)
           {

               throw ex;
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
           }
           catch (Exception){
               
               throw;
           }

           finally {

               ClosedConnection();
           
           }


       }

    }
}
