<div class="quick-launch-panel">
    <div class="container">
        <div class="quick-launcher-inner">
            <a href="javascript:;" class="close" data-toggle="quick-launch-panel">×</a>
            <div class="css-table-xs">

                <div class="col">
                    <a href="#">
                        <i class="entypo-layout"></i>
                        <span>Ainda não temos nada aqui!</span>
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>




<div class="main-panel">
    <header class="header navbar">
        <div class="brand visible-xs">
            <div class="toggle-offscreen">
                <a href="#" class="hamburger-icon visible-xs" data-toggle="offscreen" data-move="ltr">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
            </div>
            <div class="brand-logo">
                <img src="dist/images/logo-dark.png" height="25" alt="">
            </div>
            <div class="toggle-chat">
                <a href="javascript:;" class="hamburger-icon v2 visible-xs" data-toggle="layout-chat-open">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
            </div>
        </div>
        <ul class="nav navbar-nav hidden-xs">
            <li>
                <p class="navbar-text">
                    <i class="entypo-clock"> </i>
                    <small>28 de Agosto de 2016 - <b>12:00</b></small> 
                </p>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right hidden-xs">
            <li>
                <a href="javascript:;" data-toggle="quick-launch-panel">
                    <i class="fa fa-circle-thin"></i>
                </a>
            </li>

            <li>
                <a href="javascript:;" data-toggle="dropdown">
                    <i class="fa fa-bell-o"></i>
                    <div class="status bg-danger border-danger animated bounce"></div>
                </a>
                <ul class="dropdown-menu notifications">
                    <li class="notifications-header">
                        <p class="text-muted small">Notificações</p>
                    </li>
                    <li>
                        <ul class="notifications-list">
                            <li>
                                <a href="javascript:;">
                                    <span class="pull-left mt2 mr15">
                                        <img src="dist/images/avatar.jpg" class="avatar avatar-xs img-circle" alt="">
                                    </span>
                                    <div class="overflow-hidden">
                                        <span>Titulo Notificações</span>
                                        <span class="time">há 2 minutos</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <div class="pull-left mt2 mr15">
                                        <div class="circle-icon bg-danger">
                                            <i class="fa fa-chain-broken"></i>
                                        </div>
                                    </div>
                                    <div class="overflow-hidden">
                                        <span>Você Possui débitos em Aberto</span>
                                        <span class="time">Clique para gerar o boleto</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                            </li>
                        </ul>
                    </li>
                    <li class="notifications-footer">
                        <a href="javascript:;">Limpar Notificações</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="dropdown">
                    <img src="../uploads/<?= $userlogin['foto']; ?>" class="header-avatar img-circle ml10" height="32" alt="user" title="user">
                    <span class="pull-left"><?= $userlogin['nome']; ?></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="painel.php?exe=usuarios/editar&id=">Conta</a>
                    </li>
                    <li>
                        <a href="javascript:;">Configurações Gerais</a>
                    </li>
                    <li>
                    </li>
                    <li>
                        <a href="javascript:;">Ajuda</a>
                    </li>
                    <li>
                        <a href="painel.php?logoff=true">Sair</a>
                    </li>
                </ul>

            </li>

            <li>
                <a href="javascript:;" class="hamburger-icon v2" data-toggle="layout-chat-open">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
            </li>
        </ul>
    </header>
</div>