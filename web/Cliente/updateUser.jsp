<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Editar Usuario
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
        <script type="text/javascript" >
            $(document).ready(function () {
                $("#estado").change(function () {
                    getCidades();
                });
            });
            function getCidades() {
                var estadoId = $("#estado").val();
                var url = "AJAXServlet";
                $.ajax({
                    url: url, // URL da sua Servlet
                    data: {
                        estadoId: estadoId
                    }, // Par�metro passado para a Servlet
                    dataType: 'json',
                    success: function (data) {
                        // Se sucesso, limpa e preenche a combo de cidade
                        // alert(JSON.stringify(data));
                        $("#cidade").empty();
                        $.each(data, function (i, obj) {
                            $("#cidade").append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                        });
                    },
                    error: function (request, textStatus, errorThrown) {
                        alert(request.status + ', Error: ' + request.statusText);
                        // Erro
                    }
                });
            }
        </script>
    </head>

    <body class="">
        <div class="wrapper ">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <div class="logo">
                    <a href="https://www.example.com" class="simple-text logo-normal">
                        CLIENTE
                    </a>
                </div>
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li>
                            <a href="index.jsp">
                                <i class="nc-icon nc-shop"></i>
                                <p>In�cio</p>
                            </a>
                        </li>
                        <li class="active">
                            <a href="updateUser.jsp">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
                            </a>
                        </li>
                        <li>
                            <a href="userServiceList.jsp">
                                <i class="nc-icon nc-book-bookmark"></i>
                                <p>Atendimentos</p>
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
                                    <a class="nav-link" href="../Autenticacao/login.jsp">
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
                            <div class="card card-user">
                                <div class="card-header">
                                    <h5 class="card-title">Editar Usuario</h5>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="updateUser.jsp">
                                        <div class="row">
                                            <div class="col-md pr-1">
                                                <div class="form-group">
                                                    <label>Nome </label>
                                                        <input type="text" class="form-control" placeholder="" value="Gabrilson">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Sobrenome</label>
                                                    <input type="text" class="form-control" placeholder="" value="De l�">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label>CPF</label>
                                                    <input readonly type="text" class="form-control cpf" placeholder="132.115.141-11">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" readonly class="form-control" placeholder="" value="gabrilson@ufpr.br">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Telefone</label>
                                                    <input type="text" class="form-control telefone" placeholder="" value="(11) 11111-1111">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Cidade</label>
                                                    <input type="text" class="form-control" placeholder="" value="Boa Vista">
                                                </div>
                                            </div>

                                            <div class="col-md-1 pr-1">
                                                <div class="form-group">
                                                    <label>UF</label>
                                                    <input type="text" class="form-control" placeholder="" value="RR">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2 pr-1">
                                                <div class="form-group">
                                                    <label>CEP</label>
                                                    <input type="text" class="form-control" placeholder="" value="69306-350">
                                                </div>
                                            </div>
                                            <div class="col-md-2 pl-1">
                                                <div class="form-group">
                                                    <label>Rua</label>
                                                    <input type="text" class="form-control" placeholder="" value="Avenida Presidente Dutra">
                                                </div>
                                            </div>
                                            <div class="col-md-1 pl-1">
                                                <div class="form-group">
                                                    <label>Numero</label>
                                                    <input type="text" class="form-control" placeholder="" value="687">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Complemento</label>
                                                    <input type="text" class="form-control" placeholder="Casa">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Bairro</label>
                                                    <input type="text" class="form-control" placeholder="Nossa Senhora Aparecida">
                                                </div>
                                            </div>
                                        </div>
                                            <div class="row">
                                                <div class="update ml-auto mr-auto">
                                                    <button type="submit" class="btn btn-primary btn-round">Atualizar perfil</button>
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
        <!--   Core JS Files   -->
        <script src="../assets/js/core/jquery.min.js"></script>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

        <!-- jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
        <!-- masks -->
        <script> 
             $(".telefone").mask("(00) 0000-00009");
             $(".cep").mask("00.000-000");
             $(".cpf").mask("999.999.999-99");
         </script>
        <!-- Endmasks -->
    </body>

</html>