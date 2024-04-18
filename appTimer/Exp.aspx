<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exp.aspx.cs" Inherits="appTimer.Exp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Navbar Vertical com Cards à Direita</title>
  <!-- Adicione o CSS do Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .navbar-vertical {
      height: 100vh; /* Altura total da viewport */
      position: fixed; /* Navbar fixa */
      overflow-y: auto; /* Adiciona scroll quando necessário */
    }
    .main-content {
      margin-left: 250px; /* Largura da navbar */
    }
  </style>
</head>
<body>
      <div class="col mr-0">
  <nav class="navbar navbar-dark bg-dark navbar-vertical">
       <div class="col mr-0">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Link 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link 2</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link 3</a>
      </li>
    </ul>
  </nav>
</div>
  <div class="container-fluid main-content">
    <div class="row">
      <div class="col-md-4">
        <div class="card mb-4">
          <div class="card-body">
            <h5 class="card-title">Card 1</h5>
            <p class="card-text">Conteúdo do Card 1.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card mb-4">
          <div class="card-body">
            <h5 class="card-title">Card 2</h5>
            <p class="card-text">Conteúdo do Card 2.</p>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card mb-4">
          <div class="card-body">
            <h5 class="card-title">Card 3</h5>
            <p class="card-text">Conteúdo do Card 3.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Scripts do Bootstrap (jQuery e Popper.js) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

