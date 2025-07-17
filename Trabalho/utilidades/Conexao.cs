using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace TRABALHO.utilidades
{
    internal static class Conexao
    {
        static MySqlConnection conexao;

        public static MySqlConnection Conectar()
        {
            try
            {
                string strconexao = "server=localhost;uid=root;port=3306;pwd=1997;database=petshop1";
                conexao = new MySqlConnection(strconexao);
                conexao.Open();
                Console.WriteLine("Conexão realizada com sucesso");
                return conexao;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao conectar com o banco de dados" + ex.Message);
            }
        }

        public static void FecharConexao()
        {
            conexao.Close();
        }
    }
}
