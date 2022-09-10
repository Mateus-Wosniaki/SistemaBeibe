<%-- 
    Document   : index
    Created on : 7 de set. de 2022, 20:17:56
    Author     : Gabril
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BEIBE - Login</title>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="../assets/css/login.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">BEIBE - Beauty Embuste Indústria de Beleza e Estética</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" href="createUser.jsp">Cadastro</a>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container">
                <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                    <c:url var="formURL" value="/AutenticacaoServlet" context="${pageContext.request.contextPath}" >
                        <c:param name="action" value="login" />
                    </c:url>
                    <form class="form" method="POST" action="${formURL}">
                        <div class="card card-login">
                            <div class="card-header ">
                                <div class="card-header ">
                                    <h3 class="header text-center">Bem-vindo!</h3>
                                    <h5 class="text-center">Acesse sua conta</h5> 
                                </div>
                            </div>
                            <div class="card-body ">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="nc-icon nc-single-02"></i>
                                        </span>
                                    </div>
                                    <input type="email" class="form-control" placeholder="Email" id="email" name="email">
                                </div>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="nc-icon nc-key-25"></i>
                                        </span>
                                    </div>
                                    <input type="password" placeholder="Senha" class="form-control" id="senha" name="senha">
                                </div>
                                <br />
                                <div class="form-group">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="checkbox" value="keepsession" checked="">
                                            <span class="form-check-sign"></span>
                                            Mantenha-me conectado
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer ">
                                <button type="submit" class="btn btn-warning btn-round btn-block mb-3">Entrar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer class="footer footer-black footer-white fixed-bottom bg-light">
            <div class="container-fluid">
                <div class="row">
                    <div class="credits ml-auto">
                        <span class="copyright">
                            <!-- TODO: Jogar essa seção numa StartupServlet -->
                            BEIBE - Beauty Embuste Indústria de Beleza e Estética |
                            Contato: (41) 9 1313-1313 | 
                            Endereço: Rua do Embuste, 1313 - Curitiba, PR, 13131-313
                        </span>
                    </div>
                </div>
            </div>
        </footer>
        <script src="../assets/js/core/jquery.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="../assets/js/plugins/chartjs.min.js"></script>
        <script src="../assets/js/plugins/bootstrap-notify.js"></script>
        <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
    </body>
</html>
