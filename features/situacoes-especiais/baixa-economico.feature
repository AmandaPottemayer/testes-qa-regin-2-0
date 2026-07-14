# language: pt
Funcionalidade: Baixa de econômico - Eventos 410 e 517
  Como sistema Regin 2.0
  Quero processar a baixa definitiva do econômico
  Para encerrar corretamente o cadastro e cancelar o alvará vinculado

  @alteracao @evento-410
  Cenário: Baixa de econômico com sócios relacionados
    Dado que o econômico com o CNPJ "60.708.090/0001-25" está ativo
    E uma requisição de alteração com o evento "410"
    Quando a requisição é processada no Regin 2.0
    Então os sócios devem ser criados e relacionados, se ainda não estiverem
    E a situação cadastral do econômico deve ser "BAIXADO"

  @alteracao @evento-517
  Cenário: Evento 517 cancela o alvará e baixa o econômico
    Dado que o econômico possui alvará ativo do tipo "13 - Dispensa"
    E uma requisição de alteração com o evento "517"
    Quando a requisição é processada no Regin 2.0
    Então o alvará deve ser cancelado
    E a situação cadastral do econômico deve ser "BAIXADO"

  @alteracao @evento-410
  Cenário: Baixa de econômico já baixado não deve gerar movimento duplicado
    Dado que o econômico já está com a situação "BAIXADO"
    E uma requisição de alteração com o evento "410"
    Quando a requisição é processada no Regin 2.0
    Então nenhuma nova alteração de situação cadastral deve ser registrada
