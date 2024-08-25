<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="appTimer.Login" %>
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

                <h3 class="h3">Faça o Login:</h3>
            </div>
        </div>
       


         
 <div class="form-group">
               <label for="nome"><b>E-mail:</b></label>
            <asp:TextBox ID="tb_utilizador" runat="server" placeholder="Coloque o seu e-mail" CssClass="form-control" required Font-Bold="True"></asp:TextBox>
               </div>

        <div class="form-group">
               <label for="Servico"><b>Password:</b></label>
            <asp:TextBox ID="Tb_PW" runat="server" placeholder="Coloque a sua password" CssClass="form-control" required Font-Bold="True"></asp:TextBox>
               </div>
       
        <asp:Button ID="Btn_Entrar" OnClick="Btn_Entrar_Click" runat="server" Text="Entrar" Font-Bold="True" />
              <br /> 
        <div >
              
            <asp:Label ID="lbl_mensagem"  runat="server" Text="" BackColor="Black" Font-Bold="True" ForeColor="White"></asp:Label>
           
               </div>
   
          </main>           

</asp:Content>
