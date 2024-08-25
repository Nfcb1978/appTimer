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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["utilizador"] == null)
            {
                Console.WriteLine("Entrei");
                Response.Redirect("login.aspx");
            }
            rtp_pesquisa.Visible = false;
            string query = "select nome from Clientes";
            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand(query, myConn);//vou correr a minha query utilizando o Myconn
            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommando);
            DataSet myDataSet = new DataSet();
            myAdapter.Fill(myDataSet);
     
            Xml1.DocumentContent = myDataSet.GetXml(); //despejar conteudo do select para o xml
        }

        protected void Lb_InicioRapido_Click(object sender, EventArgs e)
        {
            Response.Redirect("adicionarCliente.aspx");
        }

        protected void rtp_pesquisa_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/

              
                ((Label)e.Item.FindControl("lbl_projecto")).Text = dr["nome"].ToString();


             
            }


            /*
            String pesquisa = tb_pesquisa.Value;

            SqlDataSource1.SelectCommand = $"Select * from mercados where mercado like '{pesquisa}%'";
        */
        }

        protected void Bt_pesquisa_Click(object sender, ImageClickEventArgs e)
        {
            String pesquisa = tb_pesquisa.Value;
            if (pesquisa == "todos")
            {
                rtp_pesquisa.Visible = true;
                Xml1.Visible = false;
                Lb_InicioRapido.Visible = false;
            }
            else
            {
                rtp_pesquisa.Visible = true;
                SqlDataSource1.SelectCommand = $"Select * from assistencias where nome like '{pesquisa}%'";
                Xml1.Visible = false;
                Lb_InicioRapido.Visible = false;

            }
        }
    }
}