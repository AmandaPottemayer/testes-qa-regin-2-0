# Testes de QA — Regin 2.0

Repositório com os cenários de teste usados na validação do sistema **Regin 2.0** — integração entre a JUCESC (Junta Comercial de Santa Catarina) e o sistema municipal e-Publica, responsável por processar eventos de abertura, alteração e baixa de empresas.

> ⚠️ Todos os dados usados nos exemplos (CNPJ, razão social, endereços, protocolos) são **fictícios**, gerados apenas para fins de teste. Nenhum dado real de contribuinte, empresa ou órgão público é utilizado neste repositório.

## Contexto

Os testes são feitos via **API (Postman)**: simula-se o envio de um protocolo do "econômico" (dados de uma empresa vindos da Junta Comercial) e valida-se:

1. Se os dados foram criados/alterados corretamente no e-Publica
2. Se o **evento** correto foi processado (cada evento representa uma ação: inclusão, alteração de endereço, alteração de sócios, baixa, etc.)
3. Se **alvará** e **taxa** foram gerados de acordo com o evento e nível de risco do protocolo

## Classificação de risco

| Código | Risco | Comportamento |
|---|---|---|
| 1 | Baixo | Alvará gerado automaticamente (tipo 13 — Dispensa) |
| 10 | Médio (auto declaratório) | Alvará gerado automaticamente (tipo 15 — Auto Declaratório) |
| 15 | Médio (sem auto declaratório) | Alvará **não** é gerado no retorno inicial — depende de aprovação manual |
| 20 | Alto | Alvará **não** é gerado no retorno inicial — depende de aprovação manual |

Se o campo `NROVIABILIDADE` vier vazio no protocolo, o risco é tratado como **20 (alto)**, independente do `CODIGO_RISCO` informado.

## Estrutura do repositório

```
features/
├── inclusao/              → eventos de abertura de empresa/filial
├── dados-cadastrais/      → alterações de endereço, contato, razão social, sócios, etc.
├── socios/                → quadro societário e preposto
├── situacoes-especiais/   → falência, liquidação, recuperação judicial, interrupção temporária
├── alvara-taxa/           → geração de alvará, taxa diversa e aprovação (risco médio/alto)
└── validacao-payload/     → validação de campos obrigatórios do protocolo
docs/
└── glossario-eventos.md   → tabela: código do evento → descrição → onde está testado
```

## Convenções

- Tags usadas para filtrar cenários:
  - Risco: `@risco-baixo`, `@risco-medio`, `@risco-alto`
  - Tipo de operação: `@inclusao`, `@alteracao`
  - Enquadramento: `@mei`, `@produtor-rural`
  - Localização: `@joinville`, `@fora-joinville`

## Autoria

Cenários elaborados como parte da atividade de QA na validação do Regin 2.0 para o município de Joinville/SC.

## Sobre a elaboração deste projeto

 Os cenários de teste deste repositório foram elaborados com apoio de IA (Claude, da Anthropic) para estruturação e escrita dos arquivos `.feature`, a partir da análise das regras de negócio reais do sistema Regin 2.0 (rotinas Groovy de processamento de eventos, geração de alvará/taxa e validação de payload).

 O Regin 2.0 é uma integração extensa, com mais de 40 eventos e múltiplas regras condicionais (risco, enquadramento, localização). A IA foi utilizada para acelerar a organização e documentação desses cenários em um volume grande de forma consistente; a definição do escopo, a categorização dos testes, a validação da lógica de negócio e a revisão técnica foram de responsabilidade minha, como Analista de Qualidade responsável pela validação do sistema.
