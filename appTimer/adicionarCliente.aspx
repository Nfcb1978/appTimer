<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="adicionarCliente.aspx.cs" Inherits="appTimer.adicionarCliente" %>
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

                <h3 class="h3">Insira o Cliente:</h3>
            </div>
        </div>
       


         
              <div class="form-group">
               <label for="nome"><b>Nome:</b></label>
            <asp:TextBox ID="tbNome" runat="server" placeholder="Insira o seu nome" CssClass="form-control" required Font-Bold="True"></asp:TextBox>
               </div>
   <div class="form-group">
               <label for="morada"><b>Morada:</b></label>
            <asp:TextBox ID="tb_morada" runat="server" placeholder="Insira a sua morada" CssClass="form-control"  Font-Bold="True"></asp:TextBox>
               </div>   
        <div class="form-group">
               <label for="morada"><b>Morada 2:</b></label>
            <asp:TextBox ID="tb_morada2" runat="server" placeholder="Insira a sua segunda morada" CssClass="form-control" Font-Bold="True"></asp:TextBox>
               </div>   
  <div class="form-group">
               <label for="codigoPostal"><b>Código Postal:</b></label>
            <asp:TextBox ID="tb_CodPostal" runat="server" placeholder="Insira o seu Código Postal" CssClass="form-control"  Font-Bold="True"></asp:TextBox>
               </div> 
         <div class="form-group">
               <label for="´freguesia"><b>Freguesia:</b></label>
            <asp:TextBox ID="tb_freguesia" runat="server" placeholder="Insira a sua freguesia" CssClass="form-control" Font-Bold="True"></asp:TextBox>
               </div>   
        <div class="form-group">
               <label for="longitude"><b>Longitude:</b></label>
            <asp:TextBox ID="tb_longitude" runat="server" placeholder="Insira a longitude da localização" CssClass="form-control"  Font-Bold="True"></asp:TextBox>
               </div>   
         <div class="form-group">
               <label for="latitude"><b>Latitude:</b></label>
            <asp:TextBox ID="tb_latitude" runat="server" placeholder="Insira a latitude da localização" CssClass="form-control"  Font-Bold="True"></asp:TextBox>
               </div>   
            <div class="form-group">
            <label for="email">Email:</label>
            <asp:TextBox ID="tbEmail" runat="server" placeholder="Insira o e-mail" CssClass="form-control"  TextMode="Email" Font-Bold="True"></asp:TextBox>
                   </div> 
        <div class="form-group">
             <label for="telefone">Telemovel:</label>
            <asp:TextBox ID="tb_telemovel" runat="server" placeholder="insira o seu telemóvel" CssClass="form-control"  TextMode="SingleLine" Font-Bold="True"></asp:TextBox>
              </div>  
         <div class="form-group">
             <label for="telefone2">Telemovel2:</label>
            <asp:TextBox ID="tb_telemovel2" runat="server" placeholder="insira o segundo telemóvel" CssClass="form-control" TextMode="SingleLine" Font-Bold="True"></asp:TextBox>
              </div>            
            <div class="form-group">
             <label for="telefone">Telefone:</label>
            <asp:TextBox ID="tb_telefone" runat="server" placeholder="insira o seu telefone" CssClass="form-control" TextMode="SingleLine" Font-Bold="True"></asp:TextBox>
              </div>  
         <div class="form-group">
             <label for="telefone2">Telefone:</label>
            <asp:TextBox ID="tb_telefone2" runat="server" placeholder="insira o segundo telefone" CssClass="form-control" TextMode="SingleLine" Font-Bold="True"></asp:TextBox>
              </div>                    
             <div class="form-group">
            <label for="nif">NIF:</label>
            <asp:TextBox ID="tb_nif" runat="server" placeholder="Insara o seu nif" CssClass="form-control" TextMode="SingleLine" Font-Bold="True"></asp:TextBox>
            </div>  
        
       
        <asp:Button ID="Btn_Inserir" OnClick="Btn_Inserir_Click" runat="server" Text="Inserir" Font-Bold="True" />
                         
   
          </main>           
             
                     
  
</asp:Content>
