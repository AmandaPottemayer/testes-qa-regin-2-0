# language: pt
Funcionalidade: Falência - Eventos 405 e 406
  Como sistema Regin 2.0
  Quero processar a decretação e reabilitação de falência
  Para refletir corretamente a situação do econômico e do alvará

  @alteracao @evento-405
  Cenário: Decretação de falência suspende o econômico e o alvará
    Dado que o econômico com o CNPJ "33.222.111/0001-40" está ativo
    E uma requisição de alteração com o evento "405"
    Quando a requisição é processada no Regin 2.0
    Então a situação cadastral do econômico deve ser "SUSPENSO"
    E o alvará vigente deve ser suspenso
    E o prefixo "Massa Falida" deve ser incluído na razão social
    E uma ocorrência de decretação de falência deve ser registrada

  @alteracao @evento-406
  Cenário: Reabilitação de falência reativa o econômico e o alvará
    Dado que o econômico está com a situação "SUSPENSO" por decretação de falência
    E uma requisição de alteração com o evento "406"
    Quando a requisição é processada no Regin 2.0
    Então a situação cadastral do econômico deve ser "ATIVO"
    E o alvará deve ser reativado
    E o prefixo "Massa Falida" deve ser removido da razão social
    E a ocorrência de decretação de falência deve ser encerrada
    E uma ocorrência de reabilitação de falência deve ser registrada

  @alteracao @evento-406
  Cenário: Reabilitação sem ocorrência de falência ativa não deve gerar erro
    Dado que o econômico não possui ocorrência ativa de decretação de falência
    E uma requisição de alteração com o evento "406"
    Quando a requisição é processada no Regin 2.0
    Então nenhuma ocorrência deve ser encerrada
    E o econômico deve ser reativado normalmente
