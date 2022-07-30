
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibir Produtos</title>
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
                        FUNCIONÁRIO
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
                            <a href="detalheFuncionario.html">
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
                            <a href="exibirProdutos.html">
                                <i class="nc-icon nc-tag-content"></i>
                                <p>Produtos</p>
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
                            <a class="navbar-brand" href="#">SAC - Sistema de Atendimento Ao Cliente</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">  
                            <ul class="navbar-nav">
                                <li>
                                    <a class="nav-link" href="#">
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
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <a href="novoProduto.jsp" class="btn btn-primary"><i class="fa fa-plus"></i>  Novo Produto</a>
                                    <a href="novaCategoria.jsp" class="btn btn-primary"><i class="fa fa-plus"></i>  Nova Categoria</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-header d-flex d-inline align-items-center">
                                    <div class="icon-big text-center">
                                        <h4 class="my-1"><i class="nc-icon nc-support-17 text-danger mx-4"></i></h4>
                                    </div>
                                    <h5 class="card-title">
                                        Listagem de Produtos
                                    </h5>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-striped table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Nome Produtos</th>
                                                <th>Categoria</th>
                                                <th>Peso</th>
                                                <th>Descrição</th>
                                                <th class="disabled-sorting text-right">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a href="#">Shampoo</a></td>
                                                <td><a href="#">Cabelo M/F</a></td>
                                                <td><a href="#">100g</a></td>
                                                <td><a href="#">Wella Professionals Invigo Nutri-Enrich - Shampoo</a></td>
                                                <td class="text-right">
                                                    <a href="novoProduto.jsp" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Base</a></td>
                                                <td><a href="#">Maquiagem</a></td>
                                                <td><a href="#">70g</a></td>
                                                <td><a href="#">Tracta Contorno Facial Claro 01</a></td>
                                                <td class="text-right">
                                                    <a href="novoProduto.jsp" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Pinça diagonal</a></td>
                                                <td><a href="#">Design de Sombrancelhas</a></td>
                                                <td><a href="#">50g</a></td>
                                                <td><a href="#">Pinça Ponta Diagonal Classic - Kiss New York</a></td>
                                                <td class="text-right">
                                                    <a href="novoProduto.jsp" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Hidratante Labial</a></td>
                                                <td><a href="#">Skincare</a></td>
                                                <td><a href="#">15g</a></td>
                                                <td><a href="#">Nuxe Rêve de Miel Baume Lèvres</a></td>
                                                <td class="text-right">
                                                    <a href="novoProduto.jsp" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Esmalte</a></td>
                                                <td><a href="#">Manicure</a></td>
                                                <td><a href="#">20g</a></td>
                                                <td><a href="#">Esmalte Gel Love Yes</a></td>
                                                <td class="text-right">
                                                    <a href="novoProduto.jsp" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer footer-black  footer-white">
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

