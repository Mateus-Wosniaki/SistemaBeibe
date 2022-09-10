
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem Categoria de Produto</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="../WEB-INF/jspf/menuFuncionario.jspf"%>
            <div class="main-panel">
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-header d-flex d-inline align-items-center">
                                    <div class="icon-big text-center">
                                        <h4 class="my-1"><i class="nc-icon nc-support-17 text-danger mx-4"></i></h4>
                                    </div>
                                    <h5 class="card-title">
                                        Listagem de Categorias 
                                    </h5>
                                </div>
                                <div class="card-body ">
                                    <table class="table table-striped table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Nome Categorias</th>

                                                <th class="disabled-sorting text-right">Ações</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a href="#">Cabelo M/F</a></td>

                                                <td class="text-right">
                                                    <a href="#" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Manicure</a></td>

                                                <td class="text-right">
                                                    <a href="#" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Design de Sombrancelha</a></td>

                                                <td class="text-right">
                                                    <a href="#" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Maquiagem</a></td>

                                                <td class="text-right">
                                                    <a href="#" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Skincare</a></td>

                                                <td class="text-right">
                                                    <a href="#" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
                                                    <a href="#" class="btn btn-danger btn-link btn-icon btn-m remove"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><a href="#">Barba</a></td>

                                                <td class="text-right">
                                                    <a href="#" class="btn btn-warning btn-link btn-icon btn-m edit"><i class="fa fa-edit"></i></a>
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