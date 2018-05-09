Feature: Consultar Despesas de um candidato
  Como usuário
  Quero ter acesso as despesas de determinado candidato
  para contar com uma maior transparência

  Background: Começando da página inicial
    Given I am on the home page
    When I click on the Brasil button
    And I click on the Pernambuco button
    And I fill Recife on the cidade input

  Scenario: Realizando uma consulta de candidato com sucesso(caminho feliz)
    When I select Michelle Collins on the select_box
    Then I should see Nome: Michelle Collins

  Scenario: Realizando uma consulta de candidato Inexistente(caminho triste)
    When I select Elon Musk on the select_box_canditato
    Then I should see candidato inexistente
