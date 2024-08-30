using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace appTimer
{
    public partial class perfil1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
           
            if (!IsPostBack)
            {

                Btn_Confirmar.Visible = false;
                string Email = Session["utilizador"].ToString();
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

                SqlCommand myCommando = new SqlCommand();//linha de comandos
                myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
                myCommando.CommandText = "dadosTecnico "; //cujo nome é... 
                myCommando.Connection = myConn; //conexão a usar
                myCommando.Parameters.AddWithValue("@Email", Email);

                myConn.Open();
                SqlDataReader dr = myCommando.ExecuteReader(); //Receber dados da consulta
                if (dr.Read())//se o datareader estiver preenchido
                {
                    tbTipo.Text = dr["tipo"].ToString();//campo nome do dr
                    tb_nome.Text = dr["nome"].ToString();//campo nome do dr
                    tb_Contacto.Text = dr["contacto"].ToString();//campo nome do dr
                    tb_email.Text = dr["Email"].ToString();
                    tb_pw.Text = dr["pass"].ToString();//campo nome do dr

                }
            }
        }
        protected void Btn_Alterar_Click(object sender, EventArgs e)
        {
            Btn_Confirmar.Visible = true;
            Btn_Alterar.Visible = false;

            tbTipo.Enabled = true;
            tb_nome.Enabled = true;
            tb_Contacto.Enabled = true;
            tb_email.Enabled = true;
            tb_pw.Enabled = true;

        }

        protected void Btn_Confirmar_Click(object sender, EventArgs e)
        {
            string Email = Session["utilizador"].ToString();
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "alterarDadosTecnico"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@tipo", tbTipo.Text);
            myCommando.Parameters.AddWithValue("@nome", tb_nome.Text);
            myCommando.Parameters.AddWithValue("@contacto", tb_Contacto.Text);
            myCommando.Parameters.AddWithValue("@Email", tb_email.Text);
            myCommando.Parameters.AddWithValue("@pw", tb_pw.Text);
            myCommando.Parameters.AddWithValue("@EmailI", Email);

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();

            Btn_Confirmar.Visible = false;
            Btn_Alterar.Visible = true;

            tbTipo.Enabled = false;
            tb_nome.Enabled = false ;
            tb_Contacto.Enabled = false ;
            tb_email.Enabled = false    ;
            tb_pw.Enabled = false;
        }
    }
}