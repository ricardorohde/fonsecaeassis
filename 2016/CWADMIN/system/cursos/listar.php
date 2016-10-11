<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb">
            <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="painel.php?exe=cursos/listar">Cursos</a></li>
            <li class="active">Listar Cursos</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>
                    Ver todos os Cursos Cadastrados 
                </h4>
            </div>
            <div class="panel-body">
                <section class="content">
                    <a href="painel.php?exe=cursos/cadastrar">
                        <button type="button" class="btn btn-green btn-icon btn-success">
                            Novo
                            <i class="entypo-plus"></i>
                        </button>
                        <br><br>
                    </a>
                    <div class="row">
                        <div class="col-xs-12">

                            <?php
                            $acao = filter_input(INPUT_GET, 'acao', FILTER_SANITIZE_STRING);
                            $acaoId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

                            require('_models/AdminCurso.class.php');
                            $readAcao = new AdminCurso;

                            $readMsg = new Read;
                            $readMsg->ExeRead('cursos', "WHERE id = :id", "id={$acaoId}");
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
                                                <th>Curso</th>
                                                <th>Responsável</th>
                                                <th>Ação</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $readUser = new Read;
                                            $readUser->ExeRead("cursos", "WHERE curso != :l ORDER BY id DESC", "l= ''");
                                            if (!$readUser->getResult()):

                                            else:
                                                foreach ($readUser->getResult() as $reg):
                                                    ?>
                                                    <tr>
                                                        <td><?= $reg['id']; ?></td>
                                                        <td><?= Check::Words($reg['curso'], 10); ?></td>
                                                        <td><?= $reg['responsavel']; ?></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <a href="painel.php?exe=cursos/editar&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-primary "><b class="fa fa-edit"></b> Editar</a>
                                                                <a href="painel.php?exe=cursos/listar&acao=excluir&id=<?= $reg['id']; ?>" class="btn btn-flat btn-sm btn-danger "><b class="fa fa-trash-o"></b> Excluir</a>
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



            </div>
        </div>
    </div>

</div>




















