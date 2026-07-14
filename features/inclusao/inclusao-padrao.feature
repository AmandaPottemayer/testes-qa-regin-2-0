# language: pt
Funcionalidade: Inclusão padrão de empresa - Eventos 101 e 102
  Como sistema Regin 2.0
  Quero processar os eventos de inclusão 101 e 102
  Para criar a pessoa, o contribuinte e o econômico no e-Publica

  Contexto:
    Dado que o econômico com o CNPJ "12.345.678/0001-95" não existe no e-Publica

  @inclusao @risco-baixo
  Cenário: Inclusão de empresa não-MEI com risco baixo gera alvará automático
    Dado uma requisição de inclusão com o evento "101"
    E enquadramento diferente de MEI
    E código de risco "1"
    E o campo "NROVIABILIDADE" preenchido
    Quando a requisição é processada no Regin 2.0
    Então a pessoa, o contribuinte e o econômico devem ser criados
    E a situação cadastral do econômico deve ser "ATIVO"
    E um alvará do tipo "13 - Dispensa" deve ser gerado
    E uma taxa diversa (TLL) deve ser gerada

  @inclusao @risco-medio
  Cenário: Inclusão de empresa não-MEI com risco médio autodeclaratório gera alvará automático
    Dado uma requisição de inclusão com o evento "102"
    E enquadramento diferente de MEI
    E código de risco "10"
    E o campo "NROVIABILIDADE" preenchido
    Quando a requisição é processada no Regin 2.0
    Então a pessoa, o contribuinte e o econômico devem ser criados
    E um alvará do tipo "15 - Auto Declaratório" deve ser gerado

  @inclusao @mei
  Cenário: Inclusão de empresa MEI não gera alvará nem taxa
    Dado uma requisição de inclusão com o evento "101"
    E enquadramento "13 - MEI"
    Quando a requisição é processada no Regin 2.0
    Então a pessoa, o contribuinte e o econômico devem ser criados
    Mas nenhum alvará deve ser gerado
    E nenhuma taxa diversa deve ser gerada

  @inclusao @risco-alto
  Cenário: Inclusão com NROVIABILIDADE vazio é tratada como risco alto
    Dado uma requisição de inclusão com o evento "101"
    E enquadramento diferente de MEI
    E código de risco "1"
    E o campo "NROVIABILIDADE" vazio
    Quando a requisição é processada no Regin 2.0
    Então o risco do protocolo deve ser tratado como "20 - Alto"
    E nenhum alvará deve ser gerado no retorno inicial
    E o protocolo deve aguardar aprovação manual

  @inclusao
  Cenário: Reprocessamento do mesmo CNPJ já existente deve ser tratado como alteração, não inclusão
    Dado que o econômico com o CNPJ "12.345.678/0001-95" já existe no e-Publica
    Quando uma nova requisição com o evento "101" é enviada para o mesmo CNPJ
    Então a operação deve ser classificada como alteração
    E nenhum novo registro de pessoa, contribuinte ou econômico deve ser duplicado
