<div class="main-associados">
    <div class="main-titulo-content">
        <div class="main-header-content">
            <h1>Advogados Associados</h1>
            <h2>Conheça nosso Time</h2>
        </div>
        <div class="main-naveg">
            <ol class="breadcrumb">
                <li><a href="<?= HOME; ?>">Home</a></li>
                <li class="active">Associados</li>
            </ol>
        </div>
    </div>
    <?php
    $ReadAssoc = new Read;
    $ReadAssoc->ExeRead('adv_associados', "WHERE nome != :n ORDER BY nome ASC", "n=''");
    if ($ReadAssoc->getResult()):
        foreach ($ReadAssoc->getResult() AS $Assoc):
            extract($Assoc);
            ?>
            <div class="box-associados">
                <div class="foto-associado">
                    <?= Check::Image('uploads/' . $foto, $nome, 'img-circle', 162, 162); ?>
                </div>
                <div class="dados-associados">
                    <h1><?= $nome; ?></h1>
                    <h2>OAB <?= $oab_reg . '/' . $oab_uf; ?></h2>
                </div>
            </div>
            <?php
        endforeach;
    else:
        WSErro('Ainda não temos nenhum associado cadastrado, aguarde...', WS_INFOR);
    endif;
    ?>
</div>
