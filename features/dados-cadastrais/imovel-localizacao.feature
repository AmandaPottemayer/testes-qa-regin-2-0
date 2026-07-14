# language: pt
Funcionalidade: Imóvel de localização - Eventos 250 e 251
  Como sistema Regin 2.0
  Quero processar alterações no vínculo do econômico com o imóvel de localização
  Para manter a inscrição imobiliária e a condição de uso atualizadas

  @alteracao @evento-250
  Cenário: Alteração do tipo de vínculo do imóvel
    Dado uma requisição de alteração com o evento "250"
    E uma inscrição imobiliária informada no protocolo
    E uma condição de uso do imóvel informada
    Quando a requisição é processada no Regin 2.0
    Então o econômico deve ser relacionado ao imóvel informado
    E o tipo de vínculo do imóvel deve ser atualizado

  @alteracao @evento-250
  Cenário: Alteração do tipo de vínculo sem inscrição imobiliária não deve ser processada
    Dado uma requisição de alteração com o evento "250"
    E nenhuma inscrição imobiliária informada no protocolo
    Quando a requisição é processada no Regin 2.0
    Então nenhuma alteração de vínculo de imóvel deve ser realizada

  @alteracao @evento-251
  Cenário: Alteração da data fim da inscrição do imóvel
    Dado uma requisição de alteração com o evento "251"
    E uma inscrição imobiliária informada no protocolo
    E uma data fim informada no arquivo
    Quando a requisição é processada no Regin 2.0
    Então a data fim da inscrição do imóvel deve ser atualizada
