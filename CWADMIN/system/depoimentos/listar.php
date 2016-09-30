<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Listar Depoimentos
        <small>Lista os cadastros de cursos</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=depoimentos/listar">Depoimentos</a></li>
        <li class="active">Listar Depoimentos</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php
            $acao = filter_input(INPUT_GET, 'acao', FILTER_SANITIZE_STRING);
            $acaoId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

            require('_models/AdminDepoimento.class.php');
            $readAcao = new AdminCurso;

            $readMsg = new Read;
            $readMsg->ExeRead('depoimentos', "WHERE id = :id", "id={$acaoId}");
            switch ($acao):
                case 'cadastrar':
                    $msg = $readMsg->getResult()[0];
                    WSErro("O Curso <b>{$msg['curso']}</b> foi cadastrado com sucesso!", WS_ACCEPT);
                    break;
                case 'editar':
                    $msg = $readMsg->getResult()[0];
                    WSErro("O Curso <b>{$msg['curso']}</b> foi atualizado com sucesso!", WS_ACCEPT);
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
                                <th>Nome</th>
                                <th>Curso</th>
                                <th>Data</th>
                                <th>Autorizado</th>
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $readUser = new Read;
                            $readUser->ExeRead("depoimentos", "WHERE dep_nome != :d ORDER BY id DESC", "d= ''");
                            if (!$readUser->getResult()):

                            else:
                                foreach ($readUser->getResult() as $reg):
                                    ?>
                                    <tr>
                                        <td><?= $reg['id']; ?></td>
                                        <td><?= Check::Words($reg['dep_nome'], 10); ?></td>
                                        <td><?= Check::Words($reg['dep_curso'], 10); ?></td>
                                        <td><?= date('d/m/Y', strtotime($reg['dep_data'])); ?></td>
                                        <td class="text-center"><?php
                                            if ($reg['dep_autoriza'] == 'true'):
                                                echo '<span class="badge bg-green">Sim</span>';
                                            else:
                                                echo '<span class="badge bg-red">Não</span>';
                                            endif;
                                            ?>
                                        </td>
                                        <td>
                                            <div class="btn-group">
                                                <a href="painel.php?exe=depoimentos/editar&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-primary "><b class="fa fa-edit"></b> Editar</a>
                                                <a href="painel.php?exe=depoimentos/listar&acao=excluir&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-danger "><b class="fa fa-trash-o"></b> Excluir</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                endforeach;
                            endif;
                            ?>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->