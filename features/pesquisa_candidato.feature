Feature: Acessar Página Informações
  Como usuário
  Quero ter acesso as informações específicas de determinado candidato
  para contar com uma maior transparência

  Background: Começando da página inicial
    Given I am on the home page
    When I visit pesquisa/index link

  Scenario: Realizando uma consulta de candidato com sucesso(caminho feliz)
    When I fill candidato.nome input with "Michelle Collins"
    Then I should see Nome: Michelle Collins

  Scenario: Não preenchendo nome do candidato (Caminho triste)
    When candidato.nome input is empty
    And I click on the buscar button
    Then I should see Preencha o nome de um candidato
