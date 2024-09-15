<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="appTimer.perfil1" %>
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

                <h3 class="h3">Dados do Técnico:</h3>
            </div>
        </div>
       


         
 <div class="form-group">

               <label for="tipo"><b>Tipo:</b></label>
            <asp:TextBox ID="tbTipo" runat="server"  CssClass="form-control" required Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>
   <div class="form-group">
               <label for="nome"><b>Nome:</b></label>
            <asp:TextBox ID="tb_nome" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>   
     
           
  <div class="form-group">
               <label for="Contacto"><b>Contacto:</b></label>
            <asp:TextBox ID="tb_Contacto" runat="server" CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
         <div class="form-group">
               <label for="´E-mail"><b>E-mail:</b></label>
            <asp:TextBox ID="tb_email" runat="server" CssClass="form-control" Font-Bold="True" Enabled="False"></asp:TextBox>
               </div> 
        
     <div class="form-group">
               <label for="password"><b>Password:</b></label>
            <asp:TextBox ID="tb_pw" runat="server"  CssClass="form-control"  Font-Bold="True" Enabled="False"></asp:TextBox>
               </div>   
              
                
        
       
        <asp:Button ID="Btn_Alterar" OnClick="Btn_Alterar_Click" runat="server" Text="Alterar" Font-Bold="True" />
        <asp:Button ID="Btn_Confirmar" OnClick="Btn_Confirmar_Click" runat="server" Text="Confirmar" Font-Bold="True" />              
   
          </main>       
</asp:Content>
