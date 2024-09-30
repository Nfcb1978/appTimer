<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="Trabalho_Detalhe.aspx.cs" Inherits="appTimer.Trabalho_Detalhe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Estilo personalizado para centralizar a imagem verticalmente */

        .table {
            color: black;
            margin-bottom: 10px;
            padding-bottom: 10px;
         
    justify-content: center; /* Centraliza horizontalmente */
    align-items: center; /* Centraliza verticalmente */
    

        }
        .img
        {
            width:40%;
            aspect-ratio:16/9;
        }
  </style>

        <div class="container mt-5">
                        <div class="text-justify">
                            <table class="table">
                            <thead class="bg-primary">
                             
                                <tr>
                                    <th scope="col">Nome Cliente</th>
                                    <th scope="col">NIF</th>

                                    <th scope="col">Serviço Contratado</th>
                                    <th scope="col">Assinatura cliente:</th>
                                    <th scope="col">Data Inicio:</th>
                                    <th scope="col">Data Fim:</th>
                                    <th scope="col">Tempo Previsto:</th>
                                                                       


                                </tr>


                            </thead>
                           
                                <tr>
                                <td scope="col"><asp:Label ID="lbl_nomecliente" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                                 <td scope="col"><asp:Label ID="lbl_NIFcliente" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                                 <td scope="col"><asp:Label ID="lbl_servico" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                               <td scope="col"><asp:Label ID="lbl_datainicio" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                                 <td scope="col"><asp:Label ID="lbl_datafim" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                                 <td scope="col"><asp:Label ID="lbl_tempoprevisto" runat="server" Text="" Font-Bold="True"></asp:Label></td>  
                               
                                    <td><asp:Image ID="img_assinatura" runat="server"  /></td>  
                                                                       


                                </tr> 
                                       </table>
     
 
    <asp:Repeater ID="rtp_Produto" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="rtp_Produto_ItemDataBound">
     
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="trabalho_detalhe" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="entrada" SessionField="entrada" Type="String" />
        </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:Button ID="Btn_Confirma" OnClick="Btn_Confirma_Click" runat="server" CssClass="btn-primary w-100 mt-4 mb-4" Text="Confirmar Trabalho" Font-Bold="True" Enabled="True" />
                         
</asp:Content>
