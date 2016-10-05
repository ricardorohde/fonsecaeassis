<?php
ob_start();
session_start();
require('../_app/Config.inc.php');
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Login - CW Admin</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

        <!--     Fonts and icons     -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link rel="stylesheet" href="login/assets/css/font-icons/entypo/css/entypo.css">

        <!-- CSS -->
        <link href="login2/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="login2/assets/css/material-kit.css" rel="stylesheet"/>

    </head>
    <body class="signup-page">
        <div class="wrapper">
            <div class="header header-filter" style="background-image: url('login2/assets/img/background.jpg'); background-size: cover; background-position: top center;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                            <div class="alertas">
                                <?php
                                $welcome = true;
                                $login = new Login(1);
                                if ($login->CheckLogin()):
                                    header('Location: painel.php');
                                endif;

                                $dataLogin = filter_input_array(INPUT_POST, FILTER_DEFAULT);
                                if (!empty($dataLogin['AdminLogin'])):
                                    $login->ExeLogin($dataLogin);
                                    if (!$login->getResult()):
                                        WSErro($login->getError()[0], $login->getError()[1]);
                                        $welcome = false;
                                    else:
                                        header('Location: painel.php');
                                    endif;
                                endif;

                                $get = filter_input(INPUT_GET, 'exe', FILTER_DEFAULT);
                                if (!empty($get)):
                                    if ($get == 'restrito'):
                                        WSErro('<b>Oppsss:</b> Acesso negado.<br> Favor efetue login para acessar o painel!', WS_ERROR);
                                        $welcome = false;
                                    elseif ($get == 'logoff'):
                                        WSErro('<b>Sucesso ao deslogar</b><br> Sua sessão foi finalizada. Volte sempre!', WS_ACCEPT);

                                        $welcome = false;
                                    endif;
                                endif;

                                if (!$welcome === false):
                                    ?>
                                    <div class="alert alert-success alerta-welcome">
                                        <div class="container-fluid">
                                            <div class="alert-icon">
                                                <i class="material-icons">check</i>
                                            </div>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="material-icons">clear</i></span>
                                            </button>
                                            <b>Olá seja bem vindo ao CW Admin</b>
                                        </div>
                                    </div>
                                    <?php
                                endif;
                                ?>  
                            </div>
                            <div class="card card-signup">
                                <form method="post" role="form" id="login" name="AdminLoginForm" action="">
                                    <div class="header header-white text-center">
                                        <img src="login2/assets/img/logo.png" alt="CW Digital - Brasil">
                                    </div>
                                    <p class="text-divider">Painél Administrador</p>
                                    <div class="content">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="entypo-user"></i>
                                            </span>
                                            <input type="text" class="form-control" name="login" id="username" placeholder="Digite seu Usuário...">     
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                            <input type="password" name="senha" id="passwd" placeholder="Digite sua senha..." class="form-control" />
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="optionsCheckboxes" checked>
                                                Lembrar Usuário
                                            </label>
                                        </div> 
                                    </div>
                                    <div class="footer text-center">
                                        <button  type="submit" name="AdminLogin"  class="btn btn-success btn-lg" value="Entrar">Entrar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container">
                        <div class="copyright pull-right">
                            CW Admin &copy; 2016 <i class="fa fa-heart heart"></i>  CW Digital -<a href="http://www.cwdigital.com.br" target="_blank"> Brasil</a>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
    <!--   Core JS Files   -->
    <script src="login2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="login2/assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="login2/assets/js/material.min.js"></script>

    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="login2/assets/js/nouislider.min.js" type="text/javascript"></script>

    <!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
    <script src="login2/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>

    <!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
    <script src="login2/assets/js/material-kit.js" type="text/javascript"></script>
    <script src = "dist/js/script.js"></script>   
</html>
<?php
ob_end_flush();
