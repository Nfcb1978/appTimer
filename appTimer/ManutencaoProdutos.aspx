<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="ManutencaoProdutos.aspx.cs" Inherits="appTimer.ManutencaoProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
    .table{
        color:white;
        text-align:center;
    }


</style>
<main role="main"  class="col-md-12 ml-sm-auto  col-lg-12 px-m-0 ms-0">
        
        <div class="col-12">
            <div class="centro">
                <h5 class="h5">Seja Bem-Vindo</h5>
                <br />

                <h3 class="h3">MANUTENÇÃO</h3>
            </div>
        </div>
       

     
        

         <asp:Repeater ID="rtp_produtos" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="rtp_produtos_ItemDataBound" OnItemCommand="rtp_produtos_ItemCommand">

                                



         <HeaderTemplate>

                    <div class="container mt-5">
                        <div class="text-justify">
                            <table class="table">
                            <thead class="bg-primary">
                                <tr>
                                    <th scope="col">Código</th>
                                    <th scope="col">Nome</th>

                                    <th scope="col">Preço</th>
                                    <th scope="col">Foto</th>
                                    <th scope="col">Descrição </th>
                                   

                                    <th scope="col">
                                     


                                </tr>


                            </thead>
                            <tbody>
                </HeaderTemplate>


                <ItemTemplate>
 <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_cod" runat="server" Text="" Font-Bold="True"></asp:Label></th>
                        
 <td>     <asp:TextBox ID="tb_nome" runat="server" Width="75%" Font-Bold="True"></asp:TextBox> </td>              
    <td>     <asp:TextBox ID="tb_preco" runat="server" Font-Bold="True" Width="50%" TextMode="SingleLine"></asp:TextBox> </td>      
       <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" style="margin-bottom: 10px;" /><br /><asp:FileUpload ID="FileUpload1" runat="server" /></td>                                         
      <td>     <asp:TextBox ID="tb_descricao" runat="server" Font-Bold="True" TextMode="MultiLine" CssClass="text-justify" Width="100%"></asp:TextBox> </td>
     
             
     <td>
        
                             <asp:ImageButton ID="btn_gravar" runat="server" style="margin-bottom: 10px;" ImageUrl="~/Imagens/save-32.png" CommandName="btn_gravar" Height="40" Width="40" />
                            <!-- nome do icon podia ser diferente
                            <asp:ImageButton ID="btn_apaga" runat="server" ImageUrl="~/Imagens/delete1.png" CommandName="btn_apaga" Height="40" Width="40" />
                            -->
                          </td>
                    </tr>
                </ItemTemplate>



                 <AlternatingItemTemplate>
 <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_cod" runat="server" Text="" Font-Bold="True"></asp:Label></th>
                        
 <td>     <asp:TextBox ID="tb_nome" runat="server" Width="75%" Font-Bold="True"></asp:TextBox> </td>              
    <td>     <asp:TextBox ID="tb_preco" runat="server" Width="50%" Font-Bold="True" TextMode="SingleLine"></asp:TextBox> </td>      
      <div style="display: flex; align-items: center; flex-direction: column;">  
     <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" style="margin-bottom: 10px;" /><br /><asp:FileUpload ID="FileUpload1" runat="server" /></td>                                         
      </div>
     <td>     <asp:TextBox ID="tb_descricao" runat="server" Font-Bold="True" TextMode="MultiLine" CssClass="text-justify" Width="100%"></asp:TextBox> </td>
     
             
     <td>
        
                             <asp:ImageButton ID="btn_gravar" runat="server" style="margin-bottom: 10px;" ImageUrl="~/Imagens/save-32.png" CommandName="btn_gravar" Height="40" Width="40" />
                            <!-- nome do icon podia ser diferente
                            <asp:ImageButton ID="btn_apaga" runat="server" ImageUrl="~/Imagens/delete1.png" CommandName="btn_apaga" Height="40" Width="40" />
                            -->
                          </td>
                    </tr>
                
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                    

  </div>

  </div>
                        
                </FooterTemplate>


                              </asp:Repeater>

                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT * FROM [Produtos]"></asp:SqlDataSource>

     


         <div class="card mb-4" style=" background-color:#333 ">
            <div class="row g-0">
               
                <div class="col-md-12" ">
                    <div class="card-body" >
                         <div class="center">                        
                          <h5>   <asp:LinkButton ID="lb_inserirProduto" runat="server" OnClick="lb_inserirProduto_Click" ForeColor="White">Inserir Produto</asp:LinkButton></h5>
                    </div>
                </div>
                </div>                
            </div>
        </div>



                 
                     
                       

       

                       
             </main> 
</asp:Content>
