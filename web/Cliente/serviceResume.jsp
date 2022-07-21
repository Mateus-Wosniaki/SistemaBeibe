<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="">
        <title>
            Resumo
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
                    <a href="https://www.creative-tim.com" class="simple-text logo-normal">
                        CLIENTE
                    </a>
                </div>
                <div class="sidebar-wrapper">
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
                                    <a class="nav-link btn-rotate" href="../Autenticacao/login.jsp">
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
                    <h5>Resumo Atendimento</h5>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-body">
                                        <form method="POST" action="userServiceList.jsp">
                                            <div class="row">
                                                <div class="col-md-4 pr-1">
                                                    <div class="form-group">
                                                        <label>Data de Criação</label>
                                                            <input readonly type="text" class="form-control" value="27/07/2022 23:50:23">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-8 pr-1">
                                                    <div class="form-group">
                                                        <label>Cliente</label>
                                                        <input type="text" class="form-control" disabled="" value="Mateus">
                                                    </div>
                                                </div>
                                                <div class="col-md-4 pl-1">
                                                    <div class="form-group">
                                                        <label>Situação</label>
                                                        <input type="email" class="form-control" disabled="" value="ABERTO">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 pr-1">
                                                    <div class="form-group">
                                                        <label>Produto</label>
                                                        <input type="text" class="form-control" disabled="" value="Remédio XPTO">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 pl-1">
                                                    <div class="form-group">
                                                        <label>Tipo Atendimento</label>
                                                        <input type="text" class="form-control" disabled="" value="Falta de Estoque">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Descrição</label>
                                                        <textarea class="form-control textarea" disabled="">Preciso realizar o consumo do remédio XPTO, porém o mesmo não se encontra disponível</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Solução</label>
                                                        <textarea class="form-control textarea" name="solucao" disabled></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="ml-auto mr-auto">
                                                    <button type="submit" class="btn btn-danger btn-round">Excluir</button>
                                                    <button class="btn btn-link btn-round">Voltar</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--   Core JS Files   -->
            <script src="../assets/js/core/jquery.min.js"></script>
            <script src="../assets/js/core/popper.min.js"></script>
            <script src="../assets/js/core/bootstrap.min.js"></script>
    </body>

</html>
