# language: pt
Funcionalidade: Aprovação de alvará - Risco médio sem autodeclaratório e risco alto
  Como sistema Regin 2.0
  Quero processar a aprovação manual de protocolos com risco 15 ou 20
  Para gerar o alvará somente após a análise do órgão responsável

  @risco-medio @evento-517
  Cenário: Aprovação de protocolo com risco médio sem autodeclaratório (15)
    Dado que o econômico está com o protocolo pendente de aprovação
    E o código de risco do protocolo é "15"
    Quando o retorno de aprovação é processado
    Então o alvará vigente deve ser cancelado, se existente
    E um novo alvará do tipo "16" deve ser gerado
    E o retorno ao Regin deve indicar processo finalizado

  @risco-alto
  Cenário: Aprovação de protocolo com risco alto (20)
    Dado que o econômico está com o protocolo pendente de aprovação
    E o código de risco do protocolo é "20"
    Quando o retorno de aprovação é processado
    Então um novo alvará do tipo "16" deve ser gerado
    E o retorno ao Regin deve indicar processo finalizado

  @risco-baixo @risco-medio
  Cenário: Aprovação ignorada para riscos diferentes de 15 e 20
    Dado que o código de risco do protocolo é "1"
    Quando o retorno de aprovação é processado
    Então nenhum processamento de aprovação deve ser realizado
    E nenhum alvará deve ser gerado nesta etapa

  @risco-alto
  Cenário: Aprovação sem econômico encontrado não deve gerar erro
    Dado que nenhum econômico é encontrado para o CNPJ do protocolo
    E o código de risco do protocolo é "20"
    Quando o retorno de aprovação é processado
    Então nenhum alvará deve ser gerado
    E a operação deve ser encerrada sem falha
