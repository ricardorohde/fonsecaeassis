<?php
ob_start();
require('./_app/Config.inc.php');
$Session = new Session(10);
Check::UserOnline();
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="theme-color" content="#35314E">
        <!--[if lt IE 9]><script src="<?= HOME; ?>/_cdn/html5.js"></script><![endif]-->
        <?php
        $Link = new Link;
        $Link->getTags();
        ?>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="<?= HOME; ?>/_cdn/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<?= INCLUDE_PATH; ?>/css/layout.min.css"/>
        <link rel="stylesheet" type='text/css' href="<?= HOME; ?>/_cdn/flexslider/flexslider.css">
    </head>
    <body>
        <?php
        //Consultar dados institucionais
        $Read = new Read;
        $Read->ExeRead('institucional');
        $Empresa = $Read->getResult()[0];

        //Topo
        require(REQUIRE_PATH . '/inc/header.inc.php');
        //Capa
        if (!require($Link->getPatch())):
            WSErro('Erro ao incluir arquivo de navegação!', WS_ERROR, true);
        endif;
        //Rodape
        require(REQUIRE_PATH . '/inc/footer.inc.php');
        ?>
    </body>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="<?= INCLUDE_PATH; ?>/css/entypo/css/entypo.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
    <!-- JS -->
    <script src="<?= HOME; ?>/_cdn/jquery.js"></script>
    <script src="<?= HOME; ?>/_cdn/bootstrap/js/bootstrap.min.js"></script>
    <script src="<?= HOME; ?>/_cdn/flexslider/flexslider.min.js"></script>
    <script src="<?= HOME; ?>/_cdn/slide.js"></script>
    <script src="<?= HOME; ?>/_cdn/_scripts.conf.js"></script>
</html>
<?php
ob_end_flush();
