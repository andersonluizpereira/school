using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAOS.LayerDao
{
  public abstract  class DaoMySQL
    {
        protected MySqlConnection cn; //mantém a conexão com o bd
        protected MySqlCommand cmd; // executa instruções de procedures
        protected MySqlDataReader reader; // consultas - modo conectado
        protected MySqlDataAdapter da; //Consultas modo desconectado

        private String conexao = ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString;

        public DaoMySQL()
        {

            cn = new MySqlConnection(conexao);
            cmd = new MySqlCommand();
            da = new MySqlDataAdapter();


        }

        protected void AbrirConexao()
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

        protected void FecharConexao()
        {
            if (cn.State == System.Data.ConnectionState.Open)
            {

                cn.Close();
            }

        }

    }
    
}
