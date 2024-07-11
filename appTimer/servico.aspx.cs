using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace appTimer
{
    public partial class servico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_nome.Text= Convert.ToString(Request.QueryString["nome"]);


        }

        protected void rtp_servico_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/

                ((Label)e.Item.FindControl("lbl_servico")).Text = dr["nome"].ToString();




            }
        }
    }
}