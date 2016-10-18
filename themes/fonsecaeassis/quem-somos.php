<div class="box-conteudo-paginas">
    <div class="container">
        <div class="row">
            <div class="box-100">
                <h5 class="titulo-paginas">Quem Somos</h5>
                <ol class="breadcrumb">
                    <li><a href="<?= HOME; ?>">Home</a></li>
                    <li class="active">Quem Somos</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="box-quem-somos">
                <?php
                $Read = new Read;
                $Read->ExeRead('institucional');
                $Res = $Read->getResult()[0];
                ?>
                <div class="box-100">
                    <h5 class="titulo-empresa"><?= $Res['empresa']; ?></h5>
                    <h6 class="texto-empresa"><?= $Res['quem_somos']; ?></h6>
                </div>
            </div>
        </div>
    </div>
</div>
