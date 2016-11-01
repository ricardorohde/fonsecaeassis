<div class="main-contato">
    <div class="main-titulo-content">
        <div class="main-header-content">
            <h1>Contato</h1>
            <h2>Entre em contato Conosco</h2>
        </div>
        <div class="main-naveg">
            <ol class="breadcrumb">
                <li><a href="<?= HOME; ?>">Home</a></li>
                <li class="active">Contato</li>
            </ol>
        </div>
    </div>
    <div class="contato-dados">
        <h1><b>Canais de Atendimento</b></h1>
        <h2><b>Telefone:</b> (69) 3224-6357</h2>
        <h2><b>E-mail:</b> contato@exemplo.com.br</h2>
        <h1><b>Localização</b></h1>
        <h2>Rua Joaquim Nabuco, 1774 - Centro - Porto Velho-RO</h2>
    </div>
    <div class="contato-form" id="contato-form">
        <?php
        $Contato = filter_input_array(INPUT_POST, FILTER_DEFAULT);
        if ($Contato && $Contato['SendFormContato']):
            unset($Contato['SendFormContato']);
            $Contato['DestinoNome'] = 'Atendimento - Fonseca & Assis';
            $Contato['DestinoEmail'] = 'atendimento@fonsecaeassis.com.br';

            $SendMail = new Email;
            $SendMail->Enviar($Contato);
            if ($SendMail->getError()):
                WSErro($SendMail->getError()[0], $SendMail->getError()[1]);
            endif;
        endif;
        ?>
        <form name="FormContato" action="" method="post">
            <div class="form-group">
                <label  class="titulo-label">Nome</label>
                <input type="text" name="RemetenteNome" class="nome form-control" placeholder="Informe seu nome">
            </div>
            <div class="form-group">
                <label class="titulo-label">E-mail</label>
                <input type="email" name="RemetenteEmail" class="email form-control" placeholder="Informe seu e-mail">
            </div>
            <div class="form-group">
                <label class="titulo-label">Assunto</label>
                <input type="text" name="Assunto" class="assunto form-control" placeholder="Informe o assunto">
            </div>
            <div class="form-group">
                <label class="titulo-label">Mensagem</label>
                <textarea name="Mensagem" class="mensagem form-control" rows="8" placeholder="Digite sua mensagem"></textarea>
            </div>
            <div class="form-group">
                <input type="submit" name="SendFormContato" value="Enviar" class="btn btn-enviar">
            </div>
        </form>
    </div>

</div>




