<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAC - Listagem de Atendimentos</title>

        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <div class="logo">
                    <a href="#" class="simple-text logo-normal">
                        BEIBE - Atendimento
                    </a>
                </div>
                <div class="sidebar-wrapper" style="padding-right: 2px;">
                    <ul class="nav">
                        <li>
                            <a href="index.jsp">
                                <i class="nc-icon nc-shop"></i>
                                <p>Início</p>
                            </a>
                        </li>
                        <li>
                            <a href="updateUser.html">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
                            </a>
                        </li>
                        <li class="active">
                            <a href="userServiceList.jsp">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Atendimentos</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
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
                            <a class="navbar-brand" href="#">SAC - Sistema de Atendimento ao Cliente</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">  
                            <ul class="navbar-nav">
                                <a class="nav-link btn-rotate" href="../Autenticacao/login.jsp">
                                    <i class="nc-icon nc-button-power"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Logout</span>
                                    </p>
                                </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-header d-flex d-inline align-items-center">
                                    <h5 class="card-title">
                                        Listagem de Atendimentos
                                    </h5>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-striped table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Tipo Atendimento</th>
                                                <th>Status</th>
                                                <th>Data</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>Aberto</td>
                                                <td>2011-04-25</td>
                                                <td class="text-center">
                                                    <a href="serviceResume.jsp"><i class="fa fa-eye"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>Aberto</td>
                                                <td>2011-06-25</td>
                                                <td class="text-center">
                                                    <a href="serviceResume.jsp"><i class="fa fa-eye"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>Aberto</td>
                                                <td>2011-02-12</td>
                                                <td class="text-center">
                                                    <a href="serviceResume.jsp"><i class="fa fa-eye"></i></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../assets/js/core/jquery.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="../assets/js/plugins/chartjs.min.js"></script>
        <script src="../assets/js/plugins/bootstrap-notify.js"></script>
        <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
    </body>
</html>
