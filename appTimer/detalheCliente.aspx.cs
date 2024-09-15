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
    public partial class detalheCliente : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
           
           string id= Convert.ToString(Request.QueryString["id"]);
            int idt = int.Parse(id);
           
           if (!IsPostBack)
           {
               
                               Btn_Confirmar.Visible = false;
                              
                               SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

                               SqlCommand myCommando = new SqlCommand();//linha de comandos
                               myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
                               myCommando.CommandText = "detalheCliente "; //cujo nome é... 
                               myCommando.Connection = myConn; //conexão a usar
                               myCommando.Parameters.AddWithValue("@idt", idt);

                               myConn.Open();
                               SqlDataReader dr = myCommando.ExecuteReader(); //Receber dados da consulta
                               if (dr.Read())//se o datareader estiver preenchido
                               {
                                   tb_NCliente.Text = dr["numero_Cliente"].ToString();//campo nome do dr
                                   tb_nome.Text = dr["nome"].ToString();//campo nome do dr
                                   tb_morada.Text = dr["morada1"].ToString();//campo nome do dr
                                   tb_morada2.Text = dr["morada2"].ToString();
                                   tbcodPostal.Text = dr["codigoPostal"].ToString();//campo nome do dr
                                   tb_Frequesia.Text = dr["freguesia"].ToString();
                                   tb_latitude.Text = dr["latitude"].ToString();
                                   tb_longitude.Text = dr["longitude"].ToString();
                                   tb_Email.Text = dr["email"].ToString();
                                   tb_telemovel.Text = dr["telemovel1"].ToString();
                                   tb_telemovel2.Text = dr["telemovel2"].ToString();
                                   tb_telefone.Text = dr["telefone1"].ToString();                   
                                   tb_telefone2.Text = dr["telefone2"].ToString();
                                   tb_nif.Text = dr["nif"].ToString();
                                }                   
            }
                       
                   
        }

        protected void Btn_Alterar_Click(object sender, EventArgs e)
        {
            Btn_Confirmar.Visible = true;
            Btn_Alterar.Visible = false;           
            tb_nome.Enabled = true;                        
            tb_morada.Enabled = true;
            tb_morada2.Enabled = true;
            tbcodPostal.Enabled = true;
            tb_Frequesia.Enabled = true;
            tb_latitude.Enabled = true;
            tb_longitude.Enabled = true;
            tb_Email.Enabled = true;
            tb_telemovel.Enabled = true;
            tb_telemovel2.Enabled = true;
            tb_telefone.Enabled = true;
            tb_telefone2.Enabled = true;
            tb_nif.Enabled = true;
        }

        protected void Btn_Confirmar_Click(object sender, EventArgs e)
        {
            string id = Convert.ToString(Request.QueryString["id"]);
            int idt = int.Parse(id);

           
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "alterarDadosCliente"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar           
            myCommando.Parameters.AddWithValue("@nome", tb_nome.Text);
            myCommando.Parameters.AddWithValue("@morada", tb_morada.Text);
            myCommando.Parameters.AddWithValue("@morada2", tb_morada2.Text);
            myCommando.Parameters.AddWithValue("@codigoPostal ", tbcodPostal.Text);
            myCommando.Parameters.AddWithValue("@freguesia", tb_Frequesia.Text);
            myCommando.Parameters.AddWithValue("@latitude", tb_latitude.Text);
            myCommando.Parameters.AddWithValue("@longitude", tb_longitude.Text);
            myCommando.Parameters.AddWithValue("@Email", tb_Email.Text);
            myCommando.Parameters.AddWithValue("@telemovel", tb_telemovel.Text);
            myCommando.Parameters.AddWithValue("@telemovel2", tb_telemovel2.Text);
            myCommando.Parameters.AddWithValue("@telefone", tb_telefone.Text);
            myCommando.Parameters.AddWithValue("@telefone2", tb_telefone2.Text);
            myCommando.Parameters.AddWithValue("@nif", tb_nif.Text);
            myCommando.Parameters.AddWithValue("@idt", idt);

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();

            Btn_Confirmar.Visible = false;
            Btn_Alterar.Visible = true;           
            tb_nome.Enabled = false;
            tb_morada.Enabled = false;
            tb_morada2.Enabled = false;
            tbcodPostal.Enabled = false;
            tb_Frequesia.Enabled = false;
            tb_latitude.Enabled = false;
            tb_longitude.Enabled = false;
            tb_Email.Enabled = false;
            tb_telemovel.Enabled = false;
            tb_telemovel2.Enabled = false;
            tb_telefone.Enabled = false;
            tb_telefone2.Enabled = false;
            tb_nif.Enabled = false;
        }
    }
    }