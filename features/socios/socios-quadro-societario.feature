# language: pt
Funcionalidade: Quadro societário - Eventos 202, 204, 230, 235, 253 e 263
  Como sistema Regin 2.0
  Quero processar a inclusão e alteração de sócios
  Para manter o quadro societário do econômico atualizado no e-Publica

  @alteracao @evento-202
  Cenário: Inclusão de novo sócio pessoa física
    Dado que o econômico com o CNPJ "45.123.789/0001-22" já existe no e-Publica
    E uma requisição de alteração com o evento "202"
    E um sócio pessoa física informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então a pessoa do sócio deve ser criada ou atualizada
    E o sócio deve ser relacionado à pessoa jurídica com o percentual de participação informado

  @alteracao @evento-204
  Cenário: Inclusão de sócio pessoa jurídica
    Dado uma requisição de alteração com o evento "204"
    E um sócio pessoa jurídica informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então a pessoa jurídica do sócio deve ser criada ou atualizada
    E o sócio deve ser relacionado à pessoa principal

  @alteracao @evento-230 @evento-235 @evento-253
  Cenário: Alteração de percentual de participação de sócio existente
    Dado que um sócio já está relacionado ao econômico
    E uma requisição de alteração com o evento "235"
    E um novo percentual de participação informado para o mesmo sócio
    Quando a requisição é processada no Regin 2.0
    Então o percentual de participação do sócio deve ser atualizado

  @alteracao @evento-202
  Cenário: Sócio ausente no arquivo deve ser finalizado no quadro societário
    Dado que o econômico possui um sócio ativo não presente na nova requisição
    E uma requisição de alteração com o evento "202"
    Quando a requisição é processada no Regin 2.0
    Então o sócio ausente deve ter sua participação finalizada com a data de geração do arquivo

  @alteracao @produtor-rural @evento-263
  Cenário: Evento 263 só é processado para produtor rural
    Dado uma requisição de alteração com o evento "263"
    E enquadramento diferente de produtor rural
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração de sócios deve ser realizada
    E o evento deve ser registrado como sem dados processáveis

  @alteracao @produtor-rural @evento-263
  Cenário: Evento 263 processado corretamente para produtor rural
    Dado uma requisição de alteração com o evento "263"
    E enquadramento de produtor rural
    E ramo de atuação compatível com produtor rural
    Quando a requisição é processada no Regin 2.0
    Então os sócios devem ser criados e relacionados normalmente
