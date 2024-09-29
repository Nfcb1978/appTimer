<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="Trabalho.aspx.cs" Inherits="appTimer.Trabalho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Estilo personalizado para centralizar a imagem verticalmente */

        .table {
            color: white;
            margin-bottom: 20px;
            padding-bottom: 20px;
         
    justify-content: center; /* Centraliza horizontalmente */
    align-items: center; /* Centraliza verticalmente */
  
   

        }

       
        .signature {
            border: 1px solid #000;
            width: 100%;
            height:200px; 
            margin-bottom: 20px;
            background-color:white; 
       
                      
                 
        }
        
        
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
            <div class="inicio">
           
                <br />
                    
        
                <br />

               
            </div>

                <div class="card mb-3" style=" background-color:#333; margin-left:0">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                 <h3 class="h3">
                    <asp:Label ID="lbl_nome" runat="server" Text="Nome" Font-Bold="True" Font-Size="XX-Large"></asp:Label></h3>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                    </div>
                    </div>
               
           </div>
            </div>
                 <div class="card mb-3" style=" background-color:#333; margin-left:0">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                 <h3 >
                    <asp:Label ID="lbl_servico" runat="server" Text="" Font-Bold="True" Font-Size="XX-Large"></asp:Label></h3>
    
                          
                   
                        </div>
                    </div>
               
           </div>
                    
            </div>
       
 </div>

         
 <div class="form-group">
               <label for="DataInicio"><b>data de Inicio:</b></label>
            <asp:TextBox ID="tbDataInicio" runat="server" placeholder="Insira a data de inicio Prevista" CssClass="form-control"  Font-Bold="True" TextMode="Date"></asp:TextBox>
               </div>

        <div class="form-group">
         <label for="DataFim"><b>data Fim:</b></label>
            <asp:TextBox ID="tbDataFim" runat="server" placeholder="Insira a data Final Prevista" CssClass="form-control"  Font-Bold="True" TextMode="Date"></asp:TextBox>
               </div>

       <div class="form-group">
         <label for="TempoPrevisto"><b>Tempo Previsto:</b></label>
            <asp:TextBox ID="TbTempoPrevisto" runat="server" placeholder="Insira Tempo Previsto" CssClass="form-control" Font-Bold="True"></asp:TextBox>
               </div>
          
          <asp:Button ID="Btn_VenderProduros" OnClick="Btn_VenderProduros_Click" runat="server" CssClass="btn-primary w-100 mt-4 mb-4" Text="Compra de Produtos" Font-Bold="True" />
      
        
        <div class="container">
  

    <asp:Repeater ID="rtpProdutos" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="rtpProdutos_ItemDataBound" >
	
	
		<HeaderTemplate>
         
                       <div class="container mt-5">
                        <div class="text-justify">
                            <table class="table">
                            <thead class="bg-primary">
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Preço</th>

                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Foto</th>
                                                                       


                                </tr>


                            </thead>
                            <tbody>
                    </HeaderTemplate>


                    <ItemTemplate>
                           <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_produto" runat="server" Text="" Font-Bold="True"></asp:Label></th>
                        
 <td><asp:Label ID="lbl_preco" runat="server" Font-Bold="True" Text=""></asp:Label> </td>              
    <td><asp:Label ID="lbl_quantidade" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
       <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" /></td>                                         
                   
     
                                  </tr>                                      
                                                     
                    </ItemTemplate>



                    <AlternatingItemTemplate>
                                      <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_produto" runat="server" Text="" Font-Bold="True"></asp:Label></th>
                        
 <td><asp:Label ID="lbl_preco" runat="server" Font-Bold="True" Text=""></asp:Label> </td>              
    <td><asp:Label ID="lbl_quantidade" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
       <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" /></td>                                         
                   
     
                                  </tr>              

                    </AlternatingItemTemplate>
                    <FooterTemplate>
                     </table>
  
 
    </div>
  </div>
                        
                    </FooterTemplate>

		</asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="carrinholista" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="util" SessionField="idcarrinho" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
         </div>
         
        <div>
        
            <h4>Rubrica do Requerente de Serviço ou Anfitrião</h4>
              <asp:TextBox ID="tbNome" runat="server" placeholder="Insira o seu nome" CssClass="form-control w-100" Font-Bold="True"></asp:TextBox>
            <br />
            <canvas name="signature" id="signature" class="signature"></canvas>
     <br />
            <button type="button" Class="btn-light w-10" onclick="clearSignature('signature')">Apagar</button>
             <button type="button" Class="btn-light w-10" onclick="saveSignature('signature')">Validar</button>
               

            <br />
              <br />

        
        <h4>Nota do Colaborador</h4>
        <br />
        <asp:TextBox ID="tb_Notas" CssClass="w-100" runat="server" TextMode="MultiLine" placeholder="Por favor deixe uma nota do serviço que vai efetuar" Font-Bold="True"></asp:TextBox>
       <br />
        
       
        <asp:Button ID="Btn_Confirma" OnClick="Btn_Confirma_Click" runat="server" CssClass="btn-primary w-100 mt-4 mb-4" Text="Confirmar Trabalho" Font-Bold="True" Enabled="True" />
                     
   </div>
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
                url: "Trabalho.aspx/SaveSignature",
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
