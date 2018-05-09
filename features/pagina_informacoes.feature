Feature: Acessar Página Informações
  Como usuário
  Quero poder acessar uma página contendo informações úteis
  Para poder me informar sobre o andamento do projeto

  Background: Começando na página inicial
    Scenario: Acessando a página de Informações com sucesso
    Given I am on the home page
    When I visit informa/index link
    Then I should see Progresso do projeto
