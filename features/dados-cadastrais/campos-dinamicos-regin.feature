# language: pt
Funcionalidade: Campos dinâmicos do Regin - Eventos 241, 242, 248 e 249
  Como sistema Regin 2.0
  Quero atualizar os campos dinâmicos usados na fórmula de cálculo de taxas
  Para refletir corretamente equiparação industrial, tipo de unidade e forma de atuação

  @alteracao @evento-241
  Cenário: Ativação de equiparação industrial
    Dado uma requisição de alteração com o evento "241"
    Quando a requisição é processada no Regin 2.0
    Então o campo dinâmico "equiparacao_industrial" deve ser definido como ativo

  @alteracao @evento-242
  Cenário: Desativação de equiparação industrial
    Dado uma requisição de alteração com o evento "242"
    Quando a requisição é processada no Regin 2.0
    Então o campo dinâmico "equiparacao_industrial" deve ser definido como inativo

  @alteracao @evento-248
  Cenário: Alteração de tipo de unidade
    Dado uma requisição de alteração com o evento "248"
    E um valor de tipo de unidade informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então o campo dinâmico "regin_tipos_unidade" deve ser atualizado

  @alteracao @evento-249
  Cenário: Alteração de forma de atuação
    Dado uma requisição de alteração com o evento "249"
    E um valor de forma de atuação informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então o campo dinâmico "regin_forma_atuacao" deve ser atualizado

  @alteracao @evento-248
  Cenário: Campo dinâmico persistido imediatamente na criação, e como pendente na alteração
    Dado uma requisição de alteração com o evento "248"
    E o econômico já existente (não é uma inclusão)
    Quando a requisição é processada no Regin 2.0
    Então o campo dinâmico deve ficar pendente e ser persistido apenas ao final do processamento
