<?php

/**
 * AdminAtuacaoIcon.class [ MODEL ADMIN ]
 * Respnsável por gerenciar os icones do módulo de atuação no Admin do sistema!
 *
 * @copyright (c) 2016, Gean M S Bertani - CW DIGITAL
 */
class AdminAtuacaoIcon {

    private $Data;
    private $Id;
    private $Error;
    private $Result;

    //Tabela do banco dados
    const Entity = 'atuacao_icons';

    /**
     * <b>Cadastrar Icone Atuação:</b> Envelopa os dados em um array atribuitivo e execute este método
     * para cadastrar o mesmo no sistema. Validações serão feitas!
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeCreate(array $Data) {
        $this->Data = $Data;
        $this->checkData();
        $this->setData();
        if ($this->Data['foto']):
            $upload = new Upload;
            $upload->Image($this->Data['foto'], $this->Data['nome'], 48, 'atuacao_icons');
        endif;
        if (isset($upload) && $upload->getResult()):
            $this->Data['foto'] = $upload->getResult();
            $this->Create();
        else:
            $this->Data['foto'] = NULL;
            $this->Create();
        endif;
    }

    /**
     * <b>Atualizar Associados:</b> Envelope os dados em uma array atribuitivo e informe o id de uma
     * noticia para atualiza-la no sistema!
     * @param INT $AssociadoId = Id do Associado
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeUpdate($AssociadoId, array $Data) {
        $this->Id = (int) $AssociadoId;
        $this->Data = $Data;
        $this->checkData();
        $this->setData();
        if (is_array($this->Data['foto'])):
            $this->fotoDelete($this->Id);
            $upload = new Upload;
            $upload->Image($this->Data['foto'], $this->Data['nome'], 48, 'atuacao_icons');
        endif;
        if (isset($upload) && $upload->getResult()):
            $this->Data['foto'] = $upload->getResult();
            $this->Update();
        else:
            unset($this->Data['foto']);
            $this->Update();
        endif;
    }

    /**
     * <b>Remover Associado:</b> Informe o ID que deseja remover.
     * @param INT $AssociadoId = Id do Associado
     */
    public function ExeDelete($AssociadoId) {
        $this->Id = (int) $AssociadoId;

        $read = new Read;
        $read->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");

        if (!$read->getResult()):
            $this->Error = ['Oppsss, você tentou remover um icone que não existe no sistema!', WS_ERROR];
            $this->Result = false;
        else:
            $this->fotoDelete($this->Id);
            $this->Delete();
        endif;
    }

    /**
     * <b>Verificar Cadastro:</b> Retorna TRUE se o cadastro ou update for efetuado ou FALSE se não.
     * Para verificar erros execute um getError();
     * @return BOOL $Var = True or False
     */
    public function getResult() {
        return $this->Result;
    }

    /**
     * <b>Obter Erro:</b> Retorna um array associativo com um erro e um tipo.
     * @return ARRAY $Error = Array associatico com o erro
     */
    public function getError() {
        return $this->Error;
    }

    /*
     * ***************************************
     * **********  PRIVATE METHODS  **********
     * ***************************************
     */

    //Checa os dados
    private function checkData() {
        if (in_array('', $this->Data)):
            $this->Error = ["Existem campos em branco. Favor preencha todos os campos!", WS_ALERT];
            $this->Result = false;
        else:
            $this->Result = true;
        endif;
    }

    //Seta os Dados
    private function setData() {
        $capa = $this->Data['foto'];
        unset($this->Data['foto']);
        $this->Data = array_map('strip_tags', $this->Data);
        $this->Data = array_map('trim', $this->Data);
        $this->Data['foto'] = $capa;
    }

    //Excluir a Foto
    private function fotoDelete($Id) {
        $this->Id = (int) $Id;

        $readFoto = new Read;
        $readFoto->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");
        $foto = "../uploads/{$readFoto->getResult()[0]['foto']}";
        if (file_exists($foto) && !is_dir($foto)):
            unlink($foto);
        endif;
    }

    //Cadastrar Evento
    private function Create() {
        $Create = new Create;
        $this->Data['qm_cadastr'] = $_SESSION['userlogin']['id'];
        $Create->ExeCreate(self::Entity, $this->Data);
        if ($Create->getResult()):
            $this->Error = ["O Icone <b>{$this->Data['nome']}</b> foi cadastrado com sucesso no sistema!", WS_ACCEPT];
            $this->Result = $Create->getResult();
        endif;
    }

    //Atualiza Evento
    private function Update() {
        $Update = new Update;
        $this->Data['qm_alterou'] = $_SESSION['userlogin']['id'];
        $this->Data['data_alterou'] = date('Y-m-d H:i:s');
        $Update->ExeUpdate(self::Entity, $this->Data, "WHERE id = :id", "id={$this->Id}");
        if ($Update->getResult()):
            $this->Error = ["O Icone <b>{$this->Data['nome']}</b> foi atualizado com sucesso!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

    //Excluir Evento
    private function Delete() {
        $Delete = new Delete;
        $Delete->ExeDelete(self::Entity, "WHERE id = :id", "id={$this->Id}");
        if ($Delete->getResult()):
            $this->Error = ["Icone removido com sucesso do sistema!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

}
