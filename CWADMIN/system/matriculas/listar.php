<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Listar Matrículas
        <small>Lista os cadastros de matrículas</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=matriculas/listar">Matrículas</a></li>
        <li class="active">Listar Matrículas</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <?php
            $acao = filter_input(INPUT_GET, 'acao', FILTER_SANITIZE_STRING);
            $acaoId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

            require('_models/AdminMatricula.class.php');
            $readAcao = new AdminMatricula;

            $readMsg = new Read;
            $readMsg->ExeRead('cursos_matriculas', "WHERE id = :id", "id={$acaoId}");
            switch ($acao):
                case 'editar':
                    $msg = $readMsg->getResult()[0];
                    WSErro("Matrícula atualizada com sucesso!", WS_ACCEPT);
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
                                <th>Retornado</th>
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $readUser = new Read;
                            $readUser->FullRead("SELECT cm.*, c.curso FROM cursos_matriculas cm, cursos c WHERE c.id = cm.id_curso AND cur_nome != :c ORDER BY id DESC", "c= ''");
                            if (!$readUser->getResult()):

                            else:
                                foreach ($readUser->getResult() as $reg):
                                    ?>
                                    <tr>
                                        <td><?= $reg['id']; ?></td>
                                        <td><?= Check::Words($reg['cur_nome'], 10); ?></td>
                                        <td><?= Check::Words($reg['curso'], 10); ?></td>
                                        <td><?= date('d/m/Y', strtotime($reg['cur_data_inscricao'])); ?></td>
                                        <td class="text-center"><?php
                                            if ($reg['cur_retornado'] == 'true'):
                                                echo '<span class="badge bg-green">Sim</span>';
                                            else:
                                                echo '<span class="badge bg-red">Não</span>';
                                            endif;
                                            ?>
                                        </td>
                                        <td>
                                            <div class="btn-group">
                                                <a href="painel.php?exe=matriculas/editar&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-warning "><b class="fa fa-eye"></b> Ver</a>
                                                <a href="painel.php?exe=matriculas/listar&acao=excluir&id=<?= $reg['id']; ?>" class="btn btn-flat btn-danger btn-sm"><b class="fa fa-trash-o"></b> Excluir</a>
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