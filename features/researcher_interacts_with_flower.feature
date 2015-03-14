Feature: Researcher interacts with PubMed Flower

  As a researcher
  I want to interact with the Flower
  So I can explore the literature in a novel way

  Scenario: researcher hovers mouse over node
    Given I am on the Flower page
    And I submit a PMID
    When I see the Flower
    And I hover my mouse over the query node
    Then I should see the tooltip
    And I should see the articles contents
  
  @javascript
  Scenario: researcher clicks a node to query
    Given I am on the Flower page
    And I submit a PMID
    And I see the Flower
    When I click the related node
    Then I should be redirected to a new flower page
