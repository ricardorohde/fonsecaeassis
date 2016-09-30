<!--<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb">
            <li><a href="painel.php"><i class="entypo-layout"></i> Home</a></li>
            <li><a href="painel.php?exe=usuarios/listar"><i class="entypo-user"></i> Usuários</a></li>
            <li class="active">Listar Usuários</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>Usuários</h4> 
                <small>Exibindo todos Usuários Cadastrados</small>
            </div>
            <div class="panel-body">
                <section class="content">
                    <a href="painel.php?exe=usuarios/cadastrar">
                        <button type="button" class="btn btn-green btn-icon btn-success">
                            Novo
                            <i class="entypo-plus"></i>
                        </button>
                        <br>
                    </a>
                    <div class="row">
                        <div class="col-xs-12">
                            <br>
<?php
$acao = filter_input(INPUT_GET, 'acao', FILTER_SANITIZE_STRING);
$acaoId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

require('_models/AdminUser.class.php');
$readAcao = new AdminUser;

$readMsg = new Read;
$readMsg->ExeRead('usuarios', "WHERE id = :id", "id={$acaoId}");
switch ($acao):
    case 'cadastrar':
        $msg = $readMsg->getResult()[0];
        WSErro("O usuário <b>{$msg['login']}</b> foi cadastrado com sucesso!", WS_ACCEPT);
        break;
    case 'editar':
        $msg = $readMsg->getResult()[0];
        WSErro("O usuário <b>{$msg['login']}</b> foi atualizado com sucesso!", WS_ACCEPT);
        break;
    case 'excluir':
        $readAcao->ExeDelete($acaoId);
        WSErro($readAcao->getError()[0], $readAcao->getError()[1]);
        break;
endswitch;
?>
                            <div class="box box-primary">
                                <div class="box-body">
                                    <table id="tableView" class="table mb0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Nome</th>
                                                <th>E-mail</th>
                                                <th>Login</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
<?php
$readUser = new Read;
$readUser->ExeRead("usuarios", "WHERE login != :l", "l= ''");
if (!$readUser->getResult()):

else:
    foreach ($readUser->getResult() as $user):
        ?>
                                                                                                                    <tr>
                                                                                                                        <td><?= $user['id']; ?></td>
                                                                                                                        <td><?= $user['nome']; ?></td>
                                                                                                                        <td><?= $user['email']; ?></td>
                                                                                                                        <td><?= $user['login']; ?></td>
                                                                                                                        <td>
                                                                                                                            <div class="btn-group">
                                                                                                                                <a href="painel.php?exe=usuarios/editar&id=<?= $user['id']; ?>" class="btn btn-default btn-outline btn-sm mr5"><b class="entypo-pencil"></b> Editar</a>
                                                                                                                                <a href="painel.php?exe=usuarios/listar&acao=excluir&id=<?= $user['id']; ?>" class="btn btn-danger btn-outline   btn-sm  mr5 "><b class="entypo-cancel"></b> Excluir</a>
                                                                                                                            </div>                                           
                                                                                                                        </td>
                                                                                                                    </tr>
        <?php
    endforeach;
endif;
?>
                                    </table>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>-->



<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb">
            <li><a href="painel.php"><i class="entypo-layout"></i> Home</a></li>
            <li><a href="painel.php?exe=usuarios/listar"><i class="entypo-user"></i> Usuários</a></li>
            <li class="active">Listar Usuários</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>Usuários</h4> 
                <small>Exibindo todos Usuários Cadastrados</small>
            </div>
            <div class="panel-body">
                <section class="content">
                    <a href="painel.php?exe=usuarios/cadastrar">
                        <button type="button" class="btn btn-green btn-icon btn-success">
                            Novo
                            <i class="entypo-plus"></i>
                        </button>
                        <br>
                    </a>
                    <div class="row">
                        <div class="col-xs-12">
                            <br>



                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget bg-white no-padding">
                <a href="javascript:;" class="block text-center relative p15">
                    <img src="dist/images/indsp.gif" class="avatar avatar-lg " alt="150">
                    <div class="h6 mb0"><strong>Titulo da Noticia Cadastrada...</strong>
                    </div>
                </a>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget bg-white">
                            <div class="text-black h5 mt0 mb0">01/01/2016</div>
                            <div class="small text-uppercase">Marco Marcos</div>
                            <div class="absolute tp rt pt15 pr15">
                                <div class="text-black">
                                    <i class="fa fa-cog"></i>
                                    <span></span>
                                </div>
                            </div>
                            <p class="pt5 text-muted small">Utilize as opções para editar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget bg-white no-padding">
                <a href="javascript:;" class="block text-center relative p15">
                    <img src="dist/images/indsp.gif" class="avatar avatar-lg " alt="150">
                    <div class="h6 mb0"><strong>Titulo da Noticia Cadastrada...</strong>
                    </div>
                </a>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget bg-white">
                            <div class="text-black h5 mt0 mb0">01/01/2016</div>
                            <div class="small text-uppercase">Marco Marcos</div>
                            <div class="absolute tp rt pt15 pr15">
                                <div class="text-black">
                                    <i class="fa fa-cog"></i>
                                    <span></span>
                                </div>
                            </div>
                            <p class="pt5 text-muted small">Utilize as opções para editar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget bg-white no-padding">
                <a href="javascript:;" class="block text-center relative p15">
                    <img src="dist/images/indsp.gif" class="avatar avatar-lg " alt="150">
                    <div class="h6 mb0"><strong>Titulo da Noticia Cadastrada...</strong>
                    </div>
                </a>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget bg-white">
                            <div class="text-black h5 mt0 mb0">01/01/2016</div>
                            <div class="small text-uppercase">Marco Marcos</div>
                            <div class="absolute tp rt pt15 pr15">
                                <div class="text-black">
                                    <i class="fa fa-cog"></i>
                                    <span></span>
                                </div>
                            </div>
                            <p class="pt5 text-muted small">Utilize as opções para editar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget bg-white no-padding">
                <a href="javascript:;" class="block text-center relative p15">
                    <img src="dist/images/indsp.gif" class="avatar avatar-lg " alt="150">
                    <div class="h6 mb0"><strong>Titulo da Noticia Cadastrada...</strong>
                    </div>
                </a>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget bg-white">
                            <div class="text-black h5 mt0 mb0">01/01/2016</div>
                            <div class="small text-uppercase">Marco Marcos</div>
                            <div class="absolute tp rt pt15 pr15">
                                <div class="text-black">
                                    <i class="fa fa-cog"></i>
                                    <span></span>
                                </div>
                            </div>
                            <p class="pt5 text-muted small">Utilize as opções para editar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget bg-white no-padding">
                <a href="javascript:;" class="block text-center relative p15">
                    <img src="dist/images/indsp.gif" class="avatar avatar-lg " alt="150">
                    <div class="h6 mb0"><strong>Titulo da Noticia Cadastrada...</strong>
                    </div>
                </a>
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget bg-white">
                            <div class="text-black h5 mt0 mb0">01/01/2016</div>
                            <div class="small text-uppercase">Marco Marcos</div>
                            <div class="absolute tp rt pt15 pr15">
                                <div class="text-black">
                                    <i class="fa fa-cog"></i>
                                    <span></span>
                                </div>
                            </div>
                            <p class="pt5 text-muted small">Utilize as opções para editar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





















