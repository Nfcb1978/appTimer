using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace appTimer
{
    public partial class Trabalho : System.Web.UI.Page
    {
     
      int idcliente = 0;
        
        string idcarrinho = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
          

               
               
            

          
            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
            //Se não escolher cliente
            if (Session["cliente"] == null)
            {
                Response.Redirect("cliente.aspx");

            }
            else
            {
                lbl_nome.Text = "Cliente: " + Session["cliente"].ToString();

            }

            //Verificar se existe serviço escolhido
            if ((Request.QueryString["servico"] == null) && ((Session["idCliente"]) == null))
            {
                Response.Redirect("servico.aspx");
            }
           
                if(Request.QueryString["servico"]!=null)
                    {
                Session["servico"] = Convert.ToString(Request.QueryString["servico"]);
                Session["idservico"] = Request.QueryString["idservico"].ToString();
            }
            lbl_servico.Text = "Serviço: " + Session["servico"];


         
        }





        [WebMethod(EnableSession = true)]
        public static void SaveTrabalho(string imageData, string contentType)
        {


            // Remove o prefixo "data:image/png;base64," da string base64
            string base64String = imageData.Replace("data:image/png;base64,", "");

            // Converte a string base64 em um array de bytes
            byte[] imageBytes = Convert.FromBase64String(base64String);

            // Conexão ao banco de dados (substitua por sua string de conexão)


            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "inserir_assinatura"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar

            myCommando.Parameters.AddWithValue("@ct", contentType);
            myCommando.Parameters.AddWithValue("@assinatura", imageBytes);
            myCommando.Parameters.AddWithValue("@RecordDate", DateTime.Today);
            // Obtendo a variável de sessão via HttpContext.Current
            if (HttpContext.Current.Session["idCliente"] != null)
            {
                int idCliente = int.Parse(HttpContext.Current.Session["idCliente"].ToString());
                myCommando.Parameters.AddWithValue("@idCliente", idCliente);  // Corrigi o nome do parâmetro para @idCliente
            }
            else
            {
                throw new Exception("Variável de sessão 'idCliente' não encontrada.");
            }


          

        

            // Abre a conexão, executa a consulta e fecha a conexão
            myConn.Open();
            myCommando.ExecuteNonQuery(); // Execução da Procedure
            myConn.Close();
            



        }


        protected void Btn_Confirma_Click(object sender, EventArgs e)
        {
            string valor = "";
            if (Session["idcarrinho"]!=null)
            {
                valor = Session["idcarrinho"].ToString();
               
            }
            idcliente= int.Parse(Session["idCliente"].ToString());
            int servico =int.Parse(Session["idservico"].ToString());
            string entrada = DateTime.Now.ToString();
            Session["entrada"] = entrada;

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "inserir_trabalho"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@carrinho", valor);
            myCommando.Parameters.AddWithValue("@cliente", idcliente);
            myCommando.Parameters.AddWithValue("@servico", servico);
            myCommando.Parameters.AddWithValue("@comentario", tb_Notas.Text);
            myCommando.Parameters.AddWithValue("@datainicio", tbDataInicio.Text);
            myCommando.Parameters.AddWithValue("@datafim", tbDataFim.Text);
            myCommando.Parameters.AddWithValue("@tempoprevisto", TbTempoPrevisto.Text);
            myCommando.Parameters.AddWithValue("@entrada", entrada);

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();
            Response.Redirect("Trabalho_Detalhe.aspx");

        }

        protected void Btn_VenderProduros_Click(object sender, EventArgs e)
        {
            
            Session["idcarrinho"] = DateTime.Now + idcliente.ToString();
            idcarrinho = Session["idcarrinho"].ToString();
            Response.Redirect("Produtos.aspx");
        }

        protected void rtpProdutos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/
               
                ((Label)e.Item.FindControl("lbl_produto")).Text = dr["Nome"].ToString();
                ((Label)e.Item.FindControl("lbl_preco")).Text = dr["Preco"].ToString() + " Eur";
                ((Label)e.Item.FindControl("lbl_quantidade")).Text = dr["Total"].ToString();
                ((Image)e.Item.FindControl("img_foto")).ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])dr["foto"]);



            }
        }
    }
}