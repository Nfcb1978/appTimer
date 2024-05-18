<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="appWelcome.aspx.cs" Inherits="appTimer.appWelcome" %>
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
         
            <h3 class="h3">ESCOLHA UMA OPÇÃO</h3>
        </div>
            </div>  
    <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
        <div class="center">
      <img src="Imagens/Ativo 17.png" class="img-fluid ml-auto">
     </div>
        </div>
    <div class="col-md-6">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="Lb_InicioRapido" runat="server">Inicio Rápido</asp:LinkButton></h5>
        <p class="card-text">Inicie rapidamente um trabalho.</p>
         </div>
      </div>
      <div class="col-md-2">
        <div class="card-body">
            <div class="center">
      <h2 >></h2>
   </div>
           </div>
    </div>
  </div>
</div>


          <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
        <div class="center">
      <img src="Imagens/Ativo 18.png" class="img-fluid ml-auto">
     </div>
        </div>
    <div class="col-md-6">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="Lb_TarefaHabit" runat="server">Tarefa Habitual</asp:LinkButton></h5>
        <p class="card-text">Inicie uma tarefa habitual ou única.</p>
         </div>
      </div>
      <div class="col-md-2">
        <div class="card-body">
            <div class="center">
      <h2 >></h2>
   </div>
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
            <asp:LinkButton ID="Lb_iniciarTrabalho" runat="server">Iniciar Trabalho</asp:LinkButton> </h5>
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

       <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-6">
        <div class="left">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="Lb_EntregaMaterial" runat="server">Entrega de Material</asp:LinkButton> </h5>
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

           <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-6">
        <div class="left">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="Lb_Consultar_Trbalhos" runat="server">Consultar Trabalhos</asp:LinkButton> </h5>
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

               <div class="card mb-3" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-6">
        <div class="left">
      <div class="card-body">
        <h5 class="card-title">
            <asp:LinkButton ID="LB_agendaVirtual" runat="server">Agenda Virtual</asp:LinkButton> </h5>
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
           
    </div>
  </div>
 </main>
</asp:Content>
