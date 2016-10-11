<div class="main-panel">
    <div class="main-content">
        <div class="row">   


            <!--         Widget Montado (Cliente pode Escolher) -->
            <?php
            $Today = date('Y-m-d');
            $ReadDash = new Read;
            ?>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="widget bg-white">
                        <?php
                        $Views = new Read;
                        $Views->ExeRead('ws_siteviews', "WHERE siteviews_date = :today", "today={$Today}");
                        if ($Views->getResult()):
                            $CountViews = $Views->getResult()[0];
                        else:
                            $CountViews['siteviews_users'] = 0;
                        endif;
                        ?>
                        <div class="widget-icon bg-blue pull-right">
                            <i class="entypo-chart-line"></i>
                        </div>
                        <div class="overflow-hidden">
                            <span class="widget-title"><?= $CountViews['siteviews_users']; ?></span>
                            <span class="widget-subtitle">Visitas Hoje</span>
                        </div>
                    </div>
                </div>
                <?php
                $CheckMod = $ReadDash;
                $CheckMod->ExeRead('menu m', "WHERE m.case = :case AND m.ativo = :ativo", "case=noticias&ativo=true");
                if ($CheckMod->getResult()):
                    ?>
                    <div class="col-sm-6 col-md-3">
                        <div class="widget bg-white">
                            <?php
                            $News = new Read;
                            $News->FullRead("SELECT count(*) AS count FROM noticias");
                            $CountNews = $News->getResult()[0];
                            ?>
                            <div class="widget-icon bg-success pull-left fa fa-paper-plane">
                                <i class="fa fa-newspaper-o"></i>
                            </div>
                            <div class="overflow-hidden">
                                <span class="widget-title"><?= $CountNews['count']; ?></span>
                                <span class="widget-subtitle">Noticias Cadastradas</span>
                            </div>
                        </div>
                    </div>
                    <?php
                endif;

                $CheckMod->setPlaces("case=eventos&ativo=true");
                if ($CheckMod->getResult()):
                    ?>
                    <div class="col-sm-6 col-md-3">
                        <div class="widget bg-white">
                            <?php
                            $Events = new Read;
                            $Events->FullRead("SELECT count(*) AS count FROM eventos");
                            $CountEvents = $Events->getResult()[0];
                            ?>
                            <div class="widget-icon bg-warning pull-right">
                                <i class="entypo-calendar"></i>
                            </div>
                            <div class="overflow-hidden">
                                <span class="widget-title"><?= $CountEvents['count']; ?></span>
                                <span class="widget-subtitle">Eventos Cadastrados</span>
                            </div>
                        </div>
                    </div>
                    <?php
                endif;

                $CheckMod->setPlaces("case=videos&ativo=true");
                if ($CheckMod->getResult()):
                    ?>
                    <div class="col-sm-6 col-md-3">
                        <div class="widget bg-white">
                            <?php
                            $Videos = new Read;
                            $Videos->FullRead("SELECT count(*) AS count FROM videos");
                            $CountVideos = $Videos->getResult()[0];
                            ?>
                            <div class="widget-icon bg-danger pull-left">
                                <i class="entypo-video"></i>
                            </div>
                            <div class="overflow-hidden">
                                <span class="widget-title"><?= $CountVideos['count']; ?></span>
                                <span class="widget-subtitle">Videos Cadastrados</span>
                            </div>
                        </div>
                    </div>
                    <?php
                endif;
                $CheckMod->setPlaces("case=matriculas&ativo=true");
                if ($CheckMod->getResult()):
                    ?>
                    <div class="col-sm-6 col-md-3">
                        <div class="widget bg-white">
                            <?php
                            $Events = new Read;
                            $Events->FullRead("SELECT count(*) AS count FROM eventos");
                            $CountEvents = $Events->getResult()[0];
                            ?>
                            <div class="widget-icon bg-dark pull-left">
                                <i class="entypo-clipboard"></i>
                            </div>
                            <div class="overflow-hidden">
                                <span class="widget-title"><?= $CountEvents['count']; ?></span>
                                <span class="widget-subtitle">Matriculas Realizadas</span>
                            </div>
                        </div>
                    </div>
                    <?php
                endif;
                ?>
            </div>


            <div class="panel mb25">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="pull-left"></div>
                        <div class="panel-controls">
                            <a href="#" class="panel-collapse" data-toggle="panel-collapse">
                                <i class="panel-icon-chevron"></i>
                            </a>

                            <a href="#" class="panel-refresh" data-toggle="panel-refresh">
                                <i class="panel-icon-circular"></i>
                            </a>

                            <a href="#" class="panel-remove" data-toggle="panel-remove">
                                <i class="panel-icon-plus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body" style="">
                        <div class="widget bg-white">
                            <h3 class="text-info mt0 mb0 bold">Olá</h3>
                            <div class="small text-uppercase">Seja bem vindo <?= $userlogin['nome']; ?></div>
                            <small class="pt5">teste</small>
                        </div>
                    </div>
                </div>
            </div>




            <!--MÓDULOS ATIVOS-->

            <div class="panel mb25">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="pull-left"><b>Módulos Ativos</b><br>Todos Módulos Ativos</div>
                        <div class="panel-controls">
                            <a href="#" class="panel-collapse" data-toggle="panel-collapse">
                                <i class="panel-icon-chevron"></i>
                            </a>

                            <a href="#" class="panel-refresh" data-toggle="panel-refresh">
                                <i class="panel-icon-circular"></i>
                            </a>

                            <a href="#" class="panel-remove" data-toggle="panel-remove">
                                <i class="panel-icon-plus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="panel-body" style="">
                        <div class="col-sm-1 col-md-1">
                            <div class="widget bg-white">
                                <div class="widget-icon pull-left bg-dark entypo-window">

                                </div>
                                <p>Banner</p>
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="widget bg-white">
                                <div class="widget-icon  pull-left bg-dark entypo-mail">

                                </div>
                                <p>Contato</p>
                            </div>
                        </div>
                        <div class="col-sm-1 col-md-1">
                            <div class="widget bg-white">
                                <div class="widget-icon  pull-left entypo-docs">

                                </div>
                                <p>Cursos</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>






        </div>
    </div>
</div>