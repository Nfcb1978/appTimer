<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="appTimer.WebForm2" %>
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

                <h3 class="h3">ESCOLHA O CLIENTE</h3>
            </div>
        </div>
       


         <div class="card mb-3" style=" background-color:#333 ">
            <div class="row g-0">
                <div class="col-md-12">
                    <div class="left">
                       
                          <div class="input-group mx-sm-3 mb-2" >

                <input type="search" style=" color:white; background-color:darkslategray " class="form-control" placeholder="Procura um projecto..." >
              
                              <div class="input-group-append">
                    <span class="input-group-text"><i class="fas fa-search" style="color:darkslategray"></i></span>
                </div>
            </div>

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



                 
                     
                       



                       
             </main>         
        <asp:Xml ID="Xml1" runat="server" TransformSource="~/formataCliente.xslt"></asp:Xml>
</asp:Content>
