<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb">
            <li><a href="painel.php"><i class="entypo-layout"></i> Home</a></li>
            <li><a href="painel.php?exe=clientes/listar"><i class="entypo-user"></i> Clientes</a></li>
            <li class="active">Clientes</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>Clientes</h4> 
                <small>Exibindo todos Clientes</small>
            </div>
            <div class="panel-body">
                <section class="content">
                    <a href="painel.php?exe=clientes/cadastrar">
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

                            require('_models/AdminCliente.class.php');
                            $readAcao = new AdminCliente;

                            $readMsg = new Read;
                            $readMsg->ExeRead('clientes', "WHERE id = :id", "id={$acaoId}");
                            switch ($acao):
                                case 'cadastrar':
                                    $msg = $readMsg->getResult()[0];
                                    WSErro("O usuário <b>{$msg['fantasia']}</b> foi cadastrado com sucesso!", WS_ACCEPT);
                                    break;
                                case 'editar':
                                    $msg = $readMsg->getResult()[0];
                                    WSErro("O usuário <b>{$msg['fantasia']}</b> foi atualizado com sucesso!", WS_ACCEPT);
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
                                                <th>Código</th>
                                                <th>Fantasia</th>
                                                <th>Razão Social</th>
                                                <th>Situação</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $readUser = new Read;
                                            $readUser->ExeRead("clientes", "WHERE fantasia != :l", "l= ''");
                                            if (!$readUser->getResult()):

                                            else:
                                                foreach ($readUser->getResult() as $user):
                                                    ?>
                                                    <tr>
                                                        <td><?= $user['id']; ?></td>
                                                        <td><?= $user['fantasia']; ?></td>
                                                        <td><?= $user['razao_social']; ?></td>
                                                        <td><?= $user['situacao']==1 ? 'Ativo' : 'Inativo'; ?></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <a href="painel.php?exe=clientes/editar&id=<?= $user['id']; ?>" class="btn btn-default btn-outline btn-sm mr5"><b class="entypo-pencil"></b> Editar</a>
                                                                <a href="painel.php?exe=clientes/listar&acao=excluir&id=<?= $user['id']; ?>" class="btn btn-danger btn-outline   btn-sm  mr5 "><b class="entypo-cancel"></b> Excluir</a>
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
</div>















