<?php
if ($Link->getData()):
    extract($Link->getData());
    $data = date('d/m/Y H:i', strtotime($data));
else:
    header('Location: ' . HOME);
endif;
?>
<div class="box-conteudo-paginas">    
    <div class="container">
        <div class="row">
            <div class="box-100">
                <h5 class="titulo-paginas"><?= $titulo; ?></h5>
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a></li>
                    <li class="active"><?= $subtitulo; ?></li>
                </ol>
                <div class="header_social">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=<?= HOME . '/noticia/' . $url_name; ?>" title="Compartilhar no Facebook" class="rds_facebook" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
                    <a href="https://twitter.com/home?status=<?= HOME . '/noticia/' . $url_name; ?>" title="Compartilhar no Twitter" class="rds_twitter" target="_blank"><i class="fa fa-twitter-square fa-2x"></i></a>
                    <a href="https://plus.google.com/share?url=<?= HOME . '/noticia/' . $url_name; ?>" title="Compartilhar no Google+" class="rds_googleplus" target="_blank"><i class="fa fa-google-plus-square fa-2x"></i></a>
                    <a href="whatsapp://send?text=<?= $titulo . ' ' . HOME . '/noticia/' . $url_name; ?>" title="Compartilhar no Whatsapp" class="rds_whatsapp"><i class="fa fa-whatsapp fa-2x"></i></a>
                    <a href="<?= INCLUDE_PATH . '/print.php?url_name=' . $url_name ?>" target="_blank" title="Imprimir Notícia" id="print" class="rds_print"><i class="fa fa-print fa-2x"></i> Imprimir</a>
                </div>
                <div class="header_infonews">
                    <?php if (!empty($data)) : ?><div class="data"><b>Data:</b> <?= $data; ?> hrs</div><?php endif; ?>
                    <?php if (!empty($fonte)) : ?><div class="fonte"><b>Fonte:</b> <?= $fonte; ?></div><?php endif; ?>
                    <?php if (!empty($autor)) : ?><div class="autor"><b>Autor:</b> <?= $autor; ?></div><?php endif; ?>
                </div>
                <article class="content_pag">
                    <div class="article_news_chars"><?= $noticia; ?></div>
                    <?php if (!empty($foto)): ?>
                        <figure class="article_news_image">
                            <a href="<?= HOME . '/uploads/' . $foto; ?>">
                                <img alt="<?= $titulo; ?>" title="<?= $titulo; ?>" src="<?= HOME . '/tim.php?src=uploads/' . $foto . '&w=870&zc=0'; ?>"/>
                            </a>
                        </figure>
                        <?php
                    endif;

                    //Video
                    if (!empty($video)):
                        ?>
                        <div class="article_news_morenews">
                            <header class="header_morenews">
                                <h1 class="header_morenews_vin">Veja o vídeo abaixo:</h1>
                            </header>
                            <div class="content_morenews">
                                <div class="frameBox">
                                    <div class="ratio16">
                                        <iframe class="ratio_element"  width="100%" height="100%" src="https://www.youtube.com/embed/<?= Check::ytVideo($video); ?>" frameborder="0" allowfullscreen></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php
                    endif;
                    //Outras Fotos
                    $OutrasFotos = new Read;
                    $OutrasFotos->ExeRead("banco_fotos", "WHERE id_tipo = :idtipo AND tipo = :tipo ORDER BY ordem ASC", "idtipo={$id}&tipo=N");
                    if ($OutrasFotos->getResult()):
                        ?>
                        <div class="article_news_moreimg">
                            <?php
                            foreach ($OutrasFotos->getResult() as $fotos):
                                echo '<div class="boxfotos">';
                                echo '<img alt="' . $titulo . '" title="' . $titulo . '" src="' . HOME . '/tim.php?src=uploads/' . $fotos['foto'] . '&w=870"/>';
                                echo '<p>' . $fotos['legenda'] . '</p>';
                                echo '</div>';
                            endforeach;
                            ?>
                        </div>
                        <?php
                    endif;
                    ?>
                    <div class="article_news_morenews">
                        <header class="header_morenews">
                            <h2 class="header_morenews_vin">Outros</h2>
                        </header>
                        <div class="content_morenews">
                            <?php
                            $ReadMoreNews = new Read;
                            $ReadMoreNews->ExeRead('noticias', "WHERE titulo != :titulo AND categoria = :categoria AND id != :id AND foto != :foto ORDER BY id DESC LIMIT :limit", "titulo=''&categoria={$categoria}&id={$id}&foto=''&limit=4");
                            if ($ReadMoreNews->getResult()):
                                foreach ($ReadMoreNews->getResult() as $n):
                                    $n['titulo'] = Check::Words($n['titulo'], 16);
                                    $n['noticia'] = Check::Words(strip_tags($n['noticia']), 36);
                                    $n['data'] = date('d/m/Y H:i', strtotime($n['data']));
                                    ?>
                                    <div class="box_morenews">
                                        <a href="<?= HOME . '/noticia/' . $n['url_name']; ?>">
                                            <div class="morenews_img"><img alt="<?= $n['titulo']; ?>" title="<?= $n['titulo']; ?>" src="<?= HOME . '/tim.php?src=uploads/' . $n['foto'] . '&w=380&h=180'; ?>"/></div>
                                            <div class="morenews_dados">
                                                <div class="morenews_datetime"><i class="fa fa-calendar"></i> <?= $n['data']; ?> hrs</div>
                                                <div class="morenews_title"><?= $n['titulo']; ?></div>
                                            </div>
                                        </a>
                                    </div>
                                    <?php
                                endforeach;
                            endif;
                            ?>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</div>



