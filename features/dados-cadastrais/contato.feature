# language: pt
Funcionalidade: Dados de contato - Eventos 214 a 219
  Como sistema Regin 2.0
  Quero processar alterações e exclusões de celular, fax e e-mail
  Para manter os dados de contato da pessoa atualizados

  @alteracao @evento-214
  Cenário: Alteração de celular
    Dado uma requisição de alteração com o evento "214"
    E um número de celular informado no protocolo
    Quando a requisição é processada no Regin 2.0
    Então o celular da pessoa deve ser atualizado

  @alteracao @produtor-rural @evento-215
  Cenário: Exclusão de celular apenas para produtor rural
    Dado uma requisição de alteração com o evento "215"
    E enquadramento de produtor rural
    E ramo de atuação compatível com produtor rural
    Quando a requisição é processada no Regin 2.0
    Então o celular da pessoa deve ser removido

  @alteracao @evento-215
  Cenário: Exclusão de celular ignorada para enquadramento diferente de produtor rural
    Dado uma requisição de alteração com o evento "215"
    E enquadramento diferente de produtor rural
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração de celular deve ser realizada
    E o evento deve ser registrado como sem dados processáveis

  @alteracao @evento-216
  Cenário: Alteração de fax
    Dado uma requisição de alteração com o evento "216"
    E um número de fax informado no protocolo
    Quando a requisição é processada no Regin 2.0
    Então o fax da pessoa deve ser atualizado

  @alteracao @evento-217
  Cenário: Exclusão de fax
    Dado que a pessoa possui fax cadastrado
    E uma requisição de alteração com o evento "217"
    Quando a requisição é processada no Regin 2.0
    Então o fax da pessoa deve ser removido

  @alteracao @evento-218
  Cenário: Alteração de e-mail
    Dado uma requisição de alteração com o evento "218"
    E um e-mail informado no protocolo
    Quando a requisição é processada no Regin 2.0
    Então o e-mail da pessoa deve ser atualizado

  @alteracao @evento-219
  Cenário: Exclusão de e-mail
    Dado que a pessoa possui e-mail cadastrado
    E uma requisição de alteração com o evento "219"
    Quando a requisição é processada no Regin 2.0
    Então o e-mail da pessoa deve ser removido
