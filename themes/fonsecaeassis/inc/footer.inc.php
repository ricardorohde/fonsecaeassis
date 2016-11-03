<!--RODAPE-->
<div class="line-horizontal"></div>
<div class="rodape">   
    <div class="social-icons">
        <a href="#"><i class="entypo-facebook-squared"></i></a>
        <a href="#"><i class="entypo-linkedin"></i></a>
        <h1>Links úteis</h1>
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
        <div class="logo-empresa">
            <a href="http://www.cwdigital.com.br/" target="_blank"><img src="<?= INCLUDE_PATH; ?>/images/logo-empresa.png"></a>
        </div>
        <p class="copyrigth">
            © 2016 - <?= $Empresa['empresa']; ?> 
        </p>
    </div>
</div>