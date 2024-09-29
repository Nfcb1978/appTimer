﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace appTimer
{
    public partial class Trabalho_Detalhe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // int num = Convert.ToInt32(Request.QueryString["num"]);

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "trabalho_detalhe"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
           // myCommando.Parameters.AddWithValue("@num", 1);

            myConn.Open();
            SqlDataReader dr = myCommando.ExecuteReader(); //Receber dados da consulta
            if (dr.Read())//se o datareader estiver preenchido
            {
                lbl_nomecliente.Text = dr["nome"].ToString();//campo nome do dr
                lbl_NIFcliente.Text = dr["nif"].ToString();//campo nome do dr
                lbl_servico.Text = dr["servico"].ToString();//campo nome do dr
                img_assinatura.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])dr["assinatura"]);

            }


            myConn.Close();
        }

        protected void rtp_Produto_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/
               
                ((Label)e.Item.FindControl("lbl_produto")).Text = dr["Nome"].ToString();
                ((Label)e.Item.FindControl("lbl_preco")).Text = dr["Preco"].ToString() + " Eur";
                ((Label)e.Item.FindControl("lbl_quantidade")).Text = dr["Total"].ToString();
                ((Image)e.Item.FindControl("img_foto")).ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])dr["foto"]);



            }
        }
    }
}