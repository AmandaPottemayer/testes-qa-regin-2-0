# language: pt
Funcionalidade: Troca de matriz e filial - Evento 246
  Como sistema Regin 2.0
  Quero processar a troca de papéis entre matriz e filial
  Para refletir corretamente qual CNPJ passa a ser matriz e qual passa a ser filial

  @alteracao @joinville @evento-246
  Cenário: Troca de matriz/filial com endereço em Joinville
    Dado uma requisição de alteração com o evento "246"
    E o endereço informado pertence a Joinville
    E um contribuinte já cadastrado para o protocolo
    Quando a requisição é processada no Regin 2.0
    Então o CNPJ da filial deve passar a ser tratado como matriz
    E o CNPJ da matriz/sede informado deve passar a ser tratado como filial

  @alteracao @fora-joinville @evento-246
  Cenário: Troca de matriz/filial ignorada para endereço fora de Joinville
    Dado uma requisição de alteração com o evento "246"
    E o endereço informado não pertence a Joinville
    Quando a requisição é processada no Regin 2.0
    Então nenhuma troca de matriz/filial deve ser realizada

  @alteracao @evento-246
  Cenário: Troca de matriz/filial sem contribuinte encontrado gera alerta
    Dado uma requisição de alteração com o evento "246"
    E o endereço informado pertence a Joinville
    E nenhum contribuinte encontrado para o protocolo
    Quando a requisição é processada no Regin 2.0
    Então um alerta de contribuinte não encontrado deve ser registrado
    E nenhuma troca de matriz/filial deve ser realizada
