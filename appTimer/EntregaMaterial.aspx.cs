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
    public partial class EntregaMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            {
                if (Session["utilizador"] == null)
                {
                    Response.Redirect("login.aspx");
                }
            }

          
            if (!Page.IsPostBack)
            {
                if ((ddl_nome.Items.Count == 0) || (ddl_nome.Items[0].Value != "Escolha o Cliente"))//Carrega todos de ddl for vazia ou diferente de todos
                {

                    ddl_nome.Items.Add("Escolha o Cliente");

                }
               
            }

            if (ddl_nome.SelectedItem.ToString() == "Escolha o Cliente")
            {
                Btn_Confirma.Enabled = false;

            }
            else
            {
                Btn_Confirma.Enabled = true;
            }

        }

        protected void Btn_Confirma_Click(object sender, EventArgs e)
        {

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "entrega_material"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@idcliente", ddl_nome.SelectedValue);
            myCommando.Parameters.AddWithValue("@local",tb_Local.Text);
            myCommando.Parameters.AddWithValue("@codPostal", Tb_cod_Postal.Text);
            myCommando.Parameters.AddWithValue("@data", tbData.Text);
            myCommando.Parameters.AddWithValue("@tempo_previsto", TbTempoPrevisto.Text);





            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();
            Response.Redirect("index.aspx");
        }

        protected void ddl_nome_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}