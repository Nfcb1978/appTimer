<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagina.aspx.cs" Inherits="appTimer.Pagina" %>
<%@ Import Namespace="System.Web.Services" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        /* Estilo personalizado para centralizar a imagem verticalmente */
        .center {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .centro {
            text-align: CENTER;
        }

        #timerDisplay{
            color: white;
        }

        body {
            background-color: #333; /* Cor 


    </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        function sendData() {
         
            var h = Math.floor(seconds / 3600).toString().padStart(2, '0');
            var m = Math.floor((seconds % 3600) / 60).toString().padStart(2, '0');
            var s = (seconds % 60).toString().padStart(2, '0');

            $.ajax({
                type: "POST",
                url: "Pagina.aspx/SaveTime",
                data: JSON.stringify({ hours: h, minutes: m, seconds: s }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Time sent successfully!");
                },
                error: function (xhr, status, error) {
                    console.log("Error sending time.");
                    console.log("Status:", status);
                    console.log("Error:", error);
                    console.log("Response Text:", xhr.responseText);
                }
            });
        }
    </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var seconds = 0;
        var timer;

        function formatTime(seconds) {
            var h = Math.floor(seconds / 3600).toString().padStart(2, '0');
            var m = Math.floor((seconds % 3600) / 60).toString().padStart(2, '0');
            var s = (seconds % 60).toString().padStart(2, '0');
            return h + ':' + m + ':' + s;


            var hhh = s.toLocaleString();

            $.ajax({
                type: "POST",
                url: "Pagina.aspx/SaveTime",
                data: JSON.stringify({ hours: h, minutes: m, seconds: s }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Time sent successfully!");
                },
                error: function (xhr, status, error) {
                    console.log("Error sending time.");
                    console.log("Status:", status);
                    console.log("Error:", error);
                    console.log("Response Text:", xhr.responseText);
                }
            });
         






        }

        function updateTimer() {
            document.getElementById('timerDisplay').innerText = formatTime(seconds);
         
            seconds++;
        }

        function startTimer() {
            if (!timer) {
                timer = setInterval(updateTimer, 1000);
            }
            document.getElementById('start').style.display = 'none';
            document.getElementById('stop').style.display = 'inline';
          
        }

        function stopTimer() {
            if (timer) {
                clearInterval(timer);
                timer = null;
                document.getElementById('start').style.display = 'inline';
                document.getElementById('stop').style.display = 'none';
               

                
            }
        }

        function resetTimer() {
            stopTimer();
            seconds = 0;
            document.getElementById('timerDisplay').innerText = '00:00:00';
          
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
          
        <div class="container-fluid">
            <div class="row">
                <!-- Navbar Vertical -->
       
                <nav class="col-md-1 col-lg-1 d-md-block bg-dark sidebar ">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                         
       
        <button id="start" type="button" onclick="startTimer()"><img src="Imagens/Ativo 20.png" /></button>
         <button id="stop" type="button" style="display: none;" onclick="stopTimer()"><img src="Imagens/Ativo 19.png" /></button>
      

                                </a>
                            
                                   
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <button type="button" onclick="resetTimer()"><img src="Imagens/stop.png" /></button>

                                </a>
                            </li>
                            <li class="nav-item">
                              <div id="timerDisplay">00:00:00</div>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <br />
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 1.png" /></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 2.png" /></a>
                            </li>
                            <li class="nav-item">
                                <p>
                                    <br />

                                </p>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 3.png" /></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 4.png" /></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 5.png" /></a>
                            </li>
                            <li class="nav-item">
                                <p style="color: aliceblue">_______</p>
                            </li>


                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 6.png" /></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 7.png" /></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <img src="Imagens/Ativo 8.png" /></a>
                            </li>
                            <li class="nav-item">
                                <p>
                                    <br />
                                    <br />

                                </p>
                            </li>
                            <li class="nav-item" style="  position: absolute;
            bottom: 0; ">
                                <a class="nav-link active" href="#">
                                  <img src="Imagens/Ativo 16.png" />

                                </a>
                            </li>

                        </ul>
                    </div>
                </nav>
                
                <!-- Cards -->

                
  <main role="main" class="col-md-11 ml-sm-auto  col-lg-11 px-md-0 ">

      <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Larger" ForeColor="White"></asp:Label>
       <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Larger" ForeColor="White"></asp:Label>
       <asp:Button ID="Button1" runat="server" Text="Submit" OnClientClick="somefunction(); return false; " />
      <asp:Button ID="Button2" runat="server" Text="Stop" OnClientClick="Afunction(); return false; " />
      <asp:Button ID="Button3" runat="server" Text="Nova" OnClientClick="sendData(); return false; " />
      <div>
    </form>
</body>
</html>
