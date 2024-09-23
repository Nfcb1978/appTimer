<%@ Page Title="" Language="C#" MasterPageFile="~/Base2.Master" AutoEventWireup="true" CodeBehind="Trabalhos.aspx.cs" Inherits="appTimer.Trabalhos" %>
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
         .caixas:hover{
           
            background-color:darkslategray;

        }

          

    </style>
   
    <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
        
        <div class="col-12">
            <div class="centro">
               <h3 class="h3">
                    <asp:Label ID="lbl_nome" runat="server" Text="Label"></asp:Label>
            
               
                   </h3>
                </div>
            </div>
         <br />
         <div class="col-12">
            <div class="centro">
                <h3 class="h3">ESCOLHA a TAREFA</h3>
            </div>
        </div>
       
        
               <div class="container">
                   
                    
                       <div class="row g-0">
                         
                         
                              <div class="col-md-6 ">
                <div class="mx-0">
            <div class="card" style=" background-color:#333 ">
           
               
               
                    <div class="card-body" >
                         <div class="center">
                         <h5>   <asp:LinkButton ID="Criar_Tarefa"  runat="server" ForeColor="White">Criar nova Tarefa</asp:LinkButton></h5>
                        
                    </div>
                </div>
                </div>    
                                   </div>    
          
       </div>

        
          <div class="col-md-6">
                  <div class="caixas">
         <div class="card" style=" background-color:#333 ">
            
               
                
                    <div class="card-body" >
                         <div class="center">
                         <h5>   <asp:LinkButton ID="Lb_InicioRapido" runat="server" ForeColor="White">Continuar sem Tarefa</asp:LinkButton></h5>
                        
                    </div>
                </div>
                </div>                
            </div>
        </div>
                         </div>          
         </div> 
        
     
       
             
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
            <asp:Image ID="assinatura" runat="server" />
              </ItemTemplate>

    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT * FROM [Trabalhos]"></asp:SqlDataSource>
</asp:Content>
