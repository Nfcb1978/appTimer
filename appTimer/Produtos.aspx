<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="appTimer.Produstos" %>
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

                <h3 class="h3">ESCOLHA O PRODUTO</h3>
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
                        
 <td><asp:Label ID="lbl_nome" runat="server" Font-Bold="True" Text=""></asp:Label> </td>              
    <td><asp:Label ID="lbl_preco" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
       <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" /></td>                                         
      <td><asp:Label ID="lbl_descricao" runat="server" Text="Label" CssClass="text-justify" Width="100px"></asp:Label>  </td>                
     <td>
        
                              <asp:Button  ID="btn_carrinho" runat="server" Text="Adquirir" CommandName="btn_carrinho"/>
                            
                          </td>
                    </tr>
                </ItemTemplate>



                 <AlternatingItemTemplate>
 <tr>
                        <th scope="row">
                            <asp:Label ID="lbl_cod" runat="server" Text="" Font-Bold="True"></asp:Label></th>
                        
 <td><asp:Label ID="lbl_nome" runat="server" Font-Bold="True" Text=""></asp:Label> </td>              
    <td><asp:Label ID="lbl_preco" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
       <td><asp:Image ID="img_foto" runat="server" Width="150" Height="100" /></td>                                         
      <td><asp:Label ID="lbl_descricao" runat="server" Text="Label" CssClass="text-justify" Width="100px"></asp:Label>  </td>                
     <td>
        
                              <asp:Button  ID="btn_carrinho" runat="server" Text="Adquirir" CommandName="btn_carrinho"/>
                            
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

     <asp:Button ID="Btn_Confirmar" OnClick="Btn_Confirmar_Click" runat="server" CssClass="btn-primary w-100 mt-4 mb-4" Text="Confirmar Compra" Font-Bold="True" />


         



                 
                     
                       

       

                       
             </main> 
    
   
     
      

</asp:Content>
