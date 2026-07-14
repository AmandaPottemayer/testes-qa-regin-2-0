# language: pt
Funcionalidade: Nome fantasia e razão social - Eventos 203, 220, 221 e 264
  Como sistema Regin 2.0
  Quero processar alterações e exclusões de nome fantasia e razão social
  Para manter os dados de identificação da empresa atualizados

  @alteracao @evento-220
  Cenário: Alteração de razão social
    Dado uma requisição de alteração com o evento "220"
    E uma nova razão social informada no arquivo
    Quando a requisição é processada no Regin 2.0
    Então a razão social da pessoa deve ser atualizada

  @alteracao @evento-221
  Cenário: Alteração de nome fantasia
    Dado uma requisição de alteração com o evento "221"
    E um novo nome fantasia informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então o nome fantasia da pessoa deve ser atualizado
    E o nome fantasia do econômico também deve ser atualizado

  @alteracao @evento-203
  Cenário: Exclusão de nome fantasia
    Dado que a pessoa possui nome fantasia cadastrado
    E uma requisição de alteração com o evento "203"
    Quando a requisição é processada no Regin 2.0
    Então o nome fantasia da pessoa deve ser removido
    E o nome fantasia do econômico deve ser definido como vazio

  @alteracao @evento-203
  Cenário: Exclusão de nome fantasia não se aplica a pessoa física
    Dado uma requisição de alteração com o evento "203"
    E o CPF/CNPJ informado é de pessoa física
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração de nome fantasia deve ser realizada

  @alteracao @evento-264
  Cenário: Evento 264 altera classificação empresarial e nome fantasia simultaneamente
    Dado uma requisição de alteração com o evento "264"
    Quando a requisição é processada no Regin 2.0
    Então a classificação empresarial deve ser atualizada
    E o nome fantasia deve ser atualizado
