using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Configuration;

namespace appTimer
{
    public partial class Pagina : System.Web.UI.Page
    {
        public static string Hours { get; set; }
        public static string Minutes { get; set; }
        public static string Seconds { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

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
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "inserir_Tempo"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@Horas", hours);
            myCommando.Parameters.AddWithValue("@Minutos", minutes);
            myCommando.Parameters.AddWithValue("@Segundos", seconds);

            myConn.Open();
            myCommando.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();
        }

    }
}