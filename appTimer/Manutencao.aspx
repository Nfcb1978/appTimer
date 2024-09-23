<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="Manutencao.aspx.cs" Inherits="appTimer.Manutencao" %>
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
    </style>
   
    <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
        
        <div class="col-12">
            <div class="centro">
                <h5 class="h5">Seja Bem-Vindo</h5>
                <br />

                <h3 class="h3">MANUTENÇÃO</h3>
            </div>
        </div>
       


       <div class="card mb-3" style=" background-color:darkslategray ">
           <a href="servico.aspx" style="text-decoration: none; color: inherit;">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div src="Cliente.aspx" class="card-body">
                            <h5 class="card-title">
                                Serviços </h5>
                            <p class="card-text">Manutenção pagina Serviços.</p>
                       
                        </div>
                    </div>
                </div>
     
            
        </div>
               </a>

       </div>
        

      <div class="card mb-3" style=" background-color:darkslategray ">
             <a href="ManutencaoProdutos.aspx" style="text-decoration: none; color: inherit;">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div class="card-body">
                            <h5 class="card-title">Produtos
                            </h5>
                            <p class="card-text">Manutenção Pagina de Produtos.</p>
                        </div>
                    </div>
                </div>
     

            
        </div>
                   </a>
          </div>

      <div class="card mb-3" style=" background-color:darkslategray ">
           <a href="Cliente.aspx" style="text-decoration: none; color: inherit;">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div class="card-body">
                            <h5 class="card-title">Clientes
                            </h5>
                            <p class="card-text">Manutenção Página de Clientes.</p>
                        </div>
                    </div>
                </div>

                
            </div>
                 </a>
           </div>

<div class="card mb-3" style=" background-color:darkslategray ">
      <a href="perfil.aspx" style="text-decoration: none; color: inherit;">
                <div class="row g-0">
                    <div class="col-md-6">
                        <div class="left">
                            <div class="card-body">
                                <h5 class="card-title">Tecnicos</h5>
                                <p class="card-text">Manutenção Página do Técnico.</p>
                            </div>
                        </div>
                    </div>

                   
                </div>
              </a>
            </div>
       
               
    </main>
</asp:Content>
