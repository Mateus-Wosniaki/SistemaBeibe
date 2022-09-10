<%-- 
    Document   : erro
    Created on : 7 de set. de 2022, 20:11:25
    Author     : Gabriel Jesus Peres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BEIBE - Erro 500</title>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="../assets/css/login.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container-fluid">
            <header class="container text-center">
                <h1 class="text-danger mt-5">Ops! Ocorreu algum problema...</h1>
            </header>
            <main class="container">
                <div class="card shadow mt-5">
                    <div class="card-body">
                        <h5 class="card-title">${mensagem} ${pageContext.exception.message}</h5>
                        <p class="card-text">
                            ${pageContext.out.flush()}
                            ${pageContext.exception.printStackTrace(pageContext.response.writer)}
                        </p>
                    </div>
                </div>
            </main>
            <footer class="mt-4 text-center">
                Em caso de problemas, contactar administrador: ${configuracao.email}
            </footer>
        </div>
        <script src="../assets/js/core/jquery.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <script src="../assets/js/plugins/chartjs.min.js"></script>
        <script src="../assets/js/plugins/bootstrap-notify.js"></script>
        <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
    </body>
</html>
