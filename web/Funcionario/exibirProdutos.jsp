<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibir Produtos</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="wrapper ">
            <%@ include file="../WEB-INF/jspf/menuFuncionario.jspf"%>
            <div class="main-panel">
                <!-- Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>     
                <!-- End Navbar -->
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <c:url var="novoProdutoURL" value="/ProdutoServlet" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="formIncluir" />
                                    </c:url>
                                    <a href="${novoProdutoURL}" class="btn btn-primary">
                                        <i class="fa fa-plus"></i>
                                        Novo Produto
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
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
                                            <c:forEach items="${requestScope.produtos}" var="p">
                                            <tr>
                                                <c:url var="editarURL" value="/ProdutoServlet" context="${pageContext.request.contextPath}" >
                                                        <c:param name="action" value="formEditar" />
                                                        <c:param name="id" value="${p.produtoId}" />
                                                    </c:url>
                                                <td><a href="${editarURL}">${p.nome}</a></td>
                                                <td>${p.categoria.descricao}</td>
                                                <td>${p.peso}g</td>
                                                <td>${p.descricao}</td>
                                                <td class="text-right">
                                                    <a href="${editarURL}" class="btn btn-warning btn-link btn-icon btn-m edit">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                    <c:url var="removerURL" value="/ProdutoServlet" context="${pageContext.request.contextPath}" >
                                                        <c:param name="action" value="deletar" />
                                                        <c:param name="id" value="${p.produtoId}" />
                                                    </c:url>
                                                    <a href="${removerURL}"
                                                       onclick="return confirm('Você realmente deseja remover esse produto?');"
                                                       class="btn btn-danger btn-link btn-icon btn-m remove"
                                                    >
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

