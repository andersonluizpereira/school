
using System.Data.SqlClient;
using System;
using System.Configuration;


namespace DAOS.LayerDao
{
    public abstract class Dao
    {
        protected SqlConnection cn; //mantém a conexão com o bd
        protected SqlCommand cmd; // executa instruções de procedures
        protected SqlDataReader reader; // consultas - modo conectado
        protected SqlDataAdapter da; //Consultas modo desconectado
         

        protected String conexao = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;
   
        // protected String conexao = ConfigurationManager.ConnectionStrings["DES"].ConnectionString;
        // protected String conexao = ConfigurationManager.AppSettings.Keys[1].ToString();
        //protected String conexao = ConfigurationManager.ConnectionStrings[FunctionsGen.GetEnvironmentVariableServerPre].ConnectionString;

        public Dao()
        {
            SchoolDao scdao = new SchoolDao();
            try
            {

                cn = new SqlConnection(conexao);
                cmd = new SqlCommand();
                da = new SqlDataAdapter();

            }
            catch (Exception ex)
            {

                throw ex;
              
            }

        }

        public void OpenConnection()
        {
            SchoolDao scdao = new SchoolDao();
            try
            {
                scdao.GravaLog("Abrindo conexão");
                cn.Open();
                cmd.Connection = cn;
            }
            catch (Exception ex)
            {

                throw ex;
             
            }


        }

        public void ClosedConnection()
        {
            if (cn.State == System.Data.ConnectionState.Open)
            {

                cn.Close();
            }

        }

    }

}
