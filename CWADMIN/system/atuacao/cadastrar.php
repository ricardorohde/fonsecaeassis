<?php
//Configurações
$exe = filter_input(INPUT_GET, 'exe');
$case = explode('/', $exe);
$tipo = ['Área de Atuação'];
?>
<section class="content-header">
    <h1>
        <?= 'Cadastrar ' . $tipo[0] ?>
        <small>Cadastros de Novos <?= $tipo[0] ?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=<?= $case[0]; ?>/listar"><?= $tipo[0]; ?></a></li>
        <li class="active"><?= 'Cadastrar ' . $tipo[0] ?></li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            if (isset($dados) && $dados['SendPostForm']):
                unset($dados['SendPostForm']);

                require('_models/AdminAtuacao.class.php');
                $cadastra = new AdminAtuacao;
                $cadastra->ExeCreate($dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe={$case[0]}/listar&acao=cadastrar&id={$cadastra->getResult()}");
                endif;
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="area">Área de Atuação</label>
                                            <input type="text" name="area" class="form-control" id="nome" value="<?= isset($dados['area']) ? $dados['area'] : ''; ?>" placeholder="Informe a Área de Atuação">
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
                                            <div class="select-avatar">
                                                <?php
                                                $ReadIco = new Read;
                                                $ReadIco->ExeRead("atuacao_icons");
                                                if ($ReadIco->getResult()):
                                                    foreach ($ReadIco->getResult() as $Ico):
                                                        ?>
                                                        <input type="radio" name="id_icon" value="<?= $Ico['id']; ?>" id="i<?= $Ico['id']; ?>" />
                                                        <label for="i<?= $Ico['id']; ?>"><img src="../uploads/<?= $Ico['foto']; ?>" alt="<?= $Ico['nome']; ?>"></label>
                                                        <?php
                                                    endforeach;
                                                endif;
                                                ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <input type="submit" name="SendPostForm" value="Cadastrar" class="btn btn-flat btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>