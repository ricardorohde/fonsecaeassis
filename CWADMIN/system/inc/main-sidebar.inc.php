
<div class="sidebar-panel offscreen-left">
    <div class="brand">
        <div class="brand-logo">
            <img src="dist/images/logo.png" height="28" alt="">
        </div>


        <a href="javascript:;" class="toggle-sidebar hidden-xs hamburger-icon v3" data-toggle="layout-small-menu">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </a>
    </div>



    <nav role="navigation">
        <ul class="nav">
            <br><br>
            <li <?= empty($getexe) ? 'class="active"' : '' ?>>
                <a href="painel.php">
                    <i class="fa fa-toggle-on"></i> <span>Dashboard</span>
                </a>
            </li>
            <li>

            </li>

            <?php
            //SQL Menu
            $menu = new Read;
            $menu->ExeRead('menu', "WHERE id_menu_tipo = :tm AND ativo = :ativo ORDER BY titulo ASC", "tm=1&ativo=true");
            if ($menu->getResult()):
                foreach ($menu->getResult() as $mn):
                    $idMenu = $mn['id_menu'];
                    $case = explode('/', $getexe);
                    ?>
                    <li class="treeview <?= $case[0] == $mn['case'] ? 'active' : ''; ?>">
                        <a href="javascript:;">
                            <i class="fa <?= $mn['ico_menu']; ?>"></i>
                            <span><?= $mn['titulo']; ?></span>    
                        </a>
                        <ul class="sub-menu" >
                            <?php
                            //SQL Sub Menu
                            $subMenu = new Read;
                            $subMenu->ExeRead("menu_sub", "WHERE id_menu = :idmenu ORDER BY id_menu_sub ASC", "idmenu={$idMenu}");
                            if ($subMenu->getResult()):
                                foreach ($subMenu->getResult() as $sm):
                                    $idSubMenu = $sm['id_menu_sub'];

                                    //SQL Nav Sub Menu
                                    $navSubMenu = new Read;
                                    $navSubMenu->ExeRead("menu_sub_nav", "WHERE id_menu_sub = :idsubmenu ORDER BY id_menu_sub ASC", "idsubmenu={$idSubMenu}");
                                    if ($navSubMenu->getResult()):
                                        ?>
                                        <li>
                                            <a href="#"><i class="fa <?= $sm['ico_menu']; ?>"></i><?= $sm['titulo']; ?><i class="     "></i></a>
                                            <ul class="sub-menu">
                                                <?php
                                                foreach ($navSubMenu->getResult() as $nsm):
                                                    ?>
                                                    <li><a href="painel.php?exe=<?= $nsm['case'] . '/' . $nsm['pagina'] ?>"><i class="fa <?= $nsm['ico_menu'] ?>"></i><?= $nsm['titulo']; ?></a></li>
                                                    <?php
                                                endforeach;
                                                ?>
                                            </ul>
                                        </li>
                                        <?php
                                    else:
                                        ?>
                                        <li <?= $getexe == $sm['case'] . '/' . $sm['pagina'] ? 'class="active"' : ''; ?>>
                                            <a href="painel.php?exe=<?= $sm['case'] . '/' . $sm['pagina'] ?>"><i class="fa <?= $sm['ico_menu'] ?>"></i> <?= $sm['titulo']; ?></a>
                                        </li>
                                    <?php
                                    endif;
                                endforeach;
                            endif;
                            ?>
                        </ul>
                    </li>
                    <?php
                endforeach;
            endif;
            ?>






        </ul>
    </nav>

</div>