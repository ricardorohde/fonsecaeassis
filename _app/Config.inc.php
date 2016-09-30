<?php

//CONFIGURAÇÕES NO PHP
date_default_timezone_set("America/Manaus");

// CONFIGURAÇÕES DO BANCO ####################
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '1234');
define('DBSA', '_painel_2016');

// DEFINE SERVIDOR DE E-MAIL ################
define('MAILUSER', 'email@dominio.com.br');
define('MAILPASS', 'senhadoemail');
define('MAILPORT', 'postadeenvio');
define('MAILHOST', 'servidordeenvio');

// DEFINE IDENTIDADE DO SITE ################
define('SITENAME', 'CW Digital');
define('SITEDESC', 'Desenvolvimento de websites e sistemas web, tudo que você e sua empresa precisa para estar na web moderna.');

// DEFINE A BASE DO SITE ####################
define('HOME', 'http://localhost/servidor/_painel_cwdigital/CWADMIN/');
define('THEME', 'imobiliaria');

define('INCLUDE_PATH', HOME . DIRECTORY_SEPARATOR . 'themes' . DIRECTORY_SEPARATOR . THEME);
define('REQUIRE_PATH', 'themes' . DIRECTORY_SEPARATOR . THEME);

// DEFINE SISTEMA CW IMOB ####################
define('CW_VERSION', 'v1.0.1');
define('CW_HOME', HOME . DIRECTORY_SEPARATOR . 'cwimob');

// AUTO LOAD DE CLASSES ####################
function __autoload($Class) {
    $cDir = ['Conn', 'Helpers', 'Models'];
    $iDir = null;
    foreach ($cDir as $dirName):
        if (!$iDir && file_exists(__DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class . '.class.php') && !is_dir(__DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class . '.class.php')):
            include_once (__DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class . '.class.php');
            $iDir = true;
        endif;
    endforeach;
    if (!$iDir):
        trigger_error("Não foi possível incluir {$Class}.class.php", E_USER_ERROR);
        die;
    endif;
}

// TRATAMENTO DE ERROS #####################
//CSS constantes :: Mensagens de Erro
define('WS_ACCEPT', 'sucesso');
define('WS_INFOR', 'info');
define('WS_ALERT', 'erro');
define('WS_ERROR', 'erro');

//WSErro :: Exibe erros lançados :: Front
function WSErro($ErrMsg, $ErrNo, $ErrDie = null) {
    $CssClass = ($ErrNo == E_USER_NOTICE ? WS_INFOR : ($ErrNo == E_USER_WARNING ? WS_ALERT : ($ErrNo == E_USER_ERROR ? WS_ERROR : $ErrNo)));
    echo "<p class=\"alert alerta-{$CssClass} text-center\">{$ErrMsg}</p>";

    if ($ErrDie):
        die;
    endif;
}

//PHPErro :: personaliza o gatilho do PHP
function PHPErro($ErrNo, $ErrMsg, $ErrFile, $ErrLine) {
    $CssClass = ($ErrNo == E_USER_NOTICE ? WS_INFOR : ($ErrNo == E_USER_WARNING ? WS_ALERT : ($ErrNo == E_USER_ERROR ? WS_ERROR : $ErrNo)));
    echo "<p class=\"trigger {$CssClass}\">";
    echo "<b>Erro na Linha: #{$ErrLine} ::</b> {$ErrMsg}<br>";
    echo "<small>{$ErrFile}</small>";
    echo "<span class=\"ajax_close\"></span></p>";

    if ($ErrNo == E_USER_ERROR):
        die;
    endif;
}

set_error_handler('PHPErro');
