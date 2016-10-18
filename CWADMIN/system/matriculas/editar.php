<section class="content-header">
    <h1>
        Ver Matrícula
        <small>Exibição das informações da matrícula</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=matriculas/listar">Matrículas</a></li>
        <li class="active">Ver Matrícula</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            $idEdit = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

            if (isset($dados) && $dados['SendPostForm']):
                unset($dados['SendPostForm']);

                require('_models/AdminMatricula.class.php');
                $cadastra = new AdminMatricula;
                $cadastra->ExeUpdate($idEdit, $dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe=matriculas/listar&acao=editar&id={$idEdit}");
                endif;
            else:
                $read = new Read;
                $read->FullRead("SELECT cm.*, c.curso FROM cursos_matriculas cm, cursos c WHERE cm.id = :id", "id={$idEdit}");
                if (!$read->getResult()):
                    header("Location: painel.php?exe=matriculas/listar");
                else:
                    $dados = $read->getResult()[0];
                endif;
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados da matrícula</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <dl>
                                    <dt>Nome:</dt>
                                    <dd><?= $dados['cur_nome']; ?></dd>
                                    <dt>Telefone:</dt>
                                    <dd><?= $dados['cur_telefone']; ?></dd>
                                    <dt>E-mail:</dt>
                                    <dd><?= $dados['cur_email']; ?></dd>
                                    <dt>Cidade:</dt>
                                    <dd><?= $dados['cur_cidade'] . ' - ' . $dados['cur_uf']; ?></dd>
                                    <dt>Curso:</dt>
                                    <dd><?= $dados['curso']; ?></dd>
                                    <dt>Data da Inscrição:</dt>
                                    <dd><?= date('d/m/Y', strtotime($dados['cur_data_inscricao'])); ?></dd>
                                    <dt>IP:</dt>
                                    <dd><?= $dados['cur_ip']; ?></dd>
                                </dl>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="cur_retornado">Retornou para o aluno?</label>
                                    <select name="cur_retornado" class="form-control" id="cur_retornado">
                                        <option value="true" <?= ($dados['cur_retornado'] == 'true') ? ' selected="selected"' : ''; ?>>Sim</option>
                                        <option value="false" <?= ($dados['cur_retornado'] == 'false') ? ' selected="selected"' : ''; ?>>Não</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <input type="submit" name="SendPostForm" value="Alterar" class="btn btn-flat btn-primary"/>
                </div>
            </form>
        </div>
    </div>
</section>