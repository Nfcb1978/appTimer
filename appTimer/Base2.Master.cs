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


namespace appTimer
{
    public partial class Base2 : System.Web.UI.MasterPage
    {
        public string horas;
        public string minutos;
        public string segundos;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_sair_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("appWelcome.aspx");
        }
    }
}