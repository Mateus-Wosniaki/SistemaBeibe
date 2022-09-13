<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            BEIBE - Editar Usuario
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
        <!-- Arquivo JS da página -->
        <script src="./assets/js/createUser.js"></script>
    </head>
    <body>
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
                                    <h5 class="card-title">Editar Usuario</h5>
                                </div>
                                <div class="card-body">
                                    <c:url var="atualizarURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="update" />
                                    </c:url>
                                    <form method="POST" action="${atualizarURL}">
                                        <div class="row">
                                            <div class="col-md pr-1">
                                                <div class="form-group">
                                                    <label for="nome">Nome</label>
                                                    <input
                                                        id="nome"
                                                        name="nome"
                                                        type="text" 
                                                        class="form-control pl-1"
                                                        value="${usuario.nomeCompleto}" 
                                                    >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label for="cpf">CPF</label>
                                                    <input 
                                                        id="cpf" 
                                                        name="cpf" 
                                                        readonly 
                                                        type="text" 
                                                        class="form-control cpf" 
                                                        value="${usuario.cpf}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input 
                                                        type="email" 
                                                        readonly 
                                                        class="form-control" 
                                                        value="${usuario.email}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label for="telefone">Telefone</label>
                                                    <input 
                                                        id="telefone" 
                                                        name="telefone" 
                                                        type="text" 
                                                        class="form-control telefone" 
                                                        value="${usuario.telefone}"
                                                        >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-1 pr-1">
                                                <div class="form-group">
                                                    <label>Estado</label>
                                                    <select name="estado" id="estado" class="form-control">
                                                        <option selected>
                                                            Selecione...
                                                        </option>
                                                        <c:forEach var="estado" items="${requestScope.estados}">
                                                            <option value="${estado.estadoId}">${estado.descricao}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label for="cidade">Cidade</label>
                                                    <select name="cidade" id="cidade" class="form-control">
                                                        <option selected value="">
                                                            Selecione o estado...
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2 pr-1">
                                                <div class="form-group">
                                                    <label for="cep">CEP</label>
                                                    <input 
                                                        id="cep" 
                                                        name="cep" 
                                                        type="text" 
                                                        class="form-control" 
                                                        value="${usuario.endereco.cep}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md-2 pl-1">
                                                <div class="form-group">
                                                    <label for="logradouro">Logradouro</label>
                                                    <input 
                                                        id="logradouro" 
                                                        name="logradouro" 
                                                        type="text" 
                                                        class="form-control" 
                                                        value="${usuario.endereco.rua}" 
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md-1 pl-1">
                                                <div class="form-group">
                                                    <label for="numero">Número</label>
                                                    <input 
                                                        id="numero" 
                                                        name="numero" 
                                                        type="text" 
                                                        class="form-control" 
                                                        value="${usuario.endereco.numero}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label for="complemento">Complemento</label>
                                                    <input 
                                                        id="complemento" 
                                                        name="complemento" 
                                                        type="text" 
                                                        class="form-control" 
                                                        value="${usuario.endereco.complemento}"
                                                        >
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label for="bairro">Bairro</label>
                                                    <input 
                                                        id="bairro"
                                                        name="bairro"
                                                        type="text"
                                                        class="form-control" 
                                                        value="${usuario.endereco.bairro}"
                                                        >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="update ml-auto mr-auto">
                                                <button type="submit" class="btn btn-primary btn-round">Atualizar perfil</button>
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
        <!-- masks -->
        <script>
            $(".telefone").mask("(00) 0000-00009");
            $(".cep").mask("00.000-000");
            $(".cpf").mask("999.999.999-99");
        </script>
        <!-- Endmasks -->
    </body>
</html>