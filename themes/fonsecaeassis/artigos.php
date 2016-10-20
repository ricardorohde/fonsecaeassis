
<div class="box-conteudo-paginas">
    <div class="container">
        <div class="row">
            <div class="box-100">
                <h5 class="titulo-paginas">Artigos</h5>
                <ol class="breadcrumb">
                    <li><a href="<?= HOME; ?>">Home</a></li>
                    <li class="active">Artigos</li>
                </ol>
                <div class="row">
                    <div class="busca">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Buscar..." aria-describedby="basic-addon1">
                            <span class="input-group-addon" id="basic-addon1"><i class="entypo-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="box-artigos">
                <?php
                $getPage = (!empty($Link->getlocal()[1]) ? $Link->getlocal()[1] : 1);
                $Pager = new Pager(HOME . '/artigos/');
                $Pager->ExePager($getPage, 10);

                $ReadNewsAll = new Read;
                $ReadNewsAll->ExeRead('noticias n', "WHERE titulo != :titulo AND categoria = :cat ORDER BY data DESC LIMIT :limit OFFSET :offset", "titulo=''&cat=artigo&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");

                if (!$ReadNewsAll->getResult()):
                    WSErro('Ainda não temos nenhum artigo cadastrado, aguarde...', WS_INFOR);
                else:
                    $View = new View;
                    $tpl_noticias = $View->Load('noticias');
                    echo '<div class="row">';
                    foreach ($ReadNewsAll->getResult() as $n):
                        $n['titulo'] = Check::Words($n['titulo'], 16);
                        $n['noticia'] = Check::Words(strip_tags($n['noticia']), 36);
                        $n['data'] = date('d/m/Y H:i', strtotime($n['data']));
                        $View->Show($n, $tpl_noticias);
                    endforeach;
                    echo '</div>';
                    echo '<nav aria-label="Page navigation">';
                    $Pager->ExePaginator('noticias', "WHERE titulo != :t AND categoria = :cat ORDER BY id DESC", "t=''&cat=artigo");
                    echo $Pager->getPaginator();
                    echo '</nav>';
                endif;
                ?>
            </div>
        </div>
    </div>
</div>
</div>