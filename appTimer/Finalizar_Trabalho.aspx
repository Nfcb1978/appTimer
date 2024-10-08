<%@ Page Title="" Language="C#" MasterPageFile="~/Base2.Master" AutoEventWireup="true" CodeBehind="Finalizar_Trabalho.aspx.cs" Inherits="appTimer.Finalizar_Trabalho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
      
        /* Estilo personalizado para centralizar a imagem verticalmente */
         
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

       

        .container {
            background-color: #333; /* Cor de fundo escura */
            color: white;
            
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
         .tempos{
             color:white;
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
                    <asp:Label ID="lbl_nome" runat="server" Text="" Font-Bold="True" Font-Size="XX-Large"></asp:Label></h3>
                    
                     
                   
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
               
    
              <asp:Xml ID="Xml1" runat="server" TransformSource="~/FormataTempos.xslt"></asp:Xml>
      
      <div class="card mb-3" style=" background-color:#333; margin-left:0">
             <div class="row g-0">
               <div class="col-md-12">
                    <div class="card-body">
        
                 <h3 >            </h3>
                    
                     
                   
                        </div>
                    </div>
        
                   </div>
                    </div>
        <asp:Repeater ID="rtp_Produto" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="rtp_Produto_ItemDataBound" >
     
 <HeaderTemplate>
      
        
      
								</h5>
                       <div class="container mt-5">
                        <div class="text-justify">
                            <table class="table">
                            <thead class="bg-primary">
                             
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Preço</th>

                                    <th scope="col">Quantidade</th>
                                    <th scope="col">Valor</th>
                                    <th scope="col">Foto</th>
                                                                       


                                </tr>


                            </thead>
                            <tbody>
                    </HeaderTemplate>


                    <ItemTemplate>
                           <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_produto" runat="server" Text="" Font-Bold="True" ForeColor="White"></asp:Label></th>
                        
 <td><asp:Label ID="lbl_preco" runat="server" Font-Bold="True" Text="" ForeColor="White"></asp:Label> </td>              
    <td><asp:Label ID="lbl_quantidade" runat="server" Font-Bold="True" Text="" ForeColor="White"></asp:Label></td> 
      <td><asp:Label ID="lbl_valor" runat="server" Font-Bold="True" Text="" ForeColor="White"></asp:Label></td>
                               <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" /></td>                                         
                   
     
                                  </tr>                                      
                                                     
                    </ItemTemplate>



                    <AlternatingItemTemplate>
                                      <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_produto" runat="server" Text="" Font-Bold="True" ForeColor="White"></asp:Label></th>
                        
 <td><asp:Label ID="lbl_preco" runat="server" Font-Bold="True" Text="" ForeColor="White"></asp:Label> </td>              
    <td><asp:Label ID="lbl_quantidade" runat="server" Font-Bold="True" Text="" ForeColor="White"></asp:Label></td>
    <td><asp:Label ID="lbl_valor" runat="server" Font-Bold="True" Text="" ForeColor="White"></asp:Label></td>
    <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" /></td>                                         
                   
     
                                  </tr>              

                    </AlternatingItemTemplate>
                    <FooterTemplate>
                     </table>
  
 
    </div>
  </div>
                        
                    </FooterTemplate>


    </asp:Repeater>

              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="trabalhoDetails" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                      <asp:SessionParameter Name="idtrabalho" SessionField="trabalhoid" Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>

        </div>
              </div>
        
          <div>
            <h4>Rubrica do Requerente de Serviço ou Anfitrião</h4>
              <asp:TextBox ID="tbNome" runat="server" placeholder="Insira o seu nome" CssClass="form-control"  Font-Bold="True"></asp:TextBox>
            <br />
            <canvas name="signature" id="signature" class="signature"></canvas>
     <br />
            <button type="button" Class="btn-light w-10" onclick="clearSignature('signature')">Clear</button>
       <!--     <button type="button" Class="btn-light w-10" onclick="saveSignature('signature', 'signature2Data')">Save</button>-->
           <button type="button" Class="btn-light w-10" onclick="saveSignature('signature')">Save</button>

            <br />
              <br />
        </div>
                  
               
         

           
  
         <h4>Nota do Colaborador</h4>
        <br />
        <asp:TextBox ID="tb_Notas" CssClass="w-100" runat="server" TextMode="MultiLine" placeholder="Por favor deixe uma nota do serviço que vai efetuar" Font-Bold="True"></asp:TextBox>
       <br />
       
          <asp:Button ID="Btn_finalizar" OnClick="Btn_finalizar_Click" Class="btn-primary w-100" runat="server" Text="Confirmar" Font-Bold="True" />
     
          
        
   
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

                    ctx.lineTo((event.clientX - rect.left + 75) / 5, (event.clientY - rect.top + 150) / 4);
                    ctx.stroke();
                    ctx.beginPath();
                    ctx.moveTo((event.clientX - rect.left + 75) / 5, (event.clientY - rect.top + 150) / 4);
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
                    url: "Executar_Trabalho.aspx/SaveSignature",
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
