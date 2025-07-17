using TRABALHO.Interface;
using TRABALHO.mapeamento;
using TRABALHO.utilidades;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySqlX.XDevAPI;

namespace TRABALHO.DAO
{
    internal class ClienteDao: InterfaceDAO<Cliente>
    {

        public void Cadastrar(Cliente cliente)
        {
            try
            {
                string sql = "INSERT INTO Cliente (nome, telefone, cpf, endereco)" +
                    "VALUES (@nome, @telefone, @cpf, @endereco)";
                MySqlCommand comando = new MySqlCommand(sql, Conexao.Conectar());
                comando.Parameters.AddWithValue("@nome", cliente.nome);
                comando.Parameters.AddWithValue("@telefone", cliente.telefone);
                comando.Parameters.AddWithValue("@cpf", cliente.cpf);
                comando.Parameters.AddWithValue("@endereco", cliente.endereco);
                comando.ExecuteNonQuery();

                Conexao.FecharConexao();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Atualizar(Cliente cliente)
        {
            string sql = "UPDATE Cliente SET nome= @nome, telefone = @telefone, cpf = @cpf, endereco = @endereco WHERE id_cliente = @id_cliente";
            MySqlCommand comando = new MySqlCommand(sql, Conexao.Conectar());
            comando.Parameters.AddWithValue("@nome", cliente.nome);
            comando.Parameters.AddWithValue("@telefone", cliente.telefone);
            comando.Parameters.AddWithValue("@cpf", cliente.cpf);
            comando.Parameters.AddWithValue("@endereco", cliente.endereco);
            comando.Parameters.AddWithValue("@id_cliente", cliente.id_cliente);

            comando.ExecuteNonQuery();

            Conexao.FecharConexao();
        }
        public void Deletar(int id_cliente)
        {
            try
            {
                string sql = "DELETE FROM Cliente WHERE id_cliente = @id_cliente";
                using var comando = new MySqlCommand(sql, Conexao.Conectar());
                comando.Parameters.AddWithValue("@id_cliente", id_cliente);
                comando.ExecuteNonQuery();
                Conexao.FecharConexao();
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao deletar cliente: " + ex.Message);
            }
        }

        public List<Cliente> Listar()
        {
            List<Cliente> clientes = new();
            try
            {
                string sql = "SELECT * FROM Cliente";
                using var comando = new MySqlCommand(sql, Conexao.Conectar());
                using var dr = comando.ExecuteReader();

                while (dr.Read())
                {
                    clientes.Add(new Cliente
                    {
                        id_cliente = dr.GetInt32("id_cliente"),
                        nome = dr.GetString("nome"),
                        telefone = dr.GetString("telefone"),
                        cpf = dr.GetString("cpf"),
                        endereco = dr.GetString("endereco")
                    });
                }
                Conexao.FecharConexao();
                return clientes;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao listar clientes: " + ex.Message);
            }
        }

        public void Deletar(Cliente t)
        {
            throw new NotImplementedException();
        }

        
    }
}
