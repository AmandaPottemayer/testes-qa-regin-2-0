# language: pt
Funcionalidade: Geração de taxa diversa (TLL)
  Como sistema Regin 2.0
  Quero gerar a taxa diversa (TLL) nos casos previstos
  Para cobrar corretamente pelo serviço público prestado

  @inclusao
  Cenário: Inclusão de empresa não-MEI gera taxa diversa
    Dado uma requisição de inclusão com o evento "101"
    E enquadramento diferente de MEI
    Quando a requisição é processada no Regin 2.0
    Então uma taxa diversa deve ser gerada com o grupo de serviço, código de taxa e base de cálculo configurados
    E a guia de pagamento deve ser gerada

  @alteracao @joinville @evento-209
  Cenário: Alteração de endereço para dentro de Joinville gera taxa diversa
    Dado uma requisição de alteração com o evento "209"
    E o novo endereço pertence a Joinville
    E enquadramento diferente de "27"
    Quando a requisição é processada no Regin 2.0
    Então uma taxa diversa deve ser gerada

  @alteracao @evento-209
  Cenário: Enquadramento "27" não gera taxa diversa na alteração de endereço
    Dado uma requisição de alteração com o evento "209"
    E o novo endereço pertence a Joinville
    E enquadramento "27"
    Quando a requisição é processada no Regin 2.0
    Então nenhuma taxa diversa deve ser gerada

  @mei
  Cenário: Empresa MEI nunca gera taxa diversa
    Dado uma requisição com enquadramento "13 - MEI"
    Quando a requisição é processada no Regin 2.0
    Então nenhuma taxa diversa deve ser gerada
