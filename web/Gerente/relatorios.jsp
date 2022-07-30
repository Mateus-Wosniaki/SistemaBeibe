<!DOCTYPE html>
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
                            <a href="detalheGerente.html">
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
                                    <div class="card-body">  
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="text-primary">
                                                    <tr><th class="text-center">
                                                            #
                                                        </th>
                                                        <th>
                                                            Nome
                                                        </th>
                                                        <th>
                                                            Cargo
                                                        </th>
                                                        <th class="text-center">
                                                            Desde
                                                        </th>
                                                        <th class="text-right">
                                                            Salario
                                                        </th>
                                                        <th class="text-right">
                                                            Relatorio
                                                        </th>
                                                    </tr></thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-center">
                                                            1
                                                        </td>
                                                        <td>
                                                            Andrew Mike
                                                        </td>
                                                        <td>
                                                            Develop
                                                        </td>
                                                        <td class="text-center">
                                                            2013
                                                        </td>
                                                        <td class="text-right">
                                                            R$ 1299,22
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            2
                                                        </td>
                                                        <td>
                                                            John Doe
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            2012
                                                        </td>
                                                        <td class="text-right">
                                                            R$ 1289,00
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            3
                                                        </td>
                                                        <td>
                                                            Alex Mike
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            2010
                                                        </td>
                                                        <td class="text-right">
                                                            R$ 1292,14
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            4
                                                        </td>
                                                        <td>
                                                            Mike Monday
                                                        </td>
                                                        <td>
                                                            Marketing
                                                        </td>
                                                        <td class="text-center">
                                                            2013
                                                        </td>
                                                        <td class="text-right">
                                                            R$ 1249,99
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            5
                                                        </td>
                                                        <td>
                                                            Paul Dickens
                                                        </td>
                                                        <td>
                                                            Communication
                                                        </td>
                                                        <td class="text-center">
                                                            2015
                                                        </td>
                                                        <td class="text-right">
                                                            R$ 1269,20
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            6
                                                        </td>
                                                        <td>
                                                            Manuel Rico
                                                        </td>
                                                        <td>
                                                            Manager
                                                        </td>
                                                        <td class="text-center">
                                                            2012
                                                        </td>
                                                        <td class="text-right">
                                                            R$ 1299,20
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Relatorio de Produtos Mais Reclamados</h4>
                                    </div>  
                                    <div class="card-body">  
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="text-primary">
                                                    <tr><th class="text-center">
                                                            #
                                                        </th>
                                                        <th>
                                                            Nome do Produto
                                                        </th>
                                                        <th>
                                                            Categoria
                                                        </th>
                                                        <th class="text-center">
                                                            Qtd de Reclamacoes
                                                        </th>
                                                        <th class="text-right">
                                                            Relatorio
                                                        </th>
                                                    </tr></thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-center">
                                                            1
                                                        </td>
                                                        <td>
                                                            Andrew Mike
                                                        </td>
                                                        <td>
                                                            Develop
                                                        </td>
                                                        <td class="text-center">
                                                            201
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            2
                                                        </td>
                                                        <td>
                                                            John Doe
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            198
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            3
                                                        </td>
                                                        <td>
                                                            Alex Mike
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            153
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            4
                                                        </td>
                                                        <td>
                                                            Mike Monday
                                                        </td>
                                                        <td>
                                                            Marketing
                                                        </td>
                                                        <td class="text-center">
                                                            134
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            5
                                                        </td>
                                                        <td>
                                                            Paul Dickens
                                                        </td>
                                                        <td>
                                                            Communication
                                                        </td>
                                                        <td class="text-center">
                                                            98
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            6
                                                        </td>
                                                        <td>
                                                            Manuel Rico
                                                        </td>
                                                        <td>
                                                            Manager
                                                        </td>
                                                        <td class="text-center">
                                                            47
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Relatorio de Atendimentos em Aberto por Data</h4>
                                    </div>  
                                    <div class="card-body">  
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="text-primary">
                                                    <tr><th class="text-center">
                                                            #
                                                        </th>
                                                        <th>
                                                            Nome atendimento
                                                        </th>
                                                        <th>
                                                            Departamento
                                                        </th>
                                                        <th class="text-center">
                                                            Data
                                                        </th>
                                                        <th class="text-right">
                                                            Relatorio
                                                        </th>
                                                    </tr></thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-center">
                                                            1
                                                        </td>
                                                        <td>
                                                            Atendimento
                                                        </td>
                                                        <td>
                                                            Develop
                                                        </td>
                                                        <td class="text-center">
                                                            02/12/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            2
                                                        </td>
                                                        <td>
                                                            Atendimento
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            02/11/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            3
                                                        </td>
                                                        <td>
                                                            Atendimento
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            02/10/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            4
                                                        </td>
                                                        <td>
                                                            Atendimento
                                                        </td>
                                                        <td>
                                                            Marketing
                                                        </td>
                                                        <td class="text-center">
                                                            02/09/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            5
                                                        </td>
                                                        <td>
                                                            Atendimento
                                                        </td>
                                                        <td>
                                                            Communication
                                                        </td>
                                                        <td class="text-center">
                                                            02/08/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            6
                                                        </td>
                                                        <td>
                                                            Atendimento
                                                        </td>
                                                        <td>
                                                            Manager
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Relatorio de Reclamações</h4>
                                    </div>  
                                    <div class="card-body">  
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="text-primary">
                                                    <tr><th class="text-center">
                                                            #
                                                        </th>
                                                        <th>
                                                            Assunto
                                                        </th>
                                                        <th>
                                                            Departamento
                                                        </th>
                                                        <th class="text-center">
                                                            Data
                                                        </th>
                                                        <th class="text-right">
                                                            Relatorio
                                                        </th>
                                                    </tr></thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-center">
                                                            1
                                                        </td>
                                                        <td>
                                                            assunto
                                                        </td>
                                                        <td>
                                                            Develop
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            2
                                                        </td>
                                                        <td>
                                                            assunto
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            3
                                                        </td>
                                                        <td>
                                                            assunto
                                                        </td>
                                                        <td>
                                                            Design
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            4
                                                        </td>
                                                        <td>
                                                            assunto
                                                        </td>
                                                        <td>
                                                            Marketing
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            5
                                                        </td>
                                                        <td>
                                                            assunto
                                                        </td>
                                                        <td>
                                                            Communication
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center">
                                                            6
                                                        </td>
                                                        <td>
                                                            assunto
                                                        </td>
                                                        <td>
                                                            Manager
                                                        </td>
                                                        <td class="text-center">
                                                            02/07/2022
                                                        </td>
                                                        <td class="text-right">
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-icon btn-sm " data-original-title="" title="">
                                                                <i class="fa fa-download"></i>
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>