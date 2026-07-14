# language: pt
Funcionalidade: Recuperação judicial - Eventos 418 e 419
  Como sistema Regin 2.0
  Quero processar o início e o encerramento de recuperação judicial
  Para refletir a situação do econômico e do alvará corretamente

  @alteracao @evento-418
  Cenário: Início de recuperação judicial suspende o econômico e o alvará
    Dado que o econômico com o CNPJ "55.444.333/0001-60" está ativo
    E uma requisição de alteração com o evento "418"
    Quando a requisição é processada no Regin 2.0
    Então os sócios devem ser criados e relacionados
    E a situação cadastral do econômico deve ser "SUSPENSO"
    E o alvará vigente deve ser suspenso
    E o prefixo " Em Recuperação" deve ser incluído na razão social
    E uma ocorrência de recuperação judicial deve ser registrada

  @alteracao @evento-419
  Cenário: Encerramento de recuperação judicial reativa o econômico e o alvará
    Dado que o econômico está em recuperação judicial
    E uma requisição de alteração com o evento "419"
    Quando a requisição é processada no Regin 2.0
    Então a ocorrência de recuperação judicial deve ser encerrada
    E a situação cadastral do econômico deve ser "ATIVO"
    E o alvará deve ser reativado
    E o prefixo " Em Recuperação" deve ser removido da razão social
    E o vínculo do sócio administrador deve ser removido
