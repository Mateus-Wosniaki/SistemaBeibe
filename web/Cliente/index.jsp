<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
    <c:when test="${empty sessionScope.login}">
        <c:set var="mensagem" value="Usuário deve se autenticar para acessar o sistema" scope="request"/>
        <jsp:forward page="/AutenticacaoServlet?action=index" />
    </c:when>
    <c:when test="${sessionScope.login.funcao.funcaoId != 1}">
        <c:set var="mensagem" value="Você não possui autorização necessária para acessar o conteúdo da página" scope="request"/>
        <jsp:forward page="/AutenticacaoServlet?action=index" />
    </c:when>
</c:choose>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="">
        <title>
            BEIBE - Início
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!-- Fonts and icons -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-body">
                                    <c:url var="newServiceURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="formAtendimento" />
                                    </c:url>
                                    <a href="${newServiceURL}" class="btn btn-primary">
                                        <i class="fa fa-plus"></i>
                                        Novo atendimento
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card ">
                                <div class="card-header d-flex d-inline align-items-center">
                                    <h5 class="card-title">
                                        Listagem de Atendimentos
                                    </h5>
                                </div>
                                <div class="card-body ">
                                    <table id="tabela" class="display table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Tipo Atendimento</th>
                                                <th>Produto</th>
                                                <th>Status</th>
                                                <th>Data</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="atendimento" items="${atendimentos}">
                                                <tr>
                                                    <td>${atendimento.tipoAtendimento.descricao}</td>
                                                    <td>${atendimento.produto.nome}</td>
                                                    <td>${atendimento.situacao.descricao}</td>
                                                    <fmt:formatDate var="dataCriacao" value="${atendimento.dataCriacao}" pattern="dd/MM/yyyy HH:mm:ss" />
                                                    <td>${dataCriacao}</td>
                                                    <td class="text-center">
                                                        <c:url var="viewURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                                            <c:param name="action" value="atendimento" />
                                                            <c:param name="atendimento" value="${atendimento.atendimentoId}" />
                                                        </c:url>
                                                        <a href="${viewURL}"><i class="fa fa-eye"></i></a>
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
        </div
        <!--   Core JS Files   -->
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    </body>
</html>
