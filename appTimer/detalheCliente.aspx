<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master"AutoEventWireup="true" CodeBehind="detalheCliente.aspx.cs" Inherits="appTimer.detalheCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
     
    <style>
        /* Estilo personalizado para centralizar a imagem verticalmente */
        .center {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .centro {
            text-align: CENTER;
        }

        #conometro {
            color: white;
        }

        body {
            background-color: #333; /* Cor de fundo escura */
            color: white;
        }

        .corpo {
            background-color: darkgray;
        }
       
        
          
        .card-body{
           
            background-color:#333;
           

        }
         .card-body:hover{
           
            background-color:darkslategray;

        }
       .pagina {
            display: none;
        }
        .ativa {
            display: block;
        }
      

    </style>

      
   
    <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
      <div class="pagina ativa" id="pagina1">
        <div class="col-12">
            <div class="centro">
                <h5 class="h5">Seja Bem-Vindo</h5>
                <br />

                <h3 class="h3">Dados do Cliente:</h3>
            </div>
        </div>
       


         
 
     
           
  <div class="form-group">
               <label for="ncliente"><b>N.º de Cliente:</b></label>
            <asp:TextBox ID="tb_NCliente" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
         
   <div class="form-group">
               <label for="nome"><b>Nome:</b></label>
            <asp:TextBox ID="tb_nome" runat="server"  CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
        
     <div class="form-group">
               <label for="morada"><b>Morada:</b></label>
            <asp:TextBox ID="tb_morada" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>   

         <div class="form-group">
               <label for="morada2"><b>Moarada 2:</b></label>
            <asp:TextBox ID="tb_morada2" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>  

        <div class="form-group">
               <label for="codPostal"><b>Código Postal:</b></label>
            <asp:TextBox ID="tbcodPostal" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>  

        <div class="form-group">
               <label for="freguesia"><b>Freguesia:</b></label>
            <asp:TextBox ID="tb_Frequesia" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>
        
        <div class="form-group">
               <label for="latitude"><b>Latitude:</b></label>
            <asp:TextBox ID="tb_latitude" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>  

         <div class="form-group">
               <label for="longitude"><b>Longitude:</b></label>
            <asp:TextBox ID="tb_longitude" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>
        
          <div class="form-group">
               <label for="email"><b>E-mail:</b></label>
            <asp:TextBox ID="tb_Email" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
              </div>
      <div class="pagina" id="pagina2">
        <div class="form-group">
               <label for="telemovel"><b>Telemóvel:</b></label>
            <asp:TextBox ID="tb_telemovel" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>
        
         <div class="form-group">
               <label for="telemovel2"><b>Telemóvel 2:</b></label>
            <asp:TextBox ID="tb_telemovel2" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 

         <div class="form-group">
               <label for="telefone"><b>Telefone:</b></label>
            <asp:TextBox ID="tb_telefone" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 

        <div class="form-group">
               <label for="telefone2"><b>Telefone 2:</b></label>
            <asp:TextBox ID="tb_telefone2" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 

         <div class="form-group">
               <label for="nif"><b>NIF:</b></label>
            <asp:TextBox ID="tb_nif" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
              
                
        
       
        <asp:Button ID="Btn_Alterar" OnClick="Btn_Alterar_Click"  runat="server" Text="Alterar" Font-Bold="True" />
        <asp:Button ID="Btn_Confirmar" OnClick="Btn_Confirmar_Click"  runat="server" Text="Confirmar" Font-Bold="True" />              
    </div>
          </main>



                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT [nome], [Nencomenda], [Comentário], [id] FROM [assistencias]"></asp:SqlDataSource>

        



                 
                     
                       

       

                       
            
     <div>
        <asp:Xml ID="Xml1" runat="server" TransformSource="~/formataCliente.xslt"></asp:Xml>
</div>
    <br />
    <div>
        <button class="btn-primary" id="btnPagina1">1</button>
        <button class="btn-primary" id="btnPagina2">2</button>
      
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script>
         $(document).ready(function () {
             // Exibir a primeira página ao carregar
             $('#pagina1').addClass('ativa');

             // Função para trocar de páginas
             function trocarPagina(numero) {
                 console.log('Trocando para página: ' + numero);
                 $('.pagina').removeClass('ativa');  // Oculta todas as páginas
                 $('#pagina' + numero).addClass('ativa');  // Exibe a página desejada
             }

             // Associar os botões à função de troca de páginas
             $('#btnPagina1').click(function (event) {
                 event.preventDefault();  // Previne o postback
                 trocarPagina(1);
             });

             $('#btnPagina2').click(function (event) {
                 event.preventDefault();  // Previne o postback
                 trocarPagina(2);
             });
         });
    </script>
</asp:Content>
