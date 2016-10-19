<!--RODAPE-->
<div class="footer">
    <div class="line-horizontal"></div>
    <div class="container">
        <div class="row">
            <div class="box-1-footer">
                <div class=" logo-footer">
                    <a href="<?= HOME; ?>" title="<?= $Empresa['empresa']; ?>"><img src="themes/fonsecaeassis/images/logo-footer.png"></a>
                </div>
                <div class="line-vertical-footer"></div>
                <p class="telefone-footer"><?= $Empresa['telefone']; ?></p>
                <p class="endereco-footer"><?= $Empresa['logradouro'] . ', ' . $Empresa['numero'] . ' - ' . $Empresa['bairro'] . ' - ' . $Empresa['cidade'] . '-' . $Empresa['uf']; ?></p>
                <p class="cnpj-footer">CNPJ 01.971.231/0001-05</p>
            </div>
            <div class="box-2-footer">
                <h5 class="btn-footer">Siga-Nos <i class="entypo-facebook-squared btn-person"></i></h5>
                <h5 class="btn-footer">Links Úteis <i class="entypo-link btn-person"></i></h5>
                <ul class="links-uteis">
                    <?php
                    $ReadLinks = new Read;
                    $ReadLinks->ExeRead('links', "WHERE titulo != :t ORDER BY id DESC", "t=''");
                    if ($ReadLinks->getResult()):
                        foreach ($ReadLinks->getResult() AS $Links):
                            echo "<li><a href=\"{$Links['link']}\" target=\"_blank\">{$Links['titulo']}</a></li>";
                        endforeach;
                    endif;
                    ?>

                </ul>
                <a href="<?= HOME; ?>"><h5 class="btn-footer btn-inicio">Inicio <i class="entypo-up-dir btn-person"></i></h5></a>
            </div>
            <div class="box-3-footer">
                <div class=" logo-empresa">
                    <a href="http://www.creativewebsites.com.br/" target="_blank"><img src="themes/fonsecaeassis/images/logo-empresa.png"></a>
                </div>
            </div>
        </div>
        <hr>
        <p class="dados-footer">© 2016 - <?= $Empresa['empresa']; ?></p>
    </div>
</div>