<?php
//Configurações
$exe = filter_input(INPUT_GET, 'exe');
$case = explode('/', $exe);
$tipo = ['Atuação'];
?>
<section class="content-header">
    <h1>
        <?= 'Listar ' . $tipo[0] ?>
        <small>Lista os Cadastros de <?= $tipo[0] ?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=<?= $case[0]; ?>/listar"><?= $tipo[0]; ?></a></li>
        <li class="active"><?= 'Listar ' . $tipo[0] ?></li>
    </ol>
    <br>
    <a href="<?= "painel.php?exe={$case[0]}-icon/listar"; ?>" class="btn btn-primary"><i class="fa fa-image"></i> Ícones Atuação</a>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php
            $acao = filter_input(INPUT_GET, 'acao', FILTER_SANITIZE_STRING);
            $acaoId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

            require('_models/AdminAtuacao.class.php');
            $readAcao = new AdminAtuacao;

            $readMsg = new Read;
            $readMsg->ExeRead('atuacao', "WHERE id = :id", "id={$acaoId}");
            switch ($acao):
                case 'cadastrar':
                    $msg = $readMsg->getResult()[0];
                    WSErro("A Atuação <b>{$msg['area']}</b> foi cadastrado com sucesso!", WS_ACCEPT);
                    break;
                case 'editar':
                    $msg = $readMsg->getResult()[0];
                    WSErro("A Atuação <b>{$msg['area']}</b> foi atualizado com sucesso!", WS_ACCEPT);
                    break;
                case 'excluir':
                    $readAcao->ExeDelete($acaoId);
                    WSErro($readAcao->getError()[0], $readAcao->getError()[1]);
                    break;
            endswitch;
            ?>
            <div class="box box-primary">
                <div class="box-body">
                    <table id="tableView" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Área de Atuação</th>
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $readUser = new Read;
                            $readUser->ExeRead("atuacao", "WHERE area != :a", "a= ''");
                            if ($readUser->getResult()):
                                foreach ($readUser->getResult() as $reg):
                                    ?>
                                    <tr>
                                        <td><?= $reg['id']; ?></td>
                                        <td><?= Check::Words($reg['area'], 10); ?></td>
                                        <td>
                                            <div class="btn-group">
                                                <a href="painel.php?exe=<?= $case[0]; ?>/editar&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-primary "><b class="fa fa-edit"></b> Editar</a>
                                                <a href="painel.php?exe=<?= $exe; ?>&acao=excluir&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-danger "><b class="fa fa-trash-o"></b> Excluir</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                endforeach;
                            endif;
                            ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>