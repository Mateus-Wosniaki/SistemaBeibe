<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<html lang="pt-BR">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            BEIBE - Criar Atendimento
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
        <!--   Core JS Files   -->
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
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
                            <div class="card card-user">
                                <div class="card-header">
                                    <h5 class="card-title">Criar atendimento</h5>
                                </div>
                                <div class="card-body">
                                    <c:url var="formURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="novoAtendimento" />
                                    </c:url>
                                    <form method="POST" action="${formURL}">
                                        <div class="row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <label for="nomeCliente">Cliente</label>
                                                    <input 
                                                        id="nomeCliente" 
                                                        name="nomeCliente" 
                                                        readonly 
                                                        type="text" 
                                                        class="form-control pr-1 pl-1" 
                                                        placeholder="${sessionScope.login.nomeCompleto}" 
                                                        value="${sessionScope.login.nomeCompleto}"
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label for="situacao">Situação</label>
                                                    <input 
                                                        name="situacao"
                                                        id="situacao"
                                                        readonly type="text" 
                                                        class="form-control" 
                                                        placeholder="Aberto"
                                                    >
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label for="produto">Produto</label>
                                                    <select name="produto" id="produto" class="form-select">
                                                        <option selected>
                                                            Selecione o produto...
                                                        </option>
                                                        <c:forEach items="${produtos}" var="produto">
                                                            <option value="${produto.produtoId}">
                                                                ${produto.descricao}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label for="tipo">Tipo</label>
                                                    <select name="tipo" id="tipo" class="form-select">
                                                        <option selected>
                                                            Selecione o tipo...
                                                        </option>
                                                        <c:forEach items="${tiposAtendimento}" var="tipoAtendimento">
                                                            <option value="${tipoAtendimento.tipoAtendimentoId}">
                                                                ${tipoAtendimento.descricao}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="descricao">Descrição</label>
                                                    <textarea 
                                                        name="descricao"
                                                        id="descricao"
                                                        class="form-control textarea" 
                                                        placeholder="Detalhe seu atendimento" 
                                                    ></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="update ml-auto mr-auto">
                                                <button type="submit" class="btn btn-primary btn-round">Criar Atendimento</button>
                                                <c:url var="voltarURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                                    <c:param name="action" value="index" />
                                                </c:url>
                                                <a href="${voltarURL}" class="btn btn-warning btn-round">Cancelar</a>
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
    </body>
</html>