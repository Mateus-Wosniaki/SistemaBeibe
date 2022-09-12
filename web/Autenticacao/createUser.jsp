<%-- 
    Document   : createUser
    Created on : Sep 9, 2022, 22:06:27 PM
    Author     : Gabriel Jesus Peres
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAC - Autocadastro</title>

        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="./assets/css/login.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <!-- Importações de jQuery e etc -->
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="./assets/js/plugins/chartjs.min.js"></script>
        <script src="./assets/js/plugins/bootstrap-notify.js"></script>
        <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <!-- Arquivo JS da página -->
        <script src="./assets/js/createUser.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">BEIBE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <c:url var="loginURL" value="/AutenticacaoServlet" context="${pageContext.request.contextPath}" >
                        <c:param name="action" value="index" />
                    </c:url>
                    <a class="nav-link" href="${loginURL}">VOLTAR</a>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container">
                <div class="col-lg-12 ml-auto mr-auto">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Cadastrar Usuário</h5>
                        </div>
                        <div class="card-body">
                            <c:url var="formURL" value="/ClienteServlet" context="${pageContext.request.contextPath}" >
                                <c:param name="action" value="cadastro" />
                            </c:url>
                            <form method="POST" action="${formURL}">
                                <div class="row">
                                    <div class="col-md pr-1">
                                        <div class="form-group">
                                            <label>Nome</label>
                                            <input id="nome" name="nome" type="text" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Senha</label>
                                            <input id="senha" name="senha" type="password" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 pr-1">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">CPF</label>
                                            <input id="CPF" name="CPF" type="text" class="form-control cpf" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input id="email" name="email" type="email" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Telefone</label>
                                            <input id="telefone" name="telefone" type="text" class="form-control telefone" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-1 pr-1">
                                        <div class="form-group">
                                            <label>Estado</label>
                                            <select name="estado" id="estado" class="form-select">
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
                                            <select name="cidade" id="cidade" class="form-select">
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
                                            <label>CEP</label>
                                            <input id="CEP" name="CEP" type="text" class="form-control cep" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-2 pl-1">
                                        <div class="form-group">
                                            <label>Logradouro</label>
                                            <input id="logradouro" name="logradouro" type="text" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-1 pl-1">
                                        <div class="form-group">
                                            <label>Número</label>
                                            <input id="numero" name="numero" type="number" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Complemento</label>
                                            <input id="complemento" name="complemento" type="text" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Bairro</label>
                                            <input id="bairro" name="bairro" type="text" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="update ml-auto mr-auto">
                                        <button type="submit" class="btn btn-primary btn-round">Cadastrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- masks -->
    <script>
        $(".telefone").mask("(00) 00000-0009");
        $(".cep").mask("00.000-000");
        $(".cpf").mask("999.999.999-99");
    </script>
</body>
</html>
