using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace appTimer
{
    public partial class adicionarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Btn_Inserir_Click(object sender, EventArgs e)
        {
          
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "inserir_cliente"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@nome", tbNome.Text);
            myCommando.Parameters.AddWithValue("@morada1", tb_morada.Text);
            myCommando.Parameters.AddWithValue("@morada2", tb_morada2.Text);
            myCommando.Parameters.AddWithValue("@codigoPostal", tb_CodPostal.Text);
            myCommando.Parameters.AddWithValue("@freguesia", tb_freguesia.Text);
            myCommando.Parameters.AddWithValue("@latitude", tb_latitude.Text);
            myCommando.Parameters.AddWithValue("@longitude", tb_longitude.Text);
            myCommando.Parameters.AddWithValue("@email", tbEmail.Text);
            myCommando.Parameters.AddWithValue("@telemovel1", tb_telemovel.Text);
            myCommando.Parameters.AddWithValue("@telemovel2", tb_telemovel2.Text);
            myCommando.Parameters.AddWithValue("@telefone1", tb_telefone.Text);
            myCommando.Parameters.AddWithValue("@telefone2", tb_telefone2.Text);
            myCommando.Parameters.AddWithValue("@nif", tb_nif.Text);

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();

            Response.Redirect("Cliente.aspx");

        }

 
    }
    
}