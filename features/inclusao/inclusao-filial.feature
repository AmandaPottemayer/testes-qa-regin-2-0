# language: pt
Funcionalidade: Inclusão de filial - Eventos 103, 106, 109, 110 e 111
  Como sistema Regin 2.0
  Quero processar os eventos de filial
  Para relacionar corretamente matriz e filial no e-Publica

  @inclusao @evento-103
  Cenário: Abertura de filial com matriz localizada em Joinville
    Dado uma requisição de inclusão com o evento "103"
    E a matriz do CNPJ informado está localizada em Joinville
    Quando a requisição é processada no Regin 2.0
    Então a pessoa da filial deve ser criada
    E a personalidade jurídica deve ser marcada como filial

  @inclusao @evento-103
  Cenário: Abertura de filial sem matriz localizada em Joinville não gera cadastro
    Dado uma requisição de inclusão com o evento "103"
    E a matriz do CNPJ informado não está localizada em Joinville
    Quando a requisição é processada no Regin 2.0
    Então nenhuma ação de cadastro deve ser realizada para o evento "103"

  @alteracao @evento-109 @evento-111
  Cenário: Relacionamento de filial com matriz em Joinville
    Dado uma requisição com o evento "109"
    E a matriz do CNPJ informado está localizada em Joinville
    Quando a requisição é processada no Regin 2.0
    Então a filial deve ser relacionada à matriz
    E a personalidade jurídica deve ser marcada como filial

  @alteracao @evento-110
  Cenário: Relacionamento de matriz com endereço em Joinville
    Dado uma requisição com o evento "110"
    E o endereço informado pertence a Joinville
    Quando a requisição é processada no Regin 2.0
    Então a personalidade jurídica deve ser marcada como matriz
    E o relacionamento entre matriz e filial deve ser atualizado

  @alteracao @evento-106
  Cenário: Atualização cadastral completa via evento 106
    Dado uma requisição de alteração com o evento "106"
    Quando a requisição é processada no Regin 2.0
    Então os dados cadastrais completos da pessoa devem ser atualizados

  @mei @evento-106
  Cenário: Evento 106 para empresa MEI não gera movimento
    Dado uma requisição com o evento "106"
    E enquadramento "13 - MEI"
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração cadastral deve ser realizada
