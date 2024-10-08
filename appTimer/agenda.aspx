<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="appTimer.agenda" %>
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

                <h3 class="h3">CALEDÁRIO DE ENTREGAS DE MATERIAL:</h3>
            </div>
        </div>
       

     
        

         <asp:Repeater ID="rtp_entregas" runat="server"  DataSourceID="SqlDataSource1" OnItemDataBound="rtp_entregas_ItemDataBound">
                                           



         <HeaderTemplate>

                    <div class="container mt-5">
                        <div class="text-justify">
                            <table class="table">
                            <thead class="bg-primary">
                                <tr>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">Telemóvel</th>
                                    <th scope="col">Local Entrega</th>

                                    <th scope="col">Código Postal</th>
                                    <th scope="col">Data</th>
                                    <th scope="col">Tempo Previsto </th>
                                 

                                   
                                     


                                </tr>


                            </thead>
                            <tbody>
                </HeaderTemplate>


                <ItemTemplate>
 <tr>
                        
                           
                        
 <td><asp:Label ID="lbl_cliente" runat="server" Font-Bold="True" Text=""></asp:Label> </td>              
    <td><asp:Label ID="lbl_telemovel" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
     <td><asp:Label ID="lbl_local" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
     <td><asp:Label ID="lbl_codigo" runat="server" Font-Bold="True" Text=""></asp:Label></td>
     <td><asp:Label ID="lbl_data" runat="server" Font-Bold="True" Text=""></asp:Label></td>                                            
    <td><asp:Label ID="lbl_tempo" runat="server" Font-Bold="True" Text=""></asp:Label></td>               
     
                    </tr>
                </ItemTemplate>



                 <AlternatingItemTemplate>
<tr>
                       
                           
                        
 <td><asp:Label ID="lbl_cliente" runat="server" Font-Bold="True" Text=""></asp:Label> </td> 
     <td><asp:Label ID="lbl_telemovel" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
    <td><asp:Label ID="lbl_local" runat="server" Font-Bold="True" Text=""></asp:Label></td> 
     <td><asp:Label ID="lbl_codigo" runat="server" Font-Bold="True" Text=""></asp:Label></td>
     <td><asp:Label ID="lbl_data" runat="server" Font-Bold="True" Text=""></asp:Label></td>                                            
    <td><asp:Label ID="lbl_tempo" runat="server" Font-Bold="True" Text=""></asp:Label></td>               
   
                    </tr>
                
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
  </div>

  </div>
                        
                </FooterTemplate>


                              </asp:Repeater>

                             

     
         
                  
                     
                       

       

                       
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="select* from Entregas_Material
inner join Clientes on Entregas_Material.idcliente=Clientes.numero_Cliente"></asp:SqlDataSource>

                             

     
         
                  
                     
                       

       

                       
             </main> 

</asp:Content>
