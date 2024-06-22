<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="AppCliente2.aspx.cs" Inherits="appTimer.AppCliente2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

                <h3 class="h3">ESCOLHA O CLIENTE</h3>
            </div>
        </div>
       


         <div class="card mb-3" style=" background-color:#333 ">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div class="card-body">
                            <h5 class="card-title">
                                <p class="card-text">Procurar um projecto...</p>
                            </h5>
                           
                        </div>
                    </div>
                </div>
     
            <div class="col-md-2">
                <div class="center">
                    <img src="Imagens/OIP.jpg" class="img-fluid ml-auto">
                </div>
            </div>
        </div>

       </div>

         <div class="card mb-3" style=" background-color:#333 ">
            <div class="row g-0">
               
                <div class="col-md-12" ">
                    <div class="card-body" >
                         <div class="center">
                         <h5>   <asp:LinkButton ID="Lb_InicioRapido" runat="server" ForeColor="White">Adicionar um novo Cliente</asp:LinkButton></h5>
                        
                    </div>
                </div>
                </div>                
            </div>
        </div>

     <div class="card mb-3" style=" background-color:#333 ">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
                        
                            <asp:LinkButton  ID="Lb_Minho_Brinde" runat="server" ForeColor="White">Minho Brinde</asp:LinkButton>
                       
                    </div>
                    </div>
               
           </div>
                
            </div>


     
         <div class="card mb-3" style=" background-color:#333 ">
              
            <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
                       
                            <asp:LinkButton CssClass="custom-linkbutton" ID="Lb_Cafe_Ameadela" runat="server" ForeColor="White">Café Ameadela</asp:LinkButton>
                       
                  
                          </div>
                    
               
                    </div>
                
            </div>
        </div>
       
               
    </main>
</asp:Content>
