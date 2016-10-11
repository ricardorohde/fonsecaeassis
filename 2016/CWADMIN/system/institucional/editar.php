<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb">
            <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Institucional</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>
                    Dados Empresa 
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
                                    $idEdit = 1;
                                    if (isset($dados) && $dados['SendPostForm']):
                                        $dados['foto'] = ($_FILES['foto']['tmp_name'] ? $_FILES['foto'] : null);
                                        unset($dados['SendPostForm']);

                                        require('_models/AdminInstitucional.class.php');
                                        $cadastra = new AdminInstitucional;
                                        $cadastra->ExeUpdate($idEdit, $dados);

                                        if (!$cadastra->getResult()):
                                            WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                                        else:
                                            WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                                        endif;
                                    else:
                                        $read = new Read;
                                        $read->ExeRead("institucional", "WHERE id = :id", "id={$idEdit}");
                                        if (!$read->getResult()):
                                            header("Location: painel.php");
                                        else:
                                            $dados = $read->getResult()[0];
                                        endif;
                                    endif;
                                    ?>
                                    <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                                        <div class="box box-primary">
                                            <div class="box-header"><h3 class="box-title">Dados Institucional</h3></div>
                                            <div class="box-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="empresa">Nome da Empresa</label>
                                                                    <input type="text" name="empresa" class="form-control" id="empresa" value="<?= isset($dados['empresa']) ? $dados['empresa'] : ''; ?>" placeholder="Informe o nome da Empresa">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="logradouro">Logradouro</label>
                                                                    <input type="text" name="logradouro" class="form-control" id="logradouro" value="<?= isset($dados['logradouro']) ? $dados['logradouro'] : ''; ?>" placeholder="Informe o Logradouro">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <label for="numero">Numero</label>
                                                                    <input type="text" name="numero" class="form-control" id="numero" value="<?= isset($dados['numero']) ? $dados['numero'] : ''; ?>" placeholder="Numero"/>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <label for="bairro">Bairro</label>
                                                                    <input type="text" name="bairro" class="form-control" id="bairro" value="<?= isset($dados['bairro']) ? $dados['bairro'] : ''; ?>" placeholder="Bairro"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label for="cidade">Cidade</label>
                                                                    <input type="text" name="cidade" class="form-control" id="cidade" value="<?= isset($dados['cidade']) ? $dados['cidade'] : ''; ?>" placeholder="Cidade"/>
                                                                </div>
                                                                <div class="col-md-2">
                                                                    <label for="uf">UF</label>
                                                                    <input type="text" name="uf" class="form-control" id="uf" value="<?= isset($dados['uf']) ? $dados['uf'] : ''; ?>" placeholder="UF"/>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label for="cep">Cep</label>
                                                                    <input type="text" name="cep" class="form-control" id="cep" value="<?= isset($dados['cep']) ? $dados['cep'] : ''; ?>" data-inputmask="'mask': '99999-999'" placeholder="Cep"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-5">
                                                                    <label for="telefone">Telefone</label>
                                                                    <input type="text" name="telefone" class="form-control" id="telefone" value="<?= isset($dados['telefone']) ? $dados['telefone'] : ''; ?>" data-inputmask="'mask': '(99) 9999-9999'" placeholder="Telefone"/>
                                                                </div>
                                                                <div class="col-md-7">
                                                                    <label for="email">E-mail</label>
                                                                    <input type="text" name="email" class="form-control" id="email" value="<?= isset($dados['email']) ? $dados['email'] : ''; ?>" placeholder="E-mail"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="foto">Foto da Empresa</label>
                                                                    <?php if (!empty($dados['foto'])): ?>
                                                                        <div class="help-image"><img src="../uploads/<?= $dados['foto']; ?>" class="img-thumbnail img-responsive"></div>
                                                                    <?php endif; ?>
                                                                    <input type="file" name="foto" class="form-control" id="foto">
                                                                    <p class="help-block">Selecione uma foto.</p>
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
                                                                    <label for="quem_somos">Quem Somos</label>
                                                                    <textarea name="quem_somos" rows="10" class="form-control" id="editor">
                                                                        <?= isset($dados['quem_somos']) ? $dados['quem_somos'] : ''; ?>
                                                                    </textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="box-footer">
                                                <input type="submit" name="SendPostForm" value="Editar" class="btn btn-flat btn-primary"/>
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







