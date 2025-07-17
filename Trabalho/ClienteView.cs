using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRABALHO.mapeamento;
using TRABALHO.utilidades;

namespace TRABALHO
{
    internal class ClienteView
    {
        public Cliente ObterDadosCliente()
        {
            var cliente = new Cliente();

            Console.WriteLine("Nome: ");
            cliente.nome = Console.ReadLine();

            Console.WriteLine("Telefone: ");
            cliente.telefone = Console.ReadLine();

            Console.WriteLine("CPF: ");
            cliente.cpf = Console.ReadLine();

            Console.WriteLine("Endereço: ");
            cliente.endereco = Console.ReadLine();

            return cliente;
        }

        public int ObterIdCliente()
        {
            Console.Write("Informe o ID do cliente: ");
            return int.Parse(Console.ReadLine());
        }



        public void MostrarClientes(List<Cliente> clientes)
        {
            Console.WriteLine("\n--- Lista de Clientes ---");
            foreach (var c in clientes)
            {
                Console.WriteLine($"ID: {c.id_cliente} | Nome: {c.nome} | Telefone: {c.telefone} | CPF: {c.cpf} | Endereço: {c.endereco}");
            }
           
        }
    }
}
