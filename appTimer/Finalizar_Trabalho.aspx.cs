using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appTimer
{
    public partial class Finalizar_Trabalho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
            //Se não escolher cliente
            if (Session["cliente"] == null)
            {
                Response.Redirect("cliente.aspx");

            }
            //Verificar se existe serviço escolhido
            if (Request.QueryString["nome"] == null)
            {
                Response.Redirect("servico.aspx");
            }
        }
    }
}