﻿using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {
          
            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão
        }

      
      
      
    }
}