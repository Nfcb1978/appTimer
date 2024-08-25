 <%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="servico.aspx.cs" Inherits="appTimer.servico" %>
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
                <h2 class="h2">
                    <asp:Label ID="lbl_nome" runat="server" Text=""></asp:Label></h2>
                <br />


                <h3 class="h3">ESCOLHA O TRABALHO</h3>
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
               
                <div class="col-md-12">
                    <div class="card-body" >
                         <div class="center">
                         <h5>   <asp:LinkButton ID="Lb_CriarTrablaho" OnClick="Lb_CriarTrablaho_Click" runat="server" ForeColor="White">Criar um novo Trabalho</asp:LinkButton></h5>
                        
                    </div>
                </div>
                </div>                
            </div>
        </div>

        <asp:Xml ID="Xml1" runat="server" ValidateRequestMode="Disabled" TransformSource="~/formata Servico.xslt"></asp:Xml>

                 
        <asp:Repeater ID="rtp_servico" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="rtp_servico_ItemDataBound">
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




                       
                       



                       
                   
             

               
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT * FROM [Tarefas]"></asp:SqlDataSource>




                       
                       



                       
                   
             

               
    </main>

 </asp:Content>
