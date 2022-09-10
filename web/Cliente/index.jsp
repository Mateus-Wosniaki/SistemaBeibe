<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <%@ include file="../WEB-INF/jspf/menuCliente.jspf"%>
            <div class="main-panel">
                <!-- Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
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
                                                <th>Status</th>
                                                <th>Data</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>Aberto</td>
                                                <td>2011-04-25</td>
                                            </tr>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>Aberto</td>
                                                <td>2011-06-25</td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>Fechado</td>
                                                <td>2011-02-12</td>
                                            </tr>
                                            <tr>
                                                <td>Falta de Estoque</td>
                                                <td>Aberto</td>
                                                <td>2012-07-05</td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>Fechado</td>
                                                <td>2010-09-17</td>
                                            </tr>
                                            <tr>
                                                <td>Produto Vencido</td>
                                                <td>Aberto</td>
                                                <td>2011-02-12</td>
                                            </tr>
                                        <td>Produto Vencido</td>
                                        <td>Fechado</td>
                                        <td>2011-02-12</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Fechado</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Motivo X</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Motivo Y</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        <tr>
                                            <td>Falta de Estoque</td>
                                            <td>Aberto</td>
                                            <td>2012-07-05</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div
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
