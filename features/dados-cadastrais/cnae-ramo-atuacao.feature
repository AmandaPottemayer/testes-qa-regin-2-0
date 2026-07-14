# language: pt
Funcionalidade: CNAE e ramo de atuação - Evento 244
  Como sistema Regin 2.0
  Quero processar a atualização de CNAEs do econômico
  Para manter as atividades econômicas e serviços vinculados corretamente

  @alteracao @evento-244
  Cenário: Inclusão de novo CNAE
    Dado uma requisição de alteração com o evento "244"
    E um código de CNAE não cadastrado anteriormente para o econômico
    Quando a requisição é processada no Regin 2.0
    Então o CNAE deve ser adicionado ao econômico
    E o ramo de atuação correspondente deve ser vinculado
    E o serviço correspondente ao CNAE deve ser adicionado

  @alteracao @evento-244
  Cenário: CNAE existente ausente no novo arquivo deve ser finalizado
    Dado que o econômico possui um CNAE ativo não presente na nova requisição
    E uma requisição de alteração com o evento "244"
    Quando a requisição é processada no Regin 2.0
    Então a data fim do CNAE ausente deve ser definida

  @alteracao @evento-244
  Cenário: Alteração de classificação do CNAE (principal/secundário)
    Dado que o econômico já possui um CNAE cadastrado como secundário
    E uma requisição de alteração com o evento "244"
    E o mesmo CNAE informado agora como principal
    Quando a requisição é processada no Regin 2.0
    Então a classificação do CNAE deve ser atualizada para principal
