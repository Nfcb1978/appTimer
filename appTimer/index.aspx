<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="appTimer.appWelcome" %>

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

                <h3 class="h3">ESCOLHA UMA OPÇÃO</h3>
            </div>
        </div>
       


       <div class="card mb-3" style=" background-color:darkslategray ">
           <a href="Cliente.aspx" style="text-decoration: none; color: inherit;">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div src="Cliente.aspx" class="card-body">
                            <h5 class="card-title">
                                Iniciar Trabalho </h5>
                            <p class="card-text">Inicie um trabalho selecionando o cliente e a tarefa.</p>
                       
                        </div>
                    </div>
                </div>
     
            <div class="col-md-2">
                <div class="center">
                    <img src="Imagens/Ativo 24.png" class="img-fluid ml-auto">
                </div>
            </div>
        </div>
               </a>

       </div>
        

      <div class="card mb-3" style=" background-color:darkslategray ">
             <a href="Produtos.aspx" style="text-decoration: none; color: inherit;">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div class="card-body">
                            <h5 class="card-title">Entrega de Material
                            </h5>
                            <p class="card-text">Inicie uma deslocação para entrega de material.</p>
                        </div>
                    </div>
                </div>
     

            <div class="col-md-2">
                <div class="center">
                    <img src="Imagens/Ativo 25.png" class="img-fluid ml-auto">
                </div>
            </div>
        </div>
                   </a>
          </div>

      <div class="card mb-3" style=" background-color:darkslategray ">
           <a href="Trabalhos.aspx" style="text-decoration: none; color: inherit;">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="left">
                        <div class="card-body">
                            <h5 class="card-title">Consultar Trabalhos</asp:LinkButton>
                            </h5>
                            <p class="card-text">Consulte todos os trabalhos realizados.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="center">
                        <img src="Imagens/Ativo 26.png" class="img-fluid ml-auto">
                    </div>
                </div>
            </div>
                 </a>
           </div>

<div class="card mb-3" style=" background-color:darkslategray ">
      <a href="agenda.aspx" style="text-decoration: none; color: inherit;">
                <div class="row g-0">
                    <div class="col-md-6">
                        <div class="left">
                            <div class="card-body">
                                <h5 class="card-title">Agenda Virtual</h5>
                                <p class="card-text">Agende e organize o seu trabalho.</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <div class="center">
                            <img src="Imagens/Ativo 27.png" class="img-fluid ml-auto">
                        </div>
                    </div>
                </div>
              </a>
            </div>
       
               
    </main>
     
     
</asp:Content>
