# language: pt
Funcionalidade: Validação condicional de risco (NROVIABILIDADE / CODIGO_RISCO)
  Como sistema Regin 2.0
  Quero validar a obrigatoriedade do código de risco quando a viabilidade estiver preenchida
  Para garantir a consistência entre esses dois campos do protocolo

  @validacao
  Cenário: NROVIABILIDADE preenchido sem CODIGO_RISCO retorna erro
    Dado uma requisição com o campo "NROVIABILIDADE" preenchido
    E o campo "CODIGO_RISCO" ausente ou vazio
    Quando a requisição é validada pelo Regin 2.0
    Então o sistema deve retornar erro informando que "CODIGO_RISCO" é obrigatório

  @validacao
  Cenário: NROVIABILIDADE preenchido com CODIGO_RISCO informado é válido
    Dado uma requisição com o campo "NROVIABILIDADE" preenchido
    E o campo "CODIGO_RISCO" igual a "1"
    Quando a requisição é validada pelo Regin 2.0
    Então nenhum erro de validação de risco deve ser retornado

  @validacao @risco-alto
  Cenário: NROVIABILIDADE vazio não exige CODIGO_RISCO, mas o risco é tratado como alto
    Dado uma requisição com o campo "NROVIABILIDADE" vazio
    E o campo "CODIGO_RISCO" ausente
    Quando a requisição é processada no Regin 2.0
    Então nenhum erro de validação deve ser retornado por falta de "CODIGO_RISCO"
    E o risco do protocolo deve ser tratado como "20 - Alto"

  @validacao
  Esquema do Cenário: Apenas os códigos de risco válidos são aceitos
    Dado uma requisição com o campo "CODIGO_RISCO" igual a "<codigo>"
    Quando a requisição é validada pelo Regin 2.0
    Então o código de risco deve ser considerado <resultado>

    Exemplos:
      | codigo | resultado |
      | 1      | válido    |
      | 10     | válido    |
      | 15     | válido    |
      | 20     | válido    |
      | 5      | inválido  |
