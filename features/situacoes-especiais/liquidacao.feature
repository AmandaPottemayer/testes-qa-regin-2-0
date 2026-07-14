# language: pt
Funcionalidade: Liquidação - Eventos 408, 416 e 417
  Como sistema Regin 2.0
  Quero processar liquidação judicial, extrajudicial e o término de liquidação
  Para manter a situação cadastral e o alvará coerentes com o processo de liquidação

  @alteracao @evento-416
  Cenário: Liquidação judicial suspende o econômico e o alvará
    Dado que o econômico com o CNPJ "10.203.040/0001-15" está ativo
    E uma requisição de alteração com o evento "416"
    Quando a requisição é processada no Regin 2.0
    Então a situação cadastral do econômico deve ser "SUSPENSO"
    E o alvará vigente deve ser suspenso
    E o sufixo " Em Liquidação Judicial" deve ser incluído na razão social
    E uma ocorrência de liquidação judicial deve ser registrada

  @alteracao @evento-417
  Cenário: Liquidação extrajudicial reativa o econômico e o alvará
    Dado que o econômico está em processo de liquidação
    E uma requisição de alteração com o evento "417"
    Quando a requisição é processada no Regin 2.0
    Então a situação cadastral do econômico deve ser "ATIVO"
    E o alvará deve ser reativado
    E o vínculo do sócio liquidante deve ser removido
    E uma ocorrência de liquidação extrajudicial deve ser registrada

  @alteracao @evento-408
  Cenário: Término de liquidação judicial baixa o econômico
    Dado que o econômico possui ocorrência ativa de liquidação judicial
    E uma requisição de alteração com o evento "408"
    Quando a requisição é processada no Regin 2.0
    Então o sufixo " Em Liquidação Judicial" deve ser removido da razão social
    E a ocorrência de liquidação deve ser encerrada
    E uma ocorrência de término de liquidação deve ser registrada
    E o vínculo do sócio liquidante deve ser finalizado
    E a situação cadastral do econômico deve ser "BAIXADO"

  @alteracao @evento-408
  Cenário: Término de liquidação extrajudicial também encerra a ocorrência correspondente
    Dado que o econômico possui ocorrência ativa de liquidação extrajudicial
    E uma requisição de alteração com o evento "408"
    Quando a requisição é processada no Regin 2.0
    Então a ocorrência de liquidação extrajudicial deve ser encerrada
    E a situação cadastral do econômico deve ser "BAIXADO"
