<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="">
        <title>
            Categoria
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
            <%@ include file="../WEB-INF/jspf/menuFuncionario.jspf"%>
            <div class="main-panel">
                <!-- Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>     
                <!-- End Navbar -->
                <div class="content">
                    <h5>Cadastrar Categoria</h5>
                    <c:url var="submitURL" value="/CategoriaServlet" context="${pageContext.request.contextPath}" >
                        <c:choose>
                            <c:when test="${empty categoria}">
                                <c:param name="action" value="cadastrarCategoria" />
                            </c:when>
                            <c:otherwise>
                                <c:param name="action" value="atualizarCategoria" />
                                <c:param name="id" value="${categoria.categoriaId}" />
                            </c:otherwise>
                        </c:choose>
                    </c:url>
                    <form method="POST" action="${submitURL}">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="descricao">Nome da Categoria</label>
                                                    <input 
                                                        id="descricao" 
                                                        name="descricao" 
                                                        type="text" 
                                                        class="form-control" 
                                                        placeholder="Categoria"
                                                        value="${categoria.descricao}"
                                                        >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="update ml-auto mr-auto">
                                                <button type="submit" class="btn btn-success btn-round">
                                                    <c:choose>
                                                        <c:when test="${empty categoria}">
                                                            Cadastrar
                                                        </c:when>
                                                        <c:otherwise>
                                                            Atualizar
                                                        </c:otherwise>
                                                    </c:choose>
                                                </button>
                                                <c:url var="voltarURL" value="/CategoriaServlet" context="${pageContext.request.contextPath}" >
                                                    <c:param name="action" value="index" />
                                                </c:url>
                                                <a href="${voltarURL}" class="btn btn-warning btn-round">Voltar</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--   Core JS Files   -->
            <script src="./assets/js/core/jquery.min.js"></script>
            <script src="./assets/js/core/popper.min.js"></script>
            <script src="./assets/js/core/bootstrap.min.js"></script>
            <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    </body>
</html>
