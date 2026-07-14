# language: pt
Funcionalidade: Produtor rural e inscrição estadual - Eventos 254 e 256
  Como sistema Regin 2.0
  Quero processar alterações específicas de produtor rural e inscrição estadual
  Para manter esses dados corretos conforme o enquadramento da empresa

  @alteracao @produtor-rural @evento-254
  Cenário: Alteração de razão social para produtor rural processável
    Dado uma requisição de alteração com o evento "254"
    E enquadramento de produtor rural
    E ramo de atuação compatível com produtor rural
    Quando a requisição é processada no Regin 2.0
    Então a razão social da pessoa deve ser atualizada

  @alteracao @evento-254
  Cenário: Evento 254 ignorado para enquadramento diferente de produtor rural
    Dado uma requisição de alteração com o evento "254"
    E enquadramento diferente de produtor rural
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração de razão social deve ser realizada
    E o evento deve ser registrado como sem dados processáveis

  @alteracao @evento-256
  Cenário: Processamento de inscrição estadual
    Dado uma requisição de alteração com o evento "256"
    E uma inscrição estadual informada no protocolo
    Quando a requisição é processada no Regin 2.0
    Então a inscrição estadual da pessoa deve ser processada com a data de início de atividade informada
