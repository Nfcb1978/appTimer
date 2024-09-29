using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Xsl;
using System.Data;

namespace appTimer
{
    public partial class servico : System.Web.UI.Page
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
            if (Request.QueryString["nome"] == null)
            {
                Xml1.TransformSource = "FormataManutencaoServicos.xslt";
                lbl_nome.Text = "MANUTENÇÃO";
            }
            else
            {
                Xml1.TransformSource = "FormataServico.xslt";
                lbl_nome.Text = "Para o cliente " + Convert.ToString(Request.QueryString["nome"]) ;
            }

            rtp_pesquisa.Visible = false;
            
            Session["idCliente"] = Convert.ToString(Request.QueryString["id"]);




            Session["cliente"] = Convert.ToString(Request.QueryString["nome"]);
            //Ir buscar dados Base de dados
            string query = "select * from Servicos";
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

    
    // Função para carregar e aplicar a transformação XSLT
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


   

       

        protected void Bt_pesquisa_Click(object sender, ImageClickEventArgs e)
        {
            String pesquisa = tb_pesquisa.Value;

            if (pesquisa == "")
            {
                rtp_pesquisa.Visible = false;

                Xml1.Visible = true;
             

            }
            else
            {
                rtp_pesquisa.Visible = true;
                SqlDataSource1.SelectCommand = $"Select * from Servicos where servico like '{pesquisa}%'";
                Xml1.Visible = false;
             

            }
        }

     

        protected void rtp_pesquisa_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/

                ((Label)e.Item.FindControl("lbl_servico")).Text = dr["servico"].ToString();

            }
        }
    }
}