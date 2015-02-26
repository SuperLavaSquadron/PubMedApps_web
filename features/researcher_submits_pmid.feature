Feature: researcher submits PMID

  As a researcher
  I want to submit a PMID
  So that I can see related citations

  Scenario: before I submit a PMID
    When I have not yet submitted a PMID
    Then I should not see the query node

  Scenario: submit a PMID that has related citations
    Given I have not yet submitted a PMID
    When I submit a PMID
    Then I should see the query node
    And I should see the related citation nodes
  #   And I have typed my PMID in the search box
  #   And PMID is actually valid
  #   And PMID actually has related citations
  #   When I click the Blossom button
  #   Then I should see the query node
  #   And I should see related citation nodes

  # Scenario: submit a PMID that has no related citations
  #   Given I have not yet submitted a PMID
  #   And I have typed my PMID in the search box
  #   And PMID is actually valid
  #   And PMID has no related citations
  #   When I click the Blossom button
  #   Then I should see only query node
  #   And a message saying "No related citations"

  # Scenario: submit an invalid PMID (eg 'fahehe phage')
  #   Given that I have not yet submitted a PMID
  #   And that I have typed my PMID in the search box
  #   And the PMID is invalid
  #   When I click the Blossom button
  #   Then I should see "The PMID is invalid"
