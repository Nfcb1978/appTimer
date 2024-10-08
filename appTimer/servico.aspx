﻿ <%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="servico.aspx.cs" Inherits="appTimer.servico" %>
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
          .mb-3 {
           
            background-color: aqua;
            font-family: Tahoma;
            
            border: 5px solid blueviolet;
            border-radius: 20px;
           }
          .navegacao
          {
              margin-bottom: 10px;
              
          }

       
        
        

    </style>

    
    <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
        
        <div class="col-12">
            <div class="centro">
                <h3 class="h3">
                    <asp:Label ID="lbl_nome" runat="server" Text=""></asp:Label></h3>
                <br />


                <h4 class="h3">ESCOLHA O SERVIÇO</h4>
            </div>
        </div>
       


  <div class="card mb-4" style=" background-color:#333 ">
            <div class="row g-0">
                <div class="col-md-12">
                    <div class="left">
                       
                          <div  class="input-group mx-sm-3 mb-2" style="height: 20px;" >

              
              
                            <input type="text" id="tb_pesquisa" runat="server" style=" color:white; background-color:darkslategray " class="form-control" placeholder="Procura um serviço" aria-label="Pesquisa" aria-describedby="button-pesquisa">
                              <asp:ImageButton ID="Bt_pesquisa" OnClick="Bt_pesquisa_Click"  ImageUrl="~/Imagens/OIP1.jpg" runat="server" />
			                            
                          

                              
            </div>

                    </div>
                </div>
     
            
        </div>

       </div>

         <asp:Repeater ID="rtp_pesquisa" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="rtp_pesquisa_ItemDataBound">

                                  <ItemTemplate>



        <div class="card mb-3" style=" background-color:#333 ">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
         
                
    <asp:Label ID="lbl_servico" runat="server" Text="" CssClass="center" Font-Bold="True" Font-Size="Large"></asp:Label>
      
                      
                   
                        </div>
                    </div>
               
           </div>
            </div>

    </ItemTemplate>


                              </asp:Repeater>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT * FROM [Servicos]"></asp:SqlDataSource>

        

        <asp:Xml ID="Xml1" runat="server" ValidateRequestMode="Disabled" TransformSource="~/formata Servico.xslt"></asp:Xml>

                 
       <!-- Botões de navegação para mudar de página -->
          <div class="navegacao">
                <asp:Button ID="btnPrevious" runat="server" Text="Anterior" OnClick="btnPrevious_Click" CssClass="btn-primary" />
                <asp:Button ID="btnNext" runat="server" Text="Próxima" OnClick="btnNext_Click" CssClass="btn-primary" />
               
            </div>
       <div class="navegacao">
     <asp:Panel ID="paginationPanel" runat="server" ></asp:Panel>

        </div>




                       
                       



                       
                   
             

               
    



                       
                       



                       
                   
             

               
    </main>

 </asp:Content>
