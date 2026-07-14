# language: pt
Funcionalidade: Contador do econômico - Eventos 232 e 233
  Como sistema Regin 2.0
  Quero relacionar e excluir o contador vinculado ao econômico
  Para manter o cadastro de responsável contábil atualizado

  @alteracao @evento-232
  Cenário: Relacionamento de novo contador
    Dado uma requisição de alteração com o evento "232"
    E um contador informado com tipo de relacionamento "3" no arquivo
    Quando a requisição é processada no Regin 2.0
    Então o contador deve ser relacionado ao grupo econômico
    Com data de início conforme informado no protocolo

  @alteracao @evento-232
  Cenário: Contadores anteriores ausentes no arquivo devem ser finalizados
    Dado que o econômico já possui um contador ativo não presente na nova requisição
    E uma requisição de alteração com o evento "232"
    Quando a requisição é processada no Regin 2.0
    Então o contador anterior deve ser finalizado

  @alteracao @evento-233
  Cenário: Exclusão de contador
    Dado que o econômico possui contador ativo relacionado
    E uma requisição de alteração com o evento "233"
    Quando a requisição é processada no Regin 2.0
    Então o vínculo do contador deve ser excluído com a data fim informada
