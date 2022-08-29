<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Criar Atendimento
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />

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
                        <li>
                            <a href="updateUser.jsp">
                                <i class="nc-icon nc-single-02"></i>
                                <p>Perfil</p>
                            </a>
                        </li>
                        <li class="active">
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
                            <a class="navbar-brand" href="javascript:;">SAC - Sistema Atendimento Ao Cliente</a>
                        </div>
                    </div>
                </nav> 
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                    <span class="navbar-toggler-bar navbar-kebab"></span>
                </button>         
                <!-- End Navbar -->

                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-user">
                                <div class="card-header">
                                    <h5 class="card-title">Criar atendimento</h5>
                                </div>
                                <div class="card-body">
                                    <form method="POST" action="userServiceList.jsp">
                                        <div class="row">
                                            <div class="col-md pr-1">
                                                <div class="form-group">
                                                    <label>Data/Hora </label>
                                                        <input readonly type="text" class="form-control" placeholder="" id="dataHora" value="EnableJs">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Cliente</label>
                                                    <input readonly type="text" class="form-control" placeholder="" value="Carlos">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 pr-1">
                                                <div class="form-group">
                                                    <label >Situa��o</label>
                                                    <input readonly type="text" class="form-control" placeholder="Aberto">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Produto</label>
                                                    <input type="text" class="form-control" placeholder="" value="">
                                                </div>
                                            </div>
                                            <div class="col-md pl-1">
                                                <div class="form-group">
                                                    <label>Tipo</label>
                                                    <input type="text" class="form-control" placeholder="" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Descri��o</label>
                                                    <textarea class="form-control textarea" placeholder="Detalhe seu atendimento" > </textarea>
                                                </div>
                                            </div>
                                        </div>
                                            <div class="row">
                                                <div class="update ml-auto mr-auto">
                                                    <button type="submit" class="btn btn-primary btn-round">Criar Atendimento</button>
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
        
        <!-- Get data and hour for form -->
        <script>
         dataHora.value = new Date().toLocaleString("pt-BR");
         </script>

        <!-- Endmasks -->
    </body>

</html>