<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="alterarservico.aspx.cs" Inherits="appTimer.alterarservico" %>
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
               <label for="nservico"><b>N.º de Serviço:</b></label>
            <asp:TextBox ID="tb_NServico" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
         
   <div class="form-group">
               <label for="servico"><b>Nome Serviço:</b></label>
            <asp:TextBox ID="tb_servico" runat="server"  CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 

          <div class="form-group">
               <label for="descricao"><b>Descrição:</b></label>
            <asp:TextBox ID="tb_descricao" runat="server"  CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>

          <asp:Button ID="Btn_Alterar" OnClick="Btn_Alterar_Click"  runat="server" Text="Alterar" Font-Bold="True" />
        <asp:Button ID="Btn_Confirmar" OnClick="Btn_Confirmar_Click"  runat="server" Text="Confirmar" Font-Bold="True" />  
            <asp:Button ID="Btn_Adicionar" OnClick="Btn_Adicionar_Click"  runat="server" Text="Confirmar" Font-Bold="True" /> 
    </div>
          </main>

</asp:Content>
