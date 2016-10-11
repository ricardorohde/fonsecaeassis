<?php
ob_start();
session_start();
require('../_app/Config.inc.php');
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login - CW Admin</title>

        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
        <link rel="stylesheet" href="login/assets/css/bootstrap.css">
        <link rel="stylesheet" href="login/assets/css/xenon-core.css">
        <link rel="stylesheet" href="login/assets/css/xenon-components.css">
        <link rel="stylesheet" href="login/assets/css/font-icons/entypo/css/entypo.css">
        <link href="dist/css/style.css" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="login/assets/css/neon-forms.css">
        <link rel="stylesheet" href="login/assets/css/neon-theme.css">

        <script src="login/assets/js/jquery-1.11.1.min.js"></script>
        <script src="login/assets/js/valid_form.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body class="page-body login-page" style="background-image: url(login/assets/images/slide-img-1-bg.png);"  >
        <div class="login-container">
            <div class="row">		
                <div class="col-sm-6">			
                    <form method="post" role="form" id="login" name="AdminLoginForm" action="" class="login-form fade-in-effect">
                        <div class="login-header">
                            <a href="#" class="logo">
                                <img src="login/assets/images/logo@2x.png" alt="" width="220" />
                            </a>
                            <p></p>
                        </div>
                        <div class="form-group" >
                            <label class="control-label" for="username" ><i class="entypo-user"></i>  Usuário</label>
                            <input type="text" class="form-control input-dark" name="login" id="username" autocomplete="off" />  
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="passwd"><i class="entypo-key"></i>  Senha</label>
                            <input type="password" class="form-control input-dark" name="senha" id="passwd" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <button type="submit" name="AdminLogin" class="btn btn-primary btn-block btn-login" value="Entrar">
                                <i class="entypo-login"></i>
                                Entrar
                            </button>
                        </div>
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
                                <div class="alertas">
                                    <div class="alert alert-succes alerta-welcome">
                                        <b>Olá! Seja bem vindo ao seu Painél Administrativo</b>
                                    </div>     
                                </div>
                                <?php
                            endif;
                            ?>  
                        </div>
                        <div class="row">
                            <div class="col-sm-6">	
                                <div class="open-redefinir-login">
                                    <a href="#" data-toggle="modal" data-target="#redefinir-login">
                                        <div class="texto">Esqueci Minha Senha</div>
                                    </a>  
                                </div>
                                <div class="info-links">
                                    <a href="#">CW DIGITAL</a> -
                                    <a href="#">VERSÃO 1.0</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        <div class="container">
            <div class="container">
                <div class="modal fade" id="redefinir-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content modal-redefinir-login">
                            <button type="button" class="close" id="close" data-dismiss="modal">x</button>
                            <div class="box-redefinir-login">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                                        <div class="box-formulario">
                                            <form class="form-inline"> 
                                                <label class="titulo-label">Digite seu E-mail para Recuperar sua senha</label>
                                                <input type="email" class="form-control s" id="form-cadastro" placeholder="Ex: usuário@cwimob.com.br" required="required">
                                                <input type="submit" class="btn btn-login" id="btn-redefinir"  value="Recuperar">  
                                            </form>
                                        </div> 
                                    </div>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- SCRIPTS-->
        <script src="login/assets/js/bootstrap.min.js"></script>
        <script src="login/assets/js/jquery-validate/jquery.validate.min.js"></script>
        <script src="login/assets/js/xenon-custom.js"></script>
        <script src = "dist/js/jquery.js"></script> 
        <script src = "dist/js/bootstrap.min.js"></script> 
        <script src = "dist/js/script.js"></script>   
    </body>
</html>
<?php
ob_end_flush();
