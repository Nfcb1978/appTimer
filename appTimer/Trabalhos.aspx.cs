﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Xml.Xsl;

namespace appTimer
{
    public partial class Trabalhos : System.Web.UI.Page
    {
        private int itemsPerPage = 5;
        private int totalItems = 0; // Armazenará o total de itens
        private int totalPages = 0; // Armazenará o total de páginas

        private int CurrentPage
        {
            get
            {
                // Verificar se há um valor de currentPage armazenado no ViewState
                if (ViewState["CurrentPage"] != null)
                {
                    return (int)ViewState["CurrentPage"];
                }
                else
                {
                    return 1; // Página padrão é a 1
                }
            }
            set
            {
                ViewState["CurrentPage"] = value; // Armazenar no ViewState
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["utilizador"] == null)
            {
              Response.Redirect("login.aspx");
            }

            string query = "Select Clientes.nome, Servicos.servico, Trabalhos.comentario, Trabalhos.tempoPrevisto " +
                " from Trabalhos inner join Clientes on " +
                "Clientes.numero_Cliente = Trabalhos.codigoCliente inner join Assinaturas " +
                "on Trabalhos.idassinatura = Assinaturas.id inner join Servicos on " +
                "Servicos.id = Trabalhos.numeroServico inner join Carrinho on " +
                "Carrinho.idtrabalho = Trabalhos.NTrabalho inner join Produtos on Carrinho.idproduto = Produtos.ID";



            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand(query, myConn);//vou correr a minha query utilizando o Myconn
            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommando);
            DataSet myDataSet = new DataSet();
            myAdapter.Fill(myDataSet);

            Xml1.DocumentContent = myDataSet.GetXml(); //despejar conteudo do select


            totalItems = myDataSet.Tables[0].Rows.Count; // Total de itens
            totalPages = (int)Math.Ceiling((double)totalItems / itemsPerPage); // Total de páginas


            LoadXmlData();
            GeneratePageButtons(); // Gerar botões de paginação





        }


        private void LoadXmlData()
        {

            // Definir os parâmetros para a transformação
            XsltArgumentList arguments = new XsltArgumentList();
            arguments.AddParam("page", "", CurrentPage);
            arguments.AddParam("itemsPerPage", "", itemsPerPage);

            // Carregar o XML e aplicar a transformação
            Xml1.TransformArgumentList = arguments;


        }

        // Evento do botão "Anterior"
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                LoadXmlData();
                GeneratePageButtons();
            }
        }

        // Evento do botão "Próxima"
        protected void btnNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            LoadXmlData();
            GeneratePageButtons();
        }

        private void GeneratePageButtons()
        {
            paginationPanel.Controls.Clear(); // Limpar botões existentes

            for (int i = 1; i <= totalPages; i++)
            {
                Button pageButton = new Button
                {
                    Text = i.ToString(),
                    CommandArgument = i.ToString(),
                    CssClass = "btn btn-primary page-button", // Classes Bootstrap para o estilo do botão
                                                              // Adicionar uma margem de 5px entre os botões

                };
                // Adicionar a margem manualmente usando o método Add
                pageButton.Style.Add("margin-right", "5px"); // Adicionar separação entre os botões

                pageButton.Click += PageButton_Click; // Adicionar evento de clique
                paginationPanel.Controls.Add(pageButton); // Adicionar o botão ao painel

                // Destacar a página atual
                if (i == CurrentPage)
                {
                    pageButton.CssClass += " active"; // Classe CSS para destacar a página atual
                }
            }
        }

        // Evento ao clicar em um botão de página
        protected void PageButton_Click(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            CurrentPage = int.Parse(clickedButton.CommandArgument); // Atualizar a página atual
            LoadXmlData(); // Recarregar dados para a nova página
            GeneratePageButtons(); // Regenerar os botões com o destaque correto
        }

    } 
}