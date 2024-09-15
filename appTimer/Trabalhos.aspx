<%@ Page Title="" Language="C#" MasterPageFile="~/Base2.Master" AutoEventWireup="true" CodeBehind="Trabalhos.aspx.cs" Inherits="appTimer.Trabalhos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
            <asp:Image ID="assinatura" runat="server" />
              </ItemTemplate>

    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TimerConnectionString %>" SelectCommand="SELECT * FROM [Trabalhos]"></asp:SqlDataSource>
</asp:Content>
