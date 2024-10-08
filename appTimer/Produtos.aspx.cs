﻿using System;
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
    public partial class Produstos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cliente"] == null)
            {
                Response.Redirect("cliente.aspx");

            }
            

            //Verificar se existe serviço escolhido
            if (Session["servico"] == null)
            {
                Response.Redirect("servico.aspx");
            }
           
        }

        protected void rtp_produtos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/
                ((Label)e.Item.FindControl("lbl_cod")).Text = dr["id"].ToString();//Vou procurar o lbl_cod e coloco os dados da DB campo cod_avaliacao
                ((Label)e.Item.FindControl("lbl_nome")).Text = dr["Nome"].ToString();
                ((Label)e.Item.FindControl("lbl_preco")).Text = dr["Preco"].ToString() + " Eur";
                ((Label)e.Item.FindControl("lbl_descricao")).Text = dr["descricao"].ToString();
                ((Image)e.Item.FindControl("img_foto")).ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])dr["foto"]);



            }
        }

      
        protected void rtp_produtos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["trabalho"] != null)
            {
                if (e.CommandName.Equals("btn_carrinho")/*icon*/)
                {
                    SqlConnection myConn = new SqlConnection
                  (ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);
                    string query = "insert into carrinho (idcliente, idproduto, idtrabalho, quantidade)";
                    query += "values(" + Session["trabalhoid"].ToString() + ",";
                    query += ((Label)e.Item.FindControl("lbl_cod")).Text + ",";
                    query += Session["trabalhoid"].ToString() + "," + 1 + ")";




                    myConn.Open();//Abrir a conexão
                    SqlCommand myComand = new SqlCommand(query, myConn); //recebe e query e executa no myConn
                    myComand.ExecuteNonQuery();
                    myConn.Close();
                }
            }

                else
                    {

                        if (e.CommandName.Equals("btn_carrinho")/*icon*/)
                        {
                            SqlConnection myConn = new SqlConnection
                          (ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);
                            string query = "insert into carrinho (ordem, idCliente, idproduto, quantidade)";
                            query += "values('" + Session["idcarrinho"].ToString() + "',";
                            query += Session["idCliente"].ToString() + ",";
                            query += ((Label)e.Item.FindControl("lbl_cod")).Text + "," + 1 + ")";




                            myConn.Open();//Abrir a conexão
                            SqlCommand myComand = new SqlCommand(query, myConn); //recebe e query e executa no myConn
                            myComand.ExecuteNonQuery();
                            myConn.Close();
                        }
            }
        }

      

        protected void lb_Alterar_Dados_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManutencaoProdutos.aspx");
        }

        protected void Btn_Confirmar_Click(object sender, EventArgs e)
        {
            if (Session["trabalho"] != null)
            {
                Response.Redirect("Executar_Trabalho.aspx");
            }
            else
            {
                Response.Redirect("Trabalho.aspx");
            }
        }
    }
    }