using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;


namespace appTimer
{
    public partial class Base2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {



        }
        [WebMethod]
        public static string SaveTime(string seconds)
        {
            // Agora você pode usar os valores recebidos
            string tempo = seconds;
            // Faça algo com os valores, como salvar em banco de dados, log, etc.
            System.Diagnostics.Debug.WriteLine($"Tempo recebido do JavaScript: {tempo}");

            // Retorne uma resposta
            return $"Received time:" + tempo;
        }
    }
}