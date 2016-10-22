<!-- SLIDE -->
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
<div class="box">
    <div class="container">
        <div class="row">
            <!--BOX NOTICIAS-->
            <div class="box-50">
                <div class="box-noticias">
                    <div class="line-vertical"></div>
                    <h3 class="titulo-noticias">Notícias</h3><br>
                    <h5 class="subtitulo-noticias">Veja as principais noticías</h5>

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
                        <a href="<?= HOME . '/noticias' ?>" class="btn btn-mais-noticias">Ver mais noticias</a>
                    </div>
                </div>
            </div>
            <!--BOX ARTIGOS-->
            <div class="col-md-6">
                <div class="box-artigos">
                    <div class="line-vertical"></div>
                    <h3 class="titulo-artigos">Artigos</h3><br>
                    <h5 class="subtitulo-artigos">Veja todos Artigos Publicados</h5>
                    <div class="row">
                        <?php
                        $ReadNews->setPlaces("tit=''&cat=artigo&limit=4&offset=0");
                        if ($ReadNews->getResult()):
                            foreach ($ReadNews->getResult() as $artigos):
                                ?>
                                <a href="<?= HOME . '/noticia/' . $artigos['url_name']; ?>" title="<?= $artigos['titulo']; ?>">
                                    <div class="col-md-6">
                                        <h5 class="titulo-artigo"><?= Check::Words($artigos['titulo'], 10); ?></h5>
                                        <h6 class="texto-artigo"><?= Check::Words($artigos['noticia'], 15); ?></h6>
                                        <div class="dados-artigos">
                                            <h6 class="data-artigo"><?= 'Em ' . date('d/m/Y h:i', strtotime($artigos['data'])) . ' hrs'; ?></h6>
                                            <h6><b>Autor/Fonte:</b> <?= $artigos['autor'] . ' / ' . $artigos['fonte']; ?></h6>
                                        </div>
                                    </div>
                                </a>
                                <?php
                            endforeach;
                        endif;
                        ?>
                    </div>
                    <hr>
                    <div class="row">
                        <?php
                        $ReadNews->setPlaces("tit=''&cat=artigo&limit=2&offset=4");
                        if ($ReadNews->getResult()):
                            foreach ($ReadNews->getResult() as $artigos):
                                ?>
                                <a href="<?= HOME . '/noticia/' . $artigos['url_name']; ?>" title="<?= $artigos['titulo']; ?>">
                                    <div class="col-md-6">
                                        <h5 class="titulo-artigo"><?= Check::Words($artigos['titulo'], 10); ?></h5>
                                        <h6 class="texto-artigo"><?= Check::Words($artigos['noticia'], 15); ?></h6>
                                        <div class="dados-artigos">
                                            <h6 class="data-artigo"><?= 'Em ' . date('d/m/Y h:i', strtotime($artigos['data'])) . ' hrs'; ?></h6>
                                            <h6><b>Autor/Fonte:</b> <?= $artigos['autor'] . ' / ' . $artigos['fonte']; ?></h6>
                                        </div>
                                    </div>
                                </a>
                                <?php
                            endforeach;
                        endif;
                        ?>
                        <a href="<?= HOME . '/artigos' ?>" class="btn btn-mais-artigos">Ver mais artigos</a>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="publicacao-header">
                <h3 class="titulo-publicacoes">Publicações</h3><br>
                <h5 class="subtitulo-publicacoes">Em destaque</h5>
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
                                    <h5 class="titulo-publicacao"><?= Check::Words($publicacao['titulo'], 10); ?></h5>
                                    <h6 class="texto-publicacao"><?= Check::Words($publicacao['noticia'], 15); ?></h6>
                                    <h6 class="data-publicacao"><?= 'Em ' . date('d/m/Y h:i', strtotime($publicacao['data'])) . ' hrs'; ?></h6>
                                    <h6 class="autor-publicacao"><b>Autor/Fonte:</b> <?= $publicacao['autor'] . ' / ' . $publicacao['fonte']; ?></h6>
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
            <a href="<?= HOME . '/publicacoes' ?>" class="btn btn-mais-publicacoes">Ver mais Publicações</a>
        </div>
        <hr>
        <div class="row">
            <div class="box-100">
                <div class="line-vertical"></div>
                <h3 class="titulo-area-de-atuacao">Áreas de Atuação</h3><br>
                <h5 class="subtitulo-area-de-atuacao">Onde Atuamos</h5>
                <div class="box-atuacoes">
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
                        endif;
                        ?>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="btn-trabalhe-conosco">
                <h5 class="titulo-btn-trabalhe">Trabalhe conosco</h5>
                <h6 class="subtitulo-btn-trabalhe">Junte-se a nós</h6>
            </div>
        </div>
    </div>
</div>