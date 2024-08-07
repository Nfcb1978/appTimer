using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace appTimer
{
    public partial class Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
       
         public static string SaveString(string value)
        {
            // Validação para ver se o parâmetro foi recebido corretamente
          

            // Faça algo com o valor, como salvar em banco de dados, log, etc.
            System.Diagnostics.Debug.WriteLine($"Valor recebido do JavaScript: {value}");

            // Retorne o valor recebido
            return value;
        }
    }
}
