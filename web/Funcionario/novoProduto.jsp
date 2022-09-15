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
        <title>
            Produto
        </title>
        <!-- Fonts and icons -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    </head>
    <body>
        <div class="wrapper ">
            <%@ include file="../WEB-INF/jspf/menuFuncionario.jspf"%>
            <div class="main-panel">
                <!-- Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>     
                <!-- End Navbar -->
                <div class="content">
                    <h5>Cadastrar Produto</h5>
                    <c:url var="submitURL" value="/ProdutoServlet" context="${pageContext.request.contextPath}" >
                        <c:choose>
                            <c:when test="${empty produto}">
                                <c:param name="action" value="incluir" />
                            </c:when>
                            <c:otherwise>
                                <c:param name="action" value="atualizar" />
                                <c:param name="id" value="${produto.produtoId}" />
                            </c:otherwise>
                        </c:choose>
                    </c:url>
                    <form method="POST" action="${submitURL}">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label for="nome">Nome do Produto</label>
                                                    <input id="nome" type="text" class="form-control" name="nome" value="${produto.nome}">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="categoria">Categoria</label>
                                                    <select name="categoria" id="categoria" class="form-control">
                                                        <option>Selecione uma categoria</option>
                                                        <c:forEach var="categoria" items="${requestScope.categorias}">
                                                            <option 
                                                                value="${categoria.categoriaId}"
                                                                <c:if test="${produto.categoria.categoriaId == categoria.categoriaId}">
                                                                    selected
                                                                </c:if>
                                                            >
                                                                ${categoria.descricao}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-9">
                                                <div class="form-group">
                                                    <label for="descricao">Descrição</label>
                                                    <input id="descricao" type="text" class="form-control" name="descricao" value="${produto.descricao}">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="peso">Peso</label>
                                                    <input id="peso" type="number" class="form-control" name="peso" value="${produto.peso}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="update ml-auto mr-auto">
                                                <button type="submit" class="btn btn-success btn-round">
                                                    <c:choose>
                                                        <c:when test="${empty produto}">
                                                            Cadastrar
                                                        </c:when>
                                                        <c:otherwise>
                                                            Atualizar
                                                        </c:otherwise>
                                                    </c:choose>
                                                </button>
                                                <c:url var="voltarURL" value="/ProdutoServlet" context="${pageContext.request.contextPath}" >
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
        </div>
        <!--   Core JS Files   -->
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
    </body>
</html>
