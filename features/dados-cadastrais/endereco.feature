# language: pt
Funcionalidade: Alteração de endereço - Eventos 209, 210 e 211
  Como sistema Regin 2.0
  Quero processar eventos de alteração de endereço
  Para manter o cadastro do econômico consistente com a localização informada

  Contexto:
    Dado que o econômico com o CNPJ "98.765.432/0001-10" já existe no e-Publica

  @alteracao @joinville @evento-209
  Cenário: Alteração de endereço dentro de Joinville atualiza pessoa e econômico
    Dado uma requisição de alteração com o evento "209"
    E o novo endereço informado pertence ao município de Joinville
    E enquadramento diferente de MEI
    Quando a requisição é processada no Regin 2.0
    Então o endereço da pessoa deve ser atualizado
    E o endereço do econômico deve ser atualizado
    E o alvará vigente deve ser cancelado
    E um novo alvará deve ser gerado, se aplicável ao risco

  @alteracao @fora-joinville @evento-210
  Cenário: Alteração de endereço para fora de Joinville baixa o econômico
    Dado uma requisição de alteração com o evento "210"
    E o novo endereço informado não pertence ao município de Joinville
    Quando a requisição é processada no Regin 2.0
    Então o endereço da pessoa deve ser atualizado
    E o econômico deve ser baixado
    E nenhum alvará deve ser gerado

  @alteracao @evento-211
  Cenário: Alteração de endereço no mesmo município (Joinville) atualiza econômico
    Dado uma requisição de alteração com o evento "211"
    E o endereço permanece dentro de Joinville
    Quando a requisição é processada no Regin 2.0
    Então o endereço da pessoa deve ser atualizado
    E o endereço do econômico deve ser atualizado

  @alteracao @mei @evento-211
  Cenário: Alteração de endereço no mesmo município para empresa MEI fora de Joinville
    Dado uma requisição de alteração com o evento "211"
    E enquadramento "13 - MEI"
    E o endereço informado não pertence a Joinville
    Quando a requisição é processada no Regin 2.0
    Então apenas o endereço da pessoa deve ser atualizado
    E o econômico não deve ser alterado

  @alteracao @evento-268
  Cenário: Alteração de endereço complementar não impacta o endereço principal
    Dado uma requisição de alteração com o evento "268"
    Quando a requisição é processada no Regin 2.0
    Então o endereço complementar da pessoa deve ser atualizado
    E o endereço complementar do econômico deve ser atualizado
    E o endereço principal não deve ser alterado
