<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb">
            <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="painel.php?exe=cursos/listar">Cursos</a></li>
            <li class="active">Editar Cursos</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>
                    Editar Curso
                </h4>
            </div>
            <div class="panel-body">
                <div class="row no-margin">
                    <div class="col-lg-12">
                        <section class="content">
                            <div class="row">
                                <div class="col-md-12">
                                    <?php
                                    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
                                    $idEdit = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

                                    if (isset($dados) && $dados['SendPostForm']):
                                        $dados['foto'] = ($_FILES['foto']['tmp_name'] ? $_FILES['foto'] : null);
                                        unset($dados['SendPostForm']);

                                        require('_models/AdminCurso.class.php');
                                        $cadastra = new AdminCurso;
                                        $cadastra->ExeUpdate($idEdit, $dados);

                                        if (!$cadastra->getResult()):
                                            WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                                        else:
                                            header("Location: painel.php?exe=cursos/listar&acao=editar&id={$idEdit}");
                                        endif;
                                    else:
                                        $read = new Read;
                                        $read->ExeRead("cursos", "WHERE id = :id", "id={$idEdit}");
                                        if (!$read->getResult()):
                                            header("Location: painel.php?exe=cursos/listar");
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
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="curso">Curso</label>
                                                                    <input type="text" name="curso" class="form-control" id="curso" value="<?= isset($dados['curso']) ? $dados['curso'] : ''; ?>" placeholder="Informe o Nome do Curso">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="responsavel">Responsável / Palestrante</label>
                                                                    <input type="text" name="responsavel" class="form-control" id="responsavel" value="<?= isset($dados['responsavel']) ? $dados['responsavel'] : ''; ?>" placeholder="Informe o Responsável por ministrar o Curso">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="carga">Carga Horária</label>
                                                                    <input type="text" name="carga" class="form-control" id="carga" value="<?= isset($dados['carga']) ? $dados['carga'] : ''; ?>" placeholder="Informe a Carga Horária">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="valor">Valor</label>
                                                                    <input type="text" name="valor" class="form-control" id="valor" value="<?= isset($dados['valor']) ? $dados['valor'] : ''; ?>" placeholder="Valor. Ex. 12x R$ 45,00">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <label for="modalidade">Modalidade</label>
                                                                    <select name="modalidade" class="form-control" id="modalidade">
                                                                        <option value="presencial" <?= ($dados['modalidade'] == 'presencial') ? ' selected="selected"' : ''; ?>>Presencial</option>
                                                                        <option value="online" <?= ($dados['modalidade'] == 'online') ? ' selected="selected"' : ''; ?>>Online</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="foto">Imagem sobre o Curso</label>
                                                                    <div class="help-image"><img src="../uploads/<?= $dados['foto']; ?>" class="img-thumbnail img-responsive"></div>
                                                                    <input type="file" name="foto" class="form-control" id="foto">
                                                                    <p class="help-block">Selecione a foto capa do curso.</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="descricao">Descrição do Curso</label>
                                                                    <textarea name="descricao" rows="10" class="form-control" id="editor">
                                                                        <?= isset($dados['descricao']) ? $dados['descricao'] : ''; ?>
                                                                    </textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="cronograma">Cronograma</label>
                                                                    <textarea name="cronograma" rows="10" class="form-control" id="editor">
                                                                        <?= isset($dados['cronograma']) ? $dados['cronograma'] : ''; ?>
                                                                    </textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <input type="submit" name="SendPostForm" value="Alterar" class="btn btn-flat btn-primary"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </section>




                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
























