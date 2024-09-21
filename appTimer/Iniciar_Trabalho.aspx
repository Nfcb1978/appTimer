    <%@ Page Title="" Language="C#" MasterPageFile="~/Base2.Master" AutoEventWireup="true" CodeBehind="Iniciar_Trabalho.aspx.cs" Inherits="appTimer.validacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
  
    <style>
        .signature {
            border: 1px solid #000;
            width: 100%;
            height:200px; 
            margin-bottom: 20px;
            background-color:white; 
       
                      
                 
        }
        body
        {
            color:white;
        }
         .centrado {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Altura total da janela */
        }

         .center {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }
         #total
         {
             display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
         }

        .inicio {
            text-align: center;
            margin-top:5%;
        }

        #cronometro {
            color: white;
          
        }

        .container {
            background-color: #333; /* Cor de fundo escura */
            color: white;
             margin-left: 0;
            padding: 0;
            width:100%;
        }

        .corpo {
            background-color: darkgray;
        }

        
          
        .card-body{
           
            background-color:#333;
            text-align:center;
           

        }
         .card-body:hover{
           
            background-color:darkslategray;

        }
         h4{
             margin-left:20%;

         }
       

         .w-10
         {
                margin-left:20%;
              background-color: #333;
         }
       
        
    </style>
     

     
      <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
   

          <div class="col-12">
            <div class="inicio">
           
                <br />
                    
        
                <br />

               
            </div>

                <div class="card mb-3" style=" background-color:#333; margin-left:0">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                 <h5 class="h3">
                    <asp:Label ID="lbl_nome" runat="server" Text="Nome" Font-Bold="True" Font-Size="Medium"></asp:Label></h5>
    
                          
                   
                        </div>
                    </div>
               
           </div>
            </div>
                 <div class="card mb-3" style=" background-color:#333; margin-left:0">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                 <h5 class="h3">
                    <asp:Label ID="lbl_servico" runat="server" Text="Tarefa" Font-Bold="True" Font-Size="Medium"></asp:Label></h5>
    
                          
                   
                        </div>
                    </div>
               
           </div>
            </div>

                 <div class="card mb-3" style=" background-color:#333;  ">
             <div class="row g-0">
              
                    <div class="card-body">
        
                
<h2 class="btn-primary" style="width:100%"; id="cronometro">00:00:00</h2>
      
                      <h3 id="total" >Total Hoje: 00:00:00</h3>
      
                   
                        </div>
                    </div>
               
           </div>
           



        </div>


          
         <div class="card mb-3" style=" background-color:#333 ">
            <div class="row g-0">
                <div class="col-md-12 ">
                    <div class="left">
                       
                          <div class="input-group mx-sm-0 mb-2" >

                <input type="search" style=" color:white; background-color:darkslategray " class="form-control" placeholder="Procura um projecto..." >
              
                              <div class="input-group-append">
                    <span class="input-group-text"><i class="fas fa-search" style="color:darkslategray"></i></span>
                </div>
            </div>

                    </div>
                </div>
     
            
        </div>

       </div>

  
  
        <div class="col-12">
            <div class="center">
              
                   
                <br />

               
            </div>
        </div>
    


      
        
       
            
        
        <div>
            <h4>Rubrica do Requerente de Serviço ou Anfitrião</h4>
              <asp:TextBox ID="tbNome" runat="server" placeholder="Insira o seu nome" CssClass="form-control" required Font-Bold="True"></asp:TextBox>
            <br />
            <canvas name="signature" id="signature" class="signature"></canvas>
     <br />
            <button type="button" Class="btn-light w-10" onclick="clearSignature('signature')">Clear</button>
       
          

            <br />
              <br />
        </div>
                  
               
         

    
  
         <h4>Nota do Colaborador</h4>
        <br />
        <asp:TextBox ID="tb_Notas" CssClass="w-100" runat="server" TextMode="MultiLine" placeholder="Por favor deixe uma nota do serviço que vai efetuar" Font-Bold="True"></asp:TextBox>
       <br />
       
         <button id="btn_iniciar" class="btn-primary w-100" type="button" onclick="Bfunction()">INICIAR TRABALHO</button>
     
   
    </main>
          
    <script>
        
        
        function setupCanvas(signature) {
            const canvas = document.getElementById(signature);
            const ctx = canvas.getContext('2d');
            let drawing = false;

            canvas.addEventListener('mousedown', () => drawing = true);
            canvas.addEventListener('mouseup', () => {
                drawing = false;
                ctx.beginPath();
            });
            canvas.addEventListener('mousemove', event => draw(event, canvas, ctx));

            function draw(event, canvas, ctx) {
                if (!drawing) return;

                const rect = canvas.getBoundingClientRect();
                ctx.lineWidth = 2;
                ctx.lineCap = 'round';
                ctx.strokeStyle = '#000';
                
                ctx.lineTo((event.clientX - rect.left+75)/5, (event.clientY - rect.top+150)/4);
                ctx.stroke();
                ctx.beginPath();
                ctx.moveTo((event.clientX - rect.left+75)/5, (event.clientY - rect.top+150)/4);
            }
        }

        function clearSignature(signature) {
            const canvas = document.getElementById(signature);
            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }
       
        function saveSignature(signature) {
            const canvas = document.getElementById(signature);
            if (!canvas) {
                console.error(`Canvas with ID '${signature}' not found.`);
                return;
            }

            const dataURL = canvas.toDataURL('image/png');
            const contentType = dataURL.split(',')[0].split(':')[1].split(';')[0];

            $.ajax({
                type: "POST",
                url: "Iniciar_Trabalho.aspx/SaveSignature",
                data: JSON.stringify({ imageData: dataURL, contentType: contentType }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Assinatura salva com sucesso!");
                },
                error: function (response) {
                    alert("Erro ao salvar assinatura.");
                }
            });
        }
        setupCanvas('signature');
       
    </script>

   
</asp:Content>
