<%-- 
    Document   : index
    Created on : 17 de jul. de 2022, 16:15:43
    Author     : Gabriel Jesus Peres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAC - Listagem de Atendimentos</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!--   Core JS Files   -->
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="./assets/js/plugins/chartjs.min.js"></script>
        <script src="./assets/js/plugins/bootstrap-notify.js"></script>
        <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
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
                                <div class="card-header d-flex d-inline align-items-center">
                                    <div class="icon-big text-center">
                                        <h4 class="my-1"><i class="nc-icon nc-support-17 text-danger mx-4"></i></h4>
                                    </div>
                                    <h5 class="card-title">
                                        Listagem de Atendimentos
                                    </h5>
                                </div>
                                <div class="card-body ">
                                    <table id="tabela" class="display table table-striped table-bordered" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Atendimento</th>
                                                <th>Data Criação</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${atendimentos}" var="atendimento" >
                                                <c:url var="view" value="/FuncionarioServlet" context="${pageContext.request.contextPath}" >
                                                    <c:param name="action" value="viewAtendimento" />
                                                    <c:param name="id" value="${atendimento.atendimentoId}" />
                                                </c:url>
                                                <c:choose>
                                                    <c:when test="${empty mostrarAbertoEmAmarelo}">
                                                        <tr>
                                                    </c:when>
                                                    <c:when test="${atendimento.situacao.situacaoId == 1 && true}">
                                                        <tr class="text-danger">
                                                    </c:when>
                                                    <c:when test="${atendimento.situacao.situacaoId == 1}">
                                                        <tr class="text-warning">
                                                    </c:when>
                                                </c:choose>
                                                    <td>
                                                        <c:if test="${atendimento.situacao.situacaoId == 1}" >
                                                            <a href="${view}">
                                                            </c:if>
                                                            ${atendimento.cliente.nomeCompleto}
                                                            <c:if test="${atendimento.situacao.situacaoId == 1}" >
                                                            </a>
                                                        </c:if>
                                                    </td>
                                                    <fmt:formatDate var="dataCriacao" value="${atendimento.dataCriacao}" pattern="dd/MM/yyyy" />
                                                    <!-- TODO: Incluir validação para COR da data -->
                                                    <td>${dataCriacao}</td>
                                                    <td>
                                                        <c:if test="${atendimento.situacao.situacaoId == 1}" >
                                                            <a href="${view}" class="btn btn-warning edit">
                                                                Resolver
                                                            </a>
                                                        </c:if>
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
    </body>
</html>
