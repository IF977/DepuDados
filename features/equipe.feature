Feature: Acessar página de equipe
  Como usuário
  Quero saber quem está desenvolvendo o projeto
  Para poder contatar os membros

  Scenario: Usuário acessando página da equipe
    Given I am on the home page
    When I visit equipe link
    Then I should see Marcus Gomes
