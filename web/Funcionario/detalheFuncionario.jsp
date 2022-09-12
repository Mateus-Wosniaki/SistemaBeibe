<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes Funcionario</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="./assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body class="">
        <div class="wrapper ">
            <%@ include file="../WEB-INF/jspf/menuFuncionario.jspf"%>
            <div class="main-panel">
                <!-- Navbar -->
                <%@ include file="../WEB-INF/jspf/navbar.jspf"%>     
                <!-- End Navbar -->
                <div class="content">
                    <h5>Dados Pessoais</h5>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="card-body">
                                        <form method="POST" action="index.jsp">
                                            <div class="row">
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>Nome</label>
                                                        <input type="text" class="form-control" disabled="" value="Matheus W">
                                                    </div>
                                                </div>
                                                <div class="col-md-2 pl-3">
                                                    <div class="form-group">
                                                        <label>Sobrenome</label>
                                                        <input type="text" class="form-control" disabled="" value="W">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>CPF</label>
                                                        <input type="text" class="form-control" disabled="" value="800.395.88-89">
                                                    </div>
                                                </div>
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>E-mail</label>
                                                        <input type="text" class="form-control" disabled="" value="chingulo1@outlook.com">
                                                    </div>
                                                </div>
                                                <div class="col-md-2 pl-1">
                                                    <div class="form-group">
                                                        <label>Telefone</label>
                                                        <input type="text" class="form-control" disabled="" value="(41) 99845-3333">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 pr-1">
                                                    <div class="form-group">
                                                        <label>Cidade</label>
                                                        <input type="text" class="form-control" disabled="" value="Curitiba">
                                                    </div>
                                                </div>
                                                <div class="col-md-1 pl-3">
                                                    <div class="form-group">
                                                        <label>UF</label>
                                                        <input type="text" class="form-control" disabled="" value="PR">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2 pr-1">
                                                    <div class="form-group">
                                                        <label>CEP</label>
                                                        <input type="text" class="form-control" disabled="" value="81070-342">
                                                    </div>
                                                </div>
                                                <div class="col-md-2 pr-1">
                                                    <div class="form-group">
                                                        <label>Rua</label>
                                                        <input type="text" class="form-control" disabled="" value="Marechal Anor">
                                                    </div>
                                                </div>
                                                <div class="col-md-1 pl-1">
                                                    <div class="form-group">
                                                        <label>Número</label>
                                                        <input type="text" class="form-control" disabled="" value="342">
                                                    </div>
                                                </div>
                                                <div class="col-md-2 pl-1">
                                                    <div class="form-group">
                                                        <label>Complemento</label>
                                                        <input type="text" class="form-control" disabled="" value="2">
                                                    </div>
                                                </div>
                                                <div class="col-md-2 pl-1">
                                                    <div class="form-group">
                                                        <label>Bairro</label>
                                                        <input type="text" class="form-control" disabled="" value="Bacacheri">
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer footer-black  footer-white ">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="credits ml-auto">
                                <span class="copyright">
                                    BEIBE - Beauty Embuste Indústria de Beleza e Estética - <script>
                                        document.write(new Date().getFullYear());
                                    </script>
                                </span>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            
            <script src="./assets/js/core/jquery.min.js"></script>
            <script src="./assets/js/core/popper.min.js"></script>
            <script src="./assets/js/core/bootstrap.min.js"></script>
            <script src="./assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
            <script src="./assets/js/plugins/chartjs.min.js"></script>
            <script src="./assets/js/plugins/bootstrap-notify.js"></script>
            <script src="./assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
    </body>
</html>
