Feature: Realizar consulta pela página de pesquisa
  Como usuário
  Quero ter acesso as informações específicas de determinado candidato
  para contar com uma maior transparência

  Background: Começando da página inicial
    Given I am on the home page
    When I visit pesquisa link

  Scenario: Realizando uma consulta de candidato com sucesso(caminho feliz)
    When I fill candidato.nome input with "Michelle Collins"
    And I click on the btn btn-default button
    Then I should see Nome: Michelle Collins

  Scenario: Não preenchendo nome do candidato (Caminho triste)
    When I fill nil input with "Michelle Collins"
    When I click on the btn btn-default button
    Then I should see Preencha o nome de um candidato
