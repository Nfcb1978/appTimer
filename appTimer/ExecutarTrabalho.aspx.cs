using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appTimer
{
    public partial class ExecutarTrabalho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void SimularProcessamento(object sender, EventArgs e)
        {
            
            System.Threading.Thread.Sleep(10000);

          
           
        }


    }
    
}