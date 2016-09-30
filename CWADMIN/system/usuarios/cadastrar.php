<div class="main-panel">
    <div class="main-content">
        <ol class="breadcrumb active">
            <li><a href="painel.php"><i class="entypo-layout"></i> Home</a></li>
            <li><a href="painel.php?exe=usuarios/listar"><i class="entypo-user"></i>Usuários</a></li>
            <li class="active">Cadastrar Usuários</li>
        </ol>
        <div class="panel mb25">
            <div class="panel-heading border">
                <h4>Cadastrar</h4> 
                <small>Cadastrar novo Usuário</small>
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
                                        $dados['foto'] = ($_FILES['foto']['tmp_name'] ? $_FILES['foto'] : null);
                                        unset($dados['SendPostForm']);

                                        require('_models/AdminUser.class.php');
                                        $cadastra = new AdminUser;
                                        $cadastra->ExeCreate($dados);

                                        if (!$cadastra->getResult()):
                                            WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                                        else:
                                            header("Location: painel.php?exe=usuarios/listar&acao=cadastrar&id={$cadastra->getResult()}");
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
                                                                    <label for="nome">Nome</label>
                                                                    <input type="text" name="nome" class="form-control" id="nome" value="<?= isset($dados['nome']) ? $dados['nome'] : ''; ?>" placeholder="Informe o nome do usuário">
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
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <label for="data_nasc">Data de Nascimento:</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-addon">
                                                                            <i class="entypo-calendar"></i>
                                                                        </div>
                                                                        <input type="text" name="data_nasc" class="form-control date" id="data_nasc" value="<?= isset($dados['data_nasc']) ? $dados['data_nasc'] : ''; ?>" placeholder="01/01/9999">
                                                                    

                                                                    
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-4">
                                                                    <label for="sexo">Sexo</label>
                                                                    <select name="sexo" class="form-control " id="sexo">
                                                                        <option value="" <?= ($dados['sexo'] == '') ? ' selected="selected"' : ''; ?>>Selecione...</option>
                                                                        <option value="1" <?= ($dados['sexo'] == 1) ? ' selected="selected"' : ''; ?>>Masculino</option>
                                                                        <option value="2" <?= ($dados['sexo'] == 2) ? ' selected="selected"' : ''; ?>>Feminino</option>
                                                                        <option value="3" <?= ($dados['sexo'] == 3) ? ' selected="selected"' : ''; ?>>Não quero informar</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label for="foto">Foto do Perfil</label>
                                                                    <input type="file" name="foto" class="btn btn-default btn-icon icon-left" id="foto">
                                                                    <p class="help-block">Selecione a foto do perfil do usuário.</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                </div>
                                            </div>
                                        </div>

                                        <div class="panel">
                                            <div class="panel-heading border">
                                                <h4> Dados de Acesso</h4>
                                            </div>
                                            <div class="panel-body">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6 col-xs-12">
                                                                <label for="login">Login</label>

                                                                <input type="text" name="login" class="form-control" id="login" value="<?= isset($dados['login']) ? $dados['login'] : ''; ?>" placeholder="Informe um nome usuário">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6 col-xs-12">
                                                                <label for="senha">Senha</label>
                                                                <input type="password" name="senha" class="form-control" id="senha" value="<?= isset($dados['senha']) ? $dados['senha'] : ''; ?>" placeholder="Informe uma senha">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="box-footer">
                                                    <button type="submit" name="SendPostForm" value="Cadastrar" class="btn btn-success btn-icon">
                                                        Salvar
                                                        <i class="entypo-drive"></i>
                                                    </button>
                                                </div>
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



