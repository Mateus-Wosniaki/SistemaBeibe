<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8" />
        <title>
            Resumo
        </title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    </head>

    <body class="">
        <div class="wrapper ">
            <%@ include file="../WEB-INF/jspf/menuGerente.jspf"%>
            <div class="main-panel">
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
                <div class="content">
                    <h5>${form == 'alterar' ? 'Editar': 'Cadastrar'} Colaborador</h5>
                    <c:url var="urlPost" value="/GerenteServlet" context="${pageContext.request.contextPath}" >
                        <c:param name="action" value="${form == 'alterar' ? 'editar' : 'cadastrar'}" />
                    </c:url>
                    <form method="POST" action="${urlPost}">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Função</label>
                                                    <div class="dropdown bootstrap-select dropup">
                                                        <select name="funcao" id="funcao" class="form-control">
                                                            <c:forEach var="funcao" items="${requestScope.funcoes}">
                                                                <option value="${funcao.funcaoId}">${funcao.descricao}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <input type="hidden" name="id" value="${usuario.usuarioId}">
                                    <div class="col-md-7 pr-1">
                                        <div class="form-group">
                                            <label for="nome">Nome Completo</label>
                                            <input
                                                id="nome"
                                                name="nome"
                                                type="text" 
                                                class="form-control pl-1"
                                                value="${form == 'alterar' ? usuario.nomeCompleto : ''}"
                                                >
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="nome">Senha</label>
                                            <input
                                                id="senha"
                                                name="senha"
                                                required
                                                type="password" 
                                                class="form-control"
                                                value="${form == 'alterar' ? usuario.senha : ''}"
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
                                                ${form == 'alterar' ? 'disabled' : ''}
                                                type="text" 
                                                class="form-control cpf" 
                                                value="${form == 'alterar' ? usuario.cpf : ''}"
                                                >
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input 
                                                type="email" 
                                                ${form == 'alterar' ? 'disabled' : ''}
                                                name="email"
                                                class="form-control" 
                                                value="${form == 'alterar' ? usuario.email : ''}"
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
                                                value="${form == 'alterar' ? usuario.telefone : ''}"
                                                >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <input type="hidden" name="estadoId" value="${usuario.endereco.enderecoId}">
                                    <div class="col-md-4 pr-1">
                                        <div class="form-group">
                                            <label>Estado</label>
                                            <div class="dropdown bootstrap-select dropup">
                                                <select name="estado" id="estado" class="form-control">
                                                    <c:forEach var="estado" items="${requestScope.estados}">
                                                        <option value="${estado.estadoId}">${estado.descricao}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label for="cidade">Cidade</label>
                                            <div class="dropdown bootstrap-select dropup">
                                                <select name="cidade" id="cidade" class="form-control">
                                                    <option selected value="">
                                                        Selecione o estado...
                                                    </option>
                                                </select>
                                            </div>
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
                                                class="form-control cep" 
                                                value="${form == 'alterar' ? usuario.endereco.cep : ''}"
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
                                                value="${form == 'alterar' ? usuario.endereco.rua : ''}"
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
                                                value="${form == 'alterar' ? usuario.endereco.numero : ''}"
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
                                                value="${form == 'alterar' ? usuario.endereco.complemento : ''}"
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
                                                value="${form == 'alterar' ? usuario.endereco.bairro : ''}"
                                                >
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="update ml-auto mr-auto">
                                        <button type="submit" class="btn btn-primary btn-round">${form == 'alterar' ? 'Atualizar' : 'Incluir'} usuário</button>
                                        <c:url var="voltarURL" value="/GerenteServlet" context="${pageContext.request.contextPath}" >
                                            <c:param name="action" value="listarColaboradores" />
                                        </c:url>
                                        <a href="${voltarURL}" class="btn btn-warning btn-round">Cancelar</a>
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
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
            <script src="./assets/js/createUser.js"></script>
            <script>
                $(".telefone").mask("(00) 00000-0009");
                $(".cep").mask("00.000-000");
                $(".cpf").mask("999.999.999-99");
            </script>
    </body>

</html>
