<?php

/**
 * AdminAtuacao.class [ MODEL ADMIN ]
 * Respnsável por gerenciar os cadastros de Áreas de Atuação no Admin do sistema!
 *
 * @copyright (c) 2016, Gean M S Bertani - CW DIGITAL
 */
class AdminAtuacao {

    private $Data;
    private $Id;
    private $Error;
    private $Result;

    //Tabela do banco de dados
    const Entity = 'atuacao';

    /**
     * <b>Cadastrar Atuação:</b> Envelopa os dados em um array atribuitivo e executa esse método
     * para cadastrar o mesmo no sistema. Validações serão feitas!
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeCreate(array $Data) {
        $this->Data = $Data;
        $this->checkData();
        $this->setData();
        if ($this->getResult()):
            $this->Create();
        endif;
    }

    /**
     * <b>Atualizar Link:</b> Envelopa os dados em um array atribuitivo e informe o id de um
     * registro para atualiza-lo no sistema!
     * @param INT $LinkId = Id do Link
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeUpdate($LinkId, array $Data) {
        $this->Id = (int) $LinkId;
        $this->Data = $Data;
        $this->checkData();
        $this->setData();
        if ($this->getResult()):
            $this->Update();
        endif;
    }

    /**
     * <b>Remover TV:</b> Informe o ID do registro que deseja remover.
     * @param INT $TvId = Id da TV
     */
    public function ExeDelete($TvId) {
        $this->Id = (int) $TvId;

        $readVideo = new Read;
        $readVideo->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");

        if (!$readVideo->getResult()):
            $this->Error = ['Oppsss, você tentou remover uma Atuação que não existe no sistema!', WS_ERROR];
            $this->Result = false;
        else:
            $this->Delete();
        endif;
    }

    /**
     * <b>Verificar Cadastro:</b> Retorna TRUE se o cadastro ou update for efetuado ou FALSE se não.
     * Para verificar erros execute um getError();
     * @return BOOL $Var = True or False
     */
    function getResult() {
        return $this->Result;
    }

    /**
     * <b>Obter Erro:</b> Retorna um array associativo com um erro e um tipo.
     * @return ARRAY $Error = Array associatico com o erro
     */
    function getError() {
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
        $this->Data = array_map('strip_tags', $this->Data);
        $this->Data = array_map('trim', $this->Data);
        $this->Data['url_name'] = Check::Name($this->Data['area']);
    }

    //Cadastra
    private function Create() {
        $Create = new Create;
        $this->Data['qm_cadastr'] = $_SESSION['userlogin']['id'];

        $Create->ExeCreate(self::Entity, $this->Data);
        if ($Create->getResult()):
            $this->Error = ["A Atuação <b>{$this->Data['area']}</b> foi cadastrada com sucesso no sistema!", WS_ACCEPT];
            $this->Result = $Create->getResult();
        endif;
    }

    //Atualiza
    private function Update() {
        $Update = new Update;
        $this->Data['qm_alterou'] = $_SESSION['userlogin']['id'];
        $this->Data['data_alterou'] = date('Y-m-d H:i:s');
        $Update->ExeUpdate(self::Entity, $this->Data, "WHERE id = :id", "id={$this->Id}");
        if ($Update->getResult()):
            $this->Error = ["A Atuação <b>{$this->Data['area']}</b> foi atualizado com sucesso no sistema!", WS_ACCEPT];
            $this->Result = $Update->getResult();
        endif;
    }

    //Excluir
    private function Delete() {
        $Delete = new Delete;
        $Delete->ExeDelete(self::Entity, "WHERE id = :id", "id={$this->Id}");
        if ($Delete->getResult()):
            $this->Error = ["Atuação removida com sucesso do sistema!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

}
