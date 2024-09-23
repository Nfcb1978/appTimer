using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using System.Data.SqlClient;
using System.Configuration;

using System.IO;

namespace appTimer
{
    public partial class ManutencaoProdutos : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void rtp_produtos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btn_gravar"))
            {
                // Estabelece a conexão com o banco de dados
                SqlConnection myConn = new SqlConnection
                (ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);

                // Obtem os valores dos campos
                string nome = ((TextBox)e.Item.FindControl("tb_nome")).Text;
                string preco = ((TextBox)e.Item.FindControl("tb_preco")).Text;
                string descricao = ((TextBox)e.Item.FindControl("tb_descricao")).Text;
                string id = ((ImageButton)e.Item.FindControl("btn_gravar")).CommandArgument; // Pega o ID do item

                // Obtem o controle FileUpload e verifica se há um arquivo carregado
                FileUpload fileUpload = (FileUpload)e.Item.FindControl("FileUpload1");
                byte[] imageBytes = null;

                if (fileUpload.HasFile)
                {
                    // Converte a imagem carregada para um array de bytes
                    using (BinaryReader reader = new BinaryReader(fileUpload.PostedFile.InputStream))
                    {
                        imageBytes = reader.ReadBytes(fileUpload.PostedFile.ContentLength);
                    }
                }

                // Cria a consulta SQL para atualizar o produto
                string query = "UPDATE Produtos SET Nome = @Nome, Preco = PARSE(@Preco AS DECIMAL(6, 2) USING 'PT-pt'), descricao = @Descricao";

                // Se uma nova imagem foi carregada, inclui a atualização da imagem na query
                if (imageBytes != null)
                {
                    query += ", foto = @Foto";
                }

                query += " WHERE ID = @ID";

                // Abre a conexão
                myConn.Open();

                // Prepara o comando SQL
                SqlCommand myComand = new SqlCommand(query, myConn);
                myComand.Parameters.AddWithValue("@Nome", nome);
                myComand.Parameters.AddWithValue("@Preco", preco);
                myComand.Parameters.AddWithValue("@Descricao", descricao);
                myComand.Parameters.AddWithValue("@ID", id);

                // Adiciona o parâmetro da imagem se houver uma nova imagem
                if (imageBytes != null)
                {
                    myComand.Parameters.AddWithValue("@Foto", imageBytes);
                }

                // Executa a consulta
                myComand.ExecuteNonQuery();

                // Fecha a conexão
                myConn.Close();
            }
        

        /*
       

        if (e.CommandName.Equals("btn_apaga"))
        {
            SqlConnection myConn = new SqlConnection
            (ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);
            string query = "delete from Produtos ";

            query += "where ID=" + ((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument;//associar oa botão
            myConn.Open();//Abrir a conexão
            SqlCommand myComand = new SqlCommand(query, myConn); //recebe e query e executa no myConn
            myComand.ExecuteNonQuery(); myComand.ExecuteNonQuery();
            myConn.Close();
        }*/

    }

        protected void rtp_produtos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/
                ((Label)e.Item.FindControl("lbl_cod")).Text = dr["id"].ToString();//Vou procurar o lbl_cod e coloco os dados da DB campo cod_avaliacao
                ((TextBox)e.Item.FindControl("tb_nome")).Text = dr["Nome"].ToString();
                ((TextBox)e.Item.FindControl("tb_preco")).Text = dr["Preco"].ToString();
                ((TextBox)e.Item.FindControl("tb_descricao")).Text = dr["descricao"].ToString();
                ((Image)e.Item.FindControl("img_foto")).ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])dr["foto"]);
                ((ImageButton)e.Item.FindControl("btn_gravar")).CommandArgument = dr["ID"].ToString();//Associar uma propriedade ao botao - ComandArgument
                 //((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument = dr["ID"].ToString();                                                                                               //  ((ImageButton)e.Item.FindControl("btn_apaga")).CommandArgument = dr["cod_servico"].ToString();


            }
        }

        protected void lb_inserirProduto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adicionar_Produto.aspx");
        }
    }
}