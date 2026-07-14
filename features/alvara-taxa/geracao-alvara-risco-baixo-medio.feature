# language: pt
Funcionalidade: Geração de alvará no retorno inicial - Risco baixo e médio autodeclaratório
  Como sistema Regin 2.0
  Quero gerar o alvará automaticamente para riscos baixo e médio autodeclaratório
  Para que a empresa já receba a licença sem depender de análise manual

  @risco-baixo
  Cenário: Risco baixo (1) gera alvará tipo 13 - Dispensa
    Dado um protocolo de inclusão com código de risco "1"
    E enquadramento diferente de MEI
    Quando o retorno inicial é processado
    Então um alvará do tipo "13 - Dispensa" deve ser gerado
    E o processo deve ser finalizado sem pendência de análise

  @risco-medio
  Cenário: Risco médio autodeclaratório (10) gera alvará tipo 15
    Dado um protocolo de inclusão com código de risco "10"
    E enquadramento diferente de MEI
    Quando o retorno inicial é processado
    Então um alvará do tipo "15 - Auto Declaratório" deve ser gerado
    E o processo deve ser finalizado sem pendência de análise

  @risco-medio @risco-alto
  Cenário: Risco médio sem autodeclaratório (15) ou alto (20) não gera alvará no retorno inicial
    Dado um protocolo de inclusão com código de risco "15"
    Quando o retorno inicial é processado
    Então nenhum alvará deve ser gerado neste momento
    E o processo deve ficar pendente de análise
    E o retorno deve indicar que o alvará depende de aprovação

  @mei
  Cenário: Empresa MEI não gera alvará independentemente do risco
    Dado um protocolo de inclusão com enquadramento "13 - MEI"
    E código de risco "1"
    Quando o retorno inicial é processado
    Então nenhum alvará deve ser gerado
    E nenhuma taxa diversa deve ser gerada

  @alteracao @evento-220
  Cenário: Alteração de razão social com risco baixo gera novo alvará cancelando o anterior
    Dado que o econômico já possui um alvará ativo do tipo "13 - Dispensa"
    E uma requisição de alteração com o evento "220"
    E código de risco "1"
    Quando o retorno inicial é processado
    Então o alvará anterior deve ser cancelado
    E um novo alvará do tipo "13 - Dispensa" deve ser gerado
