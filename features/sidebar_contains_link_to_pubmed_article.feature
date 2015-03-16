Feature: Sidebar contains link to pubmed article

  As a researcher
  I want to click a link to a nodes article in PubMed
  So I can access the full text article

  Scenario: click a node's url
    Given I see the PubMed Flower
    And I hover my mouse over a node
    And I see the PubMed url
    When I click the PubMed link
    Then I should go to the articles PubMed page
