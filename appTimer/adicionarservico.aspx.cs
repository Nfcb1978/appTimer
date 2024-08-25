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
    public partial class adicionarservico : System.Web.UI.Page
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
            myCommando.CommandText = "inserir_servico"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@nome", tbServico.Text);
            

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();
            Response.Redirect("index.aspx");
        }
    }
}