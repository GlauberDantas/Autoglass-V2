using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Autoglass.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace Autoglass.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public JsonResult Get()
        {
            string projectPath = AppDomain.CurrentDomain.BaseDirectory.Split(new String[] { @"bin\" }, 
                                 StringSplitOptions.None)[0];
            IConfigurationRoot configuration = new ConfigurationBuilder()
                                                                         .SetBasePath(projectPath)
                                                                         .AddJsonFile("appsettings.json")
                                                                         .Build();
            string connectionString = configuration.GetConnectionString("Autoglass");

            var conexao = new SqlConnection(connectionString);

            List<Fornecedor> listaFornecedores = new List<Fornecedor>();

            listaFornecedores = conexao.Query<Fornecedor>(
                " select "+
                "     p.tbProduto_id,p.tbProduto_descricao, p.tbProduto_DataFabricacao,p.tbProduto_DataValidade," +
                "     f.tbFornecedor_Id,f.tbFornecedor_Descricao, concat(c.nome,' - ',e.UF) as tbFornecedor_Cidade" +
                " from  "+
                "     tbProduto p "+
                "     inner join tbFornecedor f on f.tbFornecedor_Id = p.tbFornecedor_Id " +
                "     inner join tbCidades c on c.id = f.tbFornecedor_Cidade " +
                "     inner join tbEstados e ON e.id = c.id_estado " +
                " order by " +
                "     p.tbProduto_descricao").ToList();

            return new JsonResult(listaFornecedores);
        }       
    }
}
