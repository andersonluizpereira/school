using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace DAOS.LayerDao
{
    public class Query
    {
        private IDbCommand comando;
        public Query(String sql, IDbConnection connection)
        {
            comando = connection.CreateCommand();
            comando.CommandText = sql;
        }
        public void ExecuteUpdate()
        {
            comando.ExecuteNonQuery();
        }
        public IDataReader ExecuteQuery()
        {
            return comando.ExecuteReader();
        }
        public Query SetParameter(String nome, object valor)
        {
            var parametro = comando.CreateParameter();
            parametro.ParameterName = nome;
            parametro.Value = valor;
            comando.Parameters.Add(parametro);
            return this;
        }
    }
    public class DBSession
    {
        private IDbConnection conexao;
        public DBSession()
        {
            conexao = new SqlConnection("Data Source=.;Initial Catalog=School;Persist Security Info=False;User ID=sa;Password=fiap;");
            conexao.Open();
        }
        public void Close()
        {
            conexao.Close();
        }
        public Query CreateQuery(String sql) 
        {
            return new Query(sql, conexao);
        }
    }
}