<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatórios</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">

    </head>

    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <div class="logo">
                    <a href="#" class="simple-text logo-normal">
                        GERENTE 
                    </a>
                </div>
                <div class="sidebar-wrapper" style="padding-right: 2px;">
                    <ul class="nav">
                        <li>
                            <a href="index.jsp">
                                <i class="nc-icon nc-shop"></i>
                                <p>Início</p>
                            </a>
                        </li>
                        <li>
                            <a href="detalheGerente.jsp">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
                            </a>
                        </li>
                        <li>
                            <a href="listaColaborador.jsp">
                                <i class="nc-icon nc-circle-10"></i>
                                <p>Colaboradores</p>
                            </a>
                        </li>
                        <li>
                            <a href="atendimentoAberto.jsp">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Atendimentos Abertos</p>
                            </a>
                        </li>
                        <li>
                            <a href="todosAtendimentos.jsp">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Todos Atendimentos</p>
                            </a>
                        </li>
                        <li class="active">
                            <a href="relatorios.jsp">
                                <i class="nc-icon nc-paper"></i>
                                <p>Relatórios</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <div class="navbar-toggle">
                                <button type="button" class="navbar-toggler">
                                    <span class="navbar-toggler-bar bar1"></span>
                                    <span class="navbar-toggler-bar bar2"></span>
                                    <span class="navbar-toggler-bar bar3"></span>
                                </button>
                            </div>
                            <a class="navbar-brand" href="javascript:;">SAC - Sistema de Atendimento ao Cliente</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link btn-rotate" href="javascript:;">
                                        <i class="nc-icon nc-button-power"></i>
                                        <p>
                                            <span class="d-lg-none d-md-block">Sair</span>
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatorio de Funcionarios</h4>
                                </div>  
                                <c:url var="relFuncionario" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >

                                    <c:param name="action" value="funcRelatorio" />

                                </c:url>

                                <div class="card-body">  
                                    <span class="icon-input-btn"  id="basic-addon2" >
                                        <i class="fa fa-download "></i> 
                                        <a href="${relFuncionario}" class="btn btn-primary btn-round" role="button"></i>Gerar</a>
                                    </span>


                                </div>

                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatorio de Produtos Mais Reclamados</h4>
                                </div>  
                                <div class="card-body">  
                                    <c:url var="relMaisReclamados" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="relReclamados" />

                                    </c:url>
                                    <span class="icon-input-btn"  id="basic-addon2" >
                                        <i class="fa fa-download "></i> 
                                        <a href="${relMaisReclamados}" class="btn btn-primary btn-round" role="button"></i>Gerar</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="card">

                                <div class="card-header">
                                    <h4 class="card-title">Relatorio de Atendimentos em Aberto por Data</h4>
                                </div>  
                                <div class="card-body">  
                                    <c:url var="relAtendimento" value="/GeradorRelatorio" context="${pageContext.request.contextPath}" >
                                        <c:param name="action" value="atendimentoRel" />

                                    </c:url>
                                    <form action="${relAtendimento}" method="POST">
                                        <label for="startDate">Data Início</label>
                                        <input  id="demo" name="startDate" class="form-control grid css col-6" type="date"  />

                                        <label for="finishDate">Data Fim</label>
                                        <input   name="finishDate" name="finishDate" class="form-control grid css col-6" type="date" />  


                                        <span class="icon-input-btn"  id="basic-addon2" >
                                            <i class="fa fa-download"></i> 
                                            <input type="submit" id="submit" value="Gerar"  class="btn btn-primary btn-round" aria-describedby="basic-addon2">
                                        </span>





                                </div>

                                </form>

                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Relatorio de Reclamações</h4>
                                </div>  
                                <div class="card-body">  
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
                                            <i class="fa fa-download"></i> 
                                            <input type="submit" id="submit" value="Gerar"  class="btn btn-primary btn-round" aria-describedby="basic-addon2">
                                        </span>
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