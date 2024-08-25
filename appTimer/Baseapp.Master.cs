using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace appTimer
{
    public partial class Baseapp : System.Web.UI.MasterPage
    {
        public static Stopwatch sw;

        public string horas = "";
        public string minutos = "";
        public string segundos = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            

                 SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//e
                 string query = "SELECT ISNULL(SUM(Horas), 0) AS TotalHoras, ISNULL(SUM(Minutos), 0) as TotalMinutos, ISNULL(SUM(Segundos), 0) as TotalSegundos FROM Tempos WHERE CONVERT(DATE, Data) = CONVERT(DATE, GETDATE())";

                 SqlCommand myCommando = new SqlCommand(query, myConn);

                 myConn.Open();
                 SqlDataReader dr = myCommando.ExecuteReader(); //Receber dados da consulta

                 while (dr.Read())//se o datareader estiver preenchido
                 {


                     horas = dr["TotalHoras"].ToString();
                     minutos = dr["TotalMinutos"].ToString();
                     segundos = dr["TotalSegundos"].ToString();

                 }
                 myConn.Close();

            var sss = decimal.Parse(horas) * 3600 + decimal.Parse(minutos) * 60 + decimal.Parse(segundos);

            decimal hor = Math.Floor(sss / 3600);
            decimal min = Math.Floor((sss % 3600) / 60);
            decimal seg = sss % 60;

           


            lb_total.Text = (hor + ":" + min + ":" + seg);
        }

        protected void btn_sair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}