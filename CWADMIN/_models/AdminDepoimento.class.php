<?php

/**
 * AdminDepoimento.class [ MODEL ADMIN ]
 * Respnsável por gerenciar os depoimentos registrados por usuários do site!
 *
 * @copyright (c) 2016, Gean Marques - CREATIVE WEBSITES
 */
class AdminDepoimento {

    private $Data;
    private $Id;
    private $Error;
    private $Result;

    //Tabela do banco dados
    const Entity = 'depoimentos';

    /**
     * <b>Atualizar Depoimento:</b> Envelope os dados em uma array atribuitivo e informe o id de um
     * registro para atualiza-lo no sistema!
     * @param INT $RegId = Id do registro
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeUpdate($RegId, array $Data) {
        $this->Id = (int) $RegId;
        $this->Data = $Data;
        $this->Update();
    }

    /**
     * <b>Remover Depoimento:</b> Informe o ID do registro que deseja remover.
     * @param INT $TvId = Id do Depoimento
     */
    public function ExeDelete($RegId) {
        $this->Id = (int) $RegId;

        $read = new Read;
        $read->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");

        if (!$read->getResult()):
            $this->Error = ['Oppsss, você tentou remover um depoimento que não existe no sistema!', WS_ERROR];
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

    //Atualiza Depoimento
    private function Update() {
        $Update = new Update;
        $this->Data['qm_alterou'] = $_SESSION['userlogin']['id'];

        $Update->ExeUpdate(self::Entity, $this->Data, "WHERE id = :id", "id={$this->Id}");
        if ($Update->getResult()):
            $this->Error = ["O Curso <b>{$this->Data['curso']}</b> foi atualizado com sucesso!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

    //Excluir
    private function Delete() {
        $Delete = new Delete;
        $Delete->ExeDelete(self::Entity, "WHERE id = :id", "id={$this->Id}");
        if ($Delete->getResult()):
            $this->Error = ["Depoimento removido com sucesso!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

}
