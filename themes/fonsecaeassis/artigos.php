<div class="main-artigos">
    <div class="main-titulo-content">
        <div class="main-header-content">
            <h1>Artigos</h1>
            <h2>Artigos Publicados</h2>
        </div>
        <div class="main-naveg">
            <ol class="breadcrumb">
                <li><a href="<?= HOME; ?>">Home</a></li>
                <li class="active">Artigos</li>
            </ol>
        </div>

        <div class="busca">
            <?php
            $buscar = filter_input(INPUT_POST, 's', FILTER_DEFAULT);
            if (!empty($buscar)):
                $buscar = strip_tags(trim(urlencode($buscar)));
                header('Location: ' . HOME . '/artigos/busca/' . $buscar);
            endif;
            ?>
            <form name="search" action="" method="post">
                <input class="fls" type="text" name="s" />
                <input class="btn" type="submit" name="sendsearch" value="Buscar" />
            </form>
        </div>
    </div>
    <div class="main-box-artigos">
        <?php
        $search = !empty($Link->getLocal()[2]) ? $Link->getLocal()[2] : null;
        if (!empty($search)):
            //Se tiver Busca
            $getPage = (!empty($Link->getlocal()[3]) ? $Link->getlocal()[3] : 1);
            $Pager = new Pager(HOME . "/artigos/busca/{$search}/");
            $Pager->ExePager($getPage, 10);

            $Where = "WHERE titulo != :titulo AND categoria = :cat AND (titulo LIKE '%' :search '%') ORDER BY data DESC LIMIT :limit OFFSET :offset";
            $Places = "titulo=''&cat=artigo&search={$search}&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}";

            $WherePag = "WHERE titulo != :t AND categoria = :cat AND (titulo LIKE '%' :search '%') ORDER BY id DESC";
            $PlacesPag = "t=''&cat=artigo&search={$search}";
        else:
            //Quando não tem busca
            $getPage = (!empty($Link->getlocal()[1]) ? $Link->getlocal()[1] : 1);
            $Pager = new Pager(HOME . "/artigos/");
            $Pager->ExePager($getPage, 10);

            $Where = "WHERE titulo != :titulo AND categoria = :cat ORDER BY data DESC LIMIT :limit OFFSET :offset";
            $Places = "titulo=''&cat=artigo&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}";

            $WherePag = "WHERE titulo != :t AND categoria = :cat ORDER BY id DESC";
            $PlacesPag = "t=''&cat=artigo";
        endif;

        $ReadNewsAll = new Read;
        $ReadNewsAll->ExeRead('noticias', $Where, $Places);

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
            $Pager->ExePaginator('noticias', $WherePag, $PlacesPag);
            echo $Pager->getPaginator();
            echo '</nav>';
        endif;
        ?>
    </div>
</div>
