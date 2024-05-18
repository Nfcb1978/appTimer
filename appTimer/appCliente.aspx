<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="appCliente.aspx.cs" Inherits="appTimer.appCliente" %>
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
    .centro
    {
        text-align:CENTER;
    }
    #conometro
    {
        color: white;
    }
  </style>
     <main role="main" class="col-md-11 ml-sm-auto  col-lg-11 px-md-4">
    <div class="col-md-5">
          <div class="centro">
            <h5 class="h5">Seja Bem-Vindo</h5><br />
         
            <h3 class="h3">ESCOLHA O CLIENTE</h3>
        </div>
            </div>  



         <div class="card">
  <div class="card-body">
            
            <asp:LinkButton ID="Lb_TarefaHabit" runat="server" CssClass="center">Adicionar novo Cliente</asp:LinkButton></h5>
   
         </div>
      </div>
      

 


   <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-6">
        <div class="left">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="Lb_MB" runat="server">Minho Brinde</asp:LinkButton> </h5>
       
         </div>
      </div>
       </div>
     
    
   </div>

       <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-6">
        <div class="left">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="lb_cAmeadela" runat="server">Cafe Ameadela</asp:LinkButton> </h5>
       
         </div>
      </div>
       </div>
     
    
   </div>
       
           
    </div>
  </div>
 </main>

</asp:Content>
