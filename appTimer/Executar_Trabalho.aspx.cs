using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Script.Serialization;


namespace appTimer
{
    public partial class validacao : System.Web.UI.Page
    {

        public static string Hours { get; set; }
        public static string Minutes { get; set; }
        public static string Seconds { get; set; }
        public string horas;
        public string minutos;
        public string segundos;

        protected void Page_Load(object sender, EventArgs e)
        {
            

             if (Session["utilizador"] == null)
             {
           Response.Redirect("login.aspx");
             }
            //Se não escolher cliente
            if ((Session["trabalhoid"] == null) && (Request.QueryString["NTrabalho"] == null))
            {
                Response.Redirect("index.aspx");

            }
            else if (Session["trabalhoid"] != null)
            {
                lbl_nome.Text = "Cliente: " + Session["cliente"].ToString();

                lbl_servico.Text = "Serviço: " + Session["servico"].ToString();

            }
            if (Request.QueryString["NTrabalho"] != null)
                    {
                Session["trabalhoid"] = Convert.ToString(Request.QueryString["NTrabalho"]);
                Session["servico"] = Convert.ToString(Request.QueryString["servico"]);
                Session["cliente"] = Convert.ToString(Request.QueryString["nome"]);
                Session["idcliente"] = Convert.ToString(Request.QueryString["codCliente"]);                              
                lbl_servico.Text = "Serviço: " + Session["servico"].ToString();
                lbl_nome.Text = "Cliente: " + Session["cliente"].ToString();
                
            }
            

        }
        protected void SimularProcessamento(object sender, EventArgs e)
        {

          //  System.Threading.Thread.Sleep(10000);



        }

        [WebMethod]

        public static object SaveTime(string hours, string minutes, string seconds)
        {
            // Validação para ver se os parâmetros foram recebidos corretamente
            System.Diagnostics.Debug.WriteLine($"Valores recebidos do JavaScript: {hours} horas, {minutes} minutos, {seconds} segundos");

            // Salvar os valores no banco de dados
            try
            {
                SaveToDatabase(hours, minutes, seconds);
                return new { success = true };
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Erro ao salvar no banco de dados: {ex.Message}");
                return new { success = false, error = ex.Message };
            }
        }


        private static void SaveToDatabase(string hours, string minutes, string seconds)

        {
            //Impedir que entrem para a base de dados tempos a "Zero"
            if ((int.Parse(hours) > 0) || (int.Parse(minutes) > 0) | (int.Parse(seconds) > 0))
            {
                int id = int.Parse(HttpContext.Current.Session["trabalhoid"].ToString());

                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

                SqlCommand myCommando = new SqlCommand();//linha de comandos
                myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
                myCommando.CommandText = "inserir_Tempo"; //cujo nome é... 
                myCommando.Connection = myConn; //conexão a usar
                myCommando.Parameters.AddWithValue("@Horas", hours);
                myCommando.Parameters.AddWithValue("@Minutos", minutes);
                myCommando.Parameters.AddWithValue("@Segundos", seconds);
                myCommando.Parameters.AddWithValue("@RecordDate", DateTime.Now);
                myCommando.Parameters.AddWithValue("@idtrabalho", id);

                myConn.Open();
                myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
                myConn.Close();
            }
        }
                
        [WebMethod]
        public static object GetTime()
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);
            //string query = "SELECT SUM(Horas) AS TotalHoras, SUM(Minutos) as TotalMinutos, SUM(Segundos) as TotalSegundos FROM Tempos WHERE CONVERT(DATE, Data) = CONVERT(DATE, GETDATE())";
            string query = "SELECT ISNULL(SUM(Horas), 0) AS TotalHoras, ISNULL(SUM(Minutos), 0) as TotalMinutos, ISNULL(SUM(Segundos), 0) as TotalSegundos FROM Tempos WHERE CONVERT(DATE, Data) = CONVERT(DATE, GETDATE())";
            SqlCommand myCommando = new SqlCommand(query, myConn);
            myConn.Open();
            SqlDataReader dr = myCommando.ExecuteReader();

            int horas = 0, minutos = 0, segundos = 0;

            while (dr.Read())
            {
                horas = Convert.ToInt32(dr["TotalHoras"]);
                minutos = Convert.ToInt32(dr["TotalMinutos"]);
                segundos = Convert.ToInt32(dr["TotalSegundos"]);
            }
            myConn.Close();

            return new { Horas = horas, Minutos = minutos, Segundos = segundos };
        }
        [WebMethod(EnableSession = true)]
        public static void SaveSignature(string imageData, string contentType)
        {

            // Remove o prefixo "data:image/png;base64," da string base64
            string base64String = imageData.Replace("data:image/png;base64,", "");

            // Converte a string base64 em um array de bytes
            byte[] imageBytes = Convert.FromBase64String(base64String);

            // Conexão ao banco de dados (substitua por sua string de conexão)


            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "inserir_assinatura"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar

            myCommando.Parameters.AddWithValue("@ct", contentType);
            myCommando.Parameters.AddWithValue("@assinatura", imageBytes);
            myCommando.Parameters.AddWithValue("@RecordDate", DateTime.Today);
            // Obtendo a variável de sessão via HttpContext.Current
            if (HttpContext.Current.Session["idCliente"] != null)
            {
                int idCliente = int.Parse(HttpContext.Current.Session["idCliente"].ToString());
                myCommando.Parameters.AddWithValue("@idCliente", idCliente);  // Corrigi o nome do parâmetro para @idCliente
            }
            else
            {
                throw new Exception("Variável de sessão 'idCliente' não encontrada.");
            }






            // Abre a conexão, executa a consulta e fecha a conexão
            myConn.Open();
            myCommando.ExecuteNonQuery(); // Execução da Procedure
            myConn.Close();





        }

        protected void Btn_finalizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Finalizar_Trabalho.aspx");
        }

        protected void Btn_comprar_Click(object sender, EventArgs e)
        {
            Session["trabalho"] = lbl_servico.Text;
            Response.Redirect("Produtos.aspx");
            
        }
    }

}
