<section class="content-header">
    <h1>
        Ver Depoimento
        <small>Exibição das informações do depoimento</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=depoimentos/listar">Depoimentos</a></li>
        <li class="active">Ver Depoimento</li>
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

                require('_models/AdminDepoimento.class.php');
                $cadastra = new AdminDepoimento;
                $cadastra->ExeUpdate($idEdit, $dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe=depoimentos/listar&acao=editar&id={$idEdit}");
                endif;
            else:
                $read = new Read;
                $read->ExeRead("depoimentos", "WHERE id = :id", "id={$idEdit}");
                if (!$read->getResult()):
                    header("Location: painel.php?exe=depoimentos/listar");
                else:
                    $dados = $read->getResult()[0];
                endif;
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados do Curso</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <dl>
                                    <dt>Nome:</dt>
                                    <dd><?= $dados['dep_nome']; ?></dd>
                                    <dt>Cidade:</dt>
                                    <dd><?= $dados['dep_cidade'] . ' - ' . $dados['dep_uf']; ?></dd>
                                    <dt>E-mail:</dt>
                                    <dd><?= $dados['dep_email']; ?></dd>
                                    <dt>Curso:</dt>
                                    <dd><?= $dados['dep_curso']; ?></dd>
                                    <dt>Mensagem:</dt>
                                    <dd><?= $dados['dep_mensagem']; ?></dd>
                                    <dt>Enviado em:</dt>
                                    <dd><?= date('d/m/Y', strtotime($dados['dep_data'])); ?></dd>
                                    <dt>IP:</dt>
                                    <dd><?= $dados['dep_ip']; ?></dd>
                                </dl>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="dep_autoriza">Liberar?</label>
                                    <select name="dep_autoriza" class="form-control" id="dep_autoriza">
                                        <option value="true" <?= ($dados['dep_autoriza'] == 'true') ? ' selected="selected"' : ''; ?>>Sim</option>
                                        <option value="false" <?= ($dados['dep_autoriza'] == 'false') ? ' selected="selected"' : ''; ?>>Não</option>
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