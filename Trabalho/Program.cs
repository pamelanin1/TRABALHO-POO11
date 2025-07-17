using TRABALHO.Controle;
using TRABALHO.DAO;
using TRABALHO.mapeamento;
using TRABALHO.utilidades;
Conexao.Conectar();


try
{
    ClienteControle controle = new ClienteControle();
    controle.Menu();
}
catch (Exception ex)
{
    Console.WriteLine("Erro: " + ex.Message);
}