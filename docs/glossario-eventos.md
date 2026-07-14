# Glossário de Eventos — Regin 2.0

Tabela de referência rápida: código do evento → o que ele faz → em qual arquivo de teste está coberto.

## Inclusão

| Evento | Descrição | Arquivo |
|---|---|---|
| 101, 102 | Inclusão padrão de empresa (cria pessoa, contribuinte e econômico) | `features/inclusao/inclusao-padrao.feature` |
| 103 | Abertura de filial | `features/inclusao/inclusao-filial.feature` |
| 106 | Atualização cadastral completa na inclusão | `features/inclusao/inclusao-filial.feature` |
| 109, 111 | Relaciona filial à matriz | `features/inclusao/inclusao-filial.feature` |
| 110 | Relaciona matriz | `features/inclusao/inclusao-filial.feature` |

## Dados cadastrais

| Evento | Descrição | Arquivo |
|---|---|---|
| 203 | Exclusão de nome fantasia | `features/dados-cadastrais/nome-razao-social.feature` |
| 220 | Alteração de razão social | `features/dados-cadastrais/nome-razao-social.feature` |
| 221 | Alteração de nome fantasia | `features/dados-cadastrais/nome-razao-social.feature` |
| 264 | Alteração de classificação empresarial + nome fantasia | `features/dados-cadastrais/nome-razao-social.feature` |
| 209, 210 | Alteração de endereço (dentro/fora de Joinville) | `features/dados-cadastrais/endereco.feature` |
| 211 | Alteração de endereço no mesmo município | `features/dados-cadastrais/endereco.feature` |
| 268 | Alteração de endereço complementar | `features/dados-cadastrais/endereco.feature` |
| 214 | Alteração de celular | `features/dados-cadastrais/contato.feature` |
| 215 | Exclusão de celular (produtor rural) | `features/dados-cadastrais/contato.feature` |
| 216 | Alteração de fax | `features/dados-cadastrais/contato.feature` |
| 217 | Exclusão de fax | `features/dados-cadastrais/contato.feature` |
| 218 | Alteração de e-mail | `features/dados-cadastrais/contato.feature` |
| 219 | Exclusão de e-mail | `features/dados-cadastrais/contato.feature` |
| 222 | Alteração de classificação empresarial / Simples Nacional | `features/dados-cadastrais/classificacao-empresarial.feature` |
| 225 | Alteração de natureza jurídica | `features/dados-cadastrais/classificacao-empresarial.feature` |
| 232 | Relaciona contador | `features/dados-cadastrais/contador.feature` |
| 233 | Exclui contador | `features/dados-cadastrais/contador.feature` |
| 244 | Alteração de CNAE / ramo de atuação | `features/dados-cadastrais/cnae-ramo-atuacao.feature` |
| 247 | Alteração de capital social | `features/dados-cadastrais/capital-social.feature` |
| 241 | Equiparação industrial — ativa | `features/dados-cadastrais/campos-dinamicos-regin.feature` |
| 242 | Equiparação industrial — desativa | `features/dados-cadastrais/campos-dinamicos-regin.feature` |
| 248 | Alteração de tipo de unidade | `features/dados-cadastrais/campos-dinamicos-regin.feature` |
| 249 | Alteração de forma de atuação | `features/dados-cadastrais/campos-dinamicos-regin.feature` |
| 250 | Alteração de tipo de vínculo do imóvel | `features/dados-cadastrais/imovel-localizacao.feature` |
| 251 | Alteração de data fim da inscrição do imóvel | `features/dados-cadastrais/imovel-localizacao.feature` |
| 254 | Alteração de razão social — produtor rural | `features/dados-cadastrais/produtor-rural-ie.feature` |
| 256 | Processamento de inscrição estadual | `features/dados-cadastrais/produtor-rural-ie.feature` |
| 246 | Troca matriz/filial | `features/dados-cadastrais/matriz-filial.feature` |

## Sócios

| Evento | Descrição | Arquivo |
|---|---|---|
| 202, 204, 230, 235, 253 | Inclusão/alteração de sócios | `features/socios/socios-quadro-societario.feature` |
| 263 | Inclusão/alteração de sócios — somente produtor rural | `features/socios/socios-quadro-societario.feature` |
| 237 | Relaciona preposto | `features/socios/preposto.feature` |
| 238, 240 | Relaciona/substitui preposto atual | `features/socios/preposto.feature` |
| 239 | Exclui preposto | `features/socios/preposto.feature` |

## Situações especiais

| Evento | Descrição | Arquivo |
|---|---|---|
| 405 | Decretação de falência (suspende alvará) | `features/situacoes-especiais/falencia.feature` |
| 406 | Reabilitação de falência (ativa alvará) | `features/situacoes-especiais/falencia.feature` |
| 407 | Falecimento do titular (baixa econômico) | `features/situacoes-especiais/falecimento-interventor.feature` |
| 411 | Exclusão de interventor (baixa econômico) | `features/situacoes-especiais/falecimento-interventor.feature` |
| 408 | Término de liquidação (baixa econômico) | `features/situacoes-especiais/liquidacao.feature` |
| 416 | Liquidação judicial (suspende alvará) | `features/situacoes-especiais/liquidacao.feature` |
| 417 | Liquidação extrajudicial (ativa alvará) | `features/situacoes-especiais/liquidacao.feature` |
| 418 | Recuperação judicial (suspende alvará) | `features/situacoes-especiais/recuperacao-judicial.feature` |
| 419 | Encerramento de recuperação judicial (ativa alvará) | `features/situacoes-especiais/recuperacao-judicial.feature` |
| 412 | Interrupção temporária de atividades (suspende alvará) | `features/situacoes-especiais/interrupcao-temporaria.feature` |
| 413 | Reativação após interrupção temporária (ativa alvará) | `features/situacoes-especiais/interrupcao-temporaria.feature` |
| 414, 415 | Ativação do econômico | `features/situacoes-especiais/interrupcao-temporaria.feature` |
| 410 | Baixa de econômico (com sócios) | `features/situacoes-especiais/baixa-economico.feature` |
| 517 | Cancelamento de alvará + baixa de econômico | `features/situacoes-especiais/baixa-economico.feature` |

## Alvará e Taxa Diversa

| Assunto | Descrição | Arquivo |
|---|---|---|
| Geração inicial | Alvará automático para risco baixo (13) e médio-autodeclaratório (15) | `features/alvara-taxa/geracao-alvara-risco-baixo-medio.feature` |
| Aprovação | Alvará tipo 16 gerado após análise manual (risco 15 sem autodeclaratório / risco 20) | `features/alvara-taxa/aprovacao-risco-medio-alto.feature` |
| Taxa diversa | Geração de taxa TLL na inclusão e em alterações de endereço | `features/alvara-taxa/geracao-taxa-diversa.feature` |

## Validação

| Assunto | Descrição | Arquivo |
|---|---|---|
| Campos obrigatórios | Protocolo, CPF/CNPJ, endereço, datas, ramo de atuação | `features/validacao-payload/campos-obrigatorios.feature` |
| CEP | CEP deve ter no máximo 8 dígitos numéricos | `features/validacao-payload/validacao-cep.feature` |
| Risco condicional | Se `NROVIABILIDADE` preenchido, `CODIGO_RISCO` é obrigatório | `features/validacao-payload/risco-nroviabilidade.feature` |
