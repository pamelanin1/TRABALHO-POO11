using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRABALHO.DAO;

namespace TRABALHO.Controle
{
    internal class ClienteControle
    {
        private readonly ClienteDao dao = new();
        private readonly ClienteView view = new();

        public void Menu()
        {
            while (true)
            {
                Console.WriteLine("\n--- Menu Cliente ---");
                Console.WriteLine("1 - Cadastrar Cliente");
                Console.WriteLine("2 - Atualizar Cliente");
                Console.WriteLine("3 - Deletar Cliente");
                Console.WriteLine("4 - Listar Clientes");
                Console.WriteLine("0 - Sair");
                Console.Write("Escolha: ");
                string opcao = Console.ReadLine();

                switch (opcao)
                {
                    case "1":
                        dao.Cadastrar(view.ObterDadosCliente());
                        break;
                    case "2":
                        var cliente = view.ObterDadosCliente();
                        cliente.id_cliente = view.ObterIdCliente();
                        dao.Atualizar(cliente);
                        break;
                    case "3":
                        int id = view.ObterIdCliente();
                        dao.Deletar(id);
                        break;
                    case "4":
                        view.MostrarClientes(dao.Listar());
                        break;
                    case "0":
                        return;
                    default:
                        Console.WriteLine("Opção inválida!");
                        break;
                }
            }
        }
    }
}
