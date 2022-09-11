<%-- 
    Document   : index
    Created on : Jul 10, 2022, 6:23:21 PM
    Author     : Gabriel Jesus Peres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início | SAC - Beibe</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="../WEB-INF/jspf/menuGerente.jspf"%>
            <div class="main-panel">
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
                <div class="content">
                    <div class="row">
                        <div class="col-md-6">
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
                                                <p class="card-category">Total de atendimentos resolvidos</p>
                                                <p class="card-title">${totalResolvidos}<p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        Quantidade de atendimentos resolvidos até o momento
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
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
                                                <p class="card-category">Atendimentos em aberto</p>
                                                <p class="card-title">${atendimentosAbertosPorTotal.getKey()} (${atendimentosAbertosPorTotal.getValue()}%)</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer ">
                                    <hr>
                                    <div class="stats">
                                        Quantidade de atendimentos em aberto e relação com o total
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
                                            <c:forEach items="${totalPorCategoria}" var="categoria">
                                                <tr>
                                                    <td><c:out value="${categoria.getKey().descricao}" /></td>
                                                    <td><c:out value="${categoria.getValue()}" /></td>
                                                </tr>
                                            </c:forEach>
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
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="./assets/js/plugins/chartjs.min.js"></script>
        <script src="./assets/js/plugins/bootstrap-notify.js"></script>
        <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
    </body>
</html>
