Feature: Researcher interacts with PubMed Flower

  As a researcher
  I want to interact with the Flower
  So I can explore the literature in a novel way
  # Merges the hover-over-node feature and node links to article features

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
