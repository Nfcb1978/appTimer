using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appTimer
{
    public partial class appWelcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
        
        protected void Lb_iniciarTrabalho_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cliente.aspx");
        }
        
        protected void Lb_TarefaHabit_Click(object sender, EventArgs e)
        {
            Response.Redirect("tarefa.aspx");
           
        }
    }
}