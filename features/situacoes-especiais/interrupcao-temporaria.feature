# language: pt
Funcionalidade: Interrupção temporária de atividades - Eventos 412, 413, 414 e 415
  Como sistema Regin 2.0
  Quero processar a interrupção e a reativação temporária de atividades
  Para manter a situação cadastral e o alvará coerentes

  @alteracao @evento-412
  Cenário: Interrupção temporária suspende o econômico
    Dado que o econômico com o CNPJ "20.301.402/0001-50" está ativo
    E uma requisição de alteração com o evento "412"
    Quando a requisição é processada no Regin 2.0
    Então a situação cadastral do econômico deve ser "SUSPENSO"
    E uma ocorrência de interrupção temporária deve ser registrada

  @alteracao @evento-412
  Cenário: Interrupção temporária para enquadramento com regra especial não suspende o alvará
    Dado uma requisição de alteração com o evento "412"
    E enquadramento "13" ou "27"
    Quando a requisição é processada no Regin 2.0
    Então o econômico deve ser suspenso
    Mas o alvará não deve ser suspenso

  @alteracao @evento-413
  Cenário: Reativação após interrupção temporária reativa o econômico
    Dado que o econômico está suspenso por interrupção temporária
    E uma requisição de alteração com o evento "413"
    Quando a requisição é processada no Regin 2.0
    Então a ocorrência de interrupção temporária deve ser encerrada
    E a situação cadastral do econômico deve ser "ATIVO"
    E o alvará deve ser reativado

  @alteracao @evento-414 @evento-415
  Cenário: Eventos 414 e 415 ativam o econômico diretamente
    Dado que o econômico não está com a situação "ATIVO"
    E uma requisição de alteração com o evento "414"
    Quando a requisição é processada no Regin 2.0
    Então a situação cadastral do econômico deve ser "ATIVO"

  @alteracao @evento-413
  Cenário: Reativação quando o econômico já está ativo não deve gerar movimento duplicado
    Dado que o econômico já está com a situação "ATIVO"
    E uma requisição de alteração com o evento "413"
    Quando a requisição é processada no Regin 2.0
    Então nenhuma nova alteração de situação cadastral deve ser registrada
