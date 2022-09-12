<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                                    <td><c:out value="${colaborador.telefone}" /></td>
                                                    <td><c:out value="${colaborador.funcao.descricao}" /></td>
                                                    <td class="text-right">
                                                        <div class="update ml-auto mr-auto">
                                                            <a href="GerenteServlet?action=formExibir&id=${colaborador.usuarioId}" class="m-2"><i class="fa fa-eye"></i></a>
                                                            <a href="GerenteServlet?action=formEditar&id=${colaborador.usuarioId}" class="m-2"><i class="fa fa-pencil"></i></a>
                                                            <button data-id="${colaborador.usuarioId}" class="modalExcluir btn btn-danger btn-icon btn-sm" data-toggle="modal" data-target="#deletar"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </td>
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
                <form action="${formUrl}" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Excluir Colaborador</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Você tem certeza que deseja excluir o colaborador?
                            <input type="hidden" id="colaboradorId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            <button type="button" class="btn btn-danger">Excluir</button>
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
        <script>
            $(document).on("click", ".modalExcluir", function () {
                var colaboradorId = $(this).data('id');
                $(".modal-body #colaboradorId").val(colaboradorId);
            });
        </script>
    </body>
</html>