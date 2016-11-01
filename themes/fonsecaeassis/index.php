<!-- ==== BANNER/SLIDE === -->
<div class="banner">
    <?php
    $datetime_now = date('Y-m-d H:i');
    $View = new View;
    $ReadMain = new Read;
    $banners = $ReadMain;
    $banners->ExeRead("banners", "WHERE tipo = :idtipo AND data_inicial <= CURRENT_DATE() AND data_final >= CURRENT_DATE() ORDER BY RAND()", "idtipo=1");
    if ($banners->getResult()):
        ?>
        <section class="wrapper-slide">
            <div class="flexslider">
                <ul class="slides">
                    <?php
                    foreach ($banners->getResult() as $bnr):
                        echo "<li>";
                        echo "<a href=\"{$bnr['link']}\" title=\"{$bnr['titulo']}\" target=\"_blank\">";
                        echo "<img alt=\"{$bnr['titulo']}\" title=\"{$bnr['titulo']}\" src=\"" . HOME . "/tim.php?src=" . HOME . "/uploads/{$bnr['banner']}&w=1920&h=640&zc=0\" class=\"banner\" />";
                        echo "</a>";
                        echo "</li>";
                    endforeach;
                    ?>
                </ul>
            </div>
        </section>
        <?php
    endif;
    ?>
</div>
<!--CONTEUDO-->
<div class="container">
    <!--BOX NOTICIAS-->
    <div class="main-noticias">
        <div class="main-header-content">
            <h1>Notícias</h1>
            <h2>Veja as principais noticías</h2>
        </div>
        <section id="slide">
            <ul>
                <?php
                $ReadNews = new Read;
                $ReadNews->ExeRead('noticias', "WHERE titulo != :tit AND categoria = :cat LIMIT :limit OFFSET :offset", "tit=''&cat=noticia&limit=5&offset=0");
                if ($ReadNews->getResult()):
                    foreach ($ReadNews->getResult() as $sNews):
                        ?>
                        <li>
                            <a href="<?= HOME . '/noticia/' . $sNews['url_name']; ?>" title="<?= $sNews['titulo']; ?>">
                                <img src="<?= HOME . '/tim.php?src=uploads/' . $sNews['foto'] . '&w=890&h=380'; ?>" title="<?= $sNews['titulo']; ?>" alt="<?= $sNews['titulo']; ?>">
                                <span><?= $sNews['titulo']; ?></span>
                            </a>
                        </li>
                        <?php
                    endforeach;
                endif;
                ?>
            </ul>
            <section id="buttons">
                <a href="#" class="icon-anterior prev"><img src="themes/fonsecaeassis/images/icon-l.png"></a>
                <a href="#" class="icon-proximo next"><img src="themes/fonsecaeassis/images/icon-r.png"></a>
            </section>
        </section>
        <div class="footer-noticias">
            <a href="<?= HOME . '/noticias' ?>" class="btn">Ver mais noticias</a>
        </div>
    </div>
    <!--BOX ARTIGOS-->
    <div class="main-artigo">
        <div class="main-header-content">
            <h1>Artigos</h1>
            <h2>Veja todos Artigos Publicados</h2>
        </div>
        <?php
        $ReadNews->setPlaces("tit=''&cat=artigo&limit=2&offset=0");
        if ($ReadNews->getResult()):
            foreach ($ReadNews->getResult() as $artigos):
                ?>
                <a href="<?= HOME . '/noticia/' . $artigos['url_name']; ?>" title="<?= $artigos['titulo']; ?>">
                    <div class="main-box-artigo">
                        <h1><?= Check::Words($artigos['titulo'], 10); ?></h1>
                        <h2><?= Check::Words($artigos['noticia'], 15); ?></h2>
                        <div class="dados-artigos">
                            <h1><?= 'Em ' . date('d/m/Y h:i', strtotime($artigos['data'])) . ' hrs'; ?></h1>
                            <h2><b>Autor/Fonte:</b> <?= $artigos['autor'] . ' / ' . $artigos['fonte']; ?></h2>
                        </div>
                    </div>
                </a>
                <?php
            endforeach;
        endif;
        ?>
        <?php
        $ReadNews->setPlaces("tit=''&cat=artigo&limit=2&offset=2");
        if ($ReadNews->getResult()):
            foreach ($ReadNews->getResult() as $artigos):
                ?>
                <a href="<?= HOME . '/noticia/' . $artigos['url_name']; ?>" title="<?= $artigos['titulo']; ?>">
                    <div class="main-box-artigo">
                        <h1><?= Check::Words($artigos['titulo'], 10); ?></h1>
                        <h2><?= Check::Words($artigos['noticia'], 15); ?></h2>
                        <div class="dados-artigos">
                            <h1><?= 'Em ' . date('d/m/Y h:i', strtotime($artigos['data'])) . ' hrs'; ?></h1>
                            <h2><b>Autor/Fonte:</b> <?= $artigos['autor'] . ' / ' . $artigos['fonte']; ?></h2>
                        </div>
                    </div>
                </a>
                <?php
            endforeach;
        endif;
        ?>
        <div class="footer-artigos">
            <a href="<?= HOME . '/artigos' ?>" class="btn btn-artigos">Ver mais artigos</a>
        </div>
    </div>
    <div class="line"></div>
    <!--BOX PUBLICAÇÕES-->
    <div class="main-publicacao">
        <div class="main-header-content">
            <h1>Publicações</h1>
            <h2>Em destaque</h2>
        </div>
        <div class="blc-publicacoes">
            <?php
            $ReadNews->setPlaces("tit=''&cat=publicacao&limit=2&offset=0");
            if ($ReadNews->getResult()):
                foreach ($ReadNews->getResult() as $publicacao):
                    ?>
                    <a href="<?= HOME . '/noticia/' . $publicacao['url_name']; ?>" title="<?= $publicacao['titulo']; ?>">
                        <div class="box-publicacoes">
                            <div class="capa-publicacoes">
                                <?= Check::Image("uploads/{$publicacao['foto']}", $publicacao['titulo'], NULL, 225, 130); ?>
                            </div>
                            <div class="dados-publicacao">
                                <h1><?= Check::Words($publicacao['titulo'], 10); ?></h1>
                                <h2><?= Check::Words($publicacao['noticia'], 15); ?></h2>
                                <h3><?= 'Em ' . date('d/m/Y h:i', strtotime($publicacao['data'])) . ' hrs'; ?></h3>
                                <h4><b>Autor/Fonte:</b> <?= $publicacao['autor'] . ' / ' . $publicacao['fonte']; ?></h4>
                            </div>
                        </div>
                    </a>
                    <?php
                endforeach;
            else:
                WSErro('Ainda não há nenhuma publicação cadastrada.', WS_INFOR);
            endif;
            ?>
        </div>
        <div class="footer-publicacoes">
            <a href="<?= HOME . '/publicacoes' ?>" class="btn">Ver mais Publicações</a>
        </div>
    </div>
    <!--BOX ATUAÇÕES-->
    <div class="main-atuacoes">
        <div class="main-header-content">
            <h1>Áreas de Atuação</h1>
            <h2>Onde Atuamos</h2>
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
<!--BTN TRABALHE CONOSCO-->
    <div class="main-btn-trabalhe">
        <div class="btn-trabalhe-conosco">
            <h1>Trabalhe conosco</h1>
            <h2>Junte-se a nós</h2>
        </div>
    </div>
</div>