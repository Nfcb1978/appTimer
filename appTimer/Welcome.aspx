<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="appTimer.Welcome" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vertical Navbar</title>
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Estilo personalizado para o menu vertical */
    .navbar-vertical {
      background-color: #f8f9fa; /* Altere a cor de fundo conforme necessário */
    }
    .navbar-vertical .navbar-nav {
      width: 100%;
    }
    .navbar-vertical .nav-link {
      padding: .5rem 1rem;
      color: #000; /* Altere a cor do texto conforme necessário */
    }
    .navbar-vertical .nav-link:hover {
      background-color: #e9ecef; /* Altere a cor de fundo do item ao passar o mouse */
    }
  </style>
</head>
<body>

<nav class="navbar navbar-vertical">
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 1.png" /> </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 2.png" /></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 3.png" /></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 4.png" /></a>
    </li>
      <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 5.png" /></a>
    </li>
      <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 6.png" /></a>
    </li>
      <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 7.png" /></a>
    </li>
      <li class="nav-item">
      <a class="nav-link" href="#"><img src="Imagens/Ativo 8.png" /></a>
    </li>
  </ul>
</nav>

<!-- Bootstrap JS (opcional, necessário apenas se você estiver usando funcionalidades JS do Bootstrap) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
