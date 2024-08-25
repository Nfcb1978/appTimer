using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace appTimer
{
    public partial class tarefa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Se não existir sessão     
            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }

            //Ir buscar dados Base de dados
            string query = "select nome from Tarefas";
            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand(query, myConn);//vou correr a minha query utilizando o Myconn
            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommando);
            DataSet myDataSet = new DataSet();
            myAdapter.Fill(myDataSet);

            Xml1.DocumentContent = myDataSet.GetXml(); //despejar conteudo do select para o
            
            
           
            //Nome cliente que vem da outra página
            lbl_nome.Text = Convert.ToString(Request.QueryString["nome"]);
              
            if (lbl_nome.Text!="")
                {
                    ddl_nome.Visible = false;
                    lbl_nome.Visible = true;
                }
                else
                {
                    ddl_nome.Visible = true;
                    lbl_nome.Visible = false;
                }

          

        if (!Page.IsPostBack)
            {
                if ((ddl_nome.Items.Count == 0) || (ddl_nome.Items[0].Value != "Escolha o Cliente"))//Carrega todos de ddl for vazia ou diferente de todos
                {
         
                    ddl_nome.Items.Add("Escolha o Cliente");

                }
            }
        }

        protected void ddl_nome_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["cliente"] = ddl_nome.SelectedItem.ToString();
        }

        protected void Criar_Tarefa_Click(object sender, EventArgs e)
        {
            Response.Redirect("adicionarservico.aspx");
        }
    }
}