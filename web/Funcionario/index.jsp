<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:choose>
    <c:when test="${empty sessionScope.login}">
        <c:set var="mensagem" value="Usuário deve se autenticar para acessar o sistema" scope="request"/>
        <jsp:forward page="/Autenticacao/login.jsp" />
    </c:when>
    <c:when test="${sessionScope.login.funcao.funcaoId != 2}">
        <c:set var="mensagem" value="Você não possui autorização necessária para acessar o conteúdo da página" scope="request"/>
        <jsp:forward page="/Autenticacao/login.jsp" />
    </c:when>
</c:choose>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="">
        <title>
            Início
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!-- Fonts and icons -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
    </head>

    <body class="">
        <div class="wrapper ">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <div class="logo">
                    <a href="https://www.creative-tim.com" class="simple-text logo-normal">
                        FUNCIONÁRIO
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li class="active">
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
                        <li>
                            <a href="exibirProdutos.jsp">
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
                    <h5>Resumo Atendimentos</h5>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <table id="example" class="display" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Tipo Atendimento</th>
                                                <th>Produto</th>
                                                <th>Data</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>XXXX</td>
                                                <td>2011-04-25</td>
                                            </tr>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>YYYY</td>
                                                <td>2011-06-25</td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>VVVV</td>
                                                <td>2011-02-12</td>
                                            </tr>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>XXXXX</td>
                                                <td>2012-07-05</td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>XXXXX</td>
                                                <td>2010-09-17</td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>XXXXX</td>
                                                <td>2011-02-12</td>
                                            </tr>
                                        <td>Produto Vencido</td>
                                        <td>XXXXX</td>
                                        <td>2011-02-12</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Motivo X</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Motivo Y</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>XXXXX</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        </tbody>
                                    </table
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
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    "pagingType": "full_numbers",
                    "lengthMenu": [
                        [10, 25, 50, -1],
                        [10, 25, 50, "All"]
                    ],
                    responsive: true,
                    language: {
                        search: "_INPUT_",
                        searchPlaceholder: "Filtrar"
                    }

                });

                var table = $('#datatable').DataTable();
            });
        </script>
    </body>

</html>
