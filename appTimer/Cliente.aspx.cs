using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace appTimer
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "select nome from Clientes";
            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand(query, myConn);//vou correr a minha query utilizando o Myconn
            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommando);
            DataSet myDataSet = new DataSet();
            myAdapter.Fill(myDataSet);
     
            Xml1.DocumentContent = myDataSet.GetXml(); //despejar conteudo do select para o xml
        }
    }
}