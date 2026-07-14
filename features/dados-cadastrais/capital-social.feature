# language: pt
Funcionalidade: Capital social - Evento 247
  Como sistema Regin 2.0
  Quero processar a alteração de capital social do econômico
  Para manter esse valor atualizado, exclusivamente em Joinville

  @alteracao @joinville @evento-247
  Cenário: Alteração de capital social com endereço em Joinville
    Dado uma requisição de alteração com o evento "247"
    E o econômico está localizado em Joinville
    E um novo valor de capital social informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então o capital social do econômico deve ser atualizado

  @alteracao @fora-joinville @evento-247
  Cenário: Alteração de capital social ignorada para econômico fora de Joinville
    Dado uma requisição de alteração com o evento "247"
    E o econômico não está localizado em Joinville
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração de capital social deve ser realizada
