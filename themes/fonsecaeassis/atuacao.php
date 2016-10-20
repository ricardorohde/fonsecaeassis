
<div class="box-conteudo-paginas">
    <div class="container">
        <div class="row">
            <div class="box-100">
                <h5 class="titulo-paginas">Áreas de Atuação</h5>
                <ol class="breadcrumb">
                    <li><a href="<?= HOME; ?>">Home</a></li>
                    <li class="active">Áreas de Atuação</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="box-100">
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
                                <h5 class="titulo-atuacao"><?= $area; ?></h5>
                                <i class="entypo-play icon-ver-atuacao"></i>
                            </div>
                            <?php
                        endforeach;
                    else:
                        WSErro('Ainda não temos nenhuma área de atuação cadastrada, aguarde...', WS_INFOR);
                    endif;
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>

