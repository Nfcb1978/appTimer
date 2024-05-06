<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="appTimer.Welcome" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Navbar Vertical com Cards à Direita</title>
  <!-- Adicione o CSS do Bootstrap -->
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

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

  <div class="container-fluid">
    <div class="row">
      <!-- Navbar Vertical -->
 
      <nav class="col-md-1 col-lg-1 d-md-block bg-dark sidebar ">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="#"> <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                  </asp:Timer>
                  <asp:ImageButton ID="Btn_conometro" ImageUrl="~/Imagens/Ativo 20.png" OnClick="Btn_conometro_Click" runat="server" /></a>
            </li>
              <li class="nav-item">
              <a class="nav-link active" href="#">
                  <asp:ImageButton ID="Btn_Pausa" ImageUrl="~/Imagens/Ativo 19.png" OnClick="Btn_Pausa_Click" runat="server" />
                 
                  </a>
            </li>
               <li class="nav-item">
              <p id="conometro">
                  <asp:Label ID="lblTempo" runat="server" Text="00:00.00"></asp:Label></p>
                 
               </li>

            <li class="nav-item">
              <a class="nav-link" href="#"></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 1.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 2.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 3.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 4.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 5.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 6.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 7.png" /></a>
            </li>
               <li class="nav-item">
              <a class="nav-link" href="#"><img src="Imagens/Ativo 8.png" /></a>
            </li>
          </ul>
        </div>
      </nav>
          
      <!-- Cards -->
       
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
        <h5 class="card-title">Inicio Rápido</h5>
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
        <h5 class="card-title">Tarefa Habitual</h5>
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
        <h5 class="card-title">Iniciar Trabalho </h5>
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
        <h5 class="card-title">Entrega de Material </h5>
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
        <h5 class="card-title">Consultar Trabalhos </h5>
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
        <h5 class="card-title">Agenda Virtual </h5>
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

         <div class="col-md-8">
          <div class="centro">
            <h5 class="h5">Total Trabalhado hoje: 00:00:00</h5>
         
           
        </div>
            </div> 

          

  
      </main>
    </div>

               
  <!-- Scripts do Bootstrap (jQuery e Popper.js) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</form>
</body>
</html>
