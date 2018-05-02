Feature: Consultar Despesas de um candidato
  Como usuário
  Quero ter acesso as despesas de determinado candidato
  para contar com uma maior transparência

  Background: Começando da página inicial
    Given I am on the home page
    When I click on the Nordeste button
    And I click on the Pernambuco button
    And I select Recife on the select_box_cidade

  Scenario: Realizando uma consulta de candidato com sucesso(caminho feliz)
    When I select Michelle Collins on the select_box_canditato
    Then I should see Nome: Michelle Collins
