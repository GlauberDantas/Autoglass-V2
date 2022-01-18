using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Autoglass.Models
{
    public class Fornecedor
    {
        public int tbProduto_id { get; set; }
        public string tbProduto_descricao { get; set; }
        public string tbProduto_DataFabricacao { get; set; }
        public string tbProduto_DataValidade { get; set; }
        public int tbFornecedor_Id { get; set; }
        public string tbFornecedor_Descricao { get; set; }
        public string tbFornecedor_Cidade { get; set; }
    }
}
