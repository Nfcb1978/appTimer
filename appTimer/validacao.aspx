<%@ Page Title="" Language="C#" MasterPageFile="~/Base2.Master" AutoEventWireup="true" CodeBehind="validacao.aspx.cs" Inherits="appTimer.validacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 

    <style>
        .signature {
            border: 1px solid #000;
            width: 80%;
            height:200px; 
            margin-bottom: 20px;
            background-color:white;
            margin-left:100px;
            
        
              
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

        .inicio {
            text-align: center;
            margin-top:5%;
        }

        #conometro {
            color: white;
        }

        .container {
            background-color: #333; /* Cor de fundo escura */
            color: white;
             margin-left: 0;
            padding: 0;
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
         h4{
             margin-left:20%;

         }
       

         .w-10
         {
                margin-left:20%;
              background-color: #333;
         }
        
    </style>
     
     <div class ="container">
      <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
   
  
          <div class="col-12">
            <div class="inicio">
              <button id="start1" type="button" onclick="startTimer()"><img src="Imagens/Ativo 21.png" /></button>
         <button id="stop1" type="button" style="display: none;" onclick="stopTimer()"><img src="Imagens/Ativo 22.png" /></button>
                <br />
                    
                   
                <br />

               
            </div>

                <div class="card mb-3" style=" background-color:#333 ">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                
    <asp:Label ID="lbl_nome" runat="server" Text="" CssClass="center" Font-Bold="True" Font-Size="Large"></asp:Label>
      
                      
                   
                        </div>
                    </div>
               
           </div>
            </div>
                 <div class="card mb-3" style=" background-color:#333 ">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                
    <asp:Label ID="lbl_servico" runat="server" Text="" CssClass="center" Font-Bold="True" Font-Size="Large"></asp:Label>
      
                      
                   
                        </div>
                    </div>
               
           </div>
            </div>

                 <div class="card mb-3" style=" background-color:#333 ">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                
     <div id="timerDisplay">00:00:00</div>
      
                      
                   
                        </div>
                    </div>
               
           </div>
            </div>



        </div>




  </main>
          </div>





   <div class ="container">
    <main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
  
        <div class="col-12">
            <div class="center">
              
                   
                <br />

               
            </div>
        </div>
        </main>
       </div>



      <div class ="container">
        
        <div>
            <h4>Rubrica do Colaborador</h4>
            <br />
            <canvas name="signature1" id="signature1" class="signature"></canvas>
           <br />
            <button type="button" Class="btn-light w-10" onclick="clearSignature('signature1')">Clear</button>
            <button type="button" Class="btn-light w-10" onclick="saveSignature('signature1', 'signature1Data')">Save</button>
              <br />
                 
              <br />
        </div>
            
        
        <div>
            <h4>Rubrida do Requerente de Serviço</h4>
            <br />
            <canvas name="signature2" id="signature2" class="signature"></canvas>
     <br />
            <button type="button" Class="btn-light w-10" onclick="clearSignature('signature2')">Clear</button>
            <button type="button" Class="btn-light w-10" onclick="saveSignature('signature2', 'signature2Data')">Save</button>
           
            <br />
              <br />
        </div>
                  
                 </div>   
         

    <div class ="container">
  
         <h4>Nota do Colaborador</h4>
        <br />
        <asp:TextBox ID="tb_Notas" CssClass="w-100" runat="server" TextMode="MultiLine" Text="Por favor deixe uma nota do serviço que vai efetuar"></asp:TextBox>
       <br />
        <asp:Button ID="btn_iniciar" CssClass="btn-primary w-100" runat="server" Text="INICIAR TRABALHO" />
      
       </div>
        

    <script>


        function setupCanvas1(signature1) {
            const canvas = document.getElementById(signature1);
            const ctx = canvas.getContext('2d');
            let drawing = false;

            canvas.addEventListener('mousedown', () => { drawing = true });
            canvas.addEventListener('mouseup', () => { drawing = false; ctx.beginPath() });
            canvas.addEventListener('mousemove', event => draw(event, signature1));

            function draw(event, signature1) {
                if (!drawing) return;
                const canvas = document.getElementById(signature1);
                const ctx = canvas.getContext('2d');
                ctx.lineWidth = 2;
                ctx.lineCap = 'round';
                ctx.strokeStyle = '#000';

                ctx.lineTo((event.clientX - canvas.offsetLeft - 200)/2.1, event.clientY - canvas.offsetTop+100);
                ctx.stroke();
                ctx.beginPath();
                ctx.moveTo((event.clientX - canvas.offsetLeft - 200)/2.1, event.clientY - canvas.offsetTop+100);
                console.log(canvas.offsetLeft + "-" + event.clientX);
              
            }
        }
        function setupCanvas2(signature2) {
            const canvas = document.getElementById(signature2);
            const ctx = canvas.getContext('2d');
            let drawing = false;

            canvas.addEventListener('mousedown', () => { drawing = true });
            canvas.addEventListener('mouseup', () => { drawing = false; ctx.beginPath() });
            canvas.addEventListener('mousemove', event => draw(event, signature2));

            function draw(event, signature2) {
                if (!drawing) return;
                const canvas = document.getElementById(signature2);
                const ctx = canvas.getContext('2d');
                ctx.lineWidth = 2;
                ctx.lineCap = 'round';
                ctx.strokeStyle = '#000';

                ctx.lineTo((event.clientX - canvas.offsetLeft - 200)/2.1, event.clientY - canvas.offsetTop+100);
                ctx.stroke();
                ctx.beginPath();
                ctx.moveTo((event.clientX - canvas.offsetLeft - 200)/2.1, event.clientY - canvas.offsetTop+100);
                console.log(canvas.offsetLeft + "-" + event.clientX);
            }
        }


        function clearSignature(canvasId) {
            const canvas = document.getElementById(canvasId);
            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        }

        function saveSignature(canvasId, storageKey) {
            const canvas = document.getElementById(canvasId);
            const dataURL = canvas.toDataURL();
            localStorage.setItem(storageKey, dataURL);
            alert('Assinatura salva localmente!');
        }

        // Setup both canvases
        setupCanvas1('signature1');
        setupCanvas2('signature2');
    </script>


</asp:Content>
