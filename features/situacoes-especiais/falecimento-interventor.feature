# language: pt
Funcionalidade: Falecimento e interventor - Eventos 407 e 411
  Como sistema Regin 2.0
  Quero processar o falecimento do titular e a exclusão de interventor
  Para dar baixa correta no econômico nesses casos

  @alteracao @evento-407
  Cenário: Falecimento do titular baixa o econômico
    Dado que o econômico com o CNPJ "77.888.999/0001-30" está ativo
    E uma requisição de alteração com o evento "407"
    Quando a requisição é processada no Regin 2.0
    Então o espólio deve ser processado para o titular
    E a situação cadastral do econômico deve ser "BAIXADO"

  @alteracao @evento-407
  Cenário: Falecimento do titular relaciona sócios antes de dar baixa, se ainda não criado
    Dado uma requisição de inclusão simultânea ao evento "407"
    E o econômico ainda não foi criado nesta requisição
    Quando a requisição é processada no Regin 2.0
    Então os sócios devem ser criados e relacionados antes da baixa do econômico

  @alteracao @evento-411
  Cenário: Exclusão de interventor baixa o econômico
    Dado que o econômico possui um sócio com qualificação de interventor
    E uma requisição de alteração com o evento "411"
    Quando a requisição é processada no Regin 2.0
    Então o vínculo de interventor deve ser removido
    E a situação cadastral do econômico deve ser "BAIXADO"
