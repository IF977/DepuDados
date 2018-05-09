Feature: Acessar página de membros
  Como usuário
  Quero saber quem está desenvolvendo o projeto
  Para poder contatar os membros ou dar feedbacks


  Background: Começando na página inicial
    Scenario: Usuário acessando página da equipe
      Given I am on the home page
      When I visit equipe/index link
      Then I should see Marcus Tiberius

    Scenario Outline: Preenchendo os campos de contato corretamente(Caminho Feliz)
      Given I am on the equipe/index
      When I put <nome> on the usuario_nome input
      And put <email> on the usuario_email input
      And put <text> on the text input
      And click on the Enviar button
      Then I should see the text Mensagem enviada com sucesso.

      Examples:
        | nome | email | text |
        | Abigobaldo | abigobaldo_amigao@auau.com | Precisa melhorar tal, tal e tal coisa. |
        | João | joao_inimiguzao@miaumiau.com | May the force be with you. |

    Scenario Outline: Preenchendo o campo e-mail incorretamente(Caminho Triste)
      Given I am on the equipe/index
      When I put <nome> on the usuario_nome input
      And put <email> on the usuario_email input
      And put <text> on the text input
      And click on the Enviar button
      Then I should see the text Campo de e-mail inválido.

      Examples:
        | nome | email | text |
        | Abigobaldo | abigobaldo_amigao | Precisa melhorar tal, tal e tal coisa. |
        | João | jo@o_inimiguzao@miaumiau.com | May the force be with you. |

    Scenario Outline: Não preenchendo campo de e-mail(Caminho Triste)
      Given I am on the equipe/index
      When I put <nome> on the usuario_nome input
      And put <text> on the text input
      And click on the Enviar button
      Then I should see the text Campo de e-mail inválido.

      Examples:
        | nome | text |
        | Abigobaldo | Precisa melhorar tal, tal e tal coisa. |
        | João | May the force be with you. |
