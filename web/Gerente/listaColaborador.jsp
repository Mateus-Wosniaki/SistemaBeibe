<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
    <c:when test="${empty sessionScope.login}">
        <c:set var="mensagem" value="Usuário deve se autenticar para acessar o sistema" scope="request"/>
        <jsp:forward page="/Autenticacao/login.jsp" />
    </c:when>
    <c:when test="${sessionScope.login.funcao.funcaoId != 3}">
        <c:set var="mensagem" value="Você não possui autorização necessária para acessar o conteúdo da página" scope="request"/>
        <jsp:forward page="/Autenticacao/login.jsp" />
    </c:when>
</c:choose>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>
            Colaboradores
        </title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    </head>

    <body class="">
        <div class="wrapper">
            <%@ include file="../WEB-INF/jspf/menuGerente.jspf"%>
            <div class="main-panel">
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Colaboradores</h4>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <thead class=" text-primary">
                                        <th>
                                            Nome
                                        </th>
                                        <th>
                                            E-mail
                                        </th>
                                        <th>
                                            Telefone
                                        </th>
                                        <th>
                                            Cargo
                                        </th>
                                        <th class="text-right">
                                            Ações
                                        </th>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${colaboradores}" var="colaborador">
                                                <tr>
                                                    <td><c:out value="${colaborador.nomeCompleto}" /></td>
                                                    <td><c:out value="${colaborador.email}" /></td>
                                                    <td class="telefone"><c:out value="${colaborador.telefone}" /></td>
                                                    <td><c:out value="${colaborador.funcao.descricao}" /></td>
                                                    <c:choose>
                                                        <c:when test="${session.login.usuarioId == colaborador.usuarioId}">
                                                            <td> N/A </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="text-right">
                                                                <div class="update ml-auto mr-auto">
                                                                    <a href="GerenteServlet?action=formExibir&id=${colaborador.usuarioId}" class="m-2"><i class="fa fa-eye"></i></a>
                                                                    <a href="GerenteServlet?action=formEditar&id=${colaborador.usuarioId}" class="m-2"><i class="fa fa-pencil"></i></a>
                                                                    <button data-id="${colaborador.usuarioId}" class="modalExcluir btn btn-danger btn-icon btn-sm" data-toggle="modal" data-target="#deletar"><i class="fa fa-times"></i></button>
                                                                </div>
                                                            </td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col text-center">
                        <a href="GerenteServlet?action=formCadastrar" class="btn btn-primary btn-round">Cadastrar</a>
                    </div> 
                </div>
            </div>
        </div>


        <div class="modal fade" id="deletar" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <c:url var="formURL" value="/GerenteServlet" context="${pageContext.request.contextPath}">
                    <c:param name="action" value="excluir" />
                </c:url>
                <form action="${formURL}" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Excluir Colaborador</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Você tem certeza que deseja excluir o colaborador?
                            <input type="hidden" name="id" id="colaboradorId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="submit" class="btn btn-danger">Excluir</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="./assets/js/core/jquery.min.js"></script>
        <script src="./assets/js/core/popper.min.js"></script>
        <script src="./assets/js/core/bootstrap.min.js"></script>
        <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="./assets/js/plugins/chartjs.min.js"></script>
        <script src="./assets/js/plugins/bootstrap-notify.js"></script>
        <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <script>
            $(document).on("click", ".modalExcluir", function () {
                var colaboradorId = $(this).data('id');
                $(".modal-body #colaboradorId").val(colaboradorId);
            });

            $(".telefone").mask("(00) 00000-0009");
        </script>
    </body>
</html>