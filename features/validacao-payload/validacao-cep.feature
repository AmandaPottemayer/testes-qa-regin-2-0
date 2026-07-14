# language: pt
Funcionalidade: Validação de CEP
  Como sistema Regin 2.0
  Quero validar o formato do CEP informado no protocolo
  Para garantir que apenas números com até 8 dígitos sejam aceitos

  @validacao
  Cenário: CEP válido com 8 dígitos numéricos é aceito
    Dado uma requisição com o CEP "89201100" no campo "RUC_ESTAB.RES_ZONA_POSTAL"
    Quando a requisição é validada pelo Regin 2.0
    Então nenhum erro de validação de CEP deve ser retornado

  @validacao
  Cenário: CEP com caracteres não numéricos é rejeitado
    Dado uma requisição com o CEP "89201-100" no campo "RUC_ESTAB.RES_ZONA_POSTAL"
    Quando a requisição é validada pelo Regin 2.0
    Então o sistema deve retornar erro informando que o CEP deve possuir apenas números

  @validacao
  Cenário: CEP com mais de 8 dígitos é rejeitado
    Dado uma requisição com o CEP "892011009" no campo "RUC_ESTAB.RES_ZONA_POSTAL"
    Quando a requisição é validada pelo Regin 2.0
    Então o sistema deve retornar erro informando que o CEP deve possuir no máximo 8 caracteres

  @validacao
  Cenário: CEP do endereço complementar vazio não gera erro
    Dado uma requisição sem CEP informado no campo "RUC_COMP.RCO_ZONA_POSTAL"
    Quando a requisição é validada pelo Regin 2.0
    Então nenhum erro de validação de CEP complementar deve ser retornado
