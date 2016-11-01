<div class="main-atuacao">
    <div class="main-titulo-content">
        <div class="main-header-content">
            <h1>Áreas de Atuação</h1>
            <h2>Onde atuamos</h2>
        </div>
        <div class="main-naveg">
            <ol class="breadcrumb">
                <li><a href="<?= HOME; ?>">Home</a></li>
                <li class="active">Áreas de Atuacão</li>
            </ol>
        </div>
    </div>
    <div class="box-atuacoes">
        <?php
        $ReadAtuacao = new Read;
        $ReadAtuacao->FullRead("SELECT a.*, ai.foto FROM atuacao a, atuacao_icons ai WHERE a.id_icon = ai.id AND area != :a", "a=''");
        if ($ReadAtuacao->getResult()):
            foreach ($ReadAtuacao->getResult() as $Atuacao):
                extract($Atuacao);
                ?>
                <div class="box-conteudo-atuacao">
                    <div class="img-responsive circle-atuacao">
                        <?= Check::Image('uploads/' . $foto, $area, 'img-circle', 48, 48); ?>
                    </div>
                    <h1><?= $area; ?></h1>
                    <i class="entypo-play icon-ver-atuacao"></i>
                </div>
                <?php
            endforeach;
        endif;
        ?>
    </div>
</div>



