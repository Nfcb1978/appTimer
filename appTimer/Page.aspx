<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="appTimer.Page" %>

<%@ Import Namespace="System.Web.Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Passar String do JavaScript para C#</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function sendString() {
            var valueToSend = 'String from JavaScript';
            $.ajax({
                type: "POST",
                url: "Page.aspx/SaveString",
                data: JSON.stringify({ value: valueToSend }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("String sent successfully!");
                    $('#<%= Label1.ClientID %>').text(response.d);
                },
                error: function (response) {
                    console.log("Error sending string.");
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Send String" OnClientClick="sendString(); return false;" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>