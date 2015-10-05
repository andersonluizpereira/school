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

namespace School.LayerDao
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
                AbrirConexao();
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
                FecharConexao();
            }

            return passwordMatch;

        }

        private string CreatePasswordHash(string pwd)
        {
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(pwd, "SHA1");
            return hashedPwd;
        }

        public DataTable ListTeachers() {
            
            DataTable dt = new DataTable();

            try
            {
                AbrirConexao();
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
                FecharConexao();
            }
            return dt;
        
        }

       public void AlterTeachers(Teacher teacher){

           try
           {

               AbrirConexao();
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

               FecharConexao();
           
           }
       
       }

       public void DeleteTeachers(Teacher teacher)
       {
           try
           {
               AbrirConexao();
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
               FecharConexao();
           }
       
       }
    }
}
