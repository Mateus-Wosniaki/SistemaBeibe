<%-- 
    Document   : login
    Created on : Jul 10, 2022, 6:10:33 PM
    Author     : Gabriel Jesus Peres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAC - Login</title>

        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/paper-dashboard.min.css"/>
        <link rel="stylesheet" href="../assets/css/login.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">BEIBE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" href="login.jsp">VOLTAR</a>
                </div>
            </div>
        </nav>
        <div class="content">
            <div class="container">
                <div class="col-lg-12 ml-auto mr-auto">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Cadastrar Usuario</h5>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="login.jsp">
                                <div class="row">
                                    <div class="col-md pr-1">
                                        <div class="form-group">
                                            <label>Nome </label>
                                            <input type="text" class="form-control"placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Sobrenome</label>
                                            <input type="text" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 pr-1">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">CPF</label>
                                            <input type="text" class="form-control cpf" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Telefone</label>
                                            <input type="text" class="form-control telefone" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Cidade</label>
                                            <input type="text" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>

                                    <div class="col-md-1 pr-1">
                                        <div class="form-group">
                                            <label>UF</label>
                                            <input type="text" class="form-control" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2 pr-1">
                                        <div class="form-group">
                                            <label>CEP</label>
                                            <input type="text" class="form-control cep" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-md-2 pl-1">
                                        <div class="form-group">
                                            <label>Rua</label>
                                            <input type="text" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md-1 pl-1">
                                        <div class="form-group">
                                            <label>Numero</label>
                                            <input type="number" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Complemento</label>
                                            <input type="text" class="form-control" placeholder="">
                                        </div>
                                    </div>
                                    <div class="col-md pl-1">
                                        <div class="form-group">
                                            <label>Bairro</label>
                                            <input type="text" class="form-control" placeholder="">
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
    <script src="../assets/js/core/jquery.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script src="../assets/js/plugins/chartjs.min.js"></script>
    <script src="../assets/js/plugins/bootstrap-notify.js"></script>
    <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
    <!-- masks -->
    <script> 
        $(".telefone").mask("(00) 0000-00009");
        $(".cep").mask("00.000-000");
        $(".cpf").mask("999.999.999-99");
    </script>
</body>
</html>
