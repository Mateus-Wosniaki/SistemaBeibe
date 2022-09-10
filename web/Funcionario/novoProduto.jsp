<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <title>
            Produto
        </title>
        <!-- Fonts and icons -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <div class="logo">
                    <a href="https://www.creative-tim.com" class="simple-text logo-normal">
                        FUNCIONÁRIO
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
                            <a href="detalheFuncionario.jsp">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
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
                        <li class="active">
                            <a href="exibirProdutos.jsp">
                                <i class="nc-icon nc-tag-content"></i>
                                <p>Produtos</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="vh-100 main-panel">
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
                    <h5>Cadastrar Produto</h5>
                    <form method="POST" action="exibirProdutos.jsp">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Nome do Produto</label>
                                                    <input type="text" class="form-control" name="nome">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-5 pr-1">
                                                <div class="form-group">
                                                    <label>Descrição</label>
                                                    <input type="text" class="form-control" name="descricao">
                                                </div>
                                            </div>
                                            <div class="col-md-7 pl-1">
                                                <div class="form-group">
                                                    <label>Peso</label>
                                                    <input type="number" class="form-control" name="number">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="update ml-auto mr-auto">
                                                <button type="submit" class="btn btn-success btn-round">Cadastrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="../assets/js/core/jquery.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
    </body>
</html>
