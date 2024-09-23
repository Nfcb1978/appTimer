using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace appTimer
{
    public partial class Adicionar_Produto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Inserir_Click(object sender, EventArgs e)
        {
            if ((tbNome.Text != "") && (tb_preco.Text != "") && (tb_descricao.Text != "") && (FileUpload1.PostedFile.ContentLength > 0)){
                Stream imgStream = FileUpload1.PostedFile.InputStream;//Acesso ao ficheiro que está selecionado
                int tamanhoFich = FileUpload1.PostedFile.ContentLength;//Tamanho do ficheiro
                string contentType = FileUpload1.PostedFile.ContentType; //Cotenttype do ficheiro selecionado

                byte[] imgBinaryData = new byte[tamanhoFich];// array de bites
                imgStream.Read(imgBinaryData, 0, tamanhoFich);//lê o ficheiro que está seleciondo e preenche desde o tamos zero até a+ tamanho do array





                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

                SqlCommand myCommando = new SqlCommand();//linha de comandos
                myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
                myCommando.CommandText = "inserir_produto"; //cujo nome é... 
                myCommando.Connection = myConn; //conexão a usar
                myCommando.Parameters.AddWithValue("@nome", tbNome.Text);
                myCommando.Parameters.AddWithValue("@descricao", tb_descricao.Text);
                myCommando.Parameters.AddWithValue("@ct", contentType);
                myCommando.Parameters.AddWithValue("@foto", imgBinaryData);
                myCommando.Parameters.AddWithValue("@preco", tb_preco.Text);


                //falta abrir conexão executar e fechar conexaão
                myConn.Open();
                myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
                myConn.Close();

                lbl_mensagem.Text = "";
                tbNome.Text = "";
                tb_preco.Text = "";
                tb_descricao.Text = "";

            }

        
        else
        {
                lbl_mensagem.Text = "Insira os dados todos do produto";
        }

    }
    }
    }
