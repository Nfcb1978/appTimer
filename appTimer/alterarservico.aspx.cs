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
    public partial class alterarservico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }

            string id = Convert.ToString(Request.QueryString["id"]);
            int idt = int.Parse(id);

            if (!IsPostBack)
            {

                Btn_Confirmar.Visible = false;

                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

                SqlCommand myCommando = new SqlCommand();//linha de comandos
                myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
                myCommando.CommandText = "Servico"; //cujo nome é... 
                myCommando.Connection = myConn; //conexão a usar
                myCommando.Parameters.AddWithValue("@idt", idt);

                myConn.Open();
                SqlDataReader dr = myCommando.ExecuteReader(); //Receber dados da consulta
                if (dr.Read())//se o datareader estiver preenchido
                {
                   tb_NServico.Text = dr["id"].ToString();//campo nome do dr
                    tb_servico.Text = dr["servico"].ToString();//campo nome do dr
                    tb_descricao.Text = dr["descricao"].ToString();//campo nome do dr
                   
                }
            }


        }

        protected void Btn_Alterar_Click(object sender, EventArgs e)
        {
            Btn_Confirmar.Visible = true;
            Btn_Alterar.Visible = false;
            tb_servico.Enabled = true;
            tb_descricao.Enabled = true;
           
        }

        protected void Btn_Confirmar_Click(object sender, EventArgs e)
        {
            string id = Convert.ToString(Request.QueryString["id"]);
            int idt = int.Parse(id);


            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "alterarServico"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar           
            myCommando.Parameters.AddWithValue("@servico", tb_servico.Text);
            myCommando.Parameters.AddWithValue("@descricao", tb_descricao.Text);
            myCommando.Parameters.AddWithValue("@idt", idt);

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();


            Btn_Confirmar.Visible = false;
            Btn_Alterar.Visible = true;
            tb_servico.Enabled = false;
            tb_descricao.Enabled = false;
            Response.Redirect("servico.aspx");
        }

        protected void Btn_Adicionar_Click(object sender, EventArgs e)
        {
            Response.Redirect("adicionarservico.aspx");
        }
    }
}