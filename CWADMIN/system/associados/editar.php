<?php
//Configurações
$exe = filter_input(INPUT_GET, 'exe');
$case = explode('/', $exe);
$tipo = ['Associados'];
?>
<section class="content-header">
    <h1>
        <?= 'Editar ' . $tipo[0] ?>
        <small>Cadastros de Novos <?= $tipo[0] ?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=<?= $case[0]; ?>/listar"><?= $tipo[0]; ?></a></li>
        <li class="active"><?= 'Editar ' . $tipo[0] ?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            $idEdit = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
            if (isset($dados) && $dados['SendPostForm']):
                $dados['foto'] = ($_FILES['foto']['tmp_name'] ? $_FILES['foto'] : null);
                unset($dados['SendPostForm']);

                require('_models/AdminAssociado.class.php');
                $cadastra = new AdminAssociado;
                $cadastra->ExeUpdate($idEdit, $dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe={$case[0]}/listar&acao=editar&id={$cadastra->getResult()}");
                endif;
            else:
                $read = new Read;
                $read->ExeRead("adv_associados", "WHERE id = :id", "id={$idEdit}");
                if (!$read->getResult()):
                    header("Location: painel.php?exe={$case[0]}/listar");
                else:
                    $dados = $read->getResult()[0];
                endif;
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados do Associado</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="nome">Nome do Associado</label>
                                            <input type="text" name="nome" class="form-control" id="nome" value="<?= isset($dados['nome']) ? $dados['nome'] : ''; ?>" placeholder="Informe o nome do Associado">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <label for="oab_reg">Registro OAB</label>
                                            <input type="text" name="oab_reg" class="form-control" id="oab_reg" value="<?= isset($dados['oab_reg']) ? $dados['oab_reg'] : ''; ?>" placeholder="Informe o Registro OAB">
                                        </div>
                                        <div class="col-md-4">
                                            <label for="oab_uf">UF Registro OAB</label>
                                            <input type="text" name="oab_uf" class="form-control" id="oab_uf" value="<?= isset($dados['oab_uf']) ? $dados['oab_uf'] : ''; ?>" placeholder="Informe a UF">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="foto">Foto do Associado</label>
                                            <div class="help-image"><img src="../uploads/<?= $dados['foto']; ?>" class="img-thumbnail img-responsive"></div>
                                            <input type="file" name="foto" class="form-control" id="foto">
                                            <p class="help-block">Selecione uma foto.</p>
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