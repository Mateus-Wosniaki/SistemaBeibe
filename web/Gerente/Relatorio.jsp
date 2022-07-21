<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Paper Dashboard 2 by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!-- Fonts and icons -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="../assets/img/logo-small.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          Creative Tim
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="./dashboard.html">
              <i class="nc-icon nc-bank"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="./icons.html">
              <i class="nc-icon nc-diamond"></i>
              <p>Icons</p>
            </a>
          </li>
          <li>
            <a href="./map.html">
              <i class="nc-icon nc-pin-3"></i>
              <p>Maps</p>
            </a>
          </li>
          <li>
            <a href="./notifications.html">
              <i class="nc-icon nc-bell-55"></i>
              <p>Notifications</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="nc-icon nc-single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li class="active">
            <a href="./tables.html">
              <i class="nc-icon nc-tile-56"></i>
              <p>Table List</p>
            </a>
          </li>
          <li>
            <a href="./typography.html">
              <i class="nc-icon nc-caps-small"></i>
              <p>Typography</p>
            </a>
          </li>
          <li class="active-pro">
            <a href="./upgrade.html">
              <i class="nc-icon nc-spaceship"></i>
              <p>Upgrade to PRO</p>
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
            <a class="navbar-brand" href="javascript:;">Paper Dashboard 2</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link btn-magnify" href="javascript:;">
                  <i class="nc-icon nc-layout-11"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Stats</span>
                  </p>
                </a>
              </li>
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link btn-rotate" href="javascript:;">
                  <i class="nc-icon nc-settings-gear-65"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
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
                          <h4 class="card-title">Relatorio de Funcionarios</h4>
                      </div>  
                      <div class="card-body">  
                          <div class="table-responsive">
                              <table class="table">
                                  <thead class="text-primary">
                                      <tr><th class="text-center">
                                              #
                                          </th>
                                          <th>
                                              Nome
                                          </th>
                                          <th>
                                              Cargo
                                          </th>
                                          <th class="text-center">
                                              Desde
                                          </th>
                                          <th class="text-right">
                                              Salario
                                          </th>
                                          <th class="text-right">
                                              Relatorio
                                          </th>
                                      </tr></thead>
                                  <tbody>
                                      <tr>
                                          <td class="text-center">
                                              1
                                          </td>
                                          <td>
                                              Andrew Mike
                                          </td>
                                          <td>
                                              Develop
                                          </td>
                                          <td class="text-center">
                                              2013
                                          </td>
                                          <td class="text-right">
                                              R$ 1299,22
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              2
                                          </td>
                                          <td>
                                              John Doe
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              2012
                                          </td>
                                          <td class="text-right">
                                              R$ 1289,00
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              3
                                          </td>
                                          <td>
                                              Alex Mike
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              2010
                                          </td>
                                          <td class="text-right">
                                              R$ 1292,14
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              4
                                          </td>
                                          <td>
                                              Mike Monday
                                          </td>
                                          <td>
                                              Marketing
                                          </td>
                                          <td class="text-center">
                                              2013
                                          </td>
                                          <td class="text-right">
                                              R$ 1249,99
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              5
                                          </td>
                                          <td>
                                              Paul Dickens
                                          </td>
                                          <td>
                                              Communication
                                          </td>
                                          <td class="text-center">
                                              2015
                                          </td>
                                          <td class="text-right">
                                              R$ 1269,20
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              6
                                          </td>
                                          <td>
                                              Manuel Rico
                                          </td>
                                          <td>
                                              Manager
                                          </td>
                                          <td class="text-center">
                                              2012
                                          </td>
                                          <td class="text-right">
                                              R$ 1299,20
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="card">
                      <div class="card-header">
                          <h4 class="card-title">Relatorio de Produtos Mais Reclamados</h4>
                      </div>  
                      <div class="card-body">  
                          <div class="table-responsive">
                              <table class="table">
                                  <thead class="text-primary">
                                      <tr><th class="text-center">
                                              #
                                          </th>
                                          <th>
                                              Nome do Produto
                                          </th>
                                          <th>
                                              Categoria
                                          </th>
                                          <th class="text-center">
                                              Qtd de Reclamacoes
                                          </th>
                                          <th class="text-right">
                                              Relatorio
                                          </th>
                                      </tr></thead>
                                  <tbody>
                                      <tr>
                                          <td class="text-center">
                                              1
                                          </td>
                                          <td>
                                              Andrew Mike
                                          </td>
                                          <td>
                                              Develop
                                          </td>
                                          <td class="text-center">
                                              201
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              2
                                          </td>
                                          <td>
                                              John Doe
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              198
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              3
                                          </td>
                                          <td>
                                              Alex Mike
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              153
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              4
                                          </td>
                                          <td>
                                              Mike Monday
                                          </td>
                                          <td>
                                              Marketing
                                          </td>
                                          <td class="text-center">
                                              134
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              5
                                          </td>
                                          <td>
                                              Paul Dickens
                                          </td>
                                          <td>
                                              Communication
                                          </td>
                                          <td class="text-center">
                                              98
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              6
                                          </td>
                                          <td>
                                              Manuel Rico
                                          </td>
                                          <td>
                                              Manager
                                          </td>
                                          <td class="text-center">
                                              47
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="card">
                      <div class="card-header">
                          <h4 class="card-title">Relatorio de Atendimentos em Aberto por Data</h4>
                      </div>  
                      <div class="card-body">  
                          <div class="table-responsive">
                              <table class="table">
                                  <thead class="text-primary">
                                      <tr><th class="text-center">
                                              #
                                          </th>
                                          <th>
                                              Nome atendimento
                                          </th>
                                          <th>
                                              Departamento
                                          </th>
                                          <th class="text-center">
                                              Data
                                          </th>
                                          <th class="text-right">
                                              Relatorio
                                          </th>
                                      </tr></thead>
                                  <tbody>
                                      <tr>
                                          <td class="text-center">
                                              1
                                          </td>
                                          <td>
                                              Atendimento
                                          </td>
                                          <td>
                                              Develop
                                          </td>
                                          <td class="text-center">
                                              02/12/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              2
                                          </td>
                                          <td>
                                              Atendimento
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              02/11/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              3
                                          </td>
                                          <td>
                                              Atendimento
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              02/10/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              4
                                          </td>
                                          <td>
                                              Atendimento
                                          </td>
                                          <td>
                                              Marketing
                                          </td>
                                          <td class="text-center">
                                              02/09/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              5
                                          </td>
                                          <td>
                                              Atendimento
                                          </td>
                                          <td>
                                              Communication
                                          </td>
                                          <td class="text-center">
                                              02/08/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              6
                                          </td>
                                          <td>
                                              Atendimento
                                          </td>
                                          <td>
                                              Manager
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-md-12">
                  <div class="card">
                      <div class="card-header">
                          <h4 class="card-title">Relatorio de Reclamações</h4>
                      </div>  
                      <div class="card-body">  
                          <div class="table-responsive">
                              <table class="table">
                                  <thead class="text-primary">
                                      <tr><th class="text-center">
                                              #
                                          </th>
                                          <th>
                                              Assunto
                                          </th>
                                          <th>
                                              Departamento
                                          </th>
                                          <th class="text-center">
                                              Data
                                          </th>
                                          <th class="text-right">
                                              Relatorio
                                          </th>
                                      </tr></thead>
                                  <tbody>
                                      <tr>
                                          <td class="text-center">
                                              1
                                          </td>
                                          <td>
                                              assunto
                                          </td>
                                          <td>
                                              Develop
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              2
                                          </td>
                                          <td>
                                              assunto
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              3
                                          </td>
                                          <td>
                                              assunto
                                          </td>
                                          <td>
                                              Design
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              4
                                          </td>
                                          <td>
                                              assunto
                                          </td>
                                          <td>
                                              Marketing
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              5
                                          </td>
                                          <td>
                                              assunto
                                          </td>
                                          <td>
                                              Communication
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="text-center">
                                              6
                                          </td>
                                          <td>
                                              assunto
                                          </td>
                                          <td>
                                              Manager
                                          </td>
                                          <td class="text-center">
                                              02/07/2022
                                          </td>
                                          <td class="text-right">
                                              <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                  <i class="fa fa-download"></i>
                                              </button>
                                          </td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                      </div>
                  </div>
              </div>
          </div>

    
