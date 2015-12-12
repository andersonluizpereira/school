using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.OleDb;

namespace DAOS.LayerDao
{
    public abstract class DaoADOdb
    {

        protected OleDbConnection cn; //mantém a conexão com o bd
        protected OleDbCommand cmd; // executa instruções de procedures
        protected OleDbDataReader reader; // consultas - modo conectado
        protected OleDbDataAdapter da; //Consultas modo desconectado

        private String conexao = ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString;

        public DaoADOdb() {
            cn = new OleDbConnection(conexao);
            cmd = new OleDbCommand();
            da = new OleDbDataAdapter();
            
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
}
