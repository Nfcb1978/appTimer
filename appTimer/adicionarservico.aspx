<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="adicionarservico.aspx.cs" Inherits="appTimer.adicionarservico" %>
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

    </style>
   
    <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
        
        <div class="col-12">
            <div class="centro">
                <h5 class="h5">Seja Bem-Vindo</h5>
                <br />

                <h3 class="h3">Insira o Serviço:</h3>
            </div>
        </div>
       


         
 <div class="form-group">
               <label for="Servico"><b>Serviço:</b></label>
            <asp:TextBox ID="tbServico" runat="server" placeholder="Insira o seu nome do Serviço" CssClass="form-control" required Font-Bold="True"></asp:TextBox>
               </div>

        <div class="form-group">
               <label for="Servico"><b>Descrição:</b></label>
            <asp:TextBox ID="tbdescricao" runat="server" placeholder="Insira a descrição do Serviço" CssClass="form-control" required Font-Bold="True" TextMode="MultiLine"></asp:TextBox>
               </div>

        
       
        <asp:Button ID="Btn_Inserir" OnClick="Btn_Inserir_Click" runat="server" CssClass="btn-primary" Text="Inserir" Font-Bold="True" />
                         
   
          </main>           

</asp:Content>
