<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatórios</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="../WEB-INF/jspf/menuGerente.jspf"%>
            <div class="main-panel">
                <!-- Start Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>
                <!-- End Navbar -->
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatório dos Funcionários</h4>
                                </div>
                                <div class="card-body">
                                    <span class="icon-input-btn" id="basic-addon2">
                                        <c:url var="relFuncionario" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >
                                            <c:param name="action" value="funcRelatorio" />
                                        </c:url>
                                        <a href="${relFuncionario}" class="btn btn-primary btn-round" role="button">
                                            <i class="fa fa-download "></i>
                                            Gerar
                                        </a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatório de Produtos mais Reclamados</h4>
                                </div>  
                                <div class="card-body">  
                                    <span class="icon-input-btn" id="basic-addon2" >
                                        <c:url var="relMaisReclamados" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >
                                            <c:param name="action" value="relReclamados" />
                                        </c:url>
                                        <a href="${relMaisReclamados}" class="btn btn-primary btn-round" role="button">
                                            <i class="fa fa-download "></i> 
                                            Gerar
                                        </a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatório de Atendimentos em Aberto, por data</h4>
                                </div>  
                                <div class="card-body">  
                                    <c:url var="relAtendimento" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="atendimentoRel" />
                                    </c:url>
                                    <form id="validarDatas" action="${relAtendimento}" method="POST">
                                        <p>Escolha abaixo o período em que deseja visualizar as informações</p>
                                        <div id="errormsg" style="display: none;" class="alert alert-warning" role="alert"></div>
                                        <label for="startDate">
                                            Data Início
                                        </label>
                                        <input id="startDate" name="startDate" class="form-control grid css col-2" type="date" />
                                        <label for="finishDate">
                                            Data Fim
                                        </label>
                                        <input id="finishDate" name="finishDate" name="finishDate" class="form-control grid css col-2" type="date" />  
                                        <span class="icon-input-btn"  id="basic-addon2" >
                                            <input type="hidden" id="submit" name="submit" value="Gerar" class="btn btn-primary btn-round" aria-describedby="basic-addon2">
                                            <button type="submit" class="btn btn-primary btn-round">
                                                <i class="fa fa-download "></i> 
                                                Gerar
                                            </button>
                                            </a>
                                        </span>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatório de Reclamações</h4>
                                </div>  
                                <div class="card-body">  
                                    <p>Escolha abaixo o estado das reclamações para gerar o relatório</p>
                                    <c:url var="relReclamacoes" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="relTodasReclamacoes" />
                                    </c:url>
                                    <form action="${relReclamacoes}" method="POST">
                                        <select name="select" class="form-control grid css col-6">
                                            <option value="todos">Todos</option>
                                            <option value="abertos" selected>Abertos</option>
                                            <option value="finalizados">Finalizados</option>
                                        </select>
                                        <span class="icon-input-btn"  id="basic-addon2" >
                                            <input type="hidden" id="submit" name="submit" value="Gerar" class="btn btn-primary btn-round" aria-describedby="basic-addon2">
                                            <button type="submit" class="btn btn-primary btn-round">
                                                <i class="fa fa-download "></i> 
                                                Gerar
                                            </button>
                                        </span>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const form = document.getElementById("validarDatas");

            form.addEventListener("submit", (evt) => {
                const startDateField = document.getElementById("startDate").value.length;
                const finishDateField = document.getElementById("finishDate").value.length;
                const errorP = document.getElementById("errormsg");
                const mensagem = "As datas precisam ser preenchidas!";

                if (startDateField === 0 || finishDateField === 0) {
                    evt.preventDefault();
                    errorP.innerText = mensagem;
                    errorP.style.display = "";
                }
            });
        </script>
    </body>
</html>