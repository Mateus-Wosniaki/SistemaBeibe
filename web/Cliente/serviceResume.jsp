<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<<c:choose>
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
<html lang="pt-BR">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="">
        <title>
            BEIBE - Resumo do Atendimento
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!-- Fonts and icons -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    </head>
    <body class="">
        <div class="wrapper ">
            <%@ include file="../WEB-INF/jspf/menuCliente.jspf"%>
            <div class="main-panel">
                <!-- Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
                <!-- End Navbar -->
                <div class="content">
                    <h5>Resumo do Atendimento ${atendimento.atendimentoId}</h5>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <c:url var="excluirAtendimento" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="excluirAtendimento" />
                                        <c:param name="idAtendimento" value="${atendimento.atendimentoId}" />
                                    </c:url>
                                    <form method="POST" action="${excluirAtendimento}">
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label>Data de Criação</label>
                                                    <fmt:formatDate value="${atendimento.dataCriacao}" var="dataCriacao" pattern="dd/MM/yyyy" />
                                                    <input 
                                                        disabled 
                                                        type="text" 
                                                        class="form-control" 
                                                        value="${dataCriacao}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label>Data de Solução</label>
                                                    <fmt:formatDate value="${atendimento.dataFinalizado}" var="dataFinalizado" pattern="dd/MM/yyyy" />
                                                    <input 
                                                        disabled 
                                                        type="text" 
                                                        class="form-control" 
                                                        value="${dataFinalizado}"
                                                        >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8 pr-1">
                                                <div class="form-group">
                                                    <label>Cliente</label>
                                                    <input 
                                                        type="text" 
                                                        class="form-control" 
                                                        disabled
                                                        value="${atendimento.cliente.nomeCompleto}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md-4 pl-1">
                                                <div class="form-group">
                                                    <label>Situação</label>
                                                    <input 
                                                        type="text" 
                                                        class="form-control" 
                                                        disabled 
                                                        value="${atendimento.situacao.descricao}"
                                                        >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Produto</label>
                                                    <input 
                                                        type="text" 
                                                        class="form-control" 
                                                        disabled 
                                                        value="${atendimento.produto.nome}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Tipo Atendimento</label>
                                                    <input 
                                                        type="text" 
                                                        class="form-control" 
                                                        disabled 
                                                        value="${atendimento.tipoAtendimento.descricao}"
                                                        >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Descrição</label>
                                                    <textarea class="form-control textarea" disabled>
                                                        ${atendimento.descricao}
                                                    </textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Solução</label>
                                                    <textarea 
                                                        class="form-control textarea" 
                                                        name="solucao" 
                                                        disabled
                                                        >
                                                        ${atendimento.justificativa}
                                                    </textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="ml-auto mr-auto">
                                                <button type="submit" class="btn btn-danger btn-round">Excluir</button>
                                                <c:url var="voltarURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                                    <c:param name="action" value="index" />
                                                </c:url>
                                                <a href="${voltarURL}" class="btn btn-link btn-round">Voltar</a>
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
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
    </body>
</html>
