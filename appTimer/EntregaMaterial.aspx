<%@ Page Title="" Language="C#" MasterPageFile="~/Baseapp.Master" AutoEventWireup="true" CodeBehind="EntregaMaterial.aspx.cs" Inherits="appTimer.EntregaMaterial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
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
            <div class="centro">
                <h5 class="h5">Seja Bem-Vindo</h5>
                <br />

                <h3 class="h3">ENTREGA DE MATERIAL</h3>
            </div>
        </div>
        <div class="col-12">
            <div class="centro">
               <h3 class="h3">
                   
                <asp:DropDownList ID="ddl_nome" AppendDataBoundItems="True" runat="server" AutoPostBack="True" DataTextField="nome" DataValueField="numero_Cliente" ForeColor="White" Font-Bold="True" BackColor="#333333" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="ddl_nome_SelectedIndexChanged"></asp:DropDownList>
               
               
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT [numero_Cliente], [nome] FROM [Clientes]"></asp:SqlDataSource>
               
               
                   </h3>
                </div>
            </div>
         <br />


        <div class="form-group">
               <label for="Local"><b>Local de Entrega:</b></label>
            <asp:TextBox ID="tb_Local" runat="server" placeholder="Insira a data de inicio Prevista" CssClass="form-control"  Font-Bold="True" ></asp:TextBox>
               </div>
        
        <div class="form-group">
               <label for="Código Postal"><b>Código Postal:</b></label>
            <asp:TextBox ID="Tb_cod_Postal" runat="server" placeholder="Insira a data de inicio Prevista" CssClass="form-control"  Font-Bold="True" ></asp:TextBox>
               </div>
         
 <div class="form-group">
               <label for="Data"><b>Data:</b></label>
            <asp:TextBox ID="tbData" runat="server" placeholder="Insira a data de inicio Prevista" CssClass="form-control"  Font-Bold="True" TextMode="Date"></asp:TextBox>
               </div>

        

       <div class="form-group">
         <label for="TempoPrevisto"><b>Tempo Previsto:</b></label>
            <asp:TextBox ID="TbTempoPrevisto" runat="server" placeholder="Insira Tempo Previsto" CssClass="form-control" Font-Bold="True" ></asp:TextBox>
               </div>
          
         
  
        <div>
   
        
        
       
        <asp:Button ID="Btn_Confirma" OnClick="Btn_Confirma_Click" runat="server" CssClass="btn-primary w-100 mt-4 mb-4" Text="Confirmar Entrega" Font-Bold="True" Enabled="True" />
                     
   </div>
          </main>  
    
    
</asp:Content>
