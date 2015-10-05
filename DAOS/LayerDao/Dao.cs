
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAOS.LayerDao
{
  public abstract  class Dao
    {
        protected SqlConnection cn; //mantém a conexão com o bd
        protected SqlCommand cmd; // executa instruções de procedures
        protected SqlDataReader reader; // consultas - modo conectado
        protected SqlDataAdapter da; //Consultas modo desconectado

       // private String conexao = "Persist Security Info=False;server=localhost;database=portal;uid=root;pwd=''";
        protected String conexao = ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString;

        public Dao()
        {

            cn = new SqlConnection(conexao);
            cmd = new SqlCommand();
            da = new SqlDataAdapter();


        }

        public void OpenConnection()
        {
            try
            {
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
