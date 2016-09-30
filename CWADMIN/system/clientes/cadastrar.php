<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb active">
            <li><a href="painel.php"><i class="entypo-layout"></i> Home</a></li>
            <li><a href="painel.php?exe=clientes/listar"><i class="entypo-user"></i>Clientes</a></li>
            <li class="active">Cadastrar Novo Cliente</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>Cadastrar</h4> 
                <small>Cadastrar novo Cliente</small>
            </div>
            <div class="panel-body">
                <div class="row no-margin">
                    <div class="col-lg-12">
                        <section class="content">
                            <div class="row">
                                <div class="col-md-12">
                                    <?php
                                    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
                                    if (isset($dados) && $dados['SendPostForm']):

                                        unset($dados['SendPostForm']);

                                        require('_models/AdminCliente.class.php');
                                        $cadastra = new AdminCliente;
                                        $cadastra->ExeCreate($dados);

                                        if (!$cadastra->getResult()):
                                            WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                                        else:
                                            header("Location: painel.php?exe=clientes/listar&acao=cadastrar&id={$cadastra->getResult()}");
                                        endif;
                                    endif;
                                    ?>
                                    <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                                        <div class="box box-primary">
                                            <div class="box-header"></div>
                                            <div class="box-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="fantasia">Fantasia</label>
                                                                    <input type="text" name="fantasia" class="form-control" id="fantasia" value="<?= isset($dados['fantasia']) ? $dados['fantasia'] : ''; ?>" placeholder="Informe o nome Fantasia">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="razao_social">Razão Social</label>
                                                                    <input type="text" name="razao_social" class="form-control" id="nome" value="<?= isset($dados['razao_social']) ? $dados['razao_social'] : ''; ?>" placeholder="Informe o nome Fantasia">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="email">E-mail</label>
                                                                    <div class="input-group minimal">
                                                                        <span class="input-group-addon"><i class="entypo-mail"></i></span>
                                                                        <input type="email" name="email" class="form-control" id="email" value="<?= isset($dados['email']) ? $dados['email'] : ''; ?>" placeholder="Informe o e-mail do usuário">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>



                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label for="situacao">Sexo</label>
                                                            <select name="situacao" class="form-control " id="sexo">
                                                                <option value="" <?= ($dados['situacao'] == '') ? ' selected="selected"' : ''; ?>>Selecione...</option>
                                                                <option value="1" <?= ($dados['situacao'] == 1) ? ' selected="selected"' : ''; ?>>Ativo</option>
                                                                <option value="2" <?= ($dados['situacao'] == 2) ? ' selected="selected"' : ''; ?>>Inativo</option>
                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="box-footer">
                                            <button type="submit" name="SendPostForm" value="Cadastrar" class="btn btn-success btn-icon">
                                                Salvar
                                                <i class="entypo-drive"></i>
                                            </button>
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




