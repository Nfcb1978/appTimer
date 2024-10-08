using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace appTimer
{
    public partial class agenda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void rtp_entregas_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/
                ((Label)e.Item.FindControl("lbl_cliente")).Text = dr["nome"].ToString();//Vou procurar o lbl_cod e coloco os dados da DB campo cod_avaliacao
                ((Label)e.Item.FindControl("lbl_telemovel")).Text = dr["telemovel1"].ToString();
                ((Label)e.Item.FindControl("lbl_local")).Text = dr["local"].ToString();
                ((Label)e.Item.FindControl("lbl_codigo")).Text = dr["codigoPostal"].ToString();
                ((Label)e.Item.FindControl("lbl_data")).Text = dr["data"].ToString();
                ((Label)e.Item.FindControl("lbl_tempo")).Text = dr["TempoPrevisto"].ToString() + " minutos";




            }
        }
    }
}