<div class="box-conteudo-paginas">
    <div class="container">
        <div class="row">
            <div class="box-100">
                <h5 class="titulo-paginas">Contato</h5>
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a></li>
                    <li class="active">Contato</li>
                </ol>
                <div class="contato-dados">
                    <h5><b>Canais de Atendimento</b></h5>
                    <h6><b>Telefone:</b> (69) 3224-6357</h6>
                    <h6><b>E-mail:</b> contato@exemplo.com.br</h6>
                    <h5><b>Localização</b></h5>
                    <h6>Rua Joaquim Nabuco, 1774 - Porto Velho-RO</h6>
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
        </div>
    </div>
</div>



