# language: pt
Funcionalidade: Preposto - Eventos 237, 238, 239 e 240
  Como sistema Regin 2.0
  Quero processar a designação e exclusão de preposto
  Para manter a qualificação correta do responsável pelo econômico

  @alteracao @evento-237
  Cenário: Designação de preposto sem substituir o atual
    Dado uma requisição de alteração com o evento "237"
    E um sócio informado com vínculo de preposto
    Quando a requisição é processada no Regin 2.0
    Então o sócio deve ser relacionado com a qualificação de preposto
    E o preposto atual, se existir, não deve ser finalizado

  @alteracao @evento-238 @evento-240
  Cenário: Substituição do preposto atual
    Dado que já existe um preposto ativo relacionado ao econômico
    E uma requisição de alteração com o evento "240"
    E um novo sócio informado com vínculo de preposto
    Quando a requisição é processada no Regin 2.0
    Então o preposto atual deve ser finalizado com a data de situação cadastral do protocolo
    E o novo sócio deve ser relacionado com a qualificação de preposto

  @alteracao @evento-239
  Cenário: Exclusão do preposto
    Dado que já existe um preposto ativo relacionado ao econômico
    E uma requisição de alteração com o evento "239"
    Quando a requisição é processada no Regin 2.0
    Então o vínculo de preposto deve ser removido do econômico

  @alteracao @evento-237
  Cenário: Sócio com tipo de relacionamento "preposto" já definido no vínculo não deve ser reprocessado
    Dado uma requisição de alteração com o evento "237"
    E o sócio informado já possui tipo de relacionamento igual a "3" (preposto) no arquivo
    Quando a requisição é processada no Regin 2.0
    Então esse sócio não deve ser processado novamente na rotina de preposto
