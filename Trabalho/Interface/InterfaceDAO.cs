using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TRABALHO.Interface
{
    interface InterfaceDAO<T>
    {
        public void Cadastrar(T t);

        public void Atualizar(T t);

        public void Deletar(T t);
        
    }
}
