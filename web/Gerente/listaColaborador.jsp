<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Colaboradores
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          CLIENTE
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li>
                            <a href="./inicio.jsp">
                                <i class="nc-icon nc-shop"></i>
                                <p>Início</p>
                            </a>
                        </li>
                        <li>
                            <a href="./user.html">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
                            </a>
                        </li>
                        <li>
                            <a href="./typography.html">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Atendimentos</p>
                            </a>
                        </li>
                        <li>
                            <a href="./tables.html">
                                <i class="nc-icon nc-paper"></i>
                                <p>Relatórios</p>
                            </a>
                        </li>
                        <li>
                            <a href="./typography.html">
                                <i class="nc-icon nc-tag-content"></i>
                                <p>Produtos</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
    <div class="main-panel">
    <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <div class="navbar-toggle">
                                <button type="button" class="navbar-toggler">
                                    <span class="navbar-toggler-bar bar1"></span>
                                    <span class="navbar-toggler-bar bar2"></span>
                                    <span class="navbar-toggler-bar bar3"></span>
                                </button>
                            </div>
                            <a class="navbar-brand" href="javascript:;">SAC - Sistema de Atendimento ao Cliente</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link btn-rotate" href="javascript:;">  
                                        <i class="nc-icon nc-button-power"></i>
                                        <p>
                                            <span class="d-lg-none d-md-block">Sair</span>
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
<!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">Colaboradores</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        Nome
                      </th>
                      <th>
                        Email
                      </th>
                      <th>
                        Cidade
                      </th>
                      <th>
                        Cargo
                      </th>
                      <th class="text-right">
                            
                      </th>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          Dakota Rice
                        </td>
                        <td>
                          123@hotmail.com.br
                        </td>
                        <td>
                          Curitiba
                        </td>
                        <td>
                           Gerente
                        </td>
                        <td class="text-right">
                            <div class="update ml-auto mr-auto">
                                <button type="submit" class="btn btn-info btn-round">Editar</button>
                                <button type="submit" class="btn btn-danger btn-round">Excluir</button>
                            </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          Dakota Rice
                        </td>
                        <td>
                          123@hotmail.com.br
                        </td>
                        <td>
                          Curitiba
                        </td>
                        <td>
                           Gerente
                        </td>
                        <td class="text-right">
                            <div class="update ml-auto mr-auto">
                                <button type="submit" class="btn btn-info btn-round">Editar</button>
                                <button type="submit" class="btn btn-danger btn-round">Excluir</button>
                            </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                    
                </div>
              </div>
                   
            </div>

          </div>
        </div>
        <div class="col text-center">
            <button type="submit" class="btn btn-success btn-round">Cadastro</button>
        </div> 
      </div>
  
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
</body>

</html>