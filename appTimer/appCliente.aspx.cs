using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appTimer
{
    public partial class appCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Lb_Minho_Brinde_Click(object sender, EventArgs e)
        {

        }

        protected void rtp_cliente_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/

                ((Label)e.Item.FindControl("lbl_cliente")).Text = dr["nome"].ToString();
               


             
            }
        }
    }
}