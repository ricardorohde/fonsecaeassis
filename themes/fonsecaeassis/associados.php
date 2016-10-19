
<div class="box-conteudo-paginas">
    <div class="container">
        <div class="row">
            <div class="box-100">
                <h5 class="titulo-paginas">Advogados Associados</h5>
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a></li>
                    <li class="active">Associados</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="box-100">
                <?php
                $ReadAssoc = new Read;
                $ReadAssoc->ExeRead('adv_associados', "WHERE nome != :n ORDER BY nome ASC", "n=''");
                if ($ReadAssoc->getResult()):
                    foreach ($ReadAssoc->getResult() AS $Assoc):
                        extract($Assoc);
                        ?>
                        <div class="box-associados">
                            <div class="box-conteudo-associados">
                                <div class="foto-associado">
                                    <?= Check::Image('uploads/' . $foto, $nome, 'img-circle', 162, 162) ?>
                                </div>
                                <div class="dados-associados">
                                    <h5 class="nome-associado"><?= $nome; ?></h5>
                                    <h6 class="oab-associado">OAB <?= $oab_reg . '/' . $oab_uf; ?></h6>
                                </div>
                            </div>
                        </div>
                        <?php
                    endforeach;
                else:
                    WSErro('Nenhum Associado cadastrado, aguarde...', WS_INFOR);
                endif;
                ?>
            </div>
        </div>
    </div>
</div>