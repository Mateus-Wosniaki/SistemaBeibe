<%-- 
    Document   : index
    Created on : Jul 10, 2022, 6:23:21 PM
    Author     : Gabriel Jesus Peres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início | SAC - Beibe</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <div class="logo">
                    <a href="#" class="simple-text logo-normal">
                        GERENTE
                    </a>
                </div>
                <div class="sidebar-wrapper" style="padding-right: 2px;">
                    <ul class="nav">
                        <li class="active">
                            <a href="index.jsp">
                                <i class="nc-icon nc-shop"></i>
                                <p>Início</p>
                            </a>
                        </li>
                        <li>
                            <a href="detalheGerente.html">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
                            </a>
                        </li>
                        <li>
                            <a href="listaColaborador.jsp">
                                <i class="nc-icon nc-circle-10"></i>
                                <p>Colaboradores</p>
                            </a>
                        </li>
                        <li>
                            <a href="atendimentoAberto.jsp">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Atendimentos Abertos</p>
                            </a>
                        </li>
                        <li>
                            <a href="todosAtendimentos.jsp">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Todos Atendimentos</p>
                            </a>
                        </li>
                        <li>
                            <a href="relatorios.jsp">
                                <i class="nc-icon nc-paper"></i>
                                <p>Relatórios</p>
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
                                <a class="nav-link btn-rotate" href="#">
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
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-3">
                                            <div class="icon-big text-center icon-warning">
                                                <i class="nc-icon nc-chat-33 text-primary"></i>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="numbers">
                                                <p class="card-category">Total de Atendimentos</p>
                                                <p class="card-title">832<p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        Quantidade de atendimentos efetuados até o momento
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-3">
                                            <div class="icon-big text-center icon-warning">
                                                <i class="nc-icon nc-support-17 text-danger"></i>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="numbers">
                                                <p class="card-category">Atendimentos - Em Aberto</p>
                                                <p class="card-title">200<p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        Quantidade de atendimentos em aberto
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-body ">
                                    <div class="row">
                                        <div class="col-3">
                                            <div class="icon-big text-center icon-warning">
                                                <i class="nc-icon nc-chart-pie-36 text-warning"></i>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="numbers">
                                                <p class="card-category">Porcentagem Atendimentos - Em Aberto / Total</p>
                                                <p class="card-title">23%<p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        Quantidade de atendimentos em aberto em relação ao total
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-header ">
                                    <h5 class="card-title">
                                        <i class="nc-icon nc-chart-bar-32 text-success mr-4"></i>
                                        Razão de Atendimentos por Categoria
                                    </h5>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-striped table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Categoria</th>
                                                <th>Razão de Atendimentos</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tiger Nixon</td>
                                                <td>23/<strong>150</strong></td>
                                            </tr>
                                            <tr>
                                                <td>Garrett Winters</td>
                                                <td>23/<strong>150</strong></td>
                                            </tr>
                                            <tr>
                                                <td>Ashton Cox</td>
                                                <td>23/<strong>150</strong></td>
                                            </tr>
                                            <tr>
                                                <td>Cedric Kelly</td>
                                                <td>23/<strong>150</strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        Quantidade, por categoria, de atendimentos em aberto / total de atendimentos
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer footer-black  footer-white ">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="credits ml-auto">
                                <span class="copyright">
                                    BEIBE - Beauty Embuste Indústria de Beleza e Estética - <script>
                                        document.write(new Date().getFullYear());
                                    </script>
                                </span>
                            </div>
                        </div>
                    </div>
                </footer>
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
