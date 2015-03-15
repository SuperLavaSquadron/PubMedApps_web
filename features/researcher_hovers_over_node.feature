Feature: Researcher hovers over node

  As a researcher
  I want to hover over a node
  So I can see its info in the sidebar

  Scenario: before I hover over a node
    Given I see the PubMed Flower
    Then I should see the query node's info

  Scenario: I hover my mouse over a node
    Given I see the PubMed Flower
    When I hover my mouse over a node
    Then I should see that node's info

  Scenario: I move mouse out of a node
    Given I see the PubMed Flower
    And I hover my mouse over a node
    When I move my mouse out of the node
    Then I should not see that node's info
