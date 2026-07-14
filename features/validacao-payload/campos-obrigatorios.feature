# language: pt
Funcionalidade: Validação de campos obrigatórios do protocolo
  Como sistema Regin 2.0
  Quero validar os campos obrigatórios antes de processar o protocolo
  Para evitar erros de processamento por dados incompletos

  @validacao
  Esquema do Cenário: Requisição sem campo obrigatório retorna erro
    Dado uma requisição de protocolo sem o campo "<campo>"
    Quando a requisição é validada pelo Regin 2.0
    Então o sistema deve retornar erro informando o campo obrigatório ausente
    E o protocolo não deve ser processado

    Exemplos:
      | campo                              |
      | protocolo                          |
      | codFuncao                          |
      | RUC_GENERAL.RGE_CGC_CPF            |
      | RUC_GENERAL.RGE_TGE_VTIP_PERS      |
      | RUC_GENERAL.RGE_NOMB               |
      | RUC_ESTAB.RES_TTL_TIP_LOGRADORO    |
      | RUC_ESTAB.RES_DIRECCION            |
      | RUC_ESTAB.RES_URBANIZACION         |
      | RUC_ESTAB.RES_ZONA_POSTAL          |
      | RUC_ESTAB.RES_TMU_COD_MUN          |
      | RUC_ESTAB.RES_NUME                 |
      | RUC_GENERAL.RGE_FEC_INI_ACT_EC     |
      | RUC_GENERAL.RGE_FEC_SIT_CAD        |
      | RUC_GENERAL.RGE_TGE_VTIP_CTRIB     |

  @validacao
  Cenário: JSON sem o nó "rowset" retorna erro
    Dado uma requisição sem o nó "rowset" (ou "ROWSET") dentro de "json"
    Quando a requisição é validada pelo Regin 2.0
    Então o sistema deve retornar erro de conteúdo ausente

  @validacao
  Cenário: Requisição com todos os campos obrigatórios preenchidos é validada com sucesso
    Dado uma requisição de protocolo com todos os campos obrigatórios preenchidos corretamente
    Quando a requisição é validada pelo Regin 2.0
    Então nenhum erro de validação deve ser retornado
    E o protocolo deve seguir para processamento
