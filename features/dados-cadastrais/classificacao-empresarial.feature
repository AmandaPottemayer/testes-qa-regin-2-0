# language: pt
Funcionalidade: Classificação empresarial e natureza jurídica - Eventos 222 e 225
  Como sistema Regin 2.0
  Quero processar alterações de classificação empresarial, Simples Nacional e natureza jurídica
  Para manter o enquadramento tributário da empresa correto no e-Publica

  @alteracao @evento-222
  Cenário: Alteração de classificação empresarial atualiza também o Simples Nacional
    Dado uma requisição de alteração com o evento "222"
    E porte da empresa diferente de "3 - Demais"
    Quando a requisição é processada no Regin 2.0
    Então a classificação empresarial deve ser atualizada
    E a opção pelo Simples Nacional deve ser atualizada

  @alteracao @evento-222
  Cenário: Porte "3" com opção pelo Simples Nacional é combinação inválida
    Dado uma requisição de alteração com o evento "222"
    E porte da empresa igual a "3"
    E opção pelo Simples Nacional igual a "S"
    Quando a requisição é processada no Regin 2.0
    Então a classificação empresarial deve ser atualizada
    Mas a opção pelo Simples Nacional não deve ser alterada

  @alteracao @evento-225
  Cenário: Alteração de natureza jurídica
    Dado uma requisição de alteração com o evento "225"
    E um novo código de natureza jurídica informado no arquivo
    Quando a requisição é processada no Regin 2.0
    Então a natureza jurídica da pessoa deve ser atualizada
