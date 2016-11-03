<?php
if ($Link->getData()):
extract($Link->getData());
$data = date('d/m/Y H:i', strtotime($data));
else:
header('Location: ' . HOME);
endif;
?>
<div class="main-noticia">
    <div class="main-titulo-content">
        <div class="main-header-content">
            <h1><?= $titulo; ?></h1>
            <h2><?= $subtitulo; ?></h2>
        </div>
        <div class="main-naveg">
            <ol class="breadcrumb">
                <li><a href="<?= HOME; ?>">Home</a></li>
                <li class="active">Visualizar</li>
            </ol>
        </div>
    </div>
    <div class="box-quem-somos">
        <div class="header_social">
            <a href="https://www.facebook.com/sharer/sharer.php?u=<?= HOME . '/noticia/' . $url_name; ?>" title="Compartilhar no Facebook" class="rds_facebook" target="_blank"><i class="entypo-facebook-squared"></i></a>
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
        </article>
    </div>
</div>








