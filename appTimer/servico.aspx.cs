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

namespace appTimer
{
    public partial class servico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     if (Session["utilizador"] == null)
            {
          //    Response.Redirect("login.aspx");
            }
            if (Request.QueryString["nome"] == null)
            {
           //   Response.Redirect("cliente.aspx");
            }


           // lbl_nome.Text= Convert.ToString(Request.QueryString["nome"]);
            

           

            Session["cliente"] = lbl_nome.Text;
            //Ir buscar dados Base de dados
            string query = "select * from Servicos";
            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand(query, myConn);//vou correr a minha query utilizando o Myconn
            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommando);
            DataSet myDataSet = new DataSet();
            myAdapter.Fill(myDataSet);

            Xml1.DocumentContent = myDataSet.GetXml(); //despejar conteudo do select 
        }

        protected void rtp_servico_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
        }

        protected void Lb_CriarTrablaho_Click(object sender, EventArgs e)
        {
            Response.Redirect("adicionarservico.aspx");
        }
    }
}