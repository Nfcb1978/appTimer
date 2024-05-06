using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;


namespace appTimer
{
    public partial class Welcome : System.Web.UI.Page
    {


        public static Stopwatch sw;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Btn_Pausa.Visible = false;
                sw = new Stopwatch();
              
            }

        }

        protected void Btn_conometro_Click(object sender, ImageClickEventArgs e)
        {
            Btn_Pausa.Visible = true;
            Btn_conometro.Visible = false;

            Timer1.Enabled = true;
            sw.Start();



        }

        protected void Btn_Pausa_Click(object sender, ImageClickEventArgs e)
        {
            Btn_Pausa.Visible = false;
            Btn_conometro.Visible = true;
            Timer1.Enabled = false;
            sw.Stop();
        }

       

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            long hor = sw.Elapsed.Hours;
            long sec = sw.Elapsed.Seconds;
            long min = sw.Elapsed.Minutes;

           
            
            if (hor < 12)
            {
                    if (hor < 10)
                        lblTempo.Text = "0" + hor;
                     else
                        lblTempo.Text = hor.ToString();

                    lblTempo.Text += ":";
                    if (min < 10)
                        lblTempo.Text += "0" + min;
                    else
                        lblTempo.Text += min.ToString();

                    lblTempo.Text += ":";

                    if (sec < 10)
                        lblTempo.Text += "0" + sec;
                    else
                        lblTempo.Text += sec.ToString();
                
            }
            else
            {
                sw.Stop();
                
            }

        }
    }
}