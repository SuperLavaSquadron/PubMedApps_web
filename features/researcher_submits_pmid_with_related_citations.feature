Feature: researcher submits PMID
  As a researcher
  I want to submit a PMID
  So that I can see related citations
  
  Scenario: submit a PMID that has related citations
    Given I am on the flower page
    And I have not yet submitted a PMID
    And I have typed my PMID in the search box
    And PMID is valid
    And PMID has related citations
    When I click the Blossom button
    Then I should see the query node
    And I should see related citation nodes

