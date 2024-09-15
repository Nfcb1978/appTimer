<%@ Page Title="" Language="C#" MasterPageFile="~/Base2.Master" AutoEventWireup="true" CodeBehind="ExecutarTrabalho.aspx.cs" Inherits="appTimer.ExecutarTrabalho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <style>
      
        
 .image-container {
      display: flex; /* Utiliza Flexbox */
      justify-content: center; /* Centraliza horizontalmente */
      align-items: center; /* Centraliza verticalmente */
      height: 100vh; /* Preenche a altura da tela */
      margin-top: 10%;
      margin-bottom: 10%;
    }

    /* Estilos para a imagem */
    #img {
      width: 60%;
      height: auto;/*  Mantém a proporção da imagem */
    }
        
     

        
        body{
            color:white;

        }
   
        .signature {
            border: 1px solid #000;
            width: 100%;
            height:200px; 
            margin-bottom: 20px;
            background-color:white;    
       
    
                    
                      
        }
         .centrado {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Altura total da janela */
        }

         .center {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }
         #total
         {
             display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
         }

        .inicio {
            text-align: center;
            margin-top:5%;
        }

        #cronometro {
            color: white;
          
        }

        .container {
            background-color: #333; /* Cor de fundo escura */
            color: white;
             margin-left: 0;
            padding: 0;
            width:100%;
        }

        .corpo {
            background-color: darkgray;
        }

        
          
        .card-body{
           
            background-color:#333;
            text-align:center;
           

        }
         .card-body:hover{
           
            background-color:darkslategray;

        }
         h4{
             margin-left:20%;

         }
       

         .w-10
         {
                margin-left:20%;
              background-color: #333;
         }
        
    </style>
     


   
      <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
   

          <div class="col-12">
            <div class="inicio">
           
                <br />
                    
        
                <br />

               
            </div>

                <div class="card mb-3" style=" background-color:#333; margin-left:0">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                 <h3 class="h3">
                    <asp:Label ID="lbl_nome" runat="server" Text="Label"></asp:Label></h3>
    
                          
                   
                        </div>
                    </div>
               
           </div>
            </div>
                 <div class="card mb-3" style=" background-color:#333 ">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                
       <h3 class="h3">
                    <asp:Label ID="lbl_tarefa" runat="server" Text="Label"></asp:Label></h3>
      
                      
                   
                        </div>
                    </div>
               
           </div>
            </div>

                 <div class="card mb-3" style=" background-color:#333;  ">
             <div class="row g-0">
              
                    <div class="card-body">
        
                
<h2 class="btn-primary" style="width:100%"; id="cronometro">00:00:00</h2>
      
                      <h3 id="total" >Total Hoje: 00:00:00</h3>
      
                   
                        </div>
                    </div>
               
           </div>
           



        </div>
    
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <!-- Label onde será exibida a mensagem após o processamento -->
      
    </ContentTemplate>
</asp:UpdatePanel>

<!-- UpdateProgress para exibir o GIF enquanto o servidor processa a requisição -->
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <img  src="relogio.gif" alt="Carregando..." />
    </ProgressTemplate>
</asp:UpdateProgress>

<!-- Botão invisível para fazer o postback via JavaScript -->
<asp:Button ID="btnPostback" runat="server" OnClick="SimularProcessamento" style="display:none;" />

<!-- Script para chamar o postback de forma assíncrona e exibir o GIF -->
<script type="text/javascript">
    window.onload = function () {
        // Exibe o GIF de carregamento e dispara o processamento no servidor
        document.getElementById('loadingGif').style.display = 'block'; // Exibe o GIF

        // Simula uma chamada AJAX via postback
        setTimeout(function () {
            __doPostBack('<%= btnPostback.UniqueID %>', ''); // Dispara o processamento no servidor
        }, 500); // Espera meio segundo para garantir que o GIF seja exibido antes do postback
    };
</script>

<!-- GIF de carregamento manual para garantir que ele seja exibido -->

  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
<img id="img" src="relogio.gif" alt="Carregando..." />
    </div> 
         </div> 
       </div> 
           <br />
         <h4>Nota do Colaborador</h4>
        <br />
        <asp:TextBox ID="tb_Notas" CssClass="w-100" runat="server" TextMode="MultiLine" placeholder="Por favor deixe uma nota do serviço que vai efetuar" Font-Bold="True"></asp:TextBox>
       <br />
       
         <button id="btn_finalizar" class="btn-primary w-100" type="button" onclick="resetTimer()">FINALIZAR TRABALHO</button>
     
   </main>
    
          

</asp:Content>
