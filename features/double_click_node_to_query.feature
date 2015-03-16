Feature: Double clicking a node queries with its PMID
  As a researcher
  I want to recenter the flower around a node
  So that I can view its related articles

  Scenario: researcher double clicks a node to query
    Given I see the PubMed Flower
    When I click the related node
    Then I should go to a new flower page
