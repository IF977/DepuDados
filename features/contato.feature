Feature: Entrar em contato com a equipe
  Como usuário
  Quero mandar mensagens para os membros do projeto
  Para poder dar feedbacks

  Background: Começando na página inicial
      Given I am on the home page
      When I visit nos-contate link
      Then I should see Fale Conosco

  Scenario Outline: Preenchendo todos os campos corretamente(Caminho Feliz)
    Given I am on the nos-contate
    When I fill Nome input with <nome>
    And I fill Email input with <email>
    And I fill Telefone input with <telefone>
    And I fill Mensagem input with <mensagem>
    And I click on the Enviar button
    Then I should see Mensagem enviada com sucesso

    Examples:
      | nome       | email                        | telefone    | mensagem                               |
      | Abigobaldo | abigobaldo_amigao@auau.com   | 81997487488 | Precisa melhorar tal, tal e tal coisa. |
      | João       | joao_inimiguzao@miaumiau.com | 81997487489 | May the force be with you.             |

  Scenario Outline: Email Inválido(Caminho Triste)
    Given I am on the nos-contate
    When I fill Nome input with <nome>
    And I fill Email input with <email>
    And I fill Telefone input with <telefone>
    And I fill Mensagem input with <mensagem>
    And I click on the Enviar button
    Then I should see O email é inválido

    Examples:
      | nome       | email                         | telefone    | mensagem                               |
      | Abigobaldo | abigobaldao                   | 81997487488 | Precisa melhorar tal, tal e tal coisa. |
      | João       | joao_inimiguzao@@miaumiau.com | 81997487489 | May the force be with you.             |

  Scenario Outline: telefone Inválido(Caminho Triste)
    Given I am on the nos-contate
    When I fill Nome input with <nome>
    And I fill Email input with <email>
    And I fill Telefone input with <telefone>
    And I fill Mensagem input with <mensagem>
    And I click on the Enviar button
    Then I should see O formato dos números ou o DDD está incorreto

    Examples:
      | nome       | email                        | telefone  | mensagem                               |
      | Abigobaldo | abigobaldo_amigao@auau.com   | 997487488 | Precisa melhorar tal, tal e tal coisa. |
      | João       | joao_inimiguzao@miaumiau.com | 997487489 | May the force be with you.             |

  Scenario Outline: Não preenchendo nenhum campo(Caminho Triste)
    Given I am on the nos-contate
    When I fill Nome input with <nome>
    And I fill Email input with <email>
    And I fill Telefone input with <telefone>
    And I fill Mensagem input with <mensagem>
    And I click on the Enviar button
    Then I should see Você deve inserir uma mensagem
    And I should see Você deve inserir um nome
    And I should see Você deve inserir um telefone
    And I should see Você deve inserir um email

    Examples:
      | nome | email | telefone | mensagem |
      |      |       |          |          |
      |      |       |          |          |
