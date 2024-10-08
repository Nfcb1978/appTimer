using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Xml.Xsl;
using System.Net;
using System.Net.Mail;
using iTextSharp.text.pdf;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace appTimer
{
    public partial class Finalizar_Trabalho : System.Web.UI.Page
    {
        private int itemsPerPage = 5;
        private int totalItems = 0; // Armazenará o total de itens
        private int totalPages = 0; // Armazenará o total de páginas

        private int CurrentPage
        {
            get
            {
                // Verificar se há um valor de currentPage armazenado no ViewState
                if (ViewState["CurrentPage"] != null)
                {
                    return (int)ViewState["CurrentPage"];
                }
                else
                {
                    return 1; // Página padrão é a 1
                }
            }
            set
            {
                ViewState["CurrentPage"] = value; // Armazenar no ViewState
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["utilizador"] == null)
            {
                Response.Redirect("login.aspx");
            }
           
            if (Session["cliente"] == null)
            {
               Response.Redirect("index.aspx");

            }
          
            lbl_nome.Text =  Session["cliente"].ToString();
            lbl_servico.Text = "Serviço Prestado: " +  Session["servico"].ToString();

            int idtrabalho = int.Parse(Session["trabalhoid"].ToString());

          
            string query = "SELECT ROUND((Horas * 60) + Minutos + (Segundos / 60.0), 2) AS TotalMinutos, " +
               "Data FROM Tempos WHERE idtrabalho = " + idtrabalho;




            //Copia a connectio á BD e comand não copia procedure
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

            SqlCommand myCommando = new SqlCommand(query, myConn);//vou correr a minha query utilizando o Myconn
            SqlDataAdapter myAdapter = new SqlDataAdapter(myCommando);
            DataSet myDataSet = new DataSet();
            myAdapter.Fill(myDataSet);

            Xml1.DocumentContent = myDataSet.GetXml(); //despejar conteudo do select


            totalItems = myDataSet.Tables[0].Rows.Count; // Total de itens
            totalPages = (int)Math.Ceiling((double)totalItems / itemsPerPage); // Total de páginas


          //  LoadXmlData();
           // GeneratePageButtons(); // Gerar botões de paginação





        }

/*
        private void LoadXmlData()
        {

            // Definir os parâmetros para a transformação
            XsltArgumentList arguments = new XsltArgumentList();
            arguments.AddParam("page", "", CurrentPage);
            arguments.AddParam("itemsPerPage", "", itemsPerPage);

            // Carregar o XML e aplicar a transformação
            Xml1.TransformArgumentList = arguments;


        }

        // Evento do botão "Anterior"
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                LoadXmlData();
                GeneratePageButtons();
            }
        }

        // Evento do botão "Próxima"
        protected void btnNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            LoadXmlData();
            GeneratePageButtons();
        }

        private void GeneratePageButtons()
        {
            paginationPanel.Controls.Clear(); // Limpar botões existentes

            for (int i = 1; i <= totalPages; i++)
            {
                Button pageButton = new Button
                {
                    Text = i.ToString(),
                    CommandArgument = i.ToString(),
                    CssClass = "btn btn-primary page-button", // Classes Bootstrap para o estilo do botão
                                                              // Adicionar uma margem de 5px entre os botões

                };
                // Adicionar a margem manualmente usando o método Add
                pageButton.Style.Add("margin-right", "5px"); // Adicionar separação entre os botões

                pageButton.Click += PageButton_Click; // Adicionar evento de clique
                paginationPanel.Controls.Add(pageButton); // Adicionar o botão ao painel

                // Destacar a página atual
                if (i == CurrentPage)
                {
                    pageButton.CssClass += " active"; // Classe CSS para destacar a página atual
                }
            }
        }

        // Evento ao clicar em um botão de página
        protected void PageButton_Click(object sender, EventArgs e)
        {
            Button clickedButton = (Button)sender;
            CurrentPage = int.Parse(clickedButton.CommandArgument); // Atualizar a página atual
            LoadXmlData(); // Recarregar dados para a nova página
            GeneratePageButtons(); // Regenerar os botões com o destaque correto
        }
*/
        protected void Btn_finalizar_Click(object sender, EventArgs e)
        {
            int idtrabalho = int.Parse(Session["trabalhoid"].ToString());
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão


           
            //string query = "SELECT SUM(Horas) AS TotalHoras, SUM(Minutos) as TotalMinutos, SUM(Segundos) as TotalSegundos FROM Tempos WHERE CONVERT(DATE, Data) = CONVERT(DATE, GETDATE())";
            string query ="SELECT ROUND(SUM((Horas * 60) + Minutos + (Segundos / 60.0)), 2) AS SomaTotalMinutos" +
                " FROM Tempos WHERE idtrabalho =" + idtrabalho;

            SqlCommand myCommand = new SqlCommand(query, myConn);
            myConn.Open();
            SqlDataReader dr1 = myCommand.ExecuteReader();

           string total ="";

            if (dr1.Read())
            {
                total = dr1["SomaTotalMinutos"].ToString();
             

            }
            myConn.Close();

          

            SqlCommand myCom = new SqlCommand();//linha de comandos
            myCom.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCom.CommandText = "inserir_comentario"; //cujo nome é... 
            myCom.Connection = myConn; //conexão a usar
            
            myCom.Parameters.AddWithValue("@comentario", tb_Notas.Text);
            myCom.Parameters.AddWithValue("@idtrabalho", idtrabalho);
           

            myConn.Open();
            myCom.ExecuteNonQuery();//Execução Procedure sem devolução de dados executa, mas não devolve nada
            myConn.Close();



            string caminhoPdfs = ConfigurationManager.AppSettings["PathPDFS"];

            //criar caminho para nosso url, também atrvés do webconfig
            //  string siteURl = ConfigurationManager.AppSettings["siteURL"];

            //ao caminho para webconfig, acreescentar caminho para o template, que quero abir
            string pdfTemplate = caminhoPdfs + "Template\\form_template.pdf";

            // Response.Write(pdfTemplate); Para testar se está a ir buscar os caminho correto

            //nome do novo pdf a criar - Para criar nomes diferentes damos como nome data hora segundos . pdf
            //Assume data hora e segundos. substitui / : e espaço por nada
            //nome a ser encriptado
            string nomePDF = (DateTime.Now.ToString().Replace("/", "").Replace(":", "").Replace(" ", "")) + ".pdf";//substitui /




            //Caminho para guardar o novo pdf
            string novoficheiro = caminhoPdfs + "Gerados\\" + nomePDF;

            //primeiro ciados o pdfreader depois o pdfstamper - lê o ficheiro template
            PdfReader preader = new PdfReader(pdfTemplate);

            //a parteir do template (preader) criar um novo ficheiro(filemode.create) utilizando o caminho definido
            PdfStamper pstamper = new PdfStamper(preader, new FileStream(novoficheiro, FileMode.Create));

            //objecto para começar a escrever dentro do PDF
            AcroFields pdfFilds = pstamper.AcroFields;

            //Preencher o Template

            decimal soma = 0;

            for (int i = 1; i <= rtp_Produto.Items.Count; i++)//perrcorre os items todos do repeter
            {
              
             soma+=decimal.Parse(((Label)rtp_Produto.Items[i - 1].FindControl("lbl_valor")).Text);

            }


            for (int i = 1; i <= rtp_Produto.Items.Count; i++)//perrcorre os items todos do repeter
            {
                pdfFilds.SetField("NomeCliente", lbl_nome.Text);
                pdfFilds.SetField("DescricaoRow" + i, ((Label)rtp_Produto.Items[i - 1].FindControl("lbl_produto")).Text);
                pdfFilds.SetField("PrecoRow" + i, ((Label)rtp_Produto.Items[i - 1].FindControl("lbl_preco")).Text);
                pdfFilds.SetField("QuantidadeRow" + i, ((Label)rtp_Produto.Items[i - 1].FindControl("lbl_quantidade")).Text);
                pdfFilds.SetField("TotalRow" + i, ((Label)rtp_Produto.Items[i - 1].FindControl("lbl_valor")).Text);
               
            }
            string soma1 = soma.ToString();
            pdfFilds.SetField("ValorTotal", soma1);//Label que foi utilizada para o Valor total do carrinho utilizador


            pstamper.Close();


            //Enviar e-mail
           int idcliente = int.Parse(Session["idcliente"].ToString());
           

           
            SqlCommand myCommando = new SqlCommand();//linha de comandos
            myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
            myCommando.CommandText = "email"; //cujo nome é... 
            myCommando.Connection = myConn; //conexão a usar
            myCommando.Parameters.AddWithValue("@util", idcliente);


            string mail = "";
            myConn.Open();
            SqlDataReader dr = myCommando.ExecuteReader(); //Receber dados da consulta
            if (dr.Read())//se o datareader estiver preenchido
            {
                mail = dr["email"].ToString();

            }
            myConn.Close();
            //Crio objectos para servidor e email
            SmtpClient servidor = new SmtpClient();
            MailMessage email = new MailMessage();

            //campos do e-mail from, to e assunto. 
            email.From = new MailAddress("nunofcbrito@sapo.pt");
            email.To.Add(new MailAddress(mail));
            email.Subject = "Prestação de Serviço";
            //Tenho de dizer se será para usar html ou não
            email.IsBodyHtml = true;
            email.Body = "<b>Obrigado por subscrever os nossos serviços. " +
                "" +
                 lbl_servico.Text +
                " " +
                "Total de minutos trabalhados: " + total + " minutos" +
                "Segue em anexo o detalhe </b> "; 

            //Antes de avançar para servidor coloco anexo
            // Damos o nome do Fileupload e colocamos filecontente (conteudo) e filename (nome)

            Attachment anexo = new Attachment(novoficheiro, System.Net.Mime.MediaTypeNames.Application.Pdf);

            ///Attachment anexo = new Attachment(FileUpload1.FileContent, FileUpload1.FileName);

            email.Attachments.Add(anexo);

            //Dados Servidor.
            //Caminhos para o webconfig 
            servidor.Host = ConfigurationManager.AppSettings["SMTP_URL"];
            servidor.Port = int.Parse(ConfigurationManager.AppSettings["SMTP_PORT"]);

            //Tratar das crediciais
            string utiliz = ConfigurationManager.AppSettings["SMTP_USER"];
            string pw = ConfigurationManager.AppSettings["SMTP_PASSWORD"];

            //também podia trabalhar diretamente sem variáveis e colocar as configuration diretamente nas credentials
            servidor.Credentials = new NetworkCredential(utiliz, pw);

            //ativar protocolo SSL - protocolo de segurança que é obrigatório
            servidor.EnableSsl = true;

            servidor.Send(email);
        }

        protected void rtp_Produto_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           // lbl_produtos.Visible = true;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)//se o e for um item
            {//preencho os dados se o e for um item.
                DataRowView dr = (DataRowView)/*cast para datarowview*/e.Item.DataItem;//apanhar os dados da linha
                /*Cast para label para assumir o .Text*/

                ((Label)e.Item.FindControl("lbl_produto")).Text = dr["Nome"].ToString();
                ((Label)e.Item.FindControl("lbl_preco")).Text = dr["Preco"].ToString() + " Eur";
                ((Label)e.Item.FindControl("lbl_quantidade")).Text = dr["Total"].ToString();
                ((Image)e.Item.FindControl("img_foto")).ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])dr["foto"]);
                ((Label)e.Item.FindControl("lbl_valor")).Text = dr["ValorTotal"].ToString();
            }                
            }

        [WebMethod(EnableSession = true)]
        public static void SaveSignature(string imageData, string contentType)
    {

        // Remove o prefixo "data:image/png;base64," da string base64
        string base64String = imageData.Replace("data:image/png;base64,", "");

        // Converte a string base64 em um array de bytes
        byte[] imageBytes = Convert.FromBase64String(base64String);

        // Conexão ao banco de dados (substitua por sua string de conexão)


        SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["TimerConnectionString"].ConnectionString);//estabilecer conexão

        SqlCommand myCommando = new SqlCommand();//linha de comandos
        myCommando.CommandType = CommandType.StoredProcedure; //vamos usar uma store procedure
        myCommando.CommandText = "inserir_assinatura"; //cujo nome é... 
        myCommando.Connection = myConn; //conexão a usar

        myCommando.Parameters.AddWithValue("@ct", contentType);
        myCommando.Parameters.AddWithValue("@assinatura", imageBytes);
        myCommando.Parameters.AddWithValue("@RecordDate", DateTime.Today);
        // Obtendo a variável de sessão via HttpContext.Current
        if (HttpContext.Current.Session["idCliente"] != null)
        {
            int idCliente = int.Parse(HttpContext.Current.Session["idCliente"].ToString());
            myCommando.Parameters.AddWithValue("@idCliente", idCliente);  // Corrigi o nome do parâmetro para @idCliente
        }
        else
        {
            throw new Exception("Variável de sessão 'idCliente' não encontrada.");
        }






        // Abre a conexão, executa a consulta e fecha a conexão
        myConn.Open();
        myCommando.ExecuteNonQuery(); // Execução da Procedure
        myConn.Close();


        }


    }
}
