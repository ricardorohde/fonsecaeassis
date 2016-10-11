<?php
ob_start();
session_start();
require('../_app/Config.inc.php');

$login = new Login(1);
$logoff = filter_input(INPUT_GET, 'logoff', FILTER_VALIDATE_BOOLEAN);
$getexe = filter_input(INPUT_GET, 'exe', FILTER_DEFAULT);

if (!$login->CheckLogin()):
    unset($_SESSION['userlogin']);
    header('Location: index.php?exe=restrito');
else:
    $userlogin = $_SESSION['userlogin'];
    $DadosLoga = ['cont_acesso' => $userlogin['cont_acesso'] + 1, 'ip' => $_SERVER['REMOTE_ADDR']];
    $Update = new Update;
    $Update->ExeUpdate('usuarios', $DadosLoga, "WHERE id = :id", "id={$userlogin['id']}");
endif;

if ($logoff):
    $Update->ExeUpdate('usuarios', ['ultimo_acesso' => Check::Data(date('d/m/Y'))], "WHERE id = :id", "id={$userlogin['id']}");
    unset($_SESSION['userlogin']);
    header('Location: index.php?exe=logoff');
endif;
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="http://www.creativewebsites.com.br/midia/favicon.ico" />
        <title>CW Admin - Cw Digital</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>


        <link rel="stylesheet" href="dist/assets/css/font-icons/entypo/css/entypo.css">
        <link rel="stylesheet" href="dist/assets/css/font-icons/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">




        <link rel="stylesheet" href="dist/vendor/bootstrap/dist/css/bootstrap.css">
        <link rel="stylesheet" href="dist/vendor/perfect-scrollbar/css/perfect-scrollbar.css">
        <link rel="stylesheet" href="dist/styles/roboto.css">
        <link rel="stylesheet" href="dist/styles/font-awesome.css">
        <link rel="stylesheet" href="dist/styles/panel.css">
        <link rel="stylesheet" href="dist/styles/feather.css">
        <link rel="stylesheet" href="dist/styles/animate.css">
        <link rel="stylesheet" href="dist/styles/urban.css">
        <link rel="stylesheet" href="dist/styles/urban.skins.css">
        <link rel="stylesheet" href="dist/styles/style.css">

        
<!--         HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries 
         WARNING: Respond.js doesn't work if you view the page via file:// 
        [if lt IE 9]>
-->            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><!--
        <![endif]-->
    </head>
    <body>
        <div class="app layout-fixed-header">



            <?php
            //Main Menu
            include(__DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'inc' . DIRECTORY_SEPARATOR . 'main-menu.inc.php');
            //Sidebar
            include(__DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'inc' . DIRECTORY_SEPARATOR . 'main-sidebar.inc.php');
            ?>
            <!-- Content Wrapper. Contains page content -->
            <div class="content">
                <?php
                //QUERY STRING
                if (!empty($getexe)):
                    $includepatch = __DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . strip_tags(trim($getexe) . '.php');
                else:
                    $includepatch = __DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'home.php';
                endif;

                if (file_exists($includepatch)):
                    require_once($includepatch);
                else:
                    echo "<div class=\"content notfound\">";
                    WSErro("<b>Erro ao incluir tela:</b> Erro ao incluir o controller /{$getexe}.php!", WS_ERROR);
                    echo "</div>";
                endif;
                ?>
            </div><!-- /.content-wrapper -->
            <?php
            //Footer
            include(__DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'inc' . DIRECTORY_SEPARATOR . 'footer.inc.php');
            ?>
        </div>


        <script src="dist/scripts/extentions/modernizr.js"></script>
        <script src="dist/vendor/jquery/dist/jquery.js"></script>
        <script src="dist/vendor/bootstrap/dist/js/bootstrap.js"></script>
        <script src="dist/vendor/jquery.easing/jquery.easing.js"></script>
        <script src="dist/vendor/fastclick/lib/fastclick.js"></script>
        <script src="dist/vendor/onScreen/jquery.onscreen.js"></script>
        <script src="dist/vendor/jquery-countTo/jquery.countTo.js"></script>
        <script src="dist/vendor/perfect-scrollbar/js/perfect-scrollbar.jquery.js"></script>
        <script src="dist/scripts/ui/accordion.js"></script>
        <script src="dist/scripts/ui/animate.js"></script>
        <script src="dist/scripts/ui/link-transition.js"></script>
        <script src="dist/scripts/ui/panel-controls.js"></script>
        <script src="dist/scripts/ui/preloader.js"></script>
        <script src="dist/scripts/ui/toggle.js"></script>
        <script src="dist/scripts/urban-constants.js"></script>
        <script src="dist/scripts/extentions/lib.js"></script>
        <script src="dist/vendor/jquery.maskedinput/dist/jquery.maskedinput.min.js"></script>
        <script src="dist/scripts/pages/form-masks.js"></script>
        <script src="dist/js/script.js"></script>  
        





    </body>
</html>
<?php
ob_end_flush();
