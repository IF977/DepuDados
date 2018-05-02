Feature: Acessar página de membros
  Como usuário
  Quero saber quem está desenvolvendo o projeto
  Para poder contatar os membros ou dar feedbacks

  Scenario: Usuário acessando página da equipe
    Given I am on the home page
    When I visit equipe/index link
    Then I should see Marcus Tiberius
